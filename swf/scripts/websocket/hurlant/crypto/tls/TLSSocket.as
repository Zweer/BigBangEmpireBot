package websocket.hurlant.crypto.tls
{
   import flash.events.Event;
   import flash.events.ProgressEvent;
   import flash.net.Socket;
   import flash.utils.ByteArray;
   import flash.utils.IDataInput;
   import flash.utils.IDataOutput;
   import flash.utils.clearTimeout;
   import flash.utils.setTimeout;
   import websocket.hurlant.crypto.cert.X509Certificate;
   
   public class TLSSocket extends Socket implements IDataInput, IDataOutput
   {
      
      public static const ACCEPT_PEER_CERT_PROMPT:String = "acceptPeerCertificatePrompt";
       
      
      private var _endian:String;
      
      private var _objectEncoding:uint;
      
      private var _iStream:ByteArray;
      
      private var _oStream:ByteArray;
      
      private var _iStream_cursor:uint;
      
      private var _socket:Socket;
      
      private var _config:TLSConfig;
      
      private var _engine:TLSEngine;
      
      private var _ready:Boolean;
      
      private var _writeScheduler:uint;
      
      public function TLSSocket(param1:String = null, param2:int = 0, param3:TLSConfig = null)
      {
         super();
         _config = param3;
         if(param1 != null && param2 != 0)
         {
            connect(param1,param2);
         }
      }
      
      override public function get bytesAvailable() : uint
      {
         return _iStream.bytesAvailable;
      }
      
      override public function get connected() : Boolean
      {
         return _socket.connected;
      }
      
      override public function get endian() : String
      {
         return _endian;
      }
      
      override public function set endian(param1:String) : void
      {
         _endian = param1;
         _iStream.endian = param1;
         _oStream.endian = param1;
      }
      
      override public function get objectEncoding() : uint
      {
         return _objectEncoding;
      }
      
      override public function set objectEncoding(param1:uint) : void
      {
         _objectEncoding = param1;
         _iStream.objectEncoding = param1;
         _oStream.objectEncoding = param1;
      }
      
      private function onTLSData(param1:TLSEvent) : void
      {
         if(_iStream.position == _iStream.length)
         {
            _iStream.position = 0;
            _iStream.length = 0;
            _iStream_cursor = 0;
         }
         var _loc2_:uint = _iStream.position;
         _iStream.position = _iStream_cursor;
         _iStream.writeBytes(param1.data);
         _iStream_cursor = _iStream.position;
         _iStream.position = _loc2_;
         dispatchEvent(new ProgressEvent("socketData",false,false,param1.data.length));
      }
      
      private function onTLSReady(param1:TLSEvent) : void
      {
         _ready = true;
         scheduleWrite();
      }
      
      private function onTLSClose(param1:Event) : void
      {
         dispatchEvent(param1);
         close();
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
         if(_ready)
         {
            _engine.sendApplicationData(_oStream);
            _oStream.length = 0;
         }
      }
      
      override public function close() : void
      {
         _ready = false;
         _engine.close();
         if(_socket.connected)
         {
            _socket.flush();
            _socket.close();
         }
      }
      
      public function setTLSConfig(param1:TLSConfig) : void
      {
         _config = param1;
      }
      
      override public function connect(param1:String, param2:int) : void
      {
         init(new Socket(),_config,param1);
         _socket.connect(param1,param2);
         _engine.start();
      }
      
      public function releaseSocket() : void
      {
         _socket.removeEventListener("connect",dispatchEvent);
         _socket.removeEventListener("ioError",dispatchEvent);
         _socket.removeEventListener("securityError",dispatchEvent);
         _socket.removeEventListener("close",dispatchEvent);
         _socket.removeEventListener("socketData",_engine.dataAvailable);
         _socket = null;
      }
      
      public function reinitialize(param1:String, param2:TLSConfig) : void
      {
         host = param1;
         config = param2;
         var ba:ByteArray = new ByteArray();
         if(_socket.bytesAvailable > 0)
         {
            _socket.readBytes(ba,0,_socket.bytesAvailable);
         }
         _iStream = new ByteArray();
         _oStream = new ByteArray();
         _iStream_cursor = 0;
         objectEncoding = 3;
         endian = "bigEndian";
         if(config == null)
         {
            var config:TLSConfig = new TLSConfig(1);
         }
         _engine = new TLSEngine(config,_socket,_socket,host);
         _engine.addEventListener("data",onTLSData);
         _engine.addEventListener("ready",onTLSReady);
         _engine.addEventListener("close",onTLSClose);
         _engine.addEventListener("socketData",function(param1:*):void
         {
            _socket.flush();
         });
         _socket.addEventListener("socketData",_engine.dataAvailable);
         _engine.addEventListener("promptAcceptCert",onAcceptCert);
         _ready = false;
         _engine.start();
      }
      
      public function startTLS(param1:Socket, param2:String, param3:TLSConfig = null) : void
      {
         if(!param1.connected)
         {
            throw new Error("Cannot STARTTLS on a socket that isn\'t connected.");
         }
         init(param1,param3,param2);
         _engine.start();
      }
      
      private function init(param1:Socket, param2:TLSConfig, param3:String) : void
      {
         socket = param1;
         config = param2;
         host = param3;
         _iStream = new ByteArray();
         _oStream = new ByteArray();
         _iStream_cursor = 0;
         objectEncoding = 3;
         endian = "bigEndian";
         _socket = socket;
         _socket.addEventListener("connect",dispatchEvent);
         _socket.addEventListener("ioError",dispatchEvent);
         _socket.addEventListener("securityError",dispatchEvent);
         _socket.addEventListener("close",dispatchEvent);
         if(config == null)
         {
            var config:TLSConfig = new TLSConfig(1);
         }
         _engine = new TLSEngine(config,_socket,_socket,host);
         _engine.addEventListener("data",onTLSData);
         _engine.addEventListener("promptAcceptCert",onAcceptCert);
         _engine.addEventListener("ready",onTLSReady);
         _engine.addEventListener("close",onTLSClose);
         _engine.addEventListener("socketData",function(param1:*):void
         {
            if(connected)
            {
               _socket.flush();
            }
         });
         _socket.addEventListener("socketData",_engine.dataAvailable);
         _ready = false;
      }
      
      override public function flush() : void
      {
         commitWrite();
         _socket.flush();
      }
      
      override public function readBoolean() : Boolean
      {
         return _iStream.readBoolean();
      }
      
      override public function readByte() : int
      {
         return _iStream.readByte();
      }
      
      override public function readBytes(param1:ByteArray, param2:uint = 0, param3:uint = 0) : void
      {
         return _iStream.readBytes(param1,param2,param3);
      }
      
      override public function readDouble() : Number
      {
         return _iStream.readDouble();
      }
      
      override public function readFloat() : Number
      {
         return _iStream.readFloat();
      }
      
      override public function readInt() : int
      {
         return _iStream.readInt();
      }
      
      override public function readMultiByte(param1:uint, param2:String) : String
      {
         return _iStream.readMultiByte(param1,param2);
      }
      
      override public function readObject() : *
      {
         return _iStream.readObject();
      }
      
      override public function readShort() : int
      {
         return _iStream.readShort();
      }
      
      override public function readUnsignedByte() : uint
      {
         return _iStream.readUnsignedByte();
      }
      
      override public function readUnsignedInt() : uint
      {
         return _iStream.readUnsignedInt();
      }
      
      override public function readUnsignedShort() : uint
      {
         return _iStream.readUnsignedShort();
      }
      
      override public function readUTF() : String
      {
         return _iStream.readUTF();
      }
      
      override public function readUTFBytes(param1:uint) : String
      {
         return _iStream.readUTFBytes(param1);
      }
      
      override public function writeBoolean(param1:Boolean) : void
      {
         _oStream.writeBoolean(param1);
         scheduleWrite();
      }
      
      override public function writeByte(param1:int) : void
      {
         _oStream.writeByte(param1);
         scheduleWrite();
      }
      
      override public function writeBytes(param1:ByteArray, param2:uint = 0, param3:uint = 0) : void
      {
         _oStream.writeBytes(param1,param2,param3);
         scheduleWrite();
      }
      
      override public function writeDouble(param1:Number) : void
      {
         _oStream.writeDouble(param1);
         scheduleWrite();
      }
      
      override public function writeFloat(param1:Number) : void
      {
         _oStream.writeFloat(param1);
         scheduleWrite();
      }
      
      override public function writeInt(param1:int) : void
      {
         _oStream.writeInt(param1);
         scheduleWrite();
      }
      
      override public function writeMultiByte(param1:String, param2:String) : void
      {
         _oStream.writeMultiByte(param1,param2);
         scheduleWrite();
      }
      
      override public function writeObject(param1:*) : void
      {
         _oStream.writeObject(param1);
         scheduleWrite();
      }
      
      override public function writeShort(param1:int) : void
      {
         _oStream.writeShort(param1);
         scheduleWrite();
      }
      
      override public function writeUnsignedInt(param1:uint) : void
      {
         _oStream.writeUnsignedInt(param1);
         scheduleWrite();
      }
      
      override public function writeUTF(param1:String) : void
      {
         _oStream.writeUTF(param1);
         scheduleWrite();
      }
      
      override public function writeUTFBytes(param1:String) : void
      {
         _oStream.writeUTFBytes(param1);
         scheduleWrite();
      }
      
      public function getPeerCertificate() : X509Certificate
      {
         return _engine.peerCertificate;
      }
      
      public function onAcceptCert(param1:TLSEvent) : void
      {
         dispatchEvent(new TLSSocketEvent(_engine.peerCertificate));
      }
      
      public function acceptPeerCertificate(param1:Event) : void
      {
         _engine.acceptPeerCertificate();
      }
      
      public function rejectPeerCertificate(param1:Event) : void
      {
         _engine.rejectPeerCertificate();
      }
   }
}
