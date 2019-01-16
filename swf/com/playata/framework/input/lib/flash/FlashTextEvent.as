package com.playata.framework.input.lib.flash
{
   import com.playata.framework.core.error.Exception;
   import com.playata.framework.input.IInteractionTarget;
   import com.playata.framework.input.InteractionEvent;
   import flash.events.TextEvent;
   
   public class FlashTextEvent extends InteractionEvent
   {
       
      
      private var _textEvent:TextEvent = null;
      
      public function FlashTextEvent(param1:IInteractionTarget, param2:TextEvent)
      {
         super();
         _textEvent = param2;
         this.target = param1;
         this.rawEvent = _textEvent;
      }
      
      override protected function getData(param1:String) : Object
      {
         var _loc2_:* = param1;
         switch(_loc2_)
         {
            case "linkText":
               return _textEvent.text;
            case "linkVector":
               return null;
            default:
               throw new Exception("Unknown event key: " + param1);
         }
      }
      
      override public function stopPropagation() : void
      {
         if(_textEvent)
         {
            _textEvent.stopImmediatePropagation();
            _textEvent.stopPropagation();
         }
      }
   }
}
