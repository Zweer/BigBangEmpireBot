package websocket.hurlant.crypto.tls
{
   import flash.utils.ByteArray;
   import websocket.hurlant.crypto.Crypto;
   import websocket.hurlant.crypto.symmetric.ICipher;
   import websocket.hurlant.crypto.symmetric.SSLPad;
   import websocket.hurlant.crypto.symmetric.TLSPad;
   
   public class BulkCiphers
   {
      
      public static const STREAM_CIPHER:uint = 0;
      
      public static const BLOCK_CIPHER:uint = 1;
      
      public static const NULL:uint = 0;
      
      public static const RC4_40:uint = 1;
      
      public static const RC4_128:uint = 2;
      
      public static const RC2_CBC_40:uint = 3;
      
      public static const DES_CBC:uint = 4;
      
      public static const DES3_EDE_CBC:uint = 5;
      
      public static const DES40_CBC:uint = 6;
      
      public static const IDEA_CBC:uint = 7;
      
      public static const AES_128:uint = 8;
      
      public static const AES_256:uint = 9;
      
      private static const algos:Array = ["","rc4","rc4","","des-cbc","3des-cbc","des-cbc","","aes","aes"];
      
      private static var _props:Array;
      
      {
         init();
      }
      
      private var type:uint;
      
      private var keyBytes:uint;
      
      private var expandedKeyBytes:uint;
      
      private var effectiveKeyBits:uint;
      
      private var IVSize:uint;
      
      private var blockSize:uint;
      
      public function BulkCiphers(param1:uint, param2:uint, param3:uint, param4:uint, param5:uint, param6:uint)
      {
         super();
         type = param1;
         keyBytes = param2;
         expandedKeyBytes = param3;
         effectiveKeyBits = param4;
         IVSize = param5;
         blockSize = param6;
      }
      
      private static function init() : void
      {
         _props = [];
         _props[0] = new BulkCiphers(0,0,0,0,0,0);
         _props[1] = new BulkCiphers(0,5,16,40,0,0);
         _props[2] = new BulkCiphers(0,16,16,128,0,0);
         _props[3] = new BulkCiphers(1,5,16,40,8,8);
         _props[4] = new BulkCiphers(1,8,8,56,8,8);
         _props[5] = new BulkCiphers(1,24,24,168,8,8);
         _props[6] = new BulkCiphers(1,5,8,40,8,8);
         _props[7] = new BulkCiphers(1,16,16,128,8,8);
         _props[8] = new BulkCiphers(1,16,16,128,16,16);
         _props[9] = new BulkCiphers(1,32,32,256,16,16);
      }
      
      private static function getProp(param1:uint) : BulkCiphers
      {
         var _loc2_:BulkCiphers = _props[param1];
         if(_loc2_ == null)
         {
            throw new Error("Unknown bulk cipher " + param1.toString(16));
         }
         return _loc2_;
      }
      
      public static function getType(param1:uint) : uint
      {
         return getProp(param1).type;
      }
      
      public static function getKeyBytes(param1:uint) : uint
      {
         return getProp(param1).keyBytes;
      }
      
      public static function getExpandedKeyBytes(param1:uint) : uint
      {
         return getProp(param1).expandedKeyBytes;
      }
      
      public static function getEffectiveKeyBits(param1:uint) : uint
      {
         return getProp(param1).effectiveKeyBits;
      }
      
      public static function getIVSize(param1:uint) : uint
      {
         return getProp(param1).IVSize;
      }
      
      public static function getBlockSize(param1:uint) : uint
      {
         return getProp(param1).blockSize;
      }
      
      public static function getCipher(param1:uint, param2:ByteArray, param3:uint) : ICipher
      {
         if(param3 == 769)
         {
            return Crypto.getCipher(algos[param1],param2,new TLSPad());
         }
         return Crypto.getCipher(algos[param1],param2,new SSLPad());
      }
   }
}
