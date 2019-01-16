package com.playata.framework.input.lib.flash
{
   import com.playata.framework.core.error.Exception;
   import com.playata.framework.input.IInteractionTarget;
   import com.playata.framework.input.InteractionEvent;
   import flash.events.MouseEvent;
   
   public class FlashRelativeStageMouseEvent extends InteractionEvent
   {
       
      
      private var _mouseEvent:MouseEvent = null;
      
      public function FlashRelativeStageMouseEvent(param1:IInteractionTarget, param2:MouseEvent)
      {
         super();
         _mouseEvent = param2;
         this.target = param1;
         this.rawEvent = _mouseEvent;
      }
      
      override protected function getData(param1:String) : Object
      {
         var _loc2_:* = param1;
         switch(_loc2_)
         {
            case "altKey":
               return _mouseEvent.altKey;
            case "controlKey":
               return _mouseEvent.ctrlKey;
            case "shiftKey":
               return _mouseEvent.shiftKey;
            case "mouseWheelDelta":
               return _mouseEvent.delta;
            case "globalX":
               return FlashInputCore.stage.mouseX;
            case "globalY":
               return FlashInputCore.stage.mouseY;
            case "localX":
               return FlashInputCore.stage.mouseX - this.target.globalX;
            case "localY":
               return FlashInputCore.stage.mouseY - this.target.globalY;
            default:
               throw new Exception("Unknown event key: " + param1);
         }
      }
      
      override public function stopPropagation() : void
      {
         if(_mouseEvent)
         {
            _mouseEvent.stopImmediatePropagation();
            _mouseEvent.stopPropagation();
         }
      }
   }
}
