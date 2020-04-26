package com.playata.framework.network.request.socket
{
   import com.playata.framework.core.signal.ISignal;
   
   public interface ISocketConnection
   {
       
      
      function connect() : void;
      
      function close() : void;
      
      function send(param1:Object, param2:String = null, param3:Function = null) : void;
      
      function startHeartbeat() : void;
      
      function get onConnected() : ISignal;
      
      function get onDisconnected() : ISignal;
      
      function get onClose() : ISignal;
      
      function get onMessage() : ISignal;
      
      function get onConnectError() : ISignal;
      
      function get onSecurityError() : ISignal;
      
      function get onIOError() : ISignal;
   }
}
