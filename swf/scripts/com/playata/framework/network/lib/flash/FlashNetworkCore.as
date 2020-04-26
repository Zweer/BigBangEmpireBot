package com.playata.framework.network.lib.flash
{
   import com.playata.framework.core.io.File;
   import com.playata.framework.network.IDownload;
   import com.playata.framework.network.INetworkCore;
   import com.playata.framework.network.INetworkInfo;
   import com.playata.framework.network.IUriData;
   import com.playata.framework.network.NetworkCore;
   import com.playata.framework.network.UriDataType;
   import com.playata.framework.network.request.ServerConnection;
   import com.playata.framework.network.request.socket.ISocketConnection;
   
   public class FlashNetworkCore implements INetworkCore
   {
       
      
      private var _isActive:Boolean = true;
      
      private var _info:INetworkInfo = null;
      
      private var _serverConnection:ServerConnection = null;
      
      public function FlashNetworkCore(param1:INetworkInfo)
      {
         super();
         NetworkCore.current = this;
         _info = param1;
         _serverConnection = new ServerConnection();
      }
      
      public function dispose() : void
      {
      }
      
      public function get info() : INetworkInfo
      {
         return _info;
      }
      
      public function get socketConnectionAllowed() : Boolean
      {
         return !FlashSocket.deactivateConnectionAttempts;
      }
      
      public function get serverConnection() : ServerConnection
      {
         return _serverConnection;
      }
      
      public function get isActive() : Boolean
      {
         return _isActive;
      }
      
      public function onActivate(param1:int) : void
      {
         _isActive = true;
         if(_serverConnection.socketTransportLayer != null)
         {
            _serverConnection.socketTransportLayer.enabled = true;
         }
      }
      
      public function onDeactivate() : void
      {
         _isActive = false;
         _serverConnection.disconnect();
         if(_serverConnection.socketTransportLayer != null)
         {
            _serverConnection.socketTransportLayer.enabled = false;
         }
      }
      
      public function createSocketConnection(param1:String) : ISocketConnection
      {
         return new FlashSocket(param1);
      }
      
      public function createDownload(param1:String, param2:File, param3:int) : IDownload
      {
         return null;
      }
      
      public function createUriData(param1:String, param2:UriDataType) : IUriData
      {
         return new FlashUriData(param1,param2);
      }
   }
}
