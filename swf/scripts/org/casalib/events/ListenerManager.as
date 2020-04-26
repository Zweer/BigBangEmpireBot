package org.casalib.events
{
   import flash.events.Event;
   import flash.events.IEventDispatcher;
   import flash.utils.Dictionary;
   import org.casalib.core.Destroyable;
   import org.casalib.util.ArrayUtil;
   
   public class ListenerManager extends Destroyable implements IRemovableEventDispatcher
   {
      
      protected static var _proxyMap:Dictionary;
       
      
      protected var _eventDispatcher:IEventDispatcher;
      
      protected var _events:Array;
      
      protected var _blockRequest:Boolean;
      
      public function ListenerManager(param1:EventInfo, param2:IEventDispatcher)
      {
         super();
         this._eventDispatcher = param2;
         this._events = new Array();
      }
      
      public static function getManager(param1:IEventDispatcher) : ListenerManager
      {
         if(ListenerManager._proxyMap == null)
         {
            ListenerManager._proxyMap = new Dictionary();
         }
         if(!(param1 in ListenerManager._proxyMap))
         {
            ListenerManager._proxyMap[param1] = new ListenerManager(new EventInfo(null,null,false),param1);
         }
         return ListenerManager._proxyMap[param1];
      }
      
      public function addEventListener(param1:String, param2:Function, param3:Boolean = false, param4:int = 0, param5:Boolean = false) : void
      {
         var _loc6_:EventInfo = new EventInfo(param1,param2,param3);
         var _loc7_:int = this._events.length;
         while(_loc7_--)
         {
            if(this._events[_loc7_].equals(_loc6_))
            {
               return;
            }
         }
         this._events.push(_loc6_);
      }
      
      public function dispatchEvent(param1:Event) : Boolean
      {
         return this._eventDispatcher.dispatchEvent(param1);
      }
      
      public function hasEventListener(param1:String) : Boolean
      {
         return this._eventDispatcher.hasEventListener(param1);
      }
      
      public function willTrigger(param1:String) : Boolean
      {
         return this._eventDispatcher.willTrigger(param1);
      }
      
      public function removeEventListener(param1:String, param2:Function, param3:Boolean = false) : void
      {
         if(this._blockRequest)
         {
            return;
         }
         var _loc4_:EventInfo = new EventInfo(param1,param2,param3);
         var _loc5_:int = this._events.length;
         while(_loc5_--)
         {
            if(this._events[_loc5_].equals(_loc4_))
            {
               this._events.splice(_loc5_,1);
            }
         }
      }
      
      public function removeEventsForType(param1:String) : void
      {
         var _loc3_:EventInfo = null;
         this._blockRequest = true;
         var _loc2_:int = this._events.length;
         while(_loc2_--)
         {
            _loc3_ = this._events[_loc2_];
            if(_loc3_.type == param1)
            {
               this._events.splice(_loc2_,1);
               this._eventDispatcher.removeEventListener(_loc3_.type,_loc3_.listener,_loc3_.useCapture);
            }
         }
         this._blockRequest = false;
      }
      
      public function removeEventsForListener(param1:Function) : void
      {
         var _loc3_:EventInfo = null;
         this._blockRequest = true;
         var _loc2_:int = this._events.length;
         while(_loc2_--)
         {
            _loc3_ = this._events[_loc2_];
            if(_loc3_.listener == param1)
            {
               this._events.splice(_loc2_,1);
               this._eventDispatcher.removeEventListener(_loc3_.type,_loc3_.listener,_loc3_.useCapture);
            }
         }
         this._blockRequest = false;
      }
      
      public function removeEventListeners() : void
      {
         var _loc2_:EventInfo = null;
         this._blockRequest = true;
         var _loc1_:int = this._events.length;
         while(_loc1_--)
         {
            _loc2_ = this._events.splice(_loc1_,1)[0];
            this._eventDispatcher.removeEventListener(_loc2_.type,_loc2_.listener,_loc2_.useCapture);
         }
         this._blockRequest = false;
      }
      
      public function getTotalEventListeners(param1:String = null) : uint
      {
         return param1 == null?uint(this._events.length):uint(ArrayUtil.getItemsByKey(this._events,"type",param1).length);
      }
      
      override public function destroy() : void
      {
         this.removeEventListeners();
         delete ListenerManager._proxyMap[this._eventDispatcher];
         this._eventDispatcher = null;
         super.destroy();
      }
   }
}

class EventInfo
{
    
   
   public var type:String;
   
   public var listener:Function;
   
   public var useCapture:Boolean;
   
   function EventInfo(param1:String, param2:Function, param3:Boolean)
   {
      super();
      this.type = param1;
      this.listener = param2;
      this.useCapture = param3;
   }
   
   public function equals(param1:EventInfo) : Boolean
   {
      return this.type == param1.type && this.listener == param1.listener && this.useCapture == param1.useCapture;
   }
}
