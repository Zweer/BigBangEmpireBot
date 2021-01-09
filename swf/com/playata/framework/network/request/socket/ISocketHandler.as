package com.playata.framework.network.request.socket
{
   public interface ISocketHandler
   {
       
      
      function onConnect() : void;
      
      function onDisconnect(param1:Boolean) : void;
      
      function handleMessage(param1:SocketTransportLayer, param2:String, param3:Object) : void;
      
      function useFallback(param1:String) : Boolean;
   }
}
