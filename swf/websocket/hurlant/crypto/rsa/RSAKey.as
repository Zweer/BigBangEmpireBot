package websocket.hurlant.crypto.rsa
{
   import flash.utils.ByteArray;
   import websocket.hurlant.crypto.prng.Random;
   import websocket.hurlant.crypto.tls.TLSError;
   import websocket.hurlant.math.BigInteger;
   import websocket.hurlant.util.Memory;
   
   public class RSAKey
   {
       
      
      public var e:int;
      
      public var n:BigInteger;
      
      public var d:BigInteger;
      
      public var p:BigInteger;
      
      public var q:BigInteger;
      
      public var dmp1:BigInteger;
      
      public var dmq1:BigInteger;
      
      public var coeff:BigInteger;
      
      protected var canDecrypt:Boolean;
      
      protected var canEncrypt:Boolean;
      
      public function RSAKey(param1:BigInteger, param2:int, param3:BigInteger = null, param4:BigInteger = null, param5:BigInteger = null, param6:BigInteger = null, param7:BigInteger = null, param8:BigInteger = null)
      {
         super();
         this.n = param1;
         this.e = param2;
         this.d = param3;
         this.p = param4;
         this.q = param5;
         this.dmp1 = param6;
         this.dmq1 = param7;
         this.coeff = param8;
         canEncrypt = n != null && e != 0;
         canDecrypt = canEncrypt && d != null;
      }
      
      public static function parsePublicKey(param1:String, param2:String) : RSAKey
      {
         return new RSAKey(new BigInteger(param1,16,true),parseInt(param2,16));
      }
      
      public static function parsePrivateKey(param1:String, param2:String, param3:String, param4:String = null, param5:String = null, param6:String = null, param7:String = null, param8:String = null) : RSAKey
      {
         if(param4 == null)
         {
            return new RSAKey(new BigInteger(param1,16,true),parseInt(param2,16),new BigInteger(param3,16,true));
         }
         return new RSAKey(new BigInteger(param1,16,true),parseInt(param2,16),new BigInteger(param3,16,true),new BigInteger(param4,16,true),new BigInteger(param5,16,true),new BigInteger(param6,16,true),new BigInteger(param7,16,true),new BigInteger(param8,16,true));
      }
      
      public static function generate(param1:uint, param2:String) : RSAKey
      {
         var _loc8_:* = null;
         var _loc6_:* = null;
         var _loc4_:* = null;
         var _loc5_:* = null;
         var _loc9_:Random = new Random();
         var _loc7_:uint = param1 >> 1;
         var _loc10_:RSAKey = new RSAKey(null,0,null);
         _loc10_.e = parseInt(param2,16);
         var _loc3_:BigInteger = new BigInteger(param2,16,true);
         do
         {
            while(true)
            {
               _loc10_.p = bigRandom(param1 - _loc7_,_loc9_);
               if(!(_loc10_.p.subtract(BigInteger.ONE).gcd(_loc3_).compareTo(BigInteger.ONE) == 0 && _loc10_.p.isProbablePrime(10)))
               {
                  continue;
               }
               break;
            }
            while(true)
            {
               _loc10_.q = bigRandom(_loc7_,_loc9_);
               if(!(_loc10_.q.subtract(BigInteger.ONE).gcd(_loc3_).compareTo(BigInteger.ONE) == 0 && _loc10_.q.isProbablePrime(10)))
               {
                  continue;
               }
               break;
            }
            if(_loc10_.p.compareTo(_loc10_.q) <= 0)
            {
               _loc8_ = _loc10_.p;
               _loc10_.p = _loc10_.q;
               _loc10_.q = _loc8_;
            }
            _loc6_ = _loc10_.p.subtract(BigInteger.ONE);
            _loc4_ = _loc10_.q.subtract(BigInteger.ONE);
            _loc5_ = _loc6_.multiply(_loc4_);
         }
         while(_loc5_.gcd(_loc3_).compareTo(BigInteger.ONE) != 0);
         
         _loc10_.n = _loc10_.p.multiply(_loc10_.q);
         _loc10_.d = _loc3_.modInverse(_loc5_);
         _loc10_.dmp1 = _loc10_.d.mod(_loc6_);
         _loc10_.dmq1 = _loc10_.d.mod(_loc4_);
         _loc10_.coeff = _loc10_.q.modInverse(_loc10_.p);
         return _loc10_;
      }
      
      protected static function bigRandom(param1:int, param2:Random) : BigInteger
      {
         if(param1 < 2)
         {
            return BigInteger.nbv(1);
         }
         var _loc4_:ByteArray = new ByteArray();
         param2.nextBytes(_loc4_,param1 >> 3);
         _loc4_.position = 0;
         var _loc3_:BigInteger = new BigInteger(_loc4_,0,true);
         _loc3_.primify(param1,1);
         return _loc3_;
      }
      
      public function getBlockSize() : uint
      {
         return (n.bitLength() + 7) / 8;
      }
      
      public function dispose() : void
      {
         e = 0;
         n.dispose();
         n = null;
         Memory.gc();
      }
      
      public function encrypt(param1:ByteArray, param2:ByteArray, param3:uint, param4:Function = null) : void
      {
         _encrypt(doPublic,param1,param2,param3,param4,2);
      }
      
      public function decrypt(param1:ByteArray, param2:ByteArray, param3:uint, param4:Function = null) : void
      {
         _decrypt(doPrivate2,param1,param2,param3,param4,2);
      }
      
      public function sign(param1:ByteArray, param2:ByteArray, param3:uint, param4:Function = null) : void
      {
         _encrypt(doPrivate2,param1,param2,param3,param4,1);
      }
      
      public function verify(param1:ByteArray, param2:ByteArray, param3:uint, param4:Function = null) : void
      {
         _decrypt(doPublic,param1,param2,param3,param4,1);
      }
      
      private function _encrypt(param1:Function, param2:ByteArray, param3:ByteArray, param4:uint, param5:Function, param6:int) : void
      {
         var _loc10_:* = null;
         var _loc7_:* = null;
         if(param5 == null)
         {
            param5 = pkcs1pad;
         }
         if(param2.position >= param2.length)
         {
            param2.position = 0;
         }
         var _loc8_:uint = getBlockSize();
         var _loc9_:int = param2.position + param4;
         while(param2.position < _loc9_)
         {
            _loc10_ = new BigInteger(param5(param2,_loc9_,_loc8_,param6),_loc8_,true);
            _loc7_ = param1(_loc10_);
            _loc7_.toArray(param3);
         }
      }
      
      private function _decrypt(param1:Function, param2:ByteArray, param3:ByteArray, param4:uint, param5:Function, param6:int) : void
      {
         var _loc11_:* = null;
         var _loc8_:* = null;
         var _loc7_:* = null;
         if(param5 == null)
         {
            param5 = pkcs1unpad;
         }
         if(param2.position >= param2.length)
         {
            param2.position = 0;
         }
         var _loc9_:uint = getBlockSize();
         var _loc10_:int = param2.position + param4;
         while(param2.position < _loc10_)
         {
            _loc11_ = new BigInteger(param2,_loc9_,true);
            _loc8_ = param1(_loc11_);
            _loc7_ = param5(_loc8_,_loc9_,param6);
            if(_loc7_ == null)
            {
               throw new TLSError("Decrypt error - padding function returned null!",50);
            }
            param3.writeBytes(_loc7_);
         }
      }
      
      private function pkcs1pad(param1:ByteArray, param2:int, param3:uint, param4:uint = 2) : ByteArray
      {
         var _loc8_:* = null;
         var _loc6_:int = 0;
         var _loc9_:ByteArray = new ByteArray();
         var _loc5_:uint = param1.position;
         param2 = Math.min(param2,param1.length,_loc5_ + param3 - 11);
         param1.position = param2;
         var _loc7_:int = param2 - 1;
         while(_loc7_ >= _loc5_ && param3 > 11)
         {
            _loc7_--;
            _loc9_[--param3] = param1[_loc7_];
         }
         _loc9_[--param3] = 0;
         if(param4 == 2)
         {
            _loc8_ = new Random();
            _loc6_ = 0;
            while(param3 > 2)
            {
               do
               {
                  _loc6_ = _loc8_.nextByte();
               }
               while(_loc6_ == 0);
               
               _loc9_[--param3] = _loc6_;
            }
         }
         else
         {
            while(param3 > 2)
            {
               _loc9_[--param3] = 255;
            }
         }
         _loc9_[--param3] = param4;
         _loc9_[--param3] = 0;
         return _loc9_;
      }
      
      private function pkcs1unpad(param1:BigInteger, param2:uint, param3:uint = 2) : ByteArray
      {
         var _loc4_:ByteArray = param1.toByteArray();
         var _loc6_:ByteArray = new ByteArray();
         _loc4_.position = 0;
         var _loc5_:int = 0;
         while(_loc5_ < _loc4_.length && _loc4_[_loc5_] == 0)
         {
            _loc5_++;
         }
         if(_loc4_.length - _loc5_ != param2 - 1 || _loc4_[_loc5_] != param3)
         {
            trace("PKCS#1 unpad: i=" + _loc5_ + ", expected b[i]==" + param3 + ", got b[i]=" + _loc4_[_loc5_].toString(16));
            return null;
         }
         _loc5_++;
         while(_loc4_[_loc5_] != 0)
         {
            _loc5_++;
            if(_loc5_ >= _loc4_.length)
            {
               trace("PKCS#1 unpad: i=" + _loc5_ + ", b[i-1]!=0 (=" + _loc4_[_loc5_ - 1].toString(16) + ")");
               return null;
            }
         }
         while(true)
         {
            _loc5_++;
            if(_loc5_ >= _loc4_.length)
            {
               break;
            }
            _loc6_.writeByte(_loc4_[_loc5_]);
         }
         _loc6_.position = 0;
         return _loc6_;
      }
      
      public function rawpad(param1:ByteArray, param2:int, param3:uint, param4:uint = 0) : ByteArray
      {
         return param1;
      }
      
      public function rawunpad(param1:BigInteger, param2:uint, param3:uint = 0) : ByteArray
      {
         return param1.toByteArray();
      }
      
      public function toString() : String
      {
         return "rsa";
      }
      
      public function dump() : String
      {
         var _loc1_:String = "N=" + n.toString(16) + "\n" + "E=" + e.toString(16) + "\n";
         if(canDecrypt)
         {
            _loc1_ = _loc1_ + ("D=" + d.toString(16) + "\n");
            if(p != null && q != null)
            {
               _loc1_ = _loc1_ + ("P=" + p.toString(16) + "\n");
               _loc1_ = _loc1_ + ("Q=" + q.toString(16) + "\n");
               _loc1_ = _loc1_ + ("DMP1=" + dmp1.toString(16) + "\n");
               _loc1_ = _loc1_ + ("DMQ1=" + dmq1.toString(16) + "\n");
               _loc1_ = _loc1_ + ("IQMP=" + coeff.toString(16) + "\n");
            }
         }
         return _loc1_;
      }
      
      protected function doPublic(param1:BigInteger) : BigInteger
      {
         return param1.modPowInt(e,n);
      }
      
      protected function doPrivate2(param1:BigInteger) : BigInteger
      {
         if(p == null && q == null)
         {
            return param1.modPow(d,n);
         }
         var _loc3_:BigInteger = param1.mod(p).modPow(dmp1,p);
         var _loc4_:BigInteger = param1.mod(q).modPow(dmq1,q);
         while(_loc3_.compareTo(_loc4_) < 0)
         {
            _loc3_ = _loc3_.add(p);
         }
         var _loc2_:BigInteger = _loc3_.subtract(_loc4_).multiply(coeff).mod(p).multiply(q).add(_loc4_);
         return _loc2_;
      }
      
      protected function doPrivate(param1:BigInteger) : BigInteger
      {
         if(p == null || q == null)
         {
            return param1.modPow(d,n);
         }
         var _loc2_:BigInteger = param1.mod(p).modPow(dmp1,p);
         var _loc3_:BigInteger = param1.mod(q).modPow(dmq1,q);
         while(_loc2_.compareTo(_loc3_) < 0)
         {
            _loc2_ = _loc2_.add(p);
         }
         return _loc2_.subtract(_loc3_).multiply(coeff).mod(p).multiply(q).add(_loc3_);
      }
   }
}
