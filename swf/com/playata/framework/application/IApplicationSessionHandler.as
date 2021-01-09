package com.playata.framework.application
{
   public interface IApplicationSessionHandler
   {
       
      
      function onNewSession() : void;
      
      function onRenewSession(param1:int, param2:int) : void;
      
      function onContinueSession() : void;
      
      function onStopSession(param1:int) : void;
   }
}
