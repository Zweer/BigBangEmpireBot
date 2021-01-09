package websocket.hurlant.crypto.prng
{
   import flash.utils.ByteArray;
   import websocket.hurlant.crypto.symmetric.IStreamCipher;
   import websocket.hurlant.util.Memory;
   
   public class ARC4 implements IPRNG, IStreamCipher
   {
       
      
      private var i:int = 0;
      
      private var j:int = 0;
      
      private var S:ByteArray;
      
      private const psize:uint = 256;
      
      public function ARC4(param1:ByteArray = null)
      {
         super();
         S = new ByteArray();
         if(param1)
         {
            init(param1);
         }
      }
      
      public function getPoolSize() : uint
      {
         return 256;
      }
      
      public function init(param1:ByteArray) : void
      {
         var _loc3_:int = 0;
         var _loc4_:* = 0;
         var _loc2_:int = 0;
         _loc3_ = 0;
         while(_loc3_ < 256)
         {
            S[_loc3_] = _loc3_;
            _loc3_++;
         }
         _loc4_ = 0;
         _loc3_ = 0;
         while(_loc3_ < 256)
         {
            _loc4_ = _loc4_ + S[_loc3_] + param1[_loc3_ % param1.length] & 255;
            _loc2_ = S[_loc3_];
            S[_loc3_] = S[_loc4_];
            S[_loc4_] = _loc2_;
            _loc3_++;
         }
         this.i = 0;
         this.j = 0;
      }
      
      public function next() : uint
      {
         var _loc1_:int = 0;
         i = i + 1 & 255;
         j = j + S[i] & 255;
         _loc1_ = S[i];
         S[i] = S[j];
         S[j] = _loc1_;
         return S[_loc1_ + S[i] & 255];
      }
      
      public function getBlockSize() : uint
      {
         return 1;
      }
      
      public function encrypt(param1:ByteArray) : void
      {
         var _loc2_:uint = 0;
         while(_loc2_ < param1.length)
         {
            var _loc3_:* = _loc2_++;
            var _loc4_:* = param1[_loc3_] ^ next();
            param1[_loc3_] = _loc4_;
         }
      }
      
      public function decrypt(param1:ByteArray) : void
      {
         encrypt(param1);
      }
      
      public function dispose() : void
      {
         var _loc1_:uint = 0;
         if(S != null)
         {
            _loc1_ = 0;
            while(_loc1_ < S.length)
            {
               S[_loc1_] = Math.random() * 256;
               _loc1_++;
            }
            S.length = 0;
            S = null;
         }
         this.i = 0;
         this.j = 0;
         Memory.gc();
      }
      
      public function toString() : String
      {
         return "rc4";
      }
   }
}
