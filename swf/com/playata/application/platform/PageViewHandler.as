package com.playata.application.platform
{
   import com.playata.framework.application.Environment;
   import flash.events.EventDispatcher;
   
   public class PageViewHandler extends EventDispatcher
   {
       
      
      public function PageViewHandler()
      {
         super();
      }
      
      public function trackPageView(param1:String) : void
      {
         dispatchEvent(new PageViewEvent(param1));
      }
      
      public function start() : void
      {
         addEventListener("call",onTrackPageView);
      }
      
      public function dispose() : void
      {
         removeEventListener("call",onTrackPageView);
      }
      
      private function onTrackPageView(param1:PageViewEvent) : void
      {
         Environment.platform.callExtern("trackPageView",param1.trackUrl);
      }
   }
}
