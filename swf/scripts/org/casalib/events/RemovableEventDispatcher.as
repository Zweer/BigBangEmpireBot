package org.casalib.events
{
   import flash.events.Event;
   import flash.events.EventDispatcher;
   import flash.events.IEventDispatcher;
   import org.casalib.core.IDestroyable;
   
   public class RemovableEventDispatcher extends EventDispatcher implements IRemovableEventDispatcher, IDestroyable
   {
       
      
      protected var _listenerManager:ListenerManager;
      
      protected var _isDestroyed:Boolean;
      
      public function RemovableEventDispatcher(param1:IEventDispatcher = null)
      {
         super(param1);
         this._listenerManager = ListenerManager.getManager(this);
      }
      
      override public function dispatchEvent(param1:Event) : Boolean
      {
         if(this.willTrigger(param1.type))
         {
            return super.dispatchEvent(param1);
         }
         return true;
      }
      
      override public function addEventListener(param1:String, param2:Function, param3:Boolean = false, param4:int = 0, param5:Boolean = false) : void
      {
         super.addEventListener(param1,param2,param3,param4,param5);
         this._listenerManager.addEventListener(param1,param2,param3,param4,param5);
      }
      
      override public function removeEventListener(param1:String, param2:Function, param3:Boolean = false) : void
      {
         super.removeEventListener(param1,param2,param3);
         this._listenerManager.removeEventListener(param1,param2,param3);
      }
      
      public function removeEventsForType(param1:String) : void
      {
         this._listenerManager.removeEventsForType(param1);
      }
      
      public function removeEventsForListener(param1:Function) : void
      {
         this._listenerManager.removeEventsForListener(param1);
      }
      
      public function removeEventListeners() : void
      {
         this._listenerManager.removeEventListeners();
      }
      
      public function getTotalEventListeners(param1:String = null) : uint
      {
         return this._listenerManager.getTotalEventListeners(param1);
      }
      
      public function get destroyed() : Boolean
      {
         return this._isDestroyed;
      }
      
      public function destroy() : void
      {
         this._listenerManager.destroy();
         this._isDestroyed = true;
      }
   }
}
