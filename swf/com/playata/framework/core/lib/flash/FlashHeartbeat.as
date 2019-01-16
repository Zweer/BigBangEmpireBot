package com.playata.framework.core.lib.flash
{
   import com.playata.framework.core.IHeartbeat;
   import com.playata.framework.core.Runtime;
   import com.playata.framework.core.signal.ISignal;
   import com.playata.framework.core.signal.ISlot;
   import com.playata.framework.core.signal.Signal;
   import com.playata.framework.core.util.NumberUtil;
   import flash.display.Shape;
   import flash.events.Event;
   
   public class FlashHeartbeat implements IHeartbeat
   {
      
      private static const MAX_FRAME_DURATION:int = 1000;
      
      private static var HEARTBEAT_OEF:ISignal = new Signal();
      
      private static var HEARTBEAT_FULL_SECONDS:ISignal = new Signal();
      
      private static var HB_SOURCE:Shape = new Shape();
      
      private static var _t:int = 0;
      
      private static var _lastSecondsTick:int = 0;
      
      private static var _lastSuspendDuration:int = 0;
       
      
      public function FlashHeartbeat()
      {
         super();
         _t = Runtime.getTimer();
         activate(0);
      }
      
      public function get globalTime() : int
      {
         return _t;
      }
      
      public function add(param1:Function) : ISlot
      {
         return HEARTBEAT_OEF.add(param1);
      }
      
      public function remove(param1:Function) : ISlot
      {
         return HEARTBEAT_OEF.remove(param1);
      }
      
      public function addFullSeconds(param1:Function, param2:Boolean = true) : ISlot
      {
         if(param2)
         {
            param1();
         }
         return HEARTBEAT_FULL_SECONDS.add(param1);
      }
      
      public function removeFullSeconds(param1:Function) : ISlot
      {
         return HEARTBEAT_FULL_SECONDS.remove(param1);
      }
      
      public function deactivate() : void
      {
         HB_SOURCE.removeEventListener("enterFrame",oef);
      }
      
      public function activate(param1:int) : void
      {
         if(!HB_SOURCE.hasEventListener("enterFrame"))
         {
            HB_SOURCE.addEventListener("enterFrame",oef);
         }
         _lastSuspendDuration = param1;
      }
      
      private function oef(param1:Event) : void
      {
         var _loc3_:int = Runtime.getTimer();
         var _loc2_:Number = _loc3_ - _t - _lastSuspendDuration;
         _lastSuspendDuration = 0;
         _loc2_ = NumberUtil.clampf(_loc2_,0,1000);
         _t = _loc3_;
         HEARTBEAT_OEF.dispatch(_loc2_);
         if(_t - _lastSecondsTick >= 1000)
         {
            _lastSecondsTick = _t;
            HEARTBEAT_FULL_SECONDS.dispatch();
         }
      }
   }
}
