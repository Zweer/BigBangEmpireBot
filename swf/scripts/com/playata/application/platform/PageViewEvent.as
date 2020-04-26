package com.playata.application.platform
{
   import flash.events.Event;
   
   public class PageViewEvent extends Event
   {
      
      public static const CALL:String = "call";
       
      
      public var trackUrl:String;
      
      public function PageViewEvent(param1:String, param2:Boolean = true, param3:Boolean = false)
      {
         super("call",param2,param3);
         this.trackUrl = param1;
      }
   }
}
