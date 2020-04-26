package com.playata.framework.network.request.socket
{
   import com.playata.framework.core.Core;
   import com.playata.framework.core.TypedObject;
   import com.playata.framework.core.error.Exception;
   import com.playata.framework.core.error.IOException;
   import com.playata.framework.core.error.SecurityException;
   import com.playata.framework.core.logging.Logger;
   import com.playata.framework.network.NetworkConfig;
   import com.playata.framework.network.NetworkCore;
   import com.playata.framework.network.request.RemoteRequest;
   import com.playata.framework.network.request.TransportLayer;
   
   public class SocketTransportLayer extends TransportLayer
   {
      
      public static const MAX_CONNECTION_ATTEMPTS:int = 3;
       
      
      private var _enabled:Boolean = false;
      
      private var _fallback:TransportLayer = null;
      
      private var _socketHandler:ISocketHandler = null;
      
      private var _ioSocket:ISocketConnection = null;
      
      private var _connecting:Boolean = false;
      
      private var _connected:Boolean = false;
      
      private var _connectionAttempt:int = 0;
      
      private var _currentRequest:RemoteRequest = null;
      
      public function SocketTransportLayer(param1:TransportLayer, param2:ISocketHandler)
      {
         super();
         _fallback = param1;
         _socketHandler = param2;
      }
      
      public function get enabled() : Boolean
      {
         return _enabled;
      }
      
      public function set enabled(param1:Boolean) : void
      {
         _enabled = param1;
         if(Core.config == null || !NetworkConfig.socketCommunicationEnabled)
         {
            _enabled = false;
         }
      }
      
      public function get socketConnection() : ISocketConnection
      {
         return _ioSocket;
      }
      
      override public function send(param1:RemoteRequest) : void
      {
         if(!enabled)
         {
            _fallback.send(param1);
            return;
         }
         var _loc2_:Boolean = _socketHandler.useFallback(!!param1.request.hasData("action")?param1.request.getString("action"):null);
         if(_loc2_)
         {
            _fallback.send(param1);
            return;
         }
         if(!isUsable)
         {
            connect();
         }
         _fallback.send(param1);
      }
      
      public function sendMessage(param1:String, param2:Object) : void
      {
         if(!_ioSocket)
         {
            return;
         }
         _ioSocket.send({
            "type":param1,
            "data":param2
         },"message");
      }
      
      public function startHeartbeat() : void
      {
         if(!_ioSocket)
         {
            return;
         }
         _ioSocket.startHeartbeat();
      }
      
      override public function get isUsable() : Boolean
      {
         return _connected && enabled;
      }
      
      private function connect() : void
      {
         if(_connecting || _connectionAttempt >= 3 || !NetworkCore.current.socketConnectionAllowed)
         {
            return;
         }
         _connectionAttempt = Number(_connectionAttempt) + 1;
         _connecting = true;
         _ioSocket = NetworkCore.current.createSocketConnection(NetworkConfig.socketServerURL);
         _ioSocket.onConnected.add(onSocketConnected);
         _ioSocket.onDisconnected.add(onSocketDisconnected);
         _ioSocket.onClose.add(onSocketClose);
         _ioSocket.onMessage.add(onSocketMessage);
         _ioSocket.onConnectError.add(onSocketConnectionFault);
         _ioSocket.onSecurityError.add(onSocketSecurityFault);
         _ioSocket.onIOError.add(onSocketIOError);
         _ioSocket.connect();
      }
      
      public function disconnect() : void
      {
         if(_ioSocket)
         {
            _ioSocket.close();
            _ioSocket = null;
         }
         _connecting = false;
         _connected = false;
         _connectionAttempt = 0;
         _currentRequest = null;
      }
      
      private function onSocketMessage(param1:TypedObject) : void
      {
         var _loc2_:* = null;
         if(TransportLayer.verbose)
         {
            Logger.debug("[Request] SocketTransportLayer::Message(" + param1.getString("name") + ")");
            Logger.debug("[Request] " + param1.asJsonString);
         }
         var _loc3_:* = param1.getString("name");
         switch(_loc3_)
         {
            case "requestResponse":
               _loc2_ = param1.getArray("args")[0] as String;
               _currentRequest.onRequestCompleted("",_loc2_,0);
               _currentRequest = endRequest(_currentRequest);
               break;
            case "clientRegistered":
               _connected = true;
               startHeartbeat();
               _socketHandler.handleMessage(this,param1.getString("name"),param1.getArray("args")[0]);
               break;
            default:
               _socketHandler.handleMessage(this,param1.getString("name"),param1.getArray("args")[0]);
         }
      }
      
      private function onSocketConnectionFault(param1:Exception) : void
      {
         _connecting = false;
         _connected = false;
         if(_ioSocket)
         {
            _ioSocket.close();
            _ioSocket = null;
         }
         if(TransportLayer.verbose)
         {
            Logger.debug("[Request] SocketTransportLayer::onSocketConnectionFault");
         }
         _socketHandler.onDisconnect(false);
      }
      
      private function onSocketIOError(param1:IOException) : void
      {
         if(_ioSocket)
         {
            _ioSocket.onConnected.add(onSocketConnected);
         }
         _connecting = false;
         _connected = false;
         if(_ioSocket)
         {
            _ioSocket.close();
            _ioSocket = null;
         }
         if(TransportLayer.verbose)
         {
            Logger.debug("[Request] SocketTransportLayer::IOError");
         }
         _socketHandler.onDisconnect(true);
      }
      
      private function onSocketSecurityFault(param1:SecurityException) : void
      {
         _connecting = false;
         _connected = false;
         if(_ioSocket)
         {
            _ioSocket.close();
            _ioSocket = null;
         }
         if(TransportLayer.verbose)
         {
            Logger.debug("[Request] SocketTransportLayer::onSocketSecurityFault");
         }
         _socketHandler.onDisconnect(false);
      }
      
      private function onSocketConnected() : void
      {
         if(!_ioSocket)
         {
            return;
         }
         _ioSocket.onConnected.remove(onSocketConnected);
         _connecting = false;
         if(TransportLayer.verbose)
         {
            Logger.debug("[Request] SocketTransportLayer::Connected");
         }
         _socketHandler.onConnect();
      }
      
      private function onSocketDisconnected() : void
      {
         if(_ioSocket)
         {
            _ioSocket.onConnected.add(onSocketConnected);
         }
         _connecting = false;
         _connected = false;
         if(_ioSocket)
         {
            _ioSocket.close();
            _ioSocket = null;
         }
         if(TransportLayer.verbose)
         {
            Logger.debug("[Request] SocketTransportLayer::Disconnected");
         }
         _socketHandler.onDisconnect(true);
      }
      
      private function onSocketClose() : void
      {
         if(_ioSocket)
         {
            _ioSocket.onConnected.add(onSocketConnected);
         }
         _connecting = false;
         _connected = false;
         if(_ioSocket)
         {
            _ioSocket.close();
            _ioSocket = null;
         }
         if(TransportLayer.verbose)
         {
            Logger.debug("[Request] SocketTransportLayer::Closed");
         }
         _socketHandler.onDisconnect(true);
      }
   }
}
