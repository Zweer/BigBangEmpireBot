package com.playata.application.platform
{
   import flash.events.Event;
   
   public class ActivityTimeEvent extends Event
   {
      
      public static const SET_TITLE:String = "set_title";
       
      
      public var remainingTime:int;
      
      public var remainingTitle:String;
      
      public var prefix:String;
      
      public function ActivityTimeEvent(param1:int, param2:String, param3:String, param4:Boolean = true, param5:Boolean = false)
      {
         super("set_title",param4,param5);
         this.remainingTime = param1;
         this.remainingTitle = param2;
         this.prefix = param3;
      }
   }
}
