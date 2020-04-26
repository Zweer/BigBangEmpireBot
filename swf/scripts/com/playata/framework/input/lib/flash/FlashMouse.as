package com.playata.framework.input.lib.flash
{
   import com.playata.framework.core.signal.ISignal;
   import com.playata.framework.core.signal.Signal;
   import com.playata.framework.input.IMouse;
   import flash.events.MouseEvent;
   
   public class FlashMouse implements IMouse
   {
       
      
      private var _onMove:ISignal = null;
      
      public function FlashMouse()
      {
         super();
      }
      
      public function dispose() : void
      {
         if(_onMove != null)
         {
            _onMove.removeAll();
            _onMove = null;
            FlashInputCore.stage.removeEventListener("mouseMove",handleInteractionMove);
         }
      }
      
      public function get onMove() : ISignal
      {
         if(_onMove === null)
         {
            _onMove = new Signal();
            FlashInputCore.stage.addEventListener("mouseMove",handleInteractionMove);
         }
         return _onMove;
      }
      
      public function get mouseX() : Number
      {
         return FlashInputCore.stage.mouseX;
      }
      
      public function get mouseY() : Number
      {
         return FlashInputCore.stage.mouseY;
      }
      
      private function handleInteractionMove(param1:MouseEvent) : void
      {
         if(_onMove != null)
         {
            _onMove.dispatch(new FlashMouseEvent(null,param1));
         }
      }
   }
}
