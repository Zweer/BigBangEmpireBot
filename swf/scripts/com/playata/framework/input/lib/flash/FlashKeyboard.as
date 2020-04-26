package com.playata.framework.input.lib.flash
{
   import com.playata.framework.core.signal.ISignal;
   import com.playata.framework.core.signal.Signal;
   import com.playata.framework.input.IKeyboard;
   import flash.events.KeyboardEvent;
   
   public class FlashKeyboard implements IKeyboard
   {
       
      
      private var _isAltPressed:Boolean = false;
      
      private var _isShiftPressed:Boolean = false;
      
      private var _isCtrlPressed:Boolean = false;
      
      private var _onKeyDown:ISignal = null;
      
      private var _onKeyUp:ISignal = null;
      
      public function FlashKeyboard()
      {
         super();
         FlashInputCore.stage.addEventListener("keyDown",onInputKeyDown);
         FlashInputCore.stage.addEventListener("keyUp",onInputKeyUp);
      }
      
      public function dispose() : void
      {
         FlashInputCore.stage.removeEventListener("keyDown",onInputKeyDown);
         FlashInputCore.stage.removeEventListener("keyUp",onInputKeyUp);
         if(_onKeyDown != null)
         {
            _onKeyDown.removeAll();
            _onKeyDown = null;
         }
         if(_onKeyUp != null)
         {
            _onKeyUp.removeAll();
            _onKeyUp = null;
         }
      }
      
      public function get onKeyDown() : ISignal
      {
         if(_onKeyDown == null)
         {
            _onKeyDown = new Signal();
         }
         return _onKeyDown;
      }
      
      public function get onKeyUp() : ISignal
      {
         if(_onKeyUp == null)
         {
            _onKeyUp = new Signal();
         }
         return _onKeyUp;
      }
      
      public function get isAltPressed() : Boolean
      {
         return _isAltPressed;
      }
      
      public function get isShiftPressed() : Boolean
      {
         return _isShiftPressed;
      }
      
      public function get isCtrlPressed() : Boolean
      {
         return _isCtrlPressed;
      }
      
      private function onInputKeyDown(param1:KeyboardEvent) : void
      {
         _isAltPressed = param1.altKey;
         _isShiftPressed = param1.shiftKey;
         _isCtrlPressed = param1.ctrlKey;
         if(_onKeyDown != null)
         {
            _onKeyDown.dispatch(new FlashKeyboardEvent(null,param1));
         }
      }
      
      private function onInputKeyUp(param1:KeyboardEvent) : void
      {
         _isAltPressed = param1.altKey;
         _isShiftPressed = param1.shiftKey;
         _isCtrlPressed = param1.ctrlKey;
         if(_onKeyUp != null)
         {
            _onKeyUp.dispatch(new FlashKeyboardEvent(null,param1));
         }
      }
   }
}
