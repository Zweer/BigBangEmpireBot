package com.playata.framework.application
{
   import com.playata.framework.core.logging.Logger;
   import com.playata.framework.core.util.TimeUtil;
   
   public class ApplicationSession
   {
      
      public static const MAX_SESSION_INACTIVE_TIME:int = 1800;
       
      
      private var _sessionHandler:IApplicationSessionHandler = null;
      
      private var _started:Boolean = false;
      
      private var _sessionStartTimestamp:int = 0;
      
      private var _lastSessionStopTimestamp:int = 0;
      
      public function ApplicationSession(param1:IApplicationSessionHandler)
      {
         super();
         _sessionHandler = param1;
      }
      
      public function start(param1:int = 0) : void
      {
         var _loc2_:int = 0;
         Logger.info("[ApplicationSession] Starting session. Suspend duration = " + param1);
         _started = true;
         if(param1 == 0)
         {
            _sessionStartTimestamp = TimeUtil.now;
            _sessionHandler.onNewSession();
         }
         else
         {
            if(param1 >= 1800)
            {
               _loc2_ = duration;
               _sessionStartTimestamp = TimeUtil.now;
               _sessionHandler.onRenewSession(_loc2_,_lastSessionStopTimestamp);
               return;
            }
            _sessionHandler.onContinueSession();
         }
      }
      
      public function stop() : void
      {
         Logger.info("[ApplicationSession] Stopping session. Duration = " + duration);
         _lastSessionStopTimestamp = TimeUtil.now;
         _sessionHandler.onStopSession(duration);
         _started = false;
      }
      
      public function get duration() : int
      {
         if(!_started)
         {
            return 0;
         }
         return TimeUtil.now - _sessionStartTimestamp;
      }
   }
}
