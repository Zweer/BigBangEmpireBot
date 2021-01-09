package com.playata.framework.network.lib.flash
{
   import com.playata.framework.application.Environment;
   import com.playata.framework.core.TypedObject;
   import com.playata.framework.core.error.Exception;
   import com.playata.framework.core.error.IOException;
   import com.playata.framework.core.error.SecurityException;
   import com.playata.framework.core.logging.Logger;
   import com.playata.framework.core.signal.ISignal;
   import com.playata.framework.core.signal.Signal;
   import com.playata.framework.core.timer.ITimer;
   import com.playata.framework.network.request.socket.ISocketConnection;
   import flash.events.Event;
   import flash.events.IOErrorEvent;
   import flash.events.SecurityErrorEvent;
   import flash.net.URLLoader;
   import flash.net.URLRequest;
   import flash.system.Security;
   import websocket.jimisaacs.data.URL;
   import websocket.net.gimite.websocket.IWebSocketLogger;
   import websocket.net.gimite.websocket.IWebSocketWrapper;
   import websocket.net.gimite.websocket.WebSocket;
   import websocket.net.gimite.websocket.WebSocketEvent;
   import websocket.socket.io.parser.Decoder;
   import websocket.socket.io.parser.Encoder;
   
   public class FlashSocket implements IWebSocketWrapper, IWebSocketLogger, ISocketConnection
   {
      
      public static var id:int = 0;
      
      public static var deactivateConnectionAttempts:Boolean = false;
       
      
      private var _debug:Boolean = false;
      
      private var _callerUrl:String;
      
      private var _socketURL:String;
      
      private var _webSocket:WebSocket;
      
      private var _sessionID:String;
      
      private var _protocols:Array;
      
      private var _httpProtocal:String;
      
      private var _webSocketProtocal:String;
      
      private var _domain:String;
      
      private var _protocol:String;
      
      private var _proxyHost:String;
      
      private var _proxyPort:int;
      
      private var _headers:String;
      
      private var _channel:String = "";
      
      private var _ackId:int = 0;
      
      private var _acks:Object;
      
      private var _queryUrlSuffix:String;
      
      private var _heartBeatInterval:int;
      
      private var _receiveBuffer:Array;
      
      private var _keepaliveTimer:ITimer;
      
      private var _pongTimer:ITimer;
      
      private var _heartBeatTimeout:int;
      
      private var _connected:Boolean;
      
      private var _connecting:Boolean;
      
      private var _onConnected:ISignal = null;
      
      private var _onDisconnected:ISignal = null;
      
      private var _onClose:ISignal = null;
      
      private var _onMessage:ISignal = null;
      
      private var _onConnectError:ISignal = null;
      
      private var _onSecurityError:ISignal = null;
      
      private var _onIOError:ISignal = null;
      
      protected var frame:String = "~m~";
      
      public function FlashSocket(param1:String, param2:String = null, param3:String = null, param4:int = 0, param5:String = null)
      {
         _acks = {};
         _receiveBuffer = [];
         super();
         _httpProtocal = "http";
         _webSocketProtocal = "ws";
         _queryUrlSuffix = param1.split("?")[1] != undefined?"?" + param1.split("?")[1]:"";
         var _loc6_:URL = new URL(param1);
         if(_loc6_.protocol == "https")
         {
            _httpProtocal = "https";
            _webSocketProtocal = "wss";
         }
         param2 = _httpProtocal;
         param1 = _loc6_.host;
         _socketURL = _webSocketProtocal + "://" + param1 + "/socket.io/?EIO=2&transport=websocket";
         _callerUrl = _httpProtocal + "://" + param1;
         _domain = param1;
         _protocol = param2;
         _proxyHost = param3;
         _proxyPort = param4;
         _headers = param5;
         _channel = _loc6_.pathname || "/";
         if(_channel && _channel.length > 0 && _channel.indexOf("/") != 0)
         {
            _channel = "/" + _channel;
         }
      }
      
      public function get onConnected() : ISignal
      {
         if(_onConnected == null)
         {
            _onConnected = new Signal();
         }
         return _onConnected;
      }
      
      public function get onDisconnected() : ISignal
      {
         if(_onDisconnected == null)
         {
            _onDisconnected = new Signal();
         }
         return _onDisconnected;
      }
      
      public function get onClose() : ISignal
      {
         if(_onClose == null)
         {
            _onClose = new Signal();
         }
         return _onClose;
      }
      
      public function get onMessage() : ISignal
      {
         if(_onMessage == null)
         {
            _onMessage = new Signal();
         }
         return _onMessage;
      }
      
      public function get onConnectError() : ISignal
      {
         if(_onConnectError == null)
         {
            _onConnectError = new Signal();
         }
         return _onConnectError;
      }
      
      public function get onSecurityError() : ISignal
      {
         if(_onSecurityError == null)
         {
            _onSecurityError = new Signal();
         }
         return _onSecurityError;
      }
      
      public function get onIOError() : ISignal
      {
         if(_onIOError == null)
         {
            _onIOError = new Signal();
         }
         return _onIOError;
      }
      
      public function getOrigin() : String
      {
         var _loc1_:URL = new URL(_callerUrl);
         return _loc1_.protocol + "://" + _loc1_.host.toLowerCase();
      }
      
      public function getCallerHost() : String
      {
         return null;
      }
      
      public function connect() : void
      {
         Logger.debug(getConnectionUrl(_httpProtocal,_domain));
         Logger.debug(_socketURL);
         Logger.debug(_callerUrl);
         var _loc1_:URLRequest = new URLRequest();
         _loc1_.url = getConnectionUrl(_httpProtocal,_domain);
         _loc1_.method = "GET";
         var _loc2_:URLLoader = new URLLoader();
         _loc2_.addEventListener("complete",onDiscover);
         _loc2_.addEventListener("securityError",onDiscoverSecurityError);
         _loc2_.addEventListener("ioError",onDiscoverIOError);
         _loc2_.load(_loc1_);
      }
      
      public function close() : void
      {
         if(_webSocket)
         {
            _webSocket.removeEventListener("message",onWSMessage);
            _webSocket.removeEventListener("close",onWSClose);
            _webSocket.removeEventListener("open",onWSOpen);
            _webSocket.removeEventListener("close",onWSClose);
            _webSocket.removeEventListener("connect",onWSConnect);
            _webSocket.removeEventListener("ioError",onWSIoError);
            _webSocket.removeEventListener("securityError",onWSSecurityError);
            _webSocket.close();
         }
         if(_keepaliveTimer)
         {
            _keepaliveTimer.dispose();
            _keepaliveTimer = null;
         }
         if(_pongTimer)
         {
            _pongTimer.dispose();
            _pongTimer = null;
         }
      }
      
      public function send(param1:Object, param2:String = null, param3:Function = null) : void
      {
         var _loc4_:int = 0;
         if(param1 as Array)
         {
            (param1 as Array).unshift(param2);
         }
         else
         {
            param1 = [param2,param1];
         }
         var _loc5_:Object = {
            "type":2,
            "data":param1,
            "nsp":_channel
         };
         if(null != param3)
         {
            _loc4_ = _ackId;
            _acks[_ackId] = param3;
            _ackId = Number(_ackId) + 1;
            _loc5_.id = _loc4_;
         }
         try
         {
            _webSocket.send(new Encoder().encodeAsString(_loc5_));
            return;
         }
         catch(err:Error)
         {
            error("Unable to send message: " + err.message);
            return;
         }
      }
      
      public function startHeartbeat() : void
      {
         if(_keepaliveTimer && _keepaliveTimer.isRunning)
         {
            return;
         }
         _keepaliveTimer = Environment.createTimer("FlashSocket::heartBeat",_heartBeatInterval,keepaliveTimer_timer);
         _keepaliveTimer.start();
      }
      
      public function log(param1:String) : void
      {
         if(_debug)
         {
            Logger.debug("webSocketLog: " + param1);
         }
      }
      
      public function error(param1:String) : void
      {
         Logger.debug("webSocketError: " + param1);
         if(param1.indexOf("bad response: HTTP/1.1 302 Found") != -1 || param1.indexOf("bad response: HTTP/1.1 450 Blocked by WPC") != -1 || param1.indexOf("bad response: HTTP/1.0 502 Bad Gateway") != -1 || param1.indexOf("bad response: HTTP/1.0 400 Bad Request") != -1 || param1.indexOf("bad response: HTTP/1.1 400 Bad Request") != -1 || param1.indexOf("bad response: HTTP/1.0 403 Forbidden") != -1 || param1.indexOf("bad response: HTTP/1.1 403 Forbidden") != -1 || param1.indexOf("bad response: HTTP/1.0 404 Not Found") != -1 || param1.indexOf("bad response: HTTP/1.1 404 Not Found") != -1 || param1.indexOf("bad response: HTTP/1.1 504") != -1 || param1.indexOf("bad response: HTTP/1.1 200 OK") != -1)
         {
            deactivateConnectionAttempts = true;
            return;
         }
         if(param1.indexOf("onDiscoverSecurityError. SecurityErrorEvent: 2048") != -1 || param1.indexOf("onDiscoverError. IOErrorEvent: 2032") != -1)
         {
            deactivateConnectionAttempts = true;
            return;
         }
         if(param1.indexOf("(SecurityError: Error #2048)") != -1)
         {
            deactivateConnectionAttempts = true;
            return;
         }
         if(param1.indexOf("(IoError: Error #2031)") != -1)
         {
            deactivateConnectionAttempts = true;
            return;
         }
         if(param1.indexOf("Error: Error #2002") != -1)
         {
            deactivateConnectionAttempts = true;
            return;
         }
         Environment.reportError("webSocketError: " + param1,null,false,true);
      }
      
      protected function getConnectionUrl(param1:String, param2:String) : String
      {
         var _loc3_:String = param1 + "://" + param2 + "/socket.io/?EIO=2&time=" + new Date().getTime() + _queryUrlSuffix.split("?").join("&");
         _loc3_ = _loc3_ + "&transport=polling";
         return _loc3_;
      }
      
      protected function loadDefaultPolicyFile(param1:String) : void
      {
         var _loc3_:URL = new URL(param1);
         var _loc2_:String = "xmlsocket://" + _loc3_.hostname + ":843";
         Security.loadPolicyFile(_loc2_);
      }
      
      protected function onDiscover(param1:Event) : void
      {
         var _loc2_:* = null;
         var _loc3_:* = null;
         var _loc4_:int = 0;
         try
         {
            _loc2_ = param1.target.data;
            _loc2_ = _loc2_.substr(_loc2_.indexOf("{"));
            _loc3_ = websocket.adobe.serialization.json.JSON.decode(_loc2_);
            _sessionID = _loc3_.sid;
            _heartBeatTimeout = _loc3_.pingTimeout;
            _heartBeatInterval = _loc3_.pingInterval;
            _protocols = _loc3_.upgrades;
            _socketURL = _socketURL + _queryUrlSuffix.split("?").join("&");
            _loc4_ = _socketURL.lastIndexOf("/");
            _socketURL = _socketURL.slice(0,_loc4_) + _socketURL.slice(_loc4_) + "&sid=" + _sessionID;
            onHandshake(param1);
            return;
         }
         catch(e:Error)
         {
            error("onDiscover: " + e.getStackTrace());
            return;
         }
      }
      
      protected function onHandshake(param1:Event = null) : void
      {
         loadDefaultPolicyFile(_socketURL);
         var _loc2_:Number = FlashSocket.id;
         FlashSocket.id++;
         _webSocket = new WebSocket(_loc2_,_socketURL,[_protocol],getOrigin(),_proxyHost,_proxyPort,"",_headers,this);
         _webSocket.addEventListener("message",onWSMessage);
         _webSocket.addEventListener("close",onWSClose);
         _webSocket.addEventListener("open",onWSOpen);
         _webSocket.addEventListener("close",onWSClose);
         _webSocket.addEventListener("connect",onWSConnect);
         _webSocket.addEventListener("ioError",onWSIoError);
         _webSocket.addEventListener("securityError",onWSSecurityError);
      }
      
      protected function onDiscoverIOError(param1:IOErrorEvent) : void
      {
         deactivateConnectionAttempts = true;
         if(_onConnectError != null)
         {
            _onConnectError.dispatch(new Exception(param1.toString(),param1.errorID));
         }
         error("onDiscoverError. IOErrorEvent: " + param1.errorID.toString());
      }
      
      protected function onDiscoverSecurityError(param1:SecurityErrorEvent) : void
      {
         deactivateConnectionAttempts = true;
         if(_onConnectError != null)
         {
            _onConnectError.dispatch(new Exception(param1.toString(),param1.errorID));
         }
         error("onDiscoverSecurityError. SecurityErrorEvent: " + param1.errorID.toString());
      }
      
      protected function onWSClose(param1:Event) : void
      {
         if(_onClose != null)
         {
            _onClose.dispatch();
         }
      }
      
      protected function onWSConnect(param1:Event) : void
      {
         if(_onConnected != null)
         {
            _onConnected.dispatch();
         }
      }
      
      protected function onWSIoError(param1:IOErrorEvent) : void
      {
         if(_onIOError != null)
         {
            _onIOError.dispatch(new IOException(param1.toString(),param1.errorID));
         }
      }
      
      protected function onWSSecurityError(param1:SecurityErrorEvent) : void
      {
         if(_onSecurityError != null)
         {
            _onSecurityError.dispatch(new SecurityException(param1.toString(),param1.errorID));
         }
      }
      
      protected function onWSOpen(param1:WebSocketEvent) : void
      {
         _webSocket.send("2probe");
      }
      
      protected function onWSMessage(param1:WebSocketEvent) : void
      {
         var _loc2_:* = null;
         var _loc7_:* = null;
         var _loc5_:* = null;
         var _loc3_:* = null;
         var _loc4_:* = null;
         var _loc6_:String = decodeURIComponent(param1.message);
         if(_loc6_)
         {
            if(_loc6_ == "3")
            {
               _pongTimer.stop();
               return;
            }
            if(_loc6_ == "3probe")
            {
               _webSocket.send("5");
               return;
            }
            if(_loc6_.charAt(0) == "4")
            {
               _loc7_ = new Decoder().decode(_loc6_);
               var _loc10_:* = _loc7_.type;
               switch(_loc10_)
               {
                  case 0:
                     if(_loc7_.nsp == _channel)
                     {
                        emitBuffered();
                        _connected = true;
                        _connecting = false;
                        if(_onConnected != null)
                        {
                           _onConnected.dispatch();
                        }
                     }
                     else
                     {
                        try
                        {
                           _webSocket.send(new Encoder().encodeAsString({
                              "type":0,
                              "nsp":_channel
                           }));
                        }
                        catch(err:Error)
                        {
                           error("connect error: " + err.message);
                        }
                     }
                     break;
                  case 2:
                     _loc2_ = _loc7_.data || [];
                     if(null != _loc7_.id)
                     {
                        Logger.debug("attaching ack callback to event");
                        if(_acks.hasOwnProperty(_loc7_.id))
                        {
                           _loc2_.push(_acks(_loc7_.id));
                        }
                     }
                     if(_connected)
                     {
                        _loc5_ = _loc2_.shift();
                        _loc3_ = _loc2_;
                        if(_onMessage != null)
                        {
                           _onMessage.dispatch(new TypedObject({
                              "name":_loc5_,
                              "args":_loc3_
                           }));
                        }
                     }
                     else
                     {
                        _receiveBuffer.push(_loc2_);
                     }
                     break;
                  case 3:
                     _loc2_ = _loc7_.data || [];
                     if(_acks.hasOwnProperty(_loc7_.id))
                     {
                        _loc4_ = _acks[_loc7_.id] as Function;
                        if(_loc2_.length > _loc4_.length)
                        {
                           _loc4_.apply(null,_loc2_.slice(0,_loc4_.length));
                        }
                        else
                        {
                           _loc4_.apply(null,_loc2_);
                        }
                        delete _acks[id];
                     }
                     break;
                  case 1:
                     _connected = false;
                     _connecting = false;
                     if(_onDisconnected != null)
                     {
                        _onDisconnected.dispatch();
                     }
                     break;
                  case 4:
                     Logger.debug("3: error" + _loc7_.data);
               }
            }
         }
      }
      
      private function emitBuffered() : void
      {
         var _loc4_:int = 0;
         var _loc1_:* = null;
         var _loc3_:* = null;
         var _loc2_:* = null;
         _loc4_ = 0;
         while(_loc4_ < _receiveBuffer.length)
         {
            _loc1_ = _receiveBuffer[_loc4_] as Array;
            _loc3_ = _loc1_.shift();
            _loc2_ = _loc1_;
            if(_onMessage != null)
            {
               _onMessage.dispatch(new TypedObject({
                  "name":_loc3_,
                  "args":_loc2_
               }));
            }
            _loc4_++;
         }
         _receiveBuffer = [];
      }
      
      private function keepaliveTimer_timer() : void
      {
         if(_pongTimer && _pongTimer.isRunning)
         {
            return;
         }
         _pongTimer = Environment.createTimer("FlashSocket::pong",_heartBeatInterval,pongTimer_timerComplete,null,1);
         _pongTimer.start();
         if(_webSocket)
         {
            try
            {
               _webSocket.send("2");
               return;
            }
            catch(e:Error)
            {
               if(e.errorID == 1502)
               {
                  close();
               }
               return;
            }
         }
      }
      
      private function pongTimer_timerComplete() : void
      {
         onWSClose(null);
      }
   }
}
