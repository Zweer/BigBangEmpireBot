package com.playata.framework.input.lib.flash
{
   import com.playata.framework.core.error.Exception;
   import com.playata.framework.input.IInteractionTarget;
   import com.playata.framework.input.InteractionEvent;
   import flash.events.SoftKeyboardEvent;
   
   public class FlashSoftKeyboardEvent extends InteractionEvent
   {
       
      
      private var _softKeyboardEvent:SoftKeyboardEvent = null;
      
      public function FlashSoftKeyboardEvent(param1:IInteractionTarget, param2:SoftKeyboardEvent)
      {
         super();
         _softKeyboardEvent = param2;
         this.target = param1;
         this.rawEvent = _softKeyboardEvent;
      }
      
      override protected function getData(param1:String) : Object
      {
         var _loc2_:* = param1;
         if("triggerType" !== _loc2_)
         {
            throw new Exception("Unknown event key: " + param1);
         }
         return _softKeyboardEvent.triggerType;
      }
      
      override public function stopPropagation() : void
      {
         if(_softKeyboardEvent)
         {
            _softKeyboardEvent.stopImmediatePropagation();
            _softKeyboardEvent.stopPropagation();
         }
      }
   }
}
