package org.casalib.events
{
   import flash.events.IEventDispatcher;
   
   public interface IRemovableEventDispatcher extends IEventDispatcher
   {
       
      
      function removeEventsForType(param1:String) : void;
      
      function removeEventsForListener(param1:Function) : void;
      
      function removeEventListeners() : void;
      
      function getTotalEventListeners(param1:String = null) : uint;
   }
}
