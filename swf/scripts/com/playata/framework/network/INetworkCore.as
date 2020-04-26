package com.playata.framework.network
{
   import com.playata.framework.core.IEnvironmentModule;
   import com.playata.framework.core.io.File;
   import com.playata.framework.network.request.ServerConnection;
   import com.playata.framework.network.request.socket.ISocketConnection;
   
   public interface INetworkCore extends IEnvironmentModule
   {
       
      
      function get info() : INetworkInfo;
      
      function get socketConnectionAllowed() : Boolean;
      
      function get serverConnection() : ServerConnection;
      
      function createSocketConnection(param1:String) : ISocketConnection;
      
      function createDownload(param1:String, param2:File, param3:int) : IDownload;
      
      function createUriData(param1:String, param2:UriDataType) : IUriData;
   }
}
