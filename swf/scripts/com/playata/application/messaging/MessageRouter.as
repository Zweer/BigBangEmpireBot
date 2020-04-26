package com.playata.application.messaging
{
   import com.playata.framework.core.collection.StringMap;
   import com.playata.framework.core.logging.Logger;
   
   public class MessageRouter
   {
      
      private static var _instance:MessageRouter = null;
       
      
      private var _listeners:StringMap = null;
      
      public function MessageRouter()
      {
         super();
         Logger.debug("[Application] Creating message router...");
         _listeners = new StringMap();
      }
      
      public static function dispatch(param1:Message) : void
      {
         if(_instance == null)
         {
            _instance = new MessageRouter();
         }
         _instance.dispatchMessage(param1);
      }
      
      public static function addListener(param1:String, param2:Function) : void
      {
         if(_instance == null)
         {
            _instance = new MessageRouter();
         }
         _instance.addListenerFunction(param1,param2);
      }
      
      public static function removeListener(param1:String, param2:Function) : void
      {
         if(_instance == null)
         {
            _instance = new MessageRouter();
         }
         _instance.removeListenerFunction(param1,param2);
      }
      
      public static function removeAllListeners(param1:Function) : void
      {
         if(_instance == null)
         {
            _instance = new MessageRouter();
         }
         _instance.removeAllListenerFunctions(param1);
      }
      
      public static function getNumListeners() : uint
      {
         if(_instance == null)
         {
            _instance = new MessageRouter();
         }
         return _instance.getNumListenerFunctions();
      }
      
      public static function getNumListenersByType(param1:String) : uint
      {
         if(_instance == null)
         {
            _instance = new MessageRouter();
         }
         return _instance.getNumListenerFunctionsByType(param1);
      }
      
      public static function getNumListenersByHandler(param1:Function) : uint
      {
         if(_instance == null)
         {
            _instance = new MessageRouter();
         }
         return _instance.getNumListenerFunctionsByHandler(param1);
      }
      
      public function dispose() : void
      {
         Logger.debug("[Application] Destroying message router...");
         _listeners = null;
      }
      
      public function dispatchMessage(param1:Message) : void
      {
         var _loc3_:Array = _listeners.getData(param1.type);
         if(_loc3_ == null)
         {
            return;
         }
         var _loc5_:int = 0;
         var _loc4_:* = _loc3_;
         for each(var _loc2_ in _loc3_)
         {
            _loc2_(param1);
         }
      }
      
      public function addListenerFunction(param1:String, param2:Function) : void
      {
         if(!_listeners.exists(param1))
         {
            _listeners.setData(param1,[]);
         }
         if(_listeners.getData(param1).indexOf(param2) != -1)
         {
            throw new Error("Failed adding listener! This listener has already subscribed to message type = \'" + param1 + "\'!");
         }
         _listeners.getData(param1).push(param2);
      }
      
      public function removeListenerFunction(param1:String, param2:Function) : void
      {
         var _loc4_:Array = _listeners.getData(param1);
         if(_loc4_ == null)
         {
            throw new Error("Failed removing listener! No handlers listening to message type = \'" + param1 + "\'!");
         }
         var _loc3_:int = _loc4_.indexOf(param2);
         if(_loc3_ == -1)
         {
            throw new Error("Failed removing listener! No such listener subscribed to message type = \'" + param1 + "\'!");
         }
         _loc4_.splice(_loc3_,1);
      }
      
      public function removeAllListenerFunctions(param1:Function) : void
      {
         var _loc2_:* = null;
         var _loc5_:int = 0;
         var _loc4_:* = _listeners;
         for(var _loc3_ in _listeners)
         {
            _loc2_ = _listeners.getData(_loc3_);
            if(_loc2_ != null && _loc2_.indexOf(param1) != -1)
            {
               _loc2_.splice(_loc2_.indexOf(param1),1);
            }
         }
      }
      
      public function getNumListenerFunctions() : uint
      {
         var _loc2_:* = null;
         var _loc1_:uint = 0;
         var _loc5_:int = 0;
         var _loc4_:* = _listeners;
         for(var _loc3_ in _listeners)
         {
            _loc2_ = _listeners.getData(_loc3_);
            if(_loc2_ != null)
            {
               _loc1_ = _loc1_ + _loc2_.length;
            }
         }
         return _loc1_;
      }
      
      public function getNumListenerFunctionsByType(param1:String) : uint
      {
         if(!_listeners.exists(param1))
         {
            return 0;
         }
         return _listeners.getData(param1).length;
      }
      
      public function getNumListenerFunctionsByHandler(param1:Function) : uint
      {
         var _loc3_:* = null;
         var _loc2_:uint = 0;
         var _loc6_:int = 0;
         var _loc5_:* = _listeners;
         for(var _loc4_ in _listeners)
         {
            _loc3_ = _listeners.getData(_loc4_);
            if(_loc3_ != null && _loc3_.indexOf(param1) != -1)
            {
               _loc2_++;
            }
         }
         return _loc2_;
      }
   }
}
