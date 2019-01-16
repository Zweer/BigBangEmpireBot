package com.playata.framework.core
{
   import com.playata.framework.core.timer.ITimer;
   
   public interface ICore
   {
       
      
      function get info() : ICoreInfo;
      
      function get heartbeat() : IHeartbeat;
      
      function get linkHandler() : ILinkHandler;
      
      function createTimer(param1:String, param2:int, param3:Function, param4:Function = null, param5:int = 0, param6:Boolean = false) : ITimer;
   }
}
