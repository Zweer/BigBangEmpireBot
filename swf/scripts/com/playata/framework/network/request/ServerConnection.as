package com.playata.framework.network.request
{
   import com.playata.framework.network.request.http.HTTPTransportLayer;
   import com.playata.framework.network.request.socket.ISocketHandler;
   import com.playata.framework.network.request.socket.SocketTransportLayer;
   
   public class ServerConnection
   {
       
      
      private var _httpTransportLayer:HTTPTransportLayer = null;
      
      private var _socketTransportLayer:SocketTransportLayer = null;
      
      private var _socketHandler:ISocketHandler = null;
      
      public function ServerConnection()
      {
         super();
      }
      
      public function set socketHandler(param1:ISocketHandler) : void
      {
         _socketHandler = param1;
      }
      
      public function get socketHandler() : ISocketHandler
      {
         return _socketHandler;
      }
      
      public function get httpTransportLayer() : HTTPTransportLayer
      {
         return _httpTransportLayer;
      }
      
      public function get socketTransportLayer() : SocketTransportLayer
      {
         return _socketTransportLayer;
      }
      
      public function send(param1:RemoteRequest) : void
      {
         if(!_httpTransportLayer)
         {
            _httpTransportLayer = new HTTPTransportLayer();
         }
         if(!_socketTransportLayer && _socketHandler)
         {
            _socketTransportLayer = new SocketTransportLayer(_httpTransportLayer,_socketHandler);
         }
         if(_socketTransportLayer)
         {
            _socketTransportLayer.addRequest(param1);
         }
         else
         {
            _httpTransportLayer.addRequest(param1);
         }
      }
      
      public function disconnect() : void
      {
         if(!isSocketTransportActive)
         {
            return;
         }
         _socketTransportLayer.disconnect();
      }
      
      public function get isSocketTransportActive() : Boolean
      {
         if(!_socketTransportLayer)
         {
            return false;
         }
         return _socketTransportLayer.isUsable;
      }
      
      public function get sessionConnectionType() : int
      {
         if(!isSocketTransportActive)
         {
            return 1;
         }
         return 2;
      }
   }
}
