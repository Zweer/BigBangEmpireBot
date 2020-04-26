package com.playata.application.platform
{
   import com.playata.framework.application.Environment;
   import flash.events.EventDispatcher;
   
   public class ActivityTimeHandler extends EventDispatcher
   {
       
      
      public function ActivityTimeHandler()
      {
         super();
      }
      
      public function setActivityTimeTitle(param1:int, param2:String, param3:String) : void
      {
         dispatchEvent(new ActivityTimeEvent(param1,param2,param3));
      }
      
      public function start() : void
      {
         addEventListener("set_title",onSetActivityTimeTitle);
      }
      
      public function dispose() : void
      {
         removeEventListener("set_title",onSetActivityTimeTitle);
      }
      
      private function onSetActivityTimeTitle(param1:ActivityTimeEvent) : void
      {
         Environment.platform.callExtern("setActivityTimeTitle",param1.remainingTime,param1.remainingTitle,param1.prefix);
      }
   }
}
