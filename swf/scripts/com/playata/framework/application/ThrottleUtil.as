package com.playata.framework.application
{
   import com.playata.framework.core.signal.ISignal;
   import com.playata.framework.core.signal.Signal;
   import flash.events.ThrottleEvent;
   
   public class ThrottleUtil
   {
      
      private static var _initialized:Boolean = false;
      
      private static var _isThrottled:Boolean = false;
      
      private static var _onThrottle:ISignal = null;
      
      private static var _onResume:ISignal = null;
       
      
      public function ThrottleUtil()
      {
         super();
      }
      
      public static function get onThrottle() : ISignal
      {
         if(_onThrottle === null)
         {
            _onThrottle = new Signal();
         }
         return _onThrottle;
      }
      
      public static function get onResume() : ISignal
      {
         if(_onResume === null)
         {
            _onResume = new Signal();
         }
         return _onResume;
      }
      
      public static function initialize() : void
      {
         if(_initialized)
         {
            return;
         }
         Environment.display.displayContext.nativeStage.addEventListener("throttle",handleThrottle);
         _initialized = true;
      }
      
      public static function dispose() : void
      {
         if(!_initialized)
         {
            return;
         }
         Environment.display.displayContext.nativeStage.removeEventListener("throttle",handleThrottle);
         _initialized = true;
      }
      
      public static function get isThrottled() : Boolean
      {
         initialize();
         return _isThrottled;
      }
      
      private static function handleThrottle(param1:ThrottleEvent) : void
      {
         if(param1.state == "pause".toString() || param1.state == "throttle".toString())
         {
            _isThrottled = true;
            if(_onThrottle != null)
            {
               _onThrottle.dispatch();
            }
         }
         else if(param1.state == "resume".toString())
         {
            _isThrottled = false;
            if(_onResume != null)
            {
               _onResume.dispatch();
            }
         }
      }
   }
}
