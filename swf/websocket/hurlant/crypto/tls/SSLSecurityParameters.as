package websocket.hurlant.crypto.tls
{
   import flash.utils.ByteArray;
   import websocket.hurlant.crypto.hash.MD5;
   import websocket.hurlant.crypto.hash.SHA1;
   import websocket.hurlant.util.Hex;
   
   public class SSLSecurityParameters implements ISecurityParameters
   {
      
      public static const COMPRESSION_NULL:uint = 0;
      
      public static const PROTOCOL_VERSION:uint = 768;
       
      
      private var entity:uint;
      
      private var bulkCipher:uint;
      
      private var cipherType:uint;
      
      private var keySize:uint;
      
      private var keyMaterialLength:uint;
      
      private var keyBlock:ByteArray;
      
      private var IVSize:uint;
      
      private var MAC_length:uint;
      
      private var macAlgorithm:uint;
      
      private var hashSize:uint;
      
      private var compression:uint;
      
      private var masterSecret:ByteArray;
      
      private var clientRandom:ByteArray;
      
      private var serverRandom:ByteArray;
      
      private var pad_1:ByteArray;
      
      private var pad_2:ByteArray;
      
      private var ignoreCNMismatch:Boolean = true;
      
      private var trustAllCerts:Boolean = false;
      
      private var trustSelfSigned:Boolean = false;
      
      public var keyExchange:uint;
      
      public function SSLSecurityParameters(param1:uint, param2:ByteArray = null, param3:ByteArray = null)
      {
         super();
         this.entity = param1;
         reset();
      }
      
      public function get version() : uint
      {
         return 768;
      }
      
      public function reset() : void
      {
         bulkCipher = 0;
         cipherType = 1;
         macAlgorithm = 0;
         compression = 0;
         masterSecret = null;
      }
      
      public function getBulkCipher() : uint
      {
         return bulkCipher;
      }
      
      public function getCipherType() : uint
      {
         return cipherType;
      }
      
      public function getMacAlgorithm() : uint
      {
         return macAlgorithm;
      }
      
      public function setCipher(param1:uint) : void
      {
         var _loc2_:int = 0;
         bulkCipher = CipherSuites.getBulkCipher(param1);
         cipherType = BulkCiphers.getType(bulkCipher);
         keySize = BulkCiphers.getExpandedKeyBytes(bulkCipher);
         keyMaterialLength = BulkCiphers.getKeyBytes(bulkCipher);
         IVSize = BulkCiphers.getIVSize(bulkCipher);
         keyExchange = CipherSuites.getKeyExchange(param1);
         macAlgorithm = CipherSuites.getMac(param1);
         hashSize = MACs.getHashSize(macAlgorithm);
         pad_1 = new ByteArray();
         pad_2 = new ByteArray();
         _loc2_ = 0;
         while(_loc2_ < 48)
         {
            pad_1.writeByte(54);
            pad_2.writeByte(92);
            _loc2_++;
         }
      }
      
      public function setCompression(param1:uint) : void
      {
         compression = param1;
      }
      
      public function setPreMasterSecret(param1:ByteArray) : void
      {
         var _loc4_:* = null;
         var _loc3_:* = null;
         var _loc6_:int = 0;
         var _loc7_:int = 0;
         var _loc9_:ByteArray = new ByteArray();
         var _loc2_:ByteArray = new ByteArray();
         var _loc10_:SHA1 = new SHA1();
         var _loc5_:MD5 = new MD5();
         var _loc8_:ByteArray = new ByteArray();
         _loc8_.writeBytes(param1);
         _loc8_.writeBytes(clientRandom);
         _loc8_.writeBytes(serverRandom);
         masterSecret = new ByteArray();
         var _loc11_:uint = 65;
         _loc6_ = 0;
         while(_loc6_ < 3)
         {
            _loc9_.position = 0;
            _loc7_ = 0;
            while(_loc7_ < _loc6_ + 1)
            {
               _loc9_.writeByte(_loc11_);
               _loc7_++;
            }
            _loc11_++;
            _loc9_.writeBytes(_loc8_);
            _loc4_ = _loc10_.hash(_loc9_);
            _loc2_.position = 0;
            _loc2_.writeBytes(param1);
            _loc2_.writeBytes(_loc4_);
            _loc3_ = _loc5_.hash(_loc2_);
            masterSecret.writeBytes(_loc3_);
            _loc6_++;
         }
         _loc8_.position = 0;
         _loc8_.writeBytes(masterSecret);
         _loc8_.writeBytes(serverRandom);
         _loc8_.writeBytes(clientRandom);
         keyBlock = new ByteArray();
         _loc9_ = new ByteArray();
         _loc2_ = new ByteArray();
         _loc11_ = 65;
         _loc6_ = 0;
         while(_loc6_ < 16)
         {
            _loc9_.position = 0;
            _loc7_ = 0;
            while(_loc7_ < _loc6_ + 1)
            {
               _loc9_.writeByte(_loc11_);
               _loc7_++;
            }
            _loc11_++;
            _loc9_.writeBytes(_loc8_);
            _loc4_ = _loc10_.hash(_loc9_);
            _loc2_.position = 0;
            _loc2_.writeBytes(masterSecret);
            _loc2_.writeBytes(_loc4_,0);
            _loc3_ = _loc5_.hash(_loc2_);
            keyBlock.writeBytes(_loc3_);
            _loc6_++;
         }
      }
      
      public function setClientRandom(param1:ByteArray) : void
      {
         clientRandom = param1;
      }
      
      public function setServerRandom(param1:ByteArray) : void
      {
         serverRandom = param1;
      }
      
      public function get useRSA() : Boolean
      {
         return KeyExchanges.useRSA(keyExchange);
      }
      
      public function computeVerifyData(param1:uint, param2:ByteArray) : ByteArray
      {
         var _loc9_:* = null;
         var _loc11_:* = null;
         var _loc3_:* = null;
         var _loc10_:SHA1 = new SHA1();
         var _loc5_:MD5 = new MD5();
         var _loc8_:ByteArray = new ByteArray();
         var _loc7_:ByteArray = new ByteArray();
         var _loc4_:ByteArray = new ByteArray();
         var _loc6_:ByteArray = new ByteArray();
         if(param1 == 1)
         {
            _loc6_.writeUnsignedInt(1129074260);
         }
         else
         {
            _loc6_.writeUnsignedInt(1397904978);
         }
         masterSecret.position = 0;
         _loc8_.writeBytes(param2);
         _loc8_.writeBytes(_loc6_);
         _loc8_.writeBytes(masterSecret);
         _loc8_.writeBytes(pad_1,0,40);
         _loc9_ = _loc10_.hash(_loc8_);
         _loc7_.writeBytes(masterSecret);
         _loc7_.writeBytes(pad_2,0,40);
         _loc7_.writeBytes(_loc9_);
         _loc11_ = _loc10_.hash(_loc7_);
         _loc8_ = new ByteArray();
         _loc8_.writeBytes(param2);
         _loc8_.writeBytes(_loc6_);
         _loc8_.writeBytes(masterSecret);
         _loc8_.writeBytes(pad_1);
         _loc9_ = _loc5_.hash(_loc8_);
         _loc7_ = new ByteArray();
         _loc7_.writeBytes(masterSecret);
         _loc7_.writeBytes(pad_2);
         _loc7_.writeBytes(_loc9_);
         _loc3_ = _loc5_.hash(_loc7_);
         _loc4_.writeBytes(_loc3_,0,_loc3_.length);
         _loc4_.writeBytes(_loc11_,0,_loc11_.length);
         var _loc12_:String = Hex.fromArray(_loc4_);
         _loc4_.position = 0;
         return _loc4_;
      }
      
      public function computeCertificateVerify(param1:uint, param2:ByteArray) : ByteArray
      {
         return null;
      }
      
      public function getConnectionStates() : Object
      {
         var _loc6_:int = 0;
         var _loc9_:int = 0;
         var _loc4_:int = 0;
         var _loc1_:* = null;
         var _loc7_:* = null;
         var _loc8_:* = null;
         var _loc5_:* = null;
         var _loc2_:* = null;
         var _loc10_:* = null;
         var _loc11_:* = null;
         var _loc3_:* = null;
         if(masterSecret != null)
         {
            _loc6_ = hashSize as Number;
            _loc9_ = keySize as Number;
            _loc4_ = IVSize as Number;
            _loc1_ = new ByteArray();
            _loc7_ = new ByteArray();
            _loc8_ = new ByteArray();
            _loc5_ = new ByteArray();
            _loc2_ = new ByteArray();
            _loc10_ = new ByteArray();
            keyBlock.position = 0;
            keyBlock.readBytes(_loc1_,0,_loc6_);
            keyBlock.readBytes(_loc7_,0,_loc6_);
            keyBlock.readBytes(_loc8_,0,_loc9_);
            keyBlock.readBytes(_loc5_,0,_loc9_);
            keyBlock.readBytes(_loc2_,0,_loc4_);
            keyBlock.readBytes(_loc10_,0,_loc4_);
            keyBlock.position = 0;
            _loc11_ = new SSLConnectionState(bulkCipher,cipherType,macAlgorithm,_loc1_,_loc8_,_loc2_);
            _loc3_ = new SSLConnectionState(bulkCipher,cipherType,macAlgorithm,_loc7_,_loc5_,_loc10_);
            if(entity == 1)
            {
               return {
                  "read":_loc3_,
                  "write":_loc11_
               };
            }
            return {
               "read":_loc11_,
               "write":_loc3_
            };
         }
         return {
            "read":new SSLConnectionState(),
            "write":new SSLConnectionState()
         };
      }
   }
}
