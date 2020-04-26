package websocket.net.gimite.websocket
{
   import flash.events.Event;
   import flash.events.EventDispatcher;
   import flash.events.IOErrorEvent;
   import flash.events.ProgressEvent;
   import flash.events.SecurityErrorEvent;
   import flash.net.Socket;
   import flash.utils.ByteArray;
   import flash.utils.setTimeout;
   import mx.utils.StringUtil;
   import websocket.adobe.net.proxies.RFC2817Socket;
   import websocket.gsolo.encryption.SHA1;
   import websocket.hurlant.crypto.tls.TLSConfig;
   import websocket.hurlant.crypto.tls.TLSSocket;
   import websocket.mx.utils.Base64Encoder;
   
   public class WebSocket extends EventDispatcher
   {
      
      private static const WEB_SOCKET_GUID:String = "258EAFA5-E914-47DA-95CA-C5AB0DC85B11";
      
      private static const CONNECTING:int = 0;
      
      private static const OPEN:int = 1;
      
      private static const CLOSING:int = 2;
      
      private static const CLOSED:int = 3;
      
      private static const OPCODE_CONTINUATION:int = 0;
      
      private static const OPCODE_TEXT:int = 1;
      
      private static const OPCODE_BINARY:int = 2;
      
      private static const OPCODE_CLOSE:int = 8;
      
      private static const OPCODE_PING:int = 9;
      
      private static const OPCODE_PONG:int = 10;
      
      private static const STATUS_NORMAL_CLOSURE:int = 1000;
      
      private static const STATUS_NO_CODE:int = 1005;
      
      private static const STATUS_CLOSED_ABNORMALLY:int = 1006;
      
      private static const STATUS_CONNECTION_ERROR:int = 5000;
       
      
      private var id:int;
      
      private var url:String;
      
      private var scheme:String;
      
      private var host:String;
      
      private var port:uint;
      
      private var path:String;
      
      private var origin:String;
      
      private var requestedProtocols:Array;
      
      private var cookie:String;
      
      private var headers:String;
      
      private var rawSocket:Socket;
      
      private var tlsSocket:TLSSocket;
      
      private var tlsConfig:TLSConfig;
      
      private var socket:Socket;
      
      private var acceptedProtocol:String;
      
      private var expectedDigest:String;
      
      private var buffer:ByteArray;
      
      private var fragmentsBuffer:ByteArray = null;
      
      private var headerState:int = 0;
      
      private var readyState:int = 0;
      
      private var logger:IWebSocketLogger;
      
      private var base64Encoder:Base64Encoder;
      
      public function WebSocket(param1:int, param2:String, param3:Array, param4:String, param5:String, param6:int, param7:String, param8:String, param9:IWebSocketLogger)
      {
         var _loc11_:* = null;
         buffer = new ByteArray();
         base64Encoder = new Base64Encoder();
         super();
         this.logger = param9;
         this.id = param1;
         this.url = param2;
         var _loc12_:Array = param2.match(/^(\w+):\/\/([^\/:]+)(:(\d+))?(\/.*)?(\?.*)?$/);
         if(!_loc12_)
         {
            fatal("SYNTAX_ERR: invalid url: " + param2);
         }
         this.scheme = _loc12_[1];
         this.host = _loc12_[2];
         var _loc10_:int = scheme == "wss"?443:80;
         this.port = parseInt(_loc12_[4]) || _loc10_;
         this.path = (_loc12_[5] || "/") + (_loc12_[6] || "");
         this.origin = param4;
         this.requestedProtocols = param3;
         this.cookie = param7;
         this.headers = param8;
         if(param5 != null && param6 != 0)
         {
            if(scheme == "wss")
            {
               fatal("wss with proxy is not supported");
            }
            _loc11_ = new RFC2817Socket();
            _loc11_.setProxyInfo(param5,param6);
            _loc11_.addEventListener("socketData",onSocketData);
            socket = _loc11_;
            rawSocket = _loc11_;
         }
         else
         {
            rawSocket = new Socket();
            if(scheme == "wss")
            {
               tlsConfig = new TLSConfig(1,null,null,null,null,null,769);
               tlsConfig.trustAllCertificates = true;
               tlsConfig.ignoreCommonNameMismatch = true;
               tlsSocket = new TLSSocket();
               tlsSocket.addEventListener("socketData",onSocketData);
               socket = tlsSocket;
            }
            else
            {
               rawSocket.addEventListener("socketData",onSocketData);
               socket = rawSocket;
            }
         }
         rawSocket.addEventListener("close",onSocketClose);
         rawSocket.addEventListener("connect",onSocketConnect);
         rawSocket.addEventListener("ioError",onSocketIoError);
         rawSocket.addEventListener("securityError",onSocketSecurityError);
         rawSocket.connect(host,port);
      }
      
      public function getId() : int
      {
         return this.id;
      }
      
      public function getReadyState() : int
      {
         return this.readyState;
      }
      
      public function getAcceptedProtocol() : String
      {
         return this.acceptedProtocol;
      }
      
      public function send(param1:String) : int
      {
         var _loc3_:* = null;
         var _loc4_:* = null;
         try
         {
            _loc3_ = decodeURIComponent(param1);
         }
         catch(ex:URIError)
         {
            logger.error("SYNTAX_ERR: URIError in send()");
            var _loc6_:int = 0;
            return _loc6_;
         }
         logger.log("send: " + _loc3_);
         var _loc2_:ByteArray = new ByteArray();
         _loc2_.writeUTFBytes(_loc3_);
         if(readyState == 1)
         {
            _loc4_ = new WebSocketFrame();
            _loc4_.opcode = 1;
            _loc4_.payload = _loc2_;
            if(sendFrame(_loc4_))
            {
               return -1;
            }
            return _loc2_.length;
         }
         if(readyState == 2 || readyState == 3)
         {
            return _loc2_.length;
         }
         fatal("invalid state");
         return 0;
      }
      
      public function close(param1:int = 1005, param2:String = "", param3:String = "client") : void
      {
         var _loc8_:* = null;
         var _loc5_:Boolean = false;
         var _loc6_:Boolean = false;
         var _loc4_:int = 0;
         if(param1 != 1000 && param1 != 1005 && param1 != 5000)
         {
            logger.error(StringUtil.substitute("Fail connection by {0}: code={1} reason={2}",param3,param1,param2));
         }
         var _loc7_:Boolean = param1 == 5000 || param3 == "server";
         try
         {
            if(readyState == 1 && param1 != 5000)
            {
               _loc8_ = new WebSocketFrame();
               _loc8_.opcode = 8;
               _loc8_.payload = new ByteArray();
               if(param3 == "client" && param1 != 1005)
               {
                  _loc8_.payload.writeShort(param1);
                  _loc8_.payload.writeUTFBytes(param2);
               }
               sendFrame(_loc8_);
            }
            socket.close();
         }
         catch(ex:Error)
         {
            logger.error("Error: " + ex.message);
         }
         if(_loc7_)
         {
            logger.log("closed");
            _loc5_ = readyState != 0 && param1 == 5000;
            readyState = 3;
            if(_loc5_)
            {
               dispatchEvent(new WebSocketEvent("error"));
            }
            _loc6_ = param1 != 1006 && param1 != 5000;
            _loc4_ = param1 == 5000?1006:int(param1);
            dispatchCloseEvent(_loc6_,_loc4_,param2);
         }
         else
         {
            logger.log("closing");
            readyState = 2;
         }
      }
      
      private function onSocketConnect(param1:Event) : void
      {
         logger.log("connected");
         if(scheme == "wss")
         {
            logger.log("starting SSL/TLS");
            tlsSocket.startTLS(rawSocket,host,tlsConfig);
         }
         var _loc2_:int = scheme == "wss"?443:80;
         var _loc4_:String = host + (port == _loc2_?"":":" + port);
         var _loc5_:String = generateKey();
         SHA1.b64pad = "=";
         expectedDigest = SHA1.b64_sha1(_loc5_ + "258EAFA5-E914-47DA-95CA-C5AB0DC85B11");
         var _loc3_:String = "";
         if(requestedProtocols.length > 0)
         {
            _loc3_ = _loc3_ + ("Sec-WebSocket-Protocol: " + requestedProtocols.join(",") + "\r\n");
         }
         if(headers)
         {
            _loc3_ = _loc3_ + headers;
         }
         var _loc6_:String = StringUtil.substitute("GET {0} HTTP/1.1\r\nHost: {1}\r\nUpgrade: websocket\r\nConnection: Upgrade\r\nSec-WebSocket-Key: {2}\r\nOrigin: {3}\r\nSec-WebSocket-Version: 13\r\nCookie: {4}\r\n{5}\r\n",path,_loc4_,_loc5_,origin,cookie,_loc3_);
         logger.log("request header:\n" + _loc6_);
         socket.writeUTFBytes(_loc6_);
         socket.flush();
      }
      
      private function onSocketClose(param1:Event) : void
      {
         logger.log("closed");
         readyState = 3;
         dispatchCloseEvent(false,1006,"");
      }
      
      private function onSocketIoError(param1:IOErrorEvent) : void
      {
         var _loc2_:* = null;
         if(readyState == 0)
         {
            _loc2_ = "cannot connect to Web Socket server at " + url + " (IoError: " + param1.text + ")";
         }
         else
         {
            _loc2_ = "error communicating with Web Socket server at " + url + " (IoError: " + param1.text + ")";
         }
         onConnectionError(_loc2_);
      }
      
      private function onSocketSecurityError(param1:SecurityErrorEvent) : void
      {
         var _loc2_:* = null;
         if(readyState == 0)
         {
            _loc2_ = "cannot connect to Web Socket server at " + url + " (SecurityError: " + param1.text + ")\n" + "make sure the server is running and Flash socket policy file is correctly placed";
         }
         else
         {
            _loc2_ = "error communicating with Web Socket server at " + url + " (SecurityError: " + param1.text + ")";
         }
         onConnectionError(_loc2_);
      }
      
      private function onConnectionError(param1:String) : void
      {
         if(readyState == 3)
         {
            return;
         }
         logger.error(param1);
         close(5000);
      }
      
      private function onSocketData(param1:ProgressEvent) : void
      {
         var _loc6_:* = null;
         var _loc7_:* = null;
         var _loc4_:* = null;
         var _loc3_:int = 0;
         var _loc2_:* = null;
         var _loc5_:int = buffer.length;
         socket.readBytes(buffer,_loc5_);
         while(_loc5_ < buffer.length)
         {
            if(headerState < 4)
            {
               if((headerState == 0 || headerState == 2) && buffer[_loc5_] == 13)
               {
                  headerState = headerState + 1;
               }
               else if((headerState == 1 || headerState == 3) && buffer[_loc5_] == 10)
               {
                  headerState = headerState + 1;
               }
               else
               {
                  headerState = 0;
               }
               if(headerState == 4)
               {
                  _loc6_ = readUTFBytes(buffer,0,_loc5_ + 1);
                  logger.log("response header:\n" + _loc6_);
                  if(!validateHandshake(_loc6_))
                  {
                     return;
                  }
                  removeBufferBefore(_loc5_ + 1);
                  _loc5_ = -1;
                  readyState = 1;
                  this.dispatchEvent(new WebSocketEvent("open"));
               }
            }
            else
            {
               _loc7_ = parseFrame();
               if(_loc7_)
               {
                  removeBufferBefore(_loc7_.length);
                  _loc5_ = -1;
                  if(_loc7_.rsv != 0)
                  {
                     close(1002,"RSV must be 0.");
                     return;
                  }
                  if(_loc7_.mask)
                  {
                     close(1002,"Frame from server must not be masked.");
                     return;
                  }
                  if(_loc7_.opcode >= 8 && _loc7_.opcode <= 15 && _loc7_.payload.length >= 126)
                  {
                     close(1004,"Payload of control frame must be less than 126 bytes.");
                  }
                  else
                  {
                     switch(int(_loc7_.opcode))
                     {
                        case 0:
                           if(fragmentsBuffer == null)
                           {
                              close(1002,"Unexpected continuation frame");
                           }
                           else
                           {
                              fragmentsBuffer.writeBytes(_loc7_.payload);
                              if(_loc7_.fin)
                              {
                                 _loc4_ = readUTFBytes(fragmentsBuffer,0,fragmentsBuffer.length);
                                 try
                                 {
                                    this.dispatchEvent(new WebSocketEvent("message",encodeURIComponent(_loc4_)));
                                 }
                                 catch(ex:URIError)
                                 {
                                    close(1007,"URIError while encoding the received data.");
                                 }
                                 fragmentsBuffer = null;
                              }
                           }
                           break;
                        case 1:
                           if(_loc7_.fin)
                           {
                              _loc4_ = readUTFBytes(_loc7_.payload,0,_loc7_.payload.length);
                              try
                              {
                                 this.dispatchEvent(new WebSocketEvent("message",encodeURIComponent(_loc4_)));
                              }
                              catch(ex:URIError)
                              {
                                 close(1007,"URIError while encoding the received data.");
                              }
                           }
                           else
                           {
                              fragmentsBuffer = new ByteArray();
                              fragmentsBuffer.writeBytes(_loc7_.payload);
                           }
                           break;
                        case 2:
                           close(1003,"Received binary data, which is not supported.");
                           break;
                        default:
                        default:
                        default:
                        default:
                        default:
                           close(1002,"Received unknown opcode: " + _loc7_.opcode);
                           break;
                        case 8:
                           _loc3_ = 1005;
                           _loc2_ = "";
                           if(_loc7_.payload.length >= 2)
                           {
                              _loc7_.payload.endian = "bigEndian";
                              _loc7_.payload.position = 0;
                              _loc3_ = _loc7_.payload.readUnsignedShort();
                              _loc2_ = readUTFBytes(_loc7_.payload,2,_loc7_.payload.length - 2);
                           }
                           logger.log("received closing frame");
                           close(_loc3_,_loc2_,"server");
                           break;
                        case 9:
                           sendPong(_loc7_.payload);
                           break;
                        case 10:
                     }
                  }
               }
            }
            _loc5_++;
         }
      }
      
      private function validateHandshake(param1:String) : Boolean
      {
         var _loc4_:int = 0;
         var _loc7_:* = null;
         var _loc9_:* = null;
         var _loc8_:* = null;
         var _loc6_:Array = param1.split(/\r\n/);
         if(!_loc6_[0].match(/^HTTP\/1.1 101 /))
         {
            onConnectionError("bad response: " + _loc6_[0]);
            return false;
         }
         var _loc3_:Object = {};
         var _loc2_:Object = {};
         _loc4_ = 1;
         while(_loc4_ < _loc6_.length)
         {
            if(_loc6_[_loc4_].length != 0)
            {
               _loc7_ = _loc6_[_loc4_].match(/^(\S+):(.*)$/);
               if(!_loc7_)
               {
                  onConnectionError("failed to parse response header line: " + _loc6_[_loc4_]);
                  return false;
               }
               _loc9_ = _loc7_[1].toLowerCase();
               _loc8_ = StringUtil.trim(_loc7_[2]);
               _loc3_[_loc9_] = _loc8_;
               _loc2_[_loc9_] = _loc8_.toLowerCase();
            }
            _loc4_++;
         }
         if(_loc2_["upgrade"] != "websocket")
         {
            onConnectionError("invalid Upgrade: " + _loc3_["Upgrade"]);
            return false;
         }
         if(_loc2_["connection"] != "upgrade")
         {
            onConnectionError("invalid Connection: " + _loc3_["Connection"]);
            return false;
         }
         if(!_loc2_["sec-websocket-accept"])
         {
            onConnectionError("The WebSocket server speaks old WebSocket protocol, which is not supported by web-socket-js. It requires WebSocket protocol HyBi 10. Try newer version of the server if available.");
            return false;
         }
         var _loc5_:String = _loc3_["sec-websocket-accept"];
         if(_loc5_ != expectedDigest)
         {
            onConnectionError("digest doesn\'t match: " + _loc5_ + " != " + expectedDigest);
            return false;
         }
         if(requestedProtocols.length > 0)
         {
            acceptedProtocol = _loc3_["sec-websocket-protocol"];
            if(requestedProtocols.indexOf(acceptedProtocol) < 0)
            {
               onConnectionError("protocol doesn\'t match: \'" + acceptedProtocol + "\' not in \'" + requestedProtocols.join(",") + "\'");
               return false;
            }
         }
         return true;
      }
      
      private function sendPong(param1:ByteArray) : Boolean
      {
         var _loc2_:WebSocketFrame = new WebSocketFrame();
         _loc2_.opcode = 10;
         _loc2_.payload = param1;
         return sendFrame(_loc2_);
      }
      
      private function sendFrame(param1:WebSocketFrame) : Boolean
      {
         frame = param1;
         var plength:uint = frame.payload.length;
         var mask:ByteArray = new ByteArray();
         var i:int = 0;
         while(i < 4)
         {
            mask.writeByte(randomInt(0,255));
            i = Number(i) + 1;
         }
         var header:ByteArray = new ByteArray();
         header.writeByte((!!frame.fin?128:0) | frame.rsv << 4 | frame.opcode);
         if(plength <= 125)
         {
            header.writeByte(128 | plength);
         }
         else if(plength > 125 && plength < 65536)
         {
            header.writeByte(254);
            header.writeShort(plength);
         }
         else if(plength >= 65536 && plength < 4294967296)
         {
            header.writeByte(255);
            header.writeUnsignedInt(0);
            header.writeUnsignedInt(plength);
         }
         else
         {
            fatal("Send frame size too large");
         }
         header.writeBytes(mask);
         var maskedPayload:ByteArray = new ByteArray();
         maskedPayload.length = frame.payload.length;
         i = 0;
         while(i < frame.payload.length)
         {
            maskedPayload[i] = mask[i % 4] ^ frame.payload[i];
            i = Number(i) + 1;
         }
         try
         {
            socket.writeBytes(header);
            socket.writeBytes(maskedPayload);
            socket.flush();
         }
         catch(ex:Error)
         {
            logger.error("Error while sending frame: " + ex.message);
            setTimeout(function():void
            {
               if(readyState != 3)
               {
                  close(5000);
               }
            },0);
            var _loc4_:Boolean = false;
            return _loc4_;
         }
         return true;
      }
      
      private function parseFrame() : WebSocketFrame
      {
         var _loc1_:* = 0;
         var _loc4_:WebSocketFrame = new WebSocketFrame();
         var _loc2_:uint = 0;
         var _loc3_:uint = 0;
         _loc2_ = 2;
         if(buffer.length < _loc2_)
         {
            return null;
         }
         _loc4_.fin = (buffer[0] & 128) != 0;
         _loc4_.rsv = (buffer[0] & 112) >> 4;
         _loc4_.opcode = buffer[0] & 15;
         _loc4_.mask = (buffer[1] & 128) != 0;
         _loc3_ = buffer[1] & 127;
         if(_loc3_ == 126)
         {
            _loc2_ = 4;
            if(buffer.length < _loc2_)
            {
               return null;
            }
            buffer.endian = "bigEndian";
            buffer.position = 2;
            _loc3_ = buffer.readUnsignedShort();
         }
         else if(_loc3_ == 127)
         {
            _loc2_ = 10;
            if(buffer.length < _loc2_)
            {
               return null;
            }
            buffer.endian = "bigEndian";
            buffer.position = 2;
            _loc1_ = uint(buffer.readUnsignedInt());
            _loc3_ = buffer.readUnsignedInt();
            if(_loc1_ != 0)
            {
               fatal("Frame length exceeds 4294967295. Bailing out!");
               return null;
            }
         }
         if(buffer.length < _loc2_ + _loc3_)
         {
            return null;
         }
         _loc4_.length = _loc2_ + _loc3_;
         _loc4_.payload = new ByteArray();
         buffer.position = _loc2_;
         buffer.readBytes(_loc4_.payload,0,_loc3_);
         return _loc4_;
      }
      
      private function dispatchCloseEvent(param1:Boolean, param2:int, param3:String) : void
      {
         var _loc4_:WebSocketEvent = new WebSocketEvent("close");
         _loc4_.wasClean = param1;
         _loc4_.code = param2;
         _loc4_.reason = param3;
         dispatchEvent(_loc4_);
      }
      
      private function removeBufferBefore(param1:int) : void
      {
         if(param1 == 0)
         {
            return;
         }
         var _loc2_:ByteArray = new ByteArray();
         buffer.position = param1;
         buffer.readBytes(_loc2_);
         buffer = _loc2_;
      }
      
      private function generateKey() : String
      {
         var _loc2_:int = 0;
         var _loc1_:ByteArray = new ByteArray();
         _loc1_.length = 16;
         _loc2_ = 0;
         while(_loc2_ < _loc1_.length)
         {
            _loc1_[_loc2_] = randomInt(0,127);
            _loc2_++;
         }
         base64Encoder.reset();
         base64Encoder.encodeBytes(_loc1_);
         return base64Encoder.toString();
      }
      
      private function readUTFBytes(param1:ByteArray, param2:int, param3:int) : String
      {
         var _loc5_:* = 0;
         param1.position = param2;
         var _loc4_:String = "";
         _loc5_ = param2;
         while(_loc5_ < param2 + param3)
         {
            if(param1[_loc5_] == 0)
            {
               _loc4_ = _loc4_ + (param1.readUTFBytes(_loc5_ - param1.position) + "\x00");
               param1.position = _loc5_ + 1;
            }
            _loc5_++;
         }
         _loc4_ = _loc4_ + param1.readUTFBytes(param2 + param3 - param1.position);
         return _loc4_;
      }
      
      private function randomInt(param1:uint, param2:uint) : uint
      {
         return param1 + Math.floor(Math.random() * (param2 - param1 + 1));
      }
      
      private function fatal(param1:String) : void
      {
         logger.error(param1);
         throw param1;
      }
   }
}
