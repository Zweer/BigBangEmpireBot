package websocket.hurlant.crypto
{
   import flash.utils.ByteArray;
   import websocket.hurlant.crypto.hash.HMAC;
   import websocket.hurlant.crypto.hash.IHash;
   import websocket.hurlant.crypto.hash.MAC;
   import websocket.hurlant.crypto.hash.MD2;
   import websocket.hurlant.crypto.hash.MD5;
   import websocket.hurlant.crypto.hash.SHA1;
   import websocket.hurlant.crypto.hash.SHA224;
   import websocket.hurlant.crypto.hash.SHA256;
   import websocket.hurlant.crypto.prng.ARC4;
   import websocket.hurlant.crypto.rsa.RSAKey;
   import websocket.hurlant.crypto.symmetric.AESKey;
   import websocket.hurlant.crypto.symmetric.BlowFishKey;
   import websocket.hurlant.crypto.symmetric.CBCMode;
   import websocket.hurlant.crypto.symmetric.CFB8Mode;
   import websocket.hurlant.crypto.symmetric.CFBMode;
   import websocket.hurlant.crypto.symmetric.CTRMode;
   import websocket.hurlant.crypto.symmetric.DESKey;
   import websocket.hurlant.crypto.symmetric.ECBMode;
   import websocket.hurlant.crypto.symmetric.ICipher;
   import websocket.hurlant.crypto.symmetric.IMode;
   import websocket.hurlant.crypto.symmetric.IPad;
   import websocket.hurlant.crypto.symmetric.ISymmetricKey;
   import websocket.hurlant.crypto.symmetric.IVMode;
   import websocket.hurlant.crypto.symmetric.NullPad;
   import websocket.hurlant.crypto.symmetric.OFBMode;
   import websocket.hurlant.crypto.symmetric.PKCS5;
   import websocket.hurlant.crypto.symmetric.SimpleIVMode;
   import websocket.hurlant.crypto.symmetric.TripleDESKey;
   import websocket.hurlant.crypto.symmetric.XTeaKey;
   import websocket.hurlant.util.Base64;
   
   public class Crypto
   {
       
      
      private var b64:Base64;
      
      public function Crypto()
      {
         super();
      }
      
      public static function getCipher(param1:String, param2:ByteArray, param3:IPad = null) : ICipher
      {
         var _loc4_:* = null;
         var _loc5_:Array = param1.split("-");
         var _loc6_:* = _loc5_[0];
         switch(_loc6_)
         {
            case "simple":
               _loc5_.shift();
               param1 = _loc5_.join("-");
               _loc4_ = getCipher(param1,param2,param3);
               if(_loc4_ is IVMode)
               {
                  return new SimpleIVMode(_loc4_ as IVMode);
               }
               return _loc4_;
            case "aes":
            case "aes128":
            case "aes192":
            case "aes256":
               _loc5_.shift();
               if(param2.length * 8 == _loc5_[0])
               {
                  _loc5_.shift();
               }
               return getMode(_loc5_[0],new AESKey(param2),param3);
            case "bf":
            case "blowfish":
               _loc5_.shift();
               return getMode(_loc5_[0],new BlowFishKey(param2),param3);
            case "des":
               _loc5_.shift();
               if(_loc5_[0] != "ede" && _loc5_[0] != "ede3")
               {
                  return getMode(_loc5_[0],new DESKey(param2),param3);
               }
               if(_loc5_.length == 1)
               {
                  _loc5_.push("ecb");
               }
            case "3des":
            case "des3":
               _loc5_.shift();
               return getMode(_loc5_[0],new TripleDESKey(param2),param3);
            case "xtea":
               _loc5_.shift();
               return getMode(_loc5_[0],new XTeaKey(param2),param3);
            case "rc4":
               _loc5_.shift();
               return new ARC4(param2);
            default:
               return null;
         }
      }
      
      public static function getKeySize(param1:String) : uint
      {
         var _loc2_:Array = param1.split("-");
         var _loc3_:* = _loc2_[0];
         switch(_loc3_)
         {
            case "simple":
               _loc2_.shift();
               return getKeySize(_loc2_.join("-"));
            case "aes128":
               return 16;
            case "aes192":
               return 24;
            case "aes256":
               return 32;
            case "aes":
               _loc2_.shift();
               return parseInt(_loc2_[0]) / 8;
            case "bf":
            case "blowfish":
               return 16;
            case "des":
               _loc2_.shift();
               _loc3_ = _loc2_[0];
               switch(_loc3_)
               {
                  case "ede":
                     return 16;
                  case "ede3":
                     return 24;
                  default:
                     return 8;
               }
            case "3des":
            case "des3":
               return 24;
            case "xtea":
               return 8;
            case "rc4":
               if(parseInt(_loc2_[1]) > 0)
               {
                  return parseInt(_loc2_[1]) / 8;
               }
               return 16;
            default:
               return 0;
         }
      }
      
      private static function getMode(param1:String, param2:ISymmetricKey, param3:IPad = null) : IMode
      {
         var _loc4_:* = param1;
         switch(_loc4_)
         {
            case "ecb":
               return new ECBMode(param2,param3);
            case "cfb":
               return new CFBMode(param2,param3);
            case "cfb8":
               return new CFB8Mode(param2,param3);
            case "ofb":
               return new OFBMode(param2,param3);
            case "ctr":
               return new CTRMode(param2,param3);
            case "cbc":
            default:
               return new CBCMode(param2,param3);
         }
      }
      
      public static function getHash(param1:String) : IHash
      {
         var _loc2_:* = param1;
         switch(_loc2_)
         {
            case "md2":
               return new MD2();
            case "md5":
               return new MD5();
            case "sha":
            case "sha1":
               return new SHA1();
            case "sha224":
               return new SHA224();
            case "sha256":
               return new SHA256();
            default:
               return null;
         }
      }
      
      public static function getHMAC(param1:String) : HMAC
      {
         var _loc2_:Array = param1.split("-");
         if(_loc2_[0] == "hmac")
         {
            _loc2_.shift();
         }
         var _loc3_:uint = 0;
         if(_loc2_.length > 1)
         {
            _loc3_ = parseInt(_loc2_[1]);
         }
         return new HMAC(getHash(_loc2_[0]),_loc3_);
      }
      
      public static function getMAC(param1:String) : MAC
      {
         var _loc2_:Array = param1.split("-");
         if(_loc2_[0] == "mac")
         {
            _loc2_.shift();
         }
         var _loc3_:uint = 0;
         if(_loc2_.length > 1)
         {
            _loc3_ = parseInt(_loc2_[1]);
         }
         return new MAC(getHash(_loc2_[0]),_loc3_);
      }
      
      public static function getPad(param1:String) : IPad
      {
         var _loc2_:* = param1;
         switch(_loc2_)
         {
            case "null":
               return new NullPad();
            case "pkcs5":
            default:
               return new PKCS5();
         }
      }
      
      public static function getRSA(param1:String, param2:String) : RSAKey
      {
         return RSAKey.parsePublicKey(param2,param1);
      }
   }
}
