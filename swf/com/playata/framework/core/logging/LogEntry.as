package com.playata.framework.core.logging
{
   import com.playata.framework.core.Runtime;
   
   public class LogEntry
   {
       
      
      public var logLevel:int;
      
      public var message:String;
      
      public var timestamp:int;
      
      public function LogEntry(param1:int, param2:String, param3:int = 0)
      {
         super();
         this.logLevel = param1;
         this.message = param2;
         if(!param3)
         {
            param3 = Runtime.getTimer();
         }
         this.timestamp = param3;
      }
      
      public function get logLevelString() : String
      {
         return Logger.getLogLevelString(logLevel);
      }
      
      public function get formattedMessage() : String
      {
         return timestamp + ": [" + logLevelString + "] " + message;
      }
   }
}
