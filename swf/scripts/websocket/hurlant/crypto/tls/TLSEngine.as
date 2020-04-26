package websocket.hurlant.crypto.tls
{
   import com.playata.framework.core.logging.Logger;
   import flash.events.Event;
   import flash.events.EventDispatcher;
   import flash.events.ProgressEvent;
   import flash.utils.ByteArray;
   import flash.utils.IDataInput;
   import flash.utils.IDataOutput;
   import flash.utils.clearTimeout;
   import flash.utils.setTimeout;
   import websocket.hurlant.crypto.cert.X509Certificate;
   import websocket.hurlant.crypto.cert.X509CertificateCollection;
   import websocket.hurlant.crypto.prng.Random;
   import websocket.hurlant.util.ArrayUtil;
   
   public class TLSEngine extends EventDispatcher
   {
      
      public static const SERVER:uint = 0;
      
      public static const CLIENT:uint = 1;
      
      private static const PROTOCOL_HANDSHAKE:uint = 22;
      
      private static const PROTOCOL_ALERT:uint = 21;
      
      private static const PROTOCOL_CHANGE_CIPHER_SPEC:uint = 20;
      
      private static const PROTOCOL_APPLICATION_DATA:uint = 23;
      
      private static const STATE_NEW:uint = 0;
      
      private static const STATE_NEGOTIATING:uint = 1;
      
      private static const STATE_READY:uint = 2;
      
      private static const STATE_CLOSED:uint = 3;
      
      private static const HANDSHAKE_HELLO_REQUEST:uint = 0;
      
      private static const HANDSHAKE_CLIENT_HELLO:uint = 1;
      
      private static const HANDSHAKE_SERVER_HELLO:uint = 2;
      
      private static const HANDSHAKE_CERTIFICATE:uint = 11;
      
      private static const HANDSHAKE_SERVER_KEY_EXCHANGE:uint = 12;
      
      private static const HANDSHAKE_CERTIFICATE_REQUEST:uint = 13;
      
      private static const HANDSHAKE_HELLO_DONE:uint = 14;
      
      private static const HANDSHAKE_CERTIFICATE_VERIFY:uint = 15;
      
      private static const HANDSHAKE_CLIENT_KEY_EXCHANGE:uint = 16;
      
      private static const HANDSHAKE_FINISHED:uint = 20;
       
      
      public var protocol_version:uint;
      
      private var _entity:uint;
      
      private var _config:TLSConfig;
      
      private var _state:uint;
      
      private var _securityParameters:ISecurityParameters;
      
      private var _currentReadState:IConnectionState;
      
      private var _currentWriteState:IConnectionState;
      
      private var _pendingReadState:IConnectionState;
      
      private var _pendingWriteState:IConnectionState;
      
      private var _handshakePayloads:ByteArray;
      
      private var _handshakeRecords:ByteArray;
      
      private var _iStream:IDataInput;
      
      private var _oStream:IDataOutput;
      
      private var _store:X509CertificateCollection;
      
      private var _otherCertificate:X509Certificate;
      
      private var _otherIdentity:String;
      
      private var _myCertficate:X509Certificate;
      
      private var _myIdentity:String;
      
      private var _packetQueue:Array;
      
      private var protocolHandlers:Object;
      
      private var handshakeHandlersServer:Object;
      
      private var handshakeHandlersClient:Object;
      
      private var _entityHandshakeHandlers:Object;
      
      private var _handshakeCanContinue:Boolean = true;
      
      private var _handshakeQueue:Array;
      
      private var sendClientCert:Boolean = false;
      
      private var _writeScheduler:uint;
      
      public function TLSEngine(param1:TLSConfig, param2:IDataInput, param3:IDataOutput, param4:String = null)
      {
         _packetQueue = [];
         protocolHandlers = {
            23:parseApplicationData,
            22:parseHandshake,
            21:parseAlert,
            20:parseChangeCipherSpec
         };
         handshakeHandlersServer = {
            0:notifyStateError,
            1:parseHandshakeClientHello,
            2:notifyStateError,
            11:loadCertificates,
            12:notifyStateError,
            13:notifyStateError,
            14:notifyStateError,
            15:notifyStateError,
            16:parseHandshakeClientKeyExchange,
            20:verifyHandshake
         };
         handshakeHandlersClient = {
            0:parseHandshakeHello,
            1:notifyStateError,
            2:parseHandshakeServerHello,
            11:loadCertificates,
            12:parseServerKeyExchange,
            13:setStateRespondWithCertificate,
            14:sendClientAck,
            15:notifyStateError,
            16:notifyStateError,
            20:verifyHandshake
         };
         _handshakeQueue = [];
         super();
         _entity = param1.entity;
         _config = param1;
         _iStream = param2;
         _oStream = param3;
         _otherIdentity = param4;
         _state = 0;
         _entityHandshakeHandlers = _entity == 1?handshakeHandlersClient:handshakeHandlersServer;
         if(_config.version == 768)
         {
            _securityParameters = new SSLSecurityParameters(_entity);
         }
         else
         {
            _securityParameters = new TLSSecurityParameters(_entity,_config.certificate,_config.privateKey);
         }
         protocol_version = _config.version;
         var _loc5_:Object = _securityParameters.getConnectionStates();
         _currentReadState = _loc5_.read;
         _currentWriteState = _loc5_.write;
         _handshakePayloads = new ByteArray();
         _store = new X509CertificateCollection();
      }
      
      public function get peerCertificate() : X509Certificate
      {
         return _otherCertificate;
      }
      
      public function start() : void
      {
         if(_entity == 1)
         {
            try
            {
               startHandshake();
               return;
            }
            catch(e:TLSError)
            {
               handleTLSError(e);
               return;
            }
         }
      }
      
      public function dataAvailable(param1:* = null) : void
      {
         if(_state == 3)
         {
            return;
         }
         try
         {
            parseRecord(_iStream);
            return;
         }
         catch(e:TLSError)
         {
            handleTLSError(e);
            return;
         }
      }
      
      public function close(param1:TLSError = null) : void
      {
         if(_state == 3)
         {
            return;
         }
         var _loc2_:ByteArray = new ByteArray();
         if(param1 == null && _state != 2)
         {
            _loc2_[0] = 1;
            _loc2_[1] = 90;
            sendRecord(21,_loc2_);
         }
         _loc2_[0] = 2;
         if(param1 == null)
         {
            _loc2_[1] = 0;
         }
         else
         {
            _loc2_[1] = param1.errorID;
            Logger.debug("TLSEngine shutdown triggered by " + param1);
         }
         sendRecord(21,_loc2_);
         _state = 3;
         dispatchEvent(new Event("close"));
      }
      
      private function parseRecord(param1:IDataInput) : void
      {
         var _loc2_:* = null;
         var _loc6_:* = null;
         var _loc7_:* = 0;
         var _loc4_:* = 0;
         var _loc5_:* = 0;
         var _loc3_:* = 0;
         while(_state != 3 && param1.bytesAvailable > 4)
         {
            if(_packetQueue.length > 0)
            {
               _loc6_ = _packetQueue.shift();
               _loc2_ = _loc6_.data;
               if(param1.bytesAvailable + _loc2_.length >= _loc6_.length)
               {
                  param1.readBytes(_loc2_,_loc2_.length,_loc6_.length - _loc2_.length);
                  parseOneRecord(_loc6_.type,_loc6_.length,_loc2_);
               }
               else
               {
                  param1.readBytes(_loc2_,_loc2_.length,param1.bytesAvailable);
                  _packetQueue.push(_loc6_);
               }
            }
            else
            {
               _loc7_ = uint(param1.readByte());
               _loc4_ = uint(param1.readShort());
               _loc5_ = uint(param1.readShort());
               if(_loc5_ > 18432)
               {
                  throw new TLSError("Excessive TLS Record length: " + _loc5_,22);
               }
               if(_loc4_ != _securityParameters.version)
               {
                  throw new TLSError("Unsupported TLS version: " + _loc4_.toString(16),70);
               }
               _loc2_ = new ByteArray();
               _loc3_ = uint(Math.min(param1.bytesAvailable,_loc5_));
               param1.readBytes(_loc2_,0,_loc3_);
               if(_loc3_ == _loc5_)
               {
                  parseOneRecord(_loc7_,_loc5_,_loc2_);
               }
               else
               {
                  _packetQueue.push({
                     "type":_loc7_,
                     "length":_loc5_,
                     "data":_loc2_
                  });
               }
            }
         }
      }
      
      private function parseOneRecord(param1:uint, param2:uint, param3:ByteArray) : void
      {
         param3 = _currentReadState.decrypt(param1,param2,param3);
         if(param3.length > 16384)
         {
            throw new TLSError("Excessive Decrypted TLS Record length: " + param3.length,22);
         }
         if(protocolHandlers.hasOwnProperty(param1))
         {
            while(param3 != null)
            {
               param3 = protocolHandlers[param1](param3);
            }
            return;
         }
         throw new TLSError("Unsupported TLS Record Content Type: " + param1.toString(16),10);
      }
      
      private function startHandshake() : void
      {
         _state = 1;
         sendClientHello();
      }
      
      private function parseHandshake(param1:ByteArray) : ByteArray
      {
         var _loc6_:* = null;
         if(param1.length < 4)
         {
            Logger.debug("Handshake packet is way too short. bailing.");
            return null;
         }
         param1.position = 0;
         var _loc2_:* = param1;
         var _loc5_:uint = _loc2_.readUnsignedByte();
         var _loc3_:uint = _loc2_.readUnsignedByte();
         var _loc4_:uint = _loc3_ << 16 | _loc2_.readUnsignedShort();
         if(_loc4_ + 4 > param1.length)
         {
            Logger.debug("Handshake packet is incomplete. bailing.");
            return null;
         }
         if(_loc5_ != 20)
         {
            _handshakePayloads.writeBytes(param1,0,_loc4_ + 4);
         }
         if(_entityHandshakeHandlers.hasOwnProperty(_loc5_))
         {
            if(_entityHandshakeHandlers[_loc5_] is Function)
            {
               _entityHandshakeHandlers[_loc5_](_loc2_);
            }
            if(_loc4_ + 4 < param1.length)
            {
               _loc6_ = new ByteArray();
               _loc6_.writeBytes(param1,_loc4_ + 4,param1.length - (_loc4_ + 4));
               return _loc6_;
            }
            return null;
         }
         throw new TLSError("Unimplemented or unknown handshake type!",80);
      }
      
      private function notifyStateError(param1:ByteArray) : void
      {
         throw new TLSError("Invalid handshake state for a TLS Entity type of " + _entity,80);
      }
      
      private function parseClientKeyExchange(param1:ByteArray) : void
      {
         throw new TLSError("ClientKeyExchange is currently unimplemented!",80);
      }
      
      private function parseServerKeyExchange(param1:ByteArray) : void
      {
         throw new TLSError("ServerKeyExchange is currently unimplemented!",80);
      }
      
      private function verifyHandshake(param1:ByteArray) : void
      {
         var _loc3_:ByteArray = new ByteArray();
         if(_securityParameters.version == 768)
         {
            param1.readBytes(_loc3_,0,36);
         }
         else
         {
            param1.readBytes(_loc3_,0,12);
         }
         var _loc2_:ByteArray = _securityParameters.computeVerifyData(1 - _entity,_handshakePayloads);
         if(ArrayUtil.equals(_loc3_,_loc2_))
         {
            _state = 2;
            dispatchEvent(new TLSEvent("ready"));
            return;
         }
         throw new TLSError("Invalid Finished mac.",20);
      }
      
      private function parseHandshakeHello(param1:ByteArray) : void
      {
         if(_state != 2)
         {
            Logger.debug("Received an HELLO_REQUEST before being in state READY. ignoring.");
            return;
         }
         _handshakePayloads = new ByteArray();
         startHandshake();
      }
      
      private function parseHandshakeClientKeyExchange(param1:ByteArray) : void
      {
         var _loc4_:* = 0;
         var _loc2_:* = null;
         var _loc3_:* = null;
         var _loc5_:* = null;
         if(_securityParameters.useRSA)
         {
            _loc4_ = uint(param1.readShort());
            _loc2_ = new ByteArray();
            param1.readBytes(_loc2_,0,_loc4_);
            _loc3_ = new ByteArray();
            _config.privateKey.decrypt(_loc2_,_loc3_,_loc4_);
            _securityParameters.setPreMasterSecret(_loc3_);
            _loc5_ = _securityParameters.getConnectionStates();
            _pendingReadState = _loc5_.read;
            _pendingWriteState = _loc5_.write;
            return;
         }
         throw new TLSError("parseHandshakeClientKeyExchange not implemented for DH modes.",80);
      }
      
      private function parseHandshakeServerHello(param1:IDataInput) : void
      {
         var _loc3_:uint = param1.readShort();
         if(_loc3_ != _securityParameters.version)
         {
            throw new TLSError("Unsupported TLS version: " + _loc3_.toString(16),70);
         }
         var _loc2_:ByteArray = new ByteArray();
         param1.readBytes(_loc2_,0,32);
         var _loc5_:uint = param1.readByte();
         var _loc4_:ByteArray = new ByteArray();
         if(_loc5_ > 0)
         {
            param1.readBytes(_loc4_,0,_loc5_);
         }
         _securityParameters.setCipher(param1.readShort());
         _securityParameters.setCompression(param1.readByte());
         _securityParameters.setServerRandom(_loc2_);
      }
      
      private function parseHandshakeClientHello(param1:IDataInput) : void
      {
         var _loc2_:* = null;
         var _loc7_:* = 0;
         var _loc17_:* = 0;
         var _loc16_:* = 0;
         var _loc9_:* = 0;
         var _loc13_:* = null;
         var _loc3_:uint = param1.readShort();
         if(_loc3_ != _securityParameters.version)
         {
            throw new TLSError("Unsupported TLS version: " + _loc3_.toString(16),70);
         }
         var _loc10_:ByteArray = new ByteArray();
         param1.readBytes(_loc10_,0,32);
         var _loc6_:uint = param1.readByte();
         var _loc5_:ByteArray = new ByteArray();
         if(_loc6_ > 0)
         {
            param1.readBytes(_loc5_,0,_loc6_);
         }
         var _loc4_:Array = [];
         var _loc8_:uint = param1.readShort();
         _loc7_ = uint(0);
         while(_loc7_ < _loc8_ / 2)
         {
            _loc4_.push(param1.readShort());
            _loc7_++;
         }
         var _loc15_:Array = [];
         var _loc14_:uint = param1.readByte();
         _loc7_ = uint(0);
         while(_loc7_ < _loc14_)
         {
            _loc15_.push(param1.readByte());
            _loc7_++;
         }
         _loc2_ = {
            "random":_loc10_,
            "session":_loc5_,
            "suites":_loc4_,
            "compressions":_loc15_
         };
         var _loc12_:uint = 35 + _loc6_ + 2 + _loc8_ + 1 + _loc14_;
         var _loc11_:Array = [];
         if(_loc12_ < 1)
         {
            _loc17_ = uint(param1.readShort());
            while(_loc17_ > 0)
            {
               _loc16_ = uint(param1.readShort());
               _loc9_ = uint(param1.readShort());
               _loc13_ = new ByteArray();
               param1.readBytes(_loc13_,0,_loc9_);
               _loc17_ = uint(_loc17_ - (4 + _loc9_));
               _loc11_.push({
                  "type":_loc16_,
                  "length":_loc9_,
                  "data":_loc13_
               });
            }
         }
         _loc2_.ext = _loc11_;
         sendServerHello(_loc2_);
         sendCertificate();
         sendServerHelloDone();
      }
      
      private function sendClientHello() : void
      {
         var _loc4_:int = 0;
         var _loc2_:ByteArray = new ByteArray();
         _loc2_.writeShort(_securityParameters.version);
         var _loc5_:Random = new Random();
         var _loc3_:ByteArray = new ByteArray();
         _loc5_.nextBytes(_loc3_,32);
         _securityParameters.setClientRandom(_loc3_);
         _loc2_.writeBytes(_loc3_,0,32);
         _loc2_.writeByte(32);
         _loc5_.nextBytes(_loc2_,32);
         var _loc1_:Array = _config.cipherSuites;
         _loc2_.writeShort(2 * _loc1_.length);
         _loc4_ = 0;
         while(_loc4_ < _loc1_.length)
         {
            _loc2_.writeShort(_loc1_[_loc4_]);
            _loc4_++;
         }
         _loc1_ = _config.compressions;
         _loc2_.writeByte(_loc1_.length);
         _loc4_ = 0;
         while(_loc4_ < _loc1_.length)
         {
            _loc2_.writeByte(_loc1_[_loc4_]);
            _loc4_++;
         }
         _loc2_.position = 0;
         sendHandshake(1,_loc2_.length,_loc2_);
      }
      
      private function findMatch(param1:Array, param2:Array) : int
      {
         var _loc4_:int = 0;
         var _loc3_:* = 0;
         _loc4_ = 0;
         while(_loc4_ < param1.length)
         {
            _loc3_ = uint(param1[_loc4_]);
            if(param2.indexOf(_loc3_) > -1)
            {
               return _loc3_;
            }
            _loc4_++;
         }
         return -1;
      }
      
      private function sendServerHello(param1:Object) : void
      {
         var _loc2_:int = findMatch(_config.cipherSuites,param1.suites);
         if(_loc2_ == -1)
         {
            throw new TLSError("No compatible cipher found.",40);
         }
         _securityParameters.setCipher(_loc2_);
         var _loc3_:int = findMatch(_config.compressions,param1.compressions);
         if(_loc3_ == 1)
         {
            throw new TLSError("No compatible compression method found.",40);
         }
         _securityParameters.setCompression(_loc3_);
         _securityParameters.setClientRandom(param1.random);
         var _loc4_:ByteArray = new ByteArray();
         _loc4_.writeShort(_securityParameters.version);
         var _loc6_:Random = new Random();
         var _loc5_:ByteArray = new ByteArray();
         _loc6_.nextBytes(_loc5_,32);
         _securityParameters.setServerRandom(_loc5_);
         _loc4_.writeBytes(_loc5_,0,32);
         _loc4_.writeByte(32);
         _loc6_.nextBytes(_loc4_,32);
         _loc4_.writeShort(param1.suites[0]);
         _loc4_.writeByte(param1.compressions[0]);
         _loc4_.position = 0;
         sendHandshake(2,_loc4_.length,_loc4_);
      }
      
      private function setStateRespondWithCertificate(param1:ByteArray = null) : void
      {
         sendClientCert = true;
      }
      
      private function sendCertificate(param1:ByteArray = null) : void
      {
         var _loc3_:* = 0;
         var _loc5_:* = 0;
         var _loc4_:ByteArray = _config.certificate;
         var _loc2_:ByteArray = new ByteArray();
         if(_loc4_ != null)
         {
            _loc3_ = uint(_loc4_.length);
            _loc5_ = uint(_loc4_.length + 3);
            _loc2_.writeByte(_loc5_ >> 16);
            _loc2_.writeShort(_loc5_ & 65535);
            _loc2_.writeByte(_loc3_ >> 16);
            _loc2_.writeShort(_loc3_ & 65535);
            _loc2_.writeBytes(_loc4_);
         }
         else
         {
            _loc2_.writeShort(0);
            _loc2_.writeByte(0);
         }
         _loc2_.position = 0;
         sendHandshake(11,_loc2_.length,_loc2_);
      }
      
      private function sendCertificateVerify() : void
      {
         var _loc1_:ByteArray = new ByteArray();
         var _loc2_:ByteArray = _securityParameters.computeCertificateVerify(_entity,_handshakePayloads);
         _loc2_.position = 0;
         sendHandshake(15,_loc2_.length,_loc2_);
      }
      
      private function sendServerHelloDone() : void
      {
         var _loc1_:ByteArray = new ByteArray();
         sendHandshake(14,_loc1_.length,_loc1_);
      }
      
      private function sendClientKeyExchange() : void
      {
         var _loc1_:* = null;
         var _loc5_:* = null;
         var _loc4_:* = null;
         var _loc2_:* = null;
         var _loc3_:* = null;
         var _loc6_:* = null;
         if(_securityParameters.useRSA)
         {
            _loc1_ = new ByteArray();
            _loc1_.writeShort(_securityParameters.version);
            _loc5_ = new Random();
            _loc5_.nextBytes(_loc1_,46);
            _loc1_.position = 0;
            _loc4_ = new ByteArray();
            _loc4_.writeBytes(_loc1_,0,_loc1_.length);
            _loc4_.position = 0;
            _securityParameters.setPreMasterSecret(_loc4_);
            _loc2_ = new ByteArray();
            _otherCertificate.getPublicKey().encrypt(_loc4_,_loc2_,_loc4_.length);
            _loc2_.position = 0;
            _loc3_ = new ByteArray();
            if(_securityParameters.version > 768)
            {
               _loc3_.writeShort(_loc2_.length);
            }
            _loc3_.writeBytes(_loc2_,0,_loc2_.length);
            _loc3_.position = 0;
            sendHandshake(16,_loc3_.length,_loc3_);
            _loc6_ = _securityParameters.getConnectionStates();
            _pendingReadState = _loc6_.read;
            _pendingWriteState = _loc6_.write;
            return;
         }
         throw new TLSError("Non-RSA Client Key Exchange not implemented.",80);
      }
      
      private function sendFinished() : void
      {
         var _loc1_:ByteArray = _securityParameters.computeVerifyData(_entity,_handshakePayloads);
         _loc1_.position = 0;
         sendHandshake(20,_loc1_.length,_loc1_);
      }
      
      private function sendHandshake(param1:uint, param2:uint, param3:IDataInput) : void
      {
         var _loc4_:ByteArray = new ByteArray();
         _loc4_.writeByte(param1);
         _loc4_.writeByte(0);
         _loc4_.writeShort(param2);
         param3.readBytes(_loc4_,_loc4_.position,param2);
         _handshakePayloads.writeBytes(_loc4_,0,_loc4_.length);
         sendRecord(22,_loc4_);
      }
      
      private function sendChangeCipherSpec() : void
      {
         var _loc1_:ByteArray = new ByteArray();
         _loc1_[0] = 1;
         sendRecord(20,_loc1_);
         _currentWriteState = _pendingWriteState;
         _pendingWriteState = null;
      }
      
      public function sendApplicationData(param1:ByteArray, param2:uint = 0, param3:uint = 0) : void
      {
         var _loc4_:ByteArray = new ByteArray();
         var _loc5_:* = param3;
         if(_loc5_ == 0)
         {
            _loc5_ = uint(param1.length);
         }
         while(_loc5_ > 16384)
         {
            _loc4_.position = 0;
            _loc4_.writeBytes(param1,param2,16384);
            _loc4_.position = 0;
            sendRecord(23,_loc4_);
            _loc4_.length = 0;
            param2 = param2 + 16384;
            _loc5_ = uint(_loc5_ - 16384);
         }
         _loc4_.position = 0;
         _loc4_.writeBytes(param1,param2,_loc5_);
         _loc4_.position = 0;
         sendRecord(23,_loc4_);
      }
      
      private function sendRecord(param1:uint, param2:ByteArray) : void
      {
         param2 = _currentWriteState.encrypt(param1,param2);
         _oStream.writeByte(param1);
         _oStream.writeShort(_securityParameters.version);
         _oStream.writeShort(param2.length);
         _oStream.writeBytes(param2,0,param2.length);
         scheduleWrite();
      }
      
      private function scheduleWrite() : void
      {
         if(_writeScheduler != 0)
         {
            return;
         }
         _writeScheduler = setTimeout(commitWrite,0);
      }
      
      private function commitWrite() : void
      {
         clearTimeout(_writeScheduler);
         _writeScheduler = 0;
         if(_state != 3)
         {
            dispatchEvent(new ProgressEvent("socketData"));
         }
      }
      
      private function sendClientAck(param1:ByteArray) : void
      {
         if(_handshakeCanContinue)
         {
            if(sendClientCert)
            {
               sendCertificate();
            }
            sendClientKeyExchange();
            if(_config.certificate != null)
            {
               sendCertificateVerify();
            }
            sendChangeCipherSpec();
            sendFinished();
         }
      }
      
      private function loadCertificates(param1:ByteArray) : void
      {
         var _loc11_:* = 0;
         var _loc10_:* = null;
         var _loc9_:int = 0;
         var _loc3_:* = null;
         var _loc6_:Boolean = false;
         var _loc4_:* = null;
         var _loc8_:* = null;
         var _loc7_:uint = param1.readByte();
         var _loc5_:uint = _loc7_ << 16 | param1.readShort();
         var _loc12_:Array = [];
         while(_loc5_ > 0)
         {
            _loc7_ = param1.readByte();
            _loc11_ = uint(_loc7_ << 16 | param1.readShort());
            _loc10_ = new ByteArray();
            param1.readBytes(_loc10_,0,_loc11_);
            _loc12_.push(_loc10_);
            _loc5_ = _loc5_ - (3 + _loc11_);
         }
         var _loc2_:* = null;
         _loc9_ = 0;
         while(_loc9_ < _loc12_.length)
         {
            _loc3_ = new X509Certificate(_loc12_[_loc9_]);
            _store.addCertificate(_loc3_);
            if(_loc2_ == null)
            {
               _loc2_ = _loc3_;
            }
            _loc9_++;
         }
         if(_config.trustAllCertificates)
         {
            _loc6_ = true;
         }
         else if(_config.trustSelfSignedCertificates)
         {
            _loc6_ = _loc2_.isSelfSigned(new Date());
         }
         else
         {
            _loc6_ = _loc2_.isSigned(_store,_config.CAStore);
         }
         if(_loc6_)
         {
            if(_otherIdentity == null || _config.ignoreCommonNameMismatch)
            {
               _otherCertificate = _loc2_;
            }
            else
            {
               _loc4_ = _loc2_.getCommonName();
               _loc8_ = new RegExp(_loc4_.replace(/[\^\\\-$.[\]|()?+{}]/g,"\\$&").replace(/\*/g,"[^.]+"),"gi");
               if(_loc8_.exec(_otherIdentity))
               {
                  _otherCertificate = _loc2_;
               }
               else if(_config.promptUserForAcceptCert)
               {
                  _handshakeCanContinue = false;
                  dispatchEvent(new TLSEvent("promptAcceptCert"));
               }
               else
               {
                  throw new TLSError("Invalid common name: " + _loc2_.getCommonName() + ", expected " + _otherIdentity,42);
               }
            }
         }
         else if(_config.promptUserForAcceptCert)
         {
            _handshakeCanContinue = false;
            dispatchEvent(new TLSEvent("promptAcceptCert"));
         }
         else
         {
            throw new TLSError("Cannot verify certificate",42);
         }
      }
      
      public function acceptPeerCertificate() : void
      {
         _handshakeCanContinue = true;
         sendClientAck(null);
      }
      
      public function rejectPeerCertificate() : void
      {
         throw new TLSError("Peer certificate not accepted!",42);
      }
      
      private function parseAlert(param1:ByteArray) : void
      {
         Logger.debug("GOT ALERT! type=" + param1[1]);
         close();
      }
      
      private function parseChangeCipherSpec(param1:ByteArray) : void
      {
         param1.readUnsignedByte();
         if(_pendingReadState == null)
         {
            throw new TLSError("Not ready to Change Cipher Spec, damnit.",10);
         }
         _currentReadState = _pendingReadState;
         _pendingReadState = null;
      }
      
      private function parseApplicationData(param1:ByteArray) : void
      {
         if(_state != 2)
         {
            throw new TLSError("Too soon for data!",10);
         }
         dispatchEvent(new TLSEvent("data",param1));
      }
      
      private function handleTLSError(param1:TLSError) : void
      {
         close(param1);
      }
   }
}
