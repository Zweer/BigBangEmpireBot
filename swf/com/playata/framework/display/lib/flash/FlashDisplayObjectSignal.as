package com.playata.framework.display.lib.flash
{
   import com.playata.framework.core.signal.ISlot;
   import com.playata.framework.core.signal.Signal;
   import com.playata.framework.display.IDisplayObject;
   import flash.display.DisplayObject;
   import flash.events.Event;
   
   public class FlashDisplayObjectSignal extends Signal
   {
       
      
      private var _eventType:String = null;
      
      private var _displayObject:IDisplayObject = null;
      
      private var _flashDisplayObject:DisplayObject = null;
      
      public function FlashDisplayObjectSignal(param1:String, param2:IDisplayObject, param3:DisplayObject)
      {
         _eventType = param1;
         _displayObject = param2;
         _flashDisplayObject = param3;
         super();
      }
      
      override public function add(param1:Function) : ISlot
      {
         _flashDisplayObject.addEventListener(_eventType,onEvent);
         return super.add(param1);
      }
      
      override public function addOnce(param1:Function) : ISlot
      {
         _flashDisplayObject.addEventListener(_eventType,onEventOnce);
         return super.addOnce(param1);
      }
      
      override public function remove(param1:Function) : ISlot
      {
         _flashDisplayObject.removeEventListener(_eventType,param1);
         return super.remove(param1);
      }
      
      override public function removeAll() : void
      {
         super.removeAll();
      }
      
      private function onEvent(param1:Event) : void
      {
         dispatch(_displayObject);
      }
      
      private function onEventOnce(param1:Event) : void
      {
         _flashDisplayObject.removeEventListener(_eventType,onEventOnce);
         dispatch(_displayObject);
      }
   }
}
