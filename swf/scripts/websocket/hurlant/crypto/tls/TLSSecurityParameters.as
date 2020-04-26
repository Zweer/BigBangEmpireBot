package websocket.hurlant.crypto.tls
{
   import com.playata.framework.core.logging.Logger;
   import flash.utils.ByteArray;
   import websocket.hurlant.crypto.hash.MD5;
   import websocket.hurlant.crypto.hash.SHA1;
   import websocket.hurlant.crypto.prng.TLSPRF;
   import websocket.hurlant.crypto.rsa.RSAKey;
   import websocket.hurlant.util.Hex;
   
   public class TLSSecurityParameters implements ISecurityParameters
   {
      
      public static const COMPRESSION_NULL:uint = 0;
      
      public static var IGNORE_CN_MISMATCH:Boolean = true;
      
      public static var ENABLE_USER_CLIENT_CERTIFICATE:Boolean = false;
      
      public static var USER_CERTIFICATE:String;
      
      public static const PROTOCOL_VERSION:uint = 769;
       
      
      private var cert:ByteArray;
      
      private var key:RSAKey;
      
      private var entity:uint;
      
      private var bulkCipher:uint;
      
      private var cipherType:uint;
      
      private var keySize:uint;
      
      private var keyMaterialLength:uint;
      
      private var IVSize:uint;
      
      private var macAlgorithm:uint;
      
      private var hashSize:uint;
      
      private var compression:uint;
      
      private var masterSecret:ByteArray;
      
      private var clientRandom:ByteArray;
      
      private var serverRandom:ByteArray;
      
      private var ignoreCNMismatch:Boolean = true;
      
      private var trustAllCerts:Boolean = false;
      
      private var trustSelfSigned:Boolean = false;
      
      private var tlsDebug:Boolean = false;
      
      public var keyExchange:uint;
      
      public function TLSSecurityParameters(param1:uint, param2:ByteArray = null, param3:RSAKey = null)
      {
         super();
         this.entity = param1;
         reset();
         key = param3;
         cert = param2;
      }
      
      public function get version() : uint
      {
         return 769;
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
         bulkCipher = CipherSuites.getBulkCipher(param1);
         cipherType = BulkCiphers.getType(bulkCipher);
         keySize = BulkCiphers.getExpandedKeyBytes(bulkCipher);
         keyMaterialLength = BulkCiphers.getKeyBytes(bulkCipher);
         IVSize = BulkCiphers.getIVSize(bulkCipher);
         keyExchange = CipherSuites.getKeyExchange(param1);
         macAlgorithm = CipherSuites.getMac(param1);
         hashSize = MACs.getHashSize(macAlgorithm);
      }
      
      public function setCompression(param1:uint) : void
      {
         compression = param1;
      }
      
      public function setPreMasterSecret(param1:ByteArray) : void
      {
         var _loc2_:ByteArray = new ByteArray();
         _loc2_.writeBytes(clientRandom,0,clientRandom.length);
         _loc2_.writeBytes(serverRandom,0,serverRandom.length);
         var _loc3_:TLSPRF = new TLSPRF(param1,"master secret",_loc2_);
         masterSecret = new ByteArray();
         _loc3_.nextBytes(masterSecret,48);
         if(tlsDebug)
         {
            Logger.debug("Master Secret: " + Hex.fromArray(masterSecret,true));
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
         var _loc3_:ByteArray = new ByteArray();
         var _loc6_:MD5 = new MD5();
         if(tlsDebug)
         {
            Logger.debug("Handshake value: " + Hex.fromArray(param2,true));
         }
         _loc3_.writeBytes(_loc6_.hash(param2),0,_loc6_.getHashSize());
         var _loc5_:SHA1 = new SHA1();
         _loc3_.writeBytes(_loc5_.hash(param2),0,_loc5_.getHashSize());
         if(tlsDebug)
         {
            Logger.debug("Seed in: " + Hex.fromArray(_loc3_,true));
         }
         var _loc4_:TLSPRF = new TLSPRF(masterSecret,param1 == 1?"client finished":"server finished",_loc3_);
         var _loc7_:ByteArray = new ByteArray();
         _loc4_.nextBytes(_loc7_,12);
         if(tlsDebug)
         {
            Logger.debug("Finished out: " + Hex.fromArray(_loc7_,true));
         }
         _loc7_.position = 0;
         return _loc7_;
      }
      
      public function computeCertificateVerify(param1:uint, param2:ByteArray) : ByteArray
      {
         var _loc3_:ByteArray = new ByteArray();
         var _loc5_:MD5 = new MD5();
         _loc3_.writeBytes(_loc5_.hash(param2),0,_loc5_.getHashSize());
         var _loc4_:SHA1 = new SHA1();
         _loc3_.writeBytes(_loc4_.hash(param2),0,_loc4_.getHashSize());
         _loc3_.position = 0;
         var _loc6_:ByteArray = new ByteArray();
         key.sign(_loc3_,_loc6_,_loc3_.bytesAvailable);
         _loc6_.position = 0;
         return _loc6_;
      }
      
      public function getConnectionStates() : Object
      {
         var _loc6_:* = null;
         var _loc7_:* = null;
         var _loc1_:* = null;
         var _loc5_:* = null;
         var _loc8_:* = null;
         var _loc4_:* = null;
         var _loc2_:* = null;
         var _loc9_:* = null;
         var _loc10_:* = null;
         var _loc3_:* = null;
         if(masterSecret != null)
         {
            _loc6_ = new ByteArray();
            _loc6_.writeBytes(serverRandom,0,serverRandom.length);
            _loc6_.writeBytes(clientRandom,0,clientRandom.length);
            _loc7_ = new TLSPRF(masterSecret,"key expansion",_loc6_);
            _loc1_ = new ByteArray();
            _loc7_.nextBytes(_loc1_,hashSize);
            _loc5_ = new ByteArray();
            _loc7_.nextBytes(_loc5_,hashSize);
            _loc8_ = new ByteArray();
            _loc7_.nextBytes(_loc8_,keyMaterialLength);
            _loc4_ = new ByteArray();
            _loc7_.nextBytes(_loc4_,keyMaterialLength);
            _loc2_ = new ByteArray();
            _loc7_.nextBytes(_loc2_,IVSize);
            _loc9_ = new ByteArray();
            _loc7_.nextBytes(_loc9_,IVSize);
            _loc10_ = new TLSConnectionState(bulkCipher,cipherType,macAlgorithm,_loc1_,_loc8_,_loc2_);
            _loc3_ = new TLSConnectionState(bulkCipher,cipherType,macAlgorithm,_loc5_,_loc4_,_loc9_);
            if(entity == 1)
            {
               return {
                  "read":_loc3_,
                  "write":_loc10_
               };
            }
            return {
               "read":_loc10_,
               "write":_loc3_
            };
         }
         return {
            "read":new TLSConnectionState(),
            "write":new TLSConnectionState()
         };
      }
   }
}
