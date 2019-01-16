package websocket.hurlant.util.der
{
   import flash.utils.ByteArray;
   import websocket.hurlant.crypto.rsa.RSAKey;
   import websocket.hurlant.util.Base64;
   
   public class PEM
   {
      
      private static const RSA_PRIVATE_KEY_HEADER:String = "-----BEGIN RSA PRIVATE KEY-----";
      
      private static const RSA_PRIVATE_KEY_FOOTER:String = "-----END RSA PRIVATE KEY-----";
      
      private static const RSA_PUBLIC_KEY_HEADER:String = "-----BEGIN PUBLIC KEY-----";
      
      private static const RSA_PUBLIC_KEY_FOOTER:String = "-----END PUBLIC KEY-----";
      
      private static const CERTIFICATE_HEADER:String = "-----BEGIN CERTIFICATE-----";
      
      private static const CERTIFICATE_FOOTER:String = "-----END CERTIFICATE-----";
       
      
      public function PEM()
      {
         super();
      }
      
      public static function readRSAPrivateKey(param1:String) : RSAKey
      {
         var _loc3_:* = null;
         var _loc2_:ByteArray = extractBinary("-----BEGIN RSA PRIVATE KEY-----","-----END RSA PRIVATE KEY-----",param1);
         if(_loc2_ == null)
         {
            return null;
         }
         var _loc4_:* = DER.parse(_loc2_);
         if(_loc4_ is Array)
         {
            _loc3_ = _loc4_ as Array;
            return new RSAKey(_loc3_[1],_loc3_[2].valueOf(),_loc3_[3],_loc3_[4],_loc3_[5],_loc3_[6],_loc3_[7],_loc3_[8]);
         }
         return null;
      }
      
      public static function readRSAPublicKey(param1:String) : RSAKey
      {
         var _loc3_:* = null;
         var _loc2_:ByteArray = extractBinary("-----BEGIN PUBLIC KEY-----","-----END PUBLIC KEY-----",param1);
         if(_loc2_ == null)
         {
            return null;
         }
         var _loc4_:* = DER.parse(_loc2_);
         if(_loc4_ is Array)
         {
            _loc3_ = _loc4_ as Array;
            if(_loc3_[0][0].toString() != "1.2.840.113549.1.1.1")
            {
               return null;
            }
            _loc3_[1].position = 1;
            _loc4_ = DER.parse(_loc3_[1]);
            if(_loc4_ is Array)
            {
               _loc3_ = _loc4_ as Array;
               return new RSAKey(_loc3_[0],_loc3_[1]);
            }
            return null;
         }
         return null;
      }
      
      public static function readCertIntoArray(param1:String) : ByteArray
      {
         var _loc2_:ByteArray = extractBinary("-----BEGIN CERTIFICATE-----","-----END CERTIFICATE-----",param1);
         return _loc2_;
      }
      
      private static function extractBinary(param1:String, param2:String, param3:String) : ByteArray
      {
         var _loc5_:int = param3.indexOf(param1);
         if(_loc5_ == -1)
         {
            return null;
         }
         _loc5_ = _loc5_ + param1.length;
         var _loc6_:int = param3.indexOf(param2);
         if(_loc6_ == -1)
         {
            return null;
         }
         var _loc4_:String = param3.substring(_loc5_,_loc6_);
         _loc4_ = _loc4_.replace(/\s/gm,"");
         return Base64.decodeToByteArray(_loc4_);
      }
   }
}
