package com.playata.framework.input.lib.flash
{
   import com.playata.framework.core.error.Exception;
   import com.playata.framework.input.IInteractionTarget;
   import com.playata.framework.input.InteractionEvent;
   import flash.events.KeyboardEvent;
   
   public class FlashKeyboardEvent extends InteractionEvent
   {
       
      
      private var _keyboardEvent:KeyboardEvent = null;
      
      public function FlashKeyboardEvent(param1:IInteractionTarget, param2:KeyboardEvent)
      {
         super();
         _keyboardEvent = param2;
         this.target = param1;
         this.rawEvent = _keyboardEvent;
      }
      
      override protected function getData(param1:String) : Object
      {
         var _loc2_:* = param1;
         switch(_loc2_)
         {
            case "altKey":
               return _keyboardEvent.altKey;
            case "controlKey":
               return _keyboardEvent.ctrlKey;
            case "shiftKey":
               return _keyboardEvent.shiftKey;
            case "charCode":
               return _keyboardEvent.charCode;
            case "keyCode":
               return _keyboardEvent.keyCode;
            default:
               throw new Exception("Unknown event key: " + param1);
         }
      }
      
      override public function stopPropagation() : void
      {
         if(_keyboardEvent)
         {
            _keyboardEvent.stopImmediatePropagation();
            _keyboardEvent.stopPropagation();
         }
      }
   }
}
