package websocket.hurlant.math
{
   import flash.utils.ByteArray;
   import websocket.hurlant.crypto.prng.Random;
   import websocket.hurlant.util.Hex;
   import websocket.hurlant.util.Memory;
   
   use namespace bi_internal;
   
   public class BigInteger
   {
      
      public static const DB:int = 30;
      
      public static const DV:int = 1073741824;
      
      public static const DM:int = 1073741823;
      
      public static const BI_FP:int = 52;
      
      public static const FV:Number = Math.pow(2,52);
      
      public static const F1:int = 22;
      
      public static const F2:int = 8;
      
      public static const ZERO:BigInteger = nbv(0);
      
      public static const ONE:BigInteger = nbv(1);
      
      public static const lowprimes:Array = [2,3,5,7,11,13,17,19,23,29,31,37,41,43,47,53,59,61,67,71,73,79,83,89,97,101,103,107,109,113,127,131,137,139,149,151,157,163,167,173,179,181,191,193,197,199,211,223,227,229,233,239,241,251,257,263,269,271,277,281,283,293,307,311,313,317,331,337,347,349,353,359,367,373,379,383,389,397,401,409,419,421,431,433,439,443,449,457,461,463,467,479,487,491,499,503,509];
      
      public static const lplim:int = 67108864 / lowprimes[lowprimes.length - 1];
       
      
      public var t:int;
      
      bi_internal var s:int;
      
      bi_internal var a:Array;
      
      public function BigInteger(param1:* = null, param2:int = 0, param3:Boolean = false)
      {
         var _loc4_:* = null;
         var _loc5_:int = 0;
         super();
         a = [];
         if(param1 is String)
         {
            if(param2 && param2 != 16)
            {
               throw new Error("BigInteger construction with radix!=16 is not supported.");
            }
            param1 = Hex.toArray(param1);
            param2 = 0;
         }
         if(param1 is ByteArray)
         {
            _loc4_ = param1 as ByteArray;
            _loc5_ = param2 || _loc4_.length - _loc4_.position;
            fromArray(_loc4_,_loc5_,param3);
         }
      }
      
      public static function nbv(param1:int) : BigInteger
      {
         var _loc2_:BigInteger = new BigInteger();
         _loc2_.fromInt(param1);
         return _loc2_;
      }
      
      public function dispose() : void
      {
         var _loc2_:* = 0;
         var _loc1_:Random = new Random();
         _loc2_ = uint(0);
         while(_loc2_ < a.length)
         {
            a[_loc2_] = _loc1_.nextByte();
            delete a[_loc2_];
            _loc2_++;
         }
         a = null;
         t = 0;
         s = 0;
         Memory.gc();
      }
      
      public function toString(param1:Number = 16) : String
      {
         var _loc7_:int = 0;
         if(s < 0)
         {
            return "-" + negate().toString(param1);
         }
         var _loc9_:* = param1;
         switch(_loc9_)
         {
            case 2:
               _loc7_ = 1;
               break;
            case 4:
               _loc7_ = 2;
               break;
            case 8:
               _loc7_ = 3;
               break;
            case 16:
               _loc7_ = 4;
               break;
            case 32:
               _loc7_ = 5;
         }
         var _loc3_:int = (1 << _loc7_) - 1;
         var _loc5_:* = 0;
         var _loc8_:Boolean = false;
         var _loc4_:String = "";
         var _loc6_:int = t;
         var _loc2_:int = 30 - _loc6_ * 30 % _loc7_;
         _loc6_--;
         if(_loc6_ > 0)
         {
            if(_loc2_ < 30 && a[_loc6_] >> _loc2_ > 0)
            {
               _loc8_ = true;
               _loc4_ = _loc5_.toString(36);
            }
            while(_loc6_ >= 0)
            {
               if(_loc2_ < _loc7_)
               {
                  _loc5_ = (a[_loc6_] & (1 << _loc2_) - 1) << _loc7_ - _loc2_;
                  _loc6_--;
                  _loc2_ = _loc2_ + (30 - _loc7_);
                  _loc5_ = _loc5_ | a[_loc6_] >> _loc2_ + (30 - _loc7_);
               }
               else
               {
                  _loc2_ = _loc2_ - _loc7_;
                  _loc5_ = a[_loc6_] >> _loc2_ - _loc7_ & _loc3_;
                  if(_loc2_ <= 0)
                  {
                     _loc2_ = _loc2_ + 30;
                     _loc6_--;
                  }
               }
               if(_loc5_ > 0)
               {
                  _loc8_ = true;
               }
               if(_loc8_)
               {
                  _loc4_ = _loc4_ + _loc5_.toString(36);
               }
            }
         }
         return !!_loc8_?_loc4_:"0";
      }
      
      public function toArray(param1:ByteArray) : uint
      {
         var _loc7_:int = 0;
         _loc7_ = 8;
         var _loc3_:int = 0;
         _loc3_ = 255;
         var _loc5_:* = 0;
         var _loc6_:int = t;
         var _loc2_:int = 30 - _loc6_ * 30 % 8;
         var _loc8_:Boolean = false;
         var _loc4_:int = 0;
         _loc6_--;
         if(_loc6_ > 0)
         {
            if(_loc2_ < 30 && a[_loc6_] >> _loc2_ > 0)
            {
               _loc8_ = true;
               param1.writeByte(_loc5_);
               _loc4_++;
            }
            while(_loc6_ >= 0)
            {
               if(_loc2_ < 8)
               {
                  _loc5_ = (a[_loc6_] & (1 << _loc2_) - 1) << 8 - _loc2_;
                  _loc6_--;
                  _loc2_ = _loc2_ + (30 - 8);
                  _loc5_ = _loc5_ | a[_loc6_] >> _loc2_ + (30 - 8);
               }
               else
               {
                  _loc2_ = _loc2_ - 8;
                  _loc5_ = a[_loc6_] >> _loc2_ - 8 & 255;
                  if(_loc2_ <= 0)
                  {
                     _loc2_ = _loc2_ + 30;
                     _loc6_--;
                  }
               }
               if(_loc5_ > 0)
               {
                  _loc8_ = true;
               }
               if(_loc8_)
               {
                  param1.writeByte(_loc5_);
                  _loc4_++;
               }
            }
         }
         return _loc4_;
      }
      
      public function valueOf() : Number
      {
         var _loc2_:* = 0;
         if(s == -1)
         {
            return -negate().valueOf();
         }
         var _loc1_:* = 1;
         var _loc3_:* = 0;
         _loc2_ = uint(0);
         while(_loc2_ < t)
         {
            _loc3_ = Number(_loc3_ + a[_loc2_] * _loc1_);
            _loc1_ = Number(_loc1_ * 1073741824);
            _loc2_++;
         }
         return _loc3_;
      }
      
      public function negate() : BigInteger
      {
         var _loc1_:BigInteger = nbi();
         ZERO.subTo(this,_loc1_);
         return _loc1_;
      }
      
      public function abs() : BigInteger
      {
         return s < 0?negate():this;
      }
      
      public function compareTo(param1:BigInteger) : int
      {
         var _loc2_:int = s - param1.s;
         if(_loc2_ != 0)
         {
            return _loc2_;
         }
         var _loc3_:int = t;
         _loc2_ = _loc3_ - param1.t;
         if(_loc2_ != 0)
         {
            return _loc2_;
         }
         while(true, true)
         {
            _loc3_--;
            if(_loc3_ < 0)
            {
               break;
            }
            _loc2_ = a[_loc3_] - param1.a[_loc3_];
            if(_loc2_ != 0)
            {
               return _loc2_;
            }
         }
         return 0;
      }
      
      bi_internal function nbits(param1:int) : int
      {
         var _loc3_:int = 0;
         var _loc2_:int = 1;
         _loc3_ = param1 >>> 16;
         if(param1 >>> 16 != 0)
         {
            param1 = _loc3_;
            _loc2_ = _loc2_ + 16;
         }
         _loc3_ = param1 >> 8;
         if(param1 >> 8 != 0)
         {
            param1 = _loc3_;
            _loc2_ = _loc2_ + 8;
         }
         _loc3_ = param1 >> 4;
         if(param1 >> 4 != 0)
         {
            param1 = _loc3_;
            _loc2_ = _loc2_ + 4;
         }
         _loc3_ = param1 >> 2;
         if(param1 >> 2 != 0)
         {
            param1 = _loc3_;
            _loc2_ = _loc2_ + 2;
         }
         _loc3_ = param1 >> 1;
         if(param1 >> 1 != 0)
         {
            param1 = _loc3_;
            _loc2_ = _loc2_ + 1;
         }
         return _loc2_;
      }
      
      public function bitLength() : int
      {
         if(t <= 0)
         {
            return 0;
         }
         return 30 * (t - 1) + nbits(a[t - 1] ^ s & 1073741823);
      }
      
      public function mod(param1:BigInteger) : BigInteger
      {
         var _loc2_:BigInteger = nbi();
         abs().divRemTo(param1,null,_loc2_);
         if(s < 0 && _loc2_.compareTo(ZERO) > 0)
         {
            param1.subTo(_loc2_,_loc2_);
         }
         return _loc2_;
      }
      
      public function modPowInt(param1:int, param2:BigInteger) : BigInteger
      {
         var _loc3_:* = null;
         if(param1 < 256 || param2.isEven())
         {
            _loc3_ = new ClassicReduction(param2);
         }
         else
         {
            _loc3_ = new MontgomeryReduction(param2);
         }
         return exp(param1,_loc3_);
      }
      
      bi_internal function copyTo(param1:BigInteger) : void
      {
         var _loc2_:int = 0;
         _loc2_ = t - 1;
         while(_loc2_ >= 0)
         {
            param1.a[_loc2_] = a[_loc2_];
            _loc2_--;
         }
         param1.t = t;
         param1.s = s;
      }
      
      bi_internal function fromInt(param1:int) : void
      {
         t = 1;
         s = param1 < 0?-1:0;
         if(param1 > 0)
         {
            a[0] = param1;
         }
         else if(param1 < -1)
         {
            a[0] = param1 + 1073741824;
         }
         else
         {
            t = 0;
         }
      }
      
      bi_internal function fromArray(param1:ByteArray, param2:int, param3:Boolean = false) : void
      {
         var _loc8_:int = 0;
         _loc8_ = 8;
         var _loc6_:int = 0;
         var _loc4_:int = param1.position;
         var _loc7_:int = _loc4_ + param2;
         var _loc5_:int = 0;
         t = 0;
         s = 0;
         while(true, true)
         {
            _loc7_--;
            if(_loc7_ < _loc4_)
            {
               break;
            }
            _loc6_ = _loc7_ < param1.length?param1[_loc7_]:0;
            if(_loc5_ == 0)
            {
               t = Number(t) + 1;
               a[Number(t)] = _loc6_;
            }
            else if(_loc5_ + 8 > 30)
            {
               var _loc9_:* = t - 1;
               var _loc10_:* = a[_loc9_] | (_loc6_ & (1 << 30 - _loc5_) - 1) << _loc5_;
               a[_loc9_] = _loc10_;
               t = Number(t) + 1;
               a[Number(t)] = _loc6_ >> 30 - _loc5_;
            }
            else
            {
               _loc10_ = t - 1;
               _loc9_ = a[_loc10_] | _loc6_ << _loc5_;
               a[_loc10_] = _loc9_;
            }
            _loc5_ = _loc5_ + 8;
            if(_loc5_ >= 30)
            {
               _loc5_ = _loc5_ - 30;
            }
         }
         if(!param3 && (param1[0] & 128) == 128)
         {
            s = -1;
            if(_loc5_ > 0)
            {
               _loc9_ = t - 1;
               _loc10_ = a[_loc9_] | (1 << 30 - _loc5_) - 1 << _loc5_;
               a[_loc9_] = _loc10_;
            }
         }
         clamp();
         param1.position = Math.min(_loc4_ + param2,param1.length);
      }
      
      bi_internal function clamp() : void
      {
         var _loc1_:* = s & 1073741823;
         while(t > 0 && a[t - 1] == _loc1_)
         {
            t = t - 1;
         }
      }
      
      bi_internal function dlShiftTo(param1:int, param2:BigInteger) : void
      {
         var _loc3_:int = 0;
         _loc3_ = t - 1;
         while(_loc3_ >= 0)
         {
            param2.a[_loc3_ + param1] = a[_loc3_];
            _loc3_--;
         }
         _loc3_ = param1 - 1;
         while(_loc3_ >= 0)
         {
            param2.a[_loc3_] = 0;
            _loc3_--;
         }
         param2.t = t + param1;
         param2.s = s;
      }
      
      bi_internal function drShiftTo(param1:int, param2:BigInteger) : void
      {
         var _loc3_:* = 0;
         _loc3_ = param1;
         while(_loc3_ < t)
         {
            param2.a[_loc3_ - param1] = a[_loc3_];
            _loc3_++;
         }
         param2.t = Math.max(t - param1,0);
         param2.s = s;
      }
      
      bi_internal function lShiftTo(param1:int, param2:BigInteger) : void
      {
         var _loc6_:int = 0;
         var _loc3_:int = param1 % 30;
         var _loc5_:int = 30 - _loc3_;
         var _loc7_:int = (1 << _loc5_) - 1;
         var _loc8_:int = param1 / 30;
         var _loc4_:* = s << _loc3_ & 1073741823;
         _loc6_ = t - 1;
         while(_loc6_ >= 0)
         {
            param2.a[_loc6_ + _loc8_ + 1] = a[_loc6_] >> _loc5_ | _loc4_;
            _loc4_ = (a[_loc6_] & _loc7_) << _loc3_;
            _loc6_--;
         }
         _loc6_ = _loc8_ - 1;
         while(_loc6_ >= 0)
         {
            param2.a[_loc6_] = 0;
            _loc6_--;
         }
         param2.a[_loc8_] = _loc4_;
         param2.t = t + _loc8_ + 1;
         param2.s = s;
         param2.clamp();
      }
      
      bi_internal function rShiftTo(param1:int, param2:BigInteger) : void
      {
         var _loc5_:int = 0;
         param2.s = s;
         var _loc7_:int = param1 / 30;
         if(_loc7_ >= t)
         {
            param2.t = 0;
            return;
         }
         var _loc3_:int = param1 % 30;
         var _loc4_:int = 30 - _loc3_;
         var _loc6_:int = (1 << _loc3_) - 1;
         param2.a[0] = a[_loc7_] >> _loc3_;
         _loc5_ = _loc7_ + 1;
         while(_loc5_ < t)
         {
            var _loc8_:* = _loc5_ - _loc7_ - 1;
            var _loc9_:* = param2.a[_loc8_] | (a[_loc5_] & _loc6_) << _loc4_;
            param2.a[_loc8_] = _loc9_;
            param2.a[_loc5_ - _loc7_] = a[_loc5_] >> _loc3_;
            _loc5_++;
         }
         if(_loc3_ > 0)
         {
            _loc9_ = t - _loc7_ - 1;
            _loc8_ = param2.a[_loc9_] | (s & _loc6_) << _loc4_;
            param2.a[_loc9_] = _loc8_;
         }
         param2.t = t - _loc7_;
         param2.clamp();
      }
      
      bi_internal function subTo(param1:BigInteger, param2:BigInteger) : void
      {
         var _loc4_:int = 0;
         var _loc3_:* = 0;
         var _loc5_:int = Math.min(param1.t,t);
         while(_loc4_ < _loc5_)
         {
            _loc3_ = int(_loc3_ + (a[_loc4_] - param1.a[_loc4_]));
            _loc4_++;
            param2.a[_loc4_] = _loc3_ & 1073741823;
            _loc3_ = _loc3_ >> 30;
         }
         if(param1.t < t)
         {
            _loc3_ = int(_loc3_ - param1.s);
            while(_loc4_ < t)
            {
               _loc3_ = int(_loc3_ + a[_loc4_]);
               _loc4_++;
               param2.a[_loc4_] = _loc3_ & 1073741823;
               _loc3_ = _loc3_ >> 30;
            }
            _loc3_ = int(_loc3_ + s);
         }
         else
         {
            _loc3_ = int(_loc3_ + s);
            while(_loc4_ < param1.t)
            {
               _loc3_ = int(_loc3_ - param1.a[_loc4_]);
               _loc4_++;
               param2.a[_loc4_] = _loc3_ & 1073741823;
               _loc3_ = _loc3_ >> 30;
            }
            _loc3_ = int(_loc3_ - param1.s);
         }
         param2.s = _loc3_ < 0?-1:0;
         if(_loc3_ < -1)
         {
            _loc4_++;
            param2.a[_loc4_] = 1073741824 + _loc3_;
         }
         else if(_loc3_ > 0)
         {
            _loc4_++;
            param2.a[_loc4_] = _loc3_;
         }
         param2.t = _loc4_;
         param2.clamp();
      }
      
      bi_internal function am(param1:int, param2:int, param3:BigInteger, param4:int, param5:int, param6:int) : int
      {
         var _loc10_:* = 0;
         var _loc9_:* = 0;
         var _loc11_:int = 0;
         var _loc8_:* = param2 & 32767;
         var _loc7_:* = param2 >> 15;
         while(true, true)
         {
            param6--;
            if(param6 < 0)
            {
               break;
            }
            _loc10_ = a[param1] & 32767;
            param1++;
            _loc9_ = a[param1] >> 15;
            _loc11_ = _loc7_ * _loc10_ + _loc9_ * _loc8_;
            _loc10_ = int(_loc8_ * _loc10_ + ((_loc11_ & 32767) << 15) + param3.a[param4] + (param5 & 1073741823));
            param5 = (_loc10_ >>> 30) + (_loc11_ >>> 15) + _loc7_ * _loc9_ + (param5 >>> 30);
            param4++;
            param3.a[param4] = _loc10_ & 1073741823;
         }
         return param5;
      }
      
      bi_internal function multiplyTo(param1:BigInteger, param2:BigInteger) : void
      {
         var _loc3_:BigInteger = abs();
         var _loc4_:BigInteger = param1.abs();
         var _loc5_:int = _loc3_.t;
         param2.t = _loc5_ + _loc4_.t;
         while(true, true)
         {
            _loc5_--;
            if(_loc5_ < 0)
            {
               break;
            }
            param2.a[_loc5_] = 0;
         }
         _loc5_ = 0;
         while(_loc5_ < _loc4_.t)
         {
            param2.a[_loc5_ + _loc3_.t] = _loc3_.am(0,_loc4_.a[_loc5_],param2,_loc5_,0,_loc3_.t);
            _loc5_++;
         }
         param2.s = 0;
         param2.clamp();
         if(s != param1.s)
         {
            ZERO.subTo(param2,param2);
         }
      }
      
      bi_internal function squareTo(param1:BigInteger) : void
      {
         var _loc2_:int = 0;
         var _loc3_:BigInteger = abs();
         var _loc5_:* = 2 * _loc3_.t;
         param1.t = _loc5_;
         var _loc4_:* = _loc5_;
         while(true, true)
         {
            _loc4_--;
            if(_loc4_ < 0)
            {
               break;
            }
            param1.a[_loc4_] = 0;
         }
         _loc4_ = 0;
         while(_loc4_ < _loc3_.t - 1)
         {
            _loc2_ = _loc3_.am(_loc4_,_loc3_.a[_loc4_],param1,2 * _loc4_,0,1);
            _loc5_ = _loc4_ + _loc3_.t;
            var _loc6_:* = param1.a[_loc5_] + _loc3_.am(_loc4_ + 1,2 * _loc3_.a[_loc4_],param1,2 * _loc4_ + 1,_loc2_,_loc3_.t - _loc4_ - 1);
            param1.a[_loc5_] = _loc6_;
            if(_loc6_ >= 1073741824)
            {
               _loc6_ = _loc4_ + _loc3_.t;
               _loc5_ = param1.a[_loc6_] - 1073741824;
               param1.a[_loc6_] = _loc5_;
               param1.a[_loc4_ + _loc3_.t + 1] = 1;
            }
            _loc4_++;
         }
         if(param1.t > 0)
         {
            _loc5_ = param1.t - 1;
            _loc6_ = param1.a[_loc5_] + _loc3_.am(_loc4_,_loc3_.a[_loc4_],param1,2 * _loc4_,0,1);
            param1.a[_loc5_] = _loc6_;
         }
         param1.s = 0;
         param1.clamp();
      }
      
      bi_internal function divRemTo(param1:BigInteger, param2:BigInteger = null, param3:BigInteger = null) : void
      {
         var _loc12_:int = 0;
         var _loc18_:BigInteger = param1.abs();
         if(_loc18_.t <= 0)
         {
            return;
         }
         var _loc5_:BigInteger = abs();
         if(_loc5_.t < _loc18_.t)
         {
            if(param2 != null)
            {
               param2.fromInt(0);
            }
            if(param3 != null)
            {
               copyTo(param3);
            }
            return;
         }
         if(param3 == null)
         {
            param3 = nbi();
         }
         var _loc15_:BigInteger = nbi();
         var _loc19_:int = s;
         var _loc7_:int = param1.s;
         var _loc4_:int = 30 - nbits(_loc18_.a[_loc18_.t - 1]);
         if(_loc4_ > 0)
         {
            _loc18_.lShiftTo(_loc4_,_loc15_);
            _loc5_.lShiftTo(_loc4_,param3);
         }
         else
         {
            _loc18_.copyTo(_loc15_);
            _loc5_.copyTo(param3);
         }
         var _loc16_:int = _loc15_.t;
         var _loc14_:int = _loc15_.a[_loc16_ - 1];
         if(_loc14_ == 0)
         {
            return;
         }
         var _loc17_:Number = _loc14_ * (1 << 22) + (_loc16_ > 1?_loc15_.a[_loc16_ - 2] >> 8:0);
         var _loc10_:Number = FV / _loc17_;
         var _loc11_:Number = (1 << 22) / _loc17_;
         var _loc6_:Number = 256;
         var _loc8_:int = param3.t;
         var _loc9_:int = _loc8_ - _loc16_;
         var _loc13_:BigInteger = param2 == null?nbi():param2;
         _loc15_.dlShiftTo(_loc9_,_loc13_);
         if(param3.compareTo(_loc13_) >= 0)
         {
            var _loc20_:* = Number(param3.t);
            param3.t = _loc20_ + 1;
            param3.a[_loc20_] = 1;
            param3.subTo(_loc13_,param3);
         }
         ONE.dlShiftTo(_loc16_,_loc13_);
         _loc13_.subTo(_loc15_,_loc15_);
         while(_loc15_.t < _loc16_)
         {
            var _loc21_:* = _loc15_;
            var _loc22_:* = 0;
            var _loc23_:* = new XMLList("");
            while(§§hasnext(_loc15_,_loc22_))
            {
               _loc20_ = §§nextvalue(_loc22_,_loc21_);
               with(_loc20_)
               {
                  
                  _loc15_.t = Number(_loc15_.t) + 1;
               }
            }
            _loc23_;
         }
         while(true, true)
         {
            _loc9_--;
            if(_loc9_ < 0)
            {
               break;
            }
            _loc8_--;
            _loc12_ = param3.a[_loc8_] == _loc14_?1073741823:param3.a[_loc8_] * _loc10_ + (Number(param3.a[_loc8_ - 1]) + _loc6_) * _loc11_;
            _loc22_ = _loc8_;
            _loc21_ = param3.a[_loc22_] + _loc15_.am(0,_loc12_,param3,_loc9_,0,_loc16_);
            param3.a[_loc22_] = _loc21_;
            if(_loc21_ < _loc12_)
            {
               _loc15_.dlShiftTo(_loc9_,_loc13_);
               param3.subTo(_loc13_,param3);
               while(true, true)
               {
                  _loc12_--;
                  if(param3.a[_loc8_] >= _loc12_)
                  {
                     break;
                  }
                  param3.subTo(_loc13_,param3);
               }
               continue;
            }
         }
         if(param2 != null)
         {
            param3.drShiftTo(_loc16_,param2);
            if(_loc19_ != _loc7_)
            {
               ZERO.subTo(param2,param2);
            }
         }
         param3.t = _loc16_;
         param3.clamp();
         if(_loc4_ > 0)
         {
            param3.rShiftTo(_loc4_,param3);
         }
         if(_loc19_ < 0)
         {
            ZERO.subTo(param3,param3);
         }
      }
      
      bi_internal function invDigit() : int
      {
         if(t < 1)
         {
            return 0;
         }
         var _loc1_:int = a[0];
         if((_loc1_ & 1) == 0)
         {
            return 0;
         }
         var _loc2_:* = _loc1_ & 3;
         _loc2_ = _loc2_ * (2 - (_loc1_ & 15) * _loc2_) & 15;
         _loc2_ = _loc2_ * (2 - (_loc1_ & 255) * _loc2_) & 255;
         _loc2_ = _loc2_ * (2 - ((_loc1_ & 65535) * _loc2_ & 65535)) & 65535;
         _loc2_ = int(_loc2_ * (2 - _loc1_ * _loc2_ % 1073741824) % 1073741824);
         return _loc2_ > 0?1073741824 - _loc2_:Number(-_loc2_);
      }
      
      bi_internal function isEven() : Boolean
      {
         return (t > 0?a[0] & 1:int(s)) == 0;
      }
      
      bi_internal function exp(param1:int, param2:IReduction) : BigInteger
      {
         var _loc5_:* = null;
         if(param1 > 4294967295 || param1 < 1)
         {
            return ONE;
         }
         var _loc4_:* = nbi();
         var _loc3_:* = nbi();
         var _loc6_:BigInteger = param2.convert(this);
         var _loc7_:int = nbits(param1) - 1;
         _loc6_.copyTo(_loc4_);
         while(true, true)
         {
            _loc7_--;
            if(_loc7_ < 0)
            {
               break;
            }
            param2.sqrTo(_loc4_,_loc3_);
            if((param1 & 1 << _loc7_) > 0)
            {
               param2.mulTo(_loc3_,_loc6_,_loc4_);
            }
            else
            {
               _loc5_ = _loc4_;
               _loc4_ = _loc3_;
               _loc3_ = _loc5_;
            }
         }
         return param2.revert(_loc4_);
      }
      
      bi_internal function intAt(param1:String, param2:int) : int
      {
         return parseInt(param1.charAt(param2),36);
      }
      
      protected function nbi() : *
      {
         return new BigInteger();
      }
      
      public function clone() : BigInteger
      {
         var _loc1_:BigInteger = new BigInteger();
         this.copyTo(_loc1_);
         return _loc1_;
      }
      
      public function intValue() : int
      {
         if(s < 0)
         {
            if(t == 1)
            {
               return a[0] - 1073741824;
            }
            if(t == 0)
            {
               return -1;
            }
         }
         else
         {
            if(t == 1)
            {
               return a[0];
            }
            if(t == 0)
            {
               return 0;
            }
         }
         return (a[1] & 3) << 30 | a[0];
      }
      
      public function byteValue() : int
      {
         return t == 0?s:a[0] << 24 >> 24;
      }
      
      public function shortValue() : int
      {
         return t == 0?s:a[0] << 16 >> 16;
      }
      
      protected function chunkSize(param1:Number) : int
      {
         return Math.floor(0.693147180559945 * 30 / Math.log(param1));
      }
      
      public function sigNum() : int
      {
         if(s < 0)
         {
            return -1;
         }
         if(t <= 0 || t == 1 && a[0] <= 0)
         {
            return 0;
         }
         return 1;
      }
      
      protected function toRadix(param1:uint = 10) : String
      {
         if(sigNum() == 0 || param1 < 2 || param1 > 32)
         {
            return "0";
         }
         var _loc2_:int = chunkSize(param1);
         var _loc3_:Number = Math.pow(param1,_loc2_);
         var _loc5_:BigInteger = nbv(_loc3_);
         var _loc6_:BigInteger = nbi();
         var _loc7_:BigInteger = nbi();
         var _loc4_:String = "";
         divRemTo(_loc5_,_loc6_,_loc7_);
         while(_loc6_.sigNum() > 0)
         {
            _loc4_ = (_loc3_ + _loc7_.intValue()).toString(param1).substr(1) + _loc4_;
            _loc6_.divRemTo(_loc5_,_loc6_,_loc7_);
         }
         return _loc7_.intValue().toString(param1) + _loc4_;
      }
      
      protected function fromRadix(param1:String, param2:int = 10) : void
      {
         var _loc7_:int = 0;
         var _loc6_:int = 0;
         fromInt(0);
         var _loc3_:int = chunkSize(param2);
         var _loc4_:Number = Math.pow(param2,_loc3_);
         var _loc9_:Boolean = false;
         var _loc8_:int = 0;
         var _loc5_:int = 0;
         _loc7_ = 0;
         while(_loc7_ < param1.length)
         {
            _loc6_ = intAt(param1,_loc7_);
            if(_loc6_ < 0)
            {
               if(param1.charAt(_loc7_) == "-" && sigNum() == 0)
               {
                  _loc9_ = true;
               }
            }
            else
            {
               _loc5_ = param2 * _loc5_ + _loc6_;
               _loc8_++;
               if(_loc8_ >= _loc3_)
               {
                  dMultiply(_loc4_);
                  dAddOffset(_loc5_,0);
                  _loc8_ = 0;
                  _loc5_ = 0;
               }
            }
            _loc7_++;
         }
         if(_loc8_ > 0)
         {
            dMultiply(Math.pow(param2,_loc8_));
            dAddOffset(_loc5_,0);
         }
         if(_loc9_)
         {
            BigInteger.ZERO.subTo(this,this);
         }
      }
      
      public function toByteArray() : ByteArray
      {
         var _loc3_:* = 0;
         var _loc4_:int = t;
         var _loc2_:ByteArray = new ByteArray();
         _loc2_[0] = s;
         var _loc1_:int = 30 - _loc4_ * 30 % 8;
         var _loc5_:int = 0;
         _loc4_--;
         if(_loc4_ > 0)
         {
            if(_loc1_ < 30 && a[_loc4_] >> _loc1_ != (s & 1073741823) >> _loc1_)
            {
               _loc5_++;
               _loc2_[_loc5_] = _loc3_ | s << 30 - _loc1_;
            }
            while(_loc4_ >= 0)
            {
               if(_loc1_ < 8)
               {
                  _loc3_ = (a[_loc4_] & (1 << _loc1_) - 1) << 8 - _loc1_;
                  _loc4_--;
                  _loc1_ = _loc1_ + (30 - 8);
                  _loc3_ = _loc3_ | a[_loc4_] >> _loc1_ + (30 - 8);
               }
               else
               {
                  _loc1_ = _loc1_ - 8;
                  _loc3_ = a[_loc4_] >> _loc1_ - 8 & 255;
                  if(_loc1_ <= 0)
                  {
                     _loc1_ = _loc1_ + 30;
                     _loc4_--;
                  }
               }
               if((_loc3_ & 128) != 0)
               {
                  _loc3_ = _loc3_ | -256;
               }
               if(_loc5_ == 0 && (s & 128) != (_loc3_ & 128))
               {
                  _loc5_++;
               }
               if(_loc5_ > 0 || _loc3_ != s)
               {
                  _loc5_++;
                  _loc2_[_loc5_] = _loc3_;
               }
            }
         }
         return _loc2_;
      }
      
      public function equals(param1:BigInteger) : Boolean
      {
         return compareTo(param1) == 0;
      }
      
      public function min(param1:BigInteger) : BigInteger
      {
         return compareTo(param1) < 0?this:param1;
      }
      
      public function max(param1:BigInteger) : BigInteger
      {
         return compareTo(param1) > 0?this:param1;
      }
      
      protected function bitwiseTo(param1:BigInteger, param2:Function, param3:BigInteger) : void
      {
         var _loc5_:* = 0;
         var _loc4_:* = 0;
         var _loc6_:int = Math.min(param1.t,t);
         _loc5_ = 0;
         while(_loc5_ < _loc6_)
         {
            param3.a[_loc5_] = param2(this.a[_loc5_],param1.a[_loc5_]);
            _loc5_++;
         }
         if(param1.t < t)
         {
            _loc4_ = param1.s & 1073741823;
            _loc5_ = _loc6_;
            while(_loc5_ < t)
            {
               param3.a[_loc5_] = param2(this.a[_loc5_],_loc4_);
               _loc5_++;
            }
            param3.t = t;
         }
         else
         {
            _loc4_ = s & 1073741823;
            _loc5_ = _loc6_;
            while(_loc5_ < param1.t)
            {
               param3.a[_loc5_] = param2(_loc4_,param1.a[_loc5_]);
               _loc5_++;
            }
            param3.t = param1.t;
         }
         param3.s = param2(s,param1.s);
         param3.clamp();
      }
      
      private function op_and(param1:int, param2:int) : int
      {
         return param1 & param2;
      }
      
      public function and(param1:BigInteger) : BigInteger
      {
         var _loc2_:BigInteger = new BigInteger();
         bitwiseTo(param1,op_and,_loc2_);
         return _loc2_;
      }
      
      private function op_or(param1:int, param2:int) : int
      {
         return param1 | param2;
      }
      
      public function or(param1:BigInteger) : BigInteger
      {
         var _loc2_:BigInteger = new BigInteger();
         bitwiseTo(param1,op_or,_loc2_);
         return _loc2_;
      }
      
      private function op_xor(param1:int, param2:int) : int
      {
         return param1 ^ param2;
      }
      
      public function xor(param1:BigInteger) : BigInteger
      {
         var _loc2_:BigInteger = new BigInteger();
         bitwiseTo(param1,op_xor,_loc2_);
         return _loc2_;
      }
      
      private function op_andnot(param1:int, param2:int) : int
      {
         return param1 & ~param2;
      }
      
      public function andNot(param1:BigInteger) : BigInteger
      {
         var _loc2_:BigInteger = new BigInteger();
         bitwiseTo(param1,op_andnot,_loc2_);
         return _loc2_;
      }
      
      public function not() : BigInteger
      {
         var _loc2_:int = 0;
         var _loc1_:BigInteger = new BigInteger();
         _loc2_ = 0;
         while(_loc2_ < t)
         {
            _loc1_[_loc2_] = 1073741823 & ~a[_loc2_];
            _loc2_++;
         }
         _loc1_.t = t;
         _loc1_.s = ~s;
         return _loc1_;
      }
      
      public function shiftLeft(param1:int) : BigInteger
      {
         var _loc2_:BigInteger = new BigInteger();
         if(param1 < 0)
         {
            rShiftTo(-param1,_loc2_);
         }
         else
         {
            lShiftTo(param1,_loc2_);
         }
         return _loc2_;
      }
      
      public function shiftRight(param1:int) : BigInteger
      {
         var _loc2_:BigInteger = new BigInteger();
         if(param1 < 0)
         {
            lShiftTo(-param1,_loc2_);
         }
         else
         {
            rShiftTo(param1,_loc2_);
         }
         return _loc2_;
      }
      
      private function lbit(param1:int) : int
      {
         if(param1 == 0)
         {
            return -1;
         }
         var _loc2_:int = 0;
         if((param1 & 65535) == 0)
         {
            param1 = param1 >> 16;
            _loc2_ = _loc2_ + 16;
         }
         if((param1 & 255) == 0)
         {
            param1 = param1 >> 8;
            _loc2_ = _loc2_ + 8;
         }
         if((param1 & 15) == 0)
         {
            param1 = param1 >> 4;
            _loc2_ = _loc2_ + 4;
         }
         if((param1 & 3) == 0)
         {
            param1 = param1 >> 2;
            _loc2_ = _loc2_ + 2;
         }
         if((param1 & 1) == 0)
         {
            _loc2_++;
         }
         return _loc2_;
      }
      
      public function getLowestSetBit() : int
      {
         var _loc1_:int = 0;
         _loc1_ = 0;
         while(_loc1_ < t)
         {
            if(a[_loc1_] != 0)
            {
               return _loc1_ * 30 + lbit(a[_loc1_]);
            }
            _loc1_++;
         }
         if(s < 0)
         {
            return t * 30;
         }
         return -1;
      }
      
      private function cbit(param1:int) : int
      {
         var _loc2_:uint = 0;
         while(param1 != 0)
         {
            param1 = param1 & param1 - 1;
            _loc2_++;
         }
         return _loc2_;
      }
      
      public function bitCount() : int
      {
         var _loc3_:int = 0;
         var _loc1_:int = 0;
         var _loc2_:* = s & 1073741823;
         _loc3_ = 0;
         while(_loc3_ < t)
         {
            _loc1_ = _loc1_ + cbit(a[_loc3_] ^ _loc2_);
            _loc3_++;
         }
         return _loc1_;
      }
      
      public function testBit(param1:int) : Boolean
      {
         var _loc2_:int = Math.floor(param1 / 30);
         if(_loc2_ >= t)
         {
            return s != 0;
         }
         return (a[_loc2_] & 1 << param1 % 30) != 0;
      }
      
      protected function changeBit(param1:int, param2:Function) : BigInteger
      {
         var _loc3_:BigInteger = BigInteger.ONE.shiftLeft(param1);
         bitwiseTo(_loc3_,param2,_loc3_);
         return _loc3_;
      }
      
      public function setBit(param1:int) : BigInteger
      {
         return changeBit(param1,op_or);
      }
      
      public function clearBit(param1:int) : BigInteger
      {
         return changeBit(param1,op_andnot);
      }
      
      public function flipBit(param1:int) : BigInteger
      {
         return changeBit(param1,op_xor);
      }
      
      protected function addTo(param1:BigInteger, param2:BigInteger) : void
      {
         var _loc4_:int = 0;
         var _loc3_:* = 0;
         var _loc5_:int = Math.min(param1.t,t);
         while(_loc4_ < _loc5_)
         {
            _loc3_ = int(_loc3_ + (this.a[_loc4_] + param1.a[_loc4_]));
            _loc4_++;
            param2.a[_loc4_] = _loc3_ & 1073741823;
            _loc3_ = _loc3_ >> 30;
         }
         if(param1.t < t)
         {
            _loc3_ = int(_loc3_ + param1.s);
            while(_loc4_ < t)
            {
               _loc3_ = int(_loc3_ + this.a[_loc4_]);
               _loc4_++;
               param2.a[_loc4_] = _loc3_ & 1073741823;
               _loc3_ = _loc3_ >> 30;
            }
            _loc3_ = int(_loc3_ + s);
         }
         else
         {
            _loc3_ = int(_loc3_ + s);
            while(_loc4_ < param1.t)
            {
               _loc3_ = int(_loc3_ + param1.a[_loc4_]);
               _loc4_++;
               param2.a[_loc4_] = _loc3_ & 1073741823;
               _loc3_ = _loc3_ >> 30;
            }
            _loc3_ = int(_loc3_ + param1.s);
         }
         param2.s = _loc3_ < 0?-1:0;
         if(_loc3_ > 0)
         {
            _loc4_++;
            param2.a[_loc4_] = _loc3_;
         }
         else if(_loc3_ < -1)
         {
            _loc4_++;
            param2.a[_loc4_] = 1073741824 + _loc3_;
         }
         param2.t = _loc4_;
         param2.clamp();
      }
      
      public function add(param1:BigInteger) : BigInteger
      {
         var _loc2_:BigInteger = new BigInteger();
         addTo(param1,_loc2_);
         return _loc2_;
      }
      
      public function subtract(param1:BigInteger) : BigInteger
      {
         var _loc2_:BigInteger = new BigInteger();
         subTo(param1,_loc2_);
         return _loc2_;
      }
      
      public function multiply(param1:BigInteger) : BigInteger
      {
         var _loc2_:BigInteger = new BigInteger();
         multiplyTo(param1,_loc2_);
         return _loc2_;
      }
      
      public function divide(param1:BigInteger) : BigInteger
      {
         var _loc2_:BigInteger = new BigInteger();
         divRemTo(param1,_loc2_,null);
         return _loc2_;
      }
      
      public function remainder(param1:BigInteger) : BigInteger
      {
         var _loc2_:BigInteger = new BigInteger();
         divRemTo(param1,null,_loc2_);
         return _loc2_;
      }
      
      public function divideAndRemainder(param1:BigInteger) : Array
      {
         var _loc2_:BigInteger = new BigInteger();
         var _loc3_:BigInteger = new BigInteger();
         divRemTo(param1,_loc2_,_loc3_);
         return [_loc2_,_loc3_];
      }
      
      bi_internal function dMultiply(param1:int) : void
      {
         a[t] = am(0,param1 - 1,this,0,0,t);
         t = t + 1;
         clamp();
      }
      
      bi_internal function dAddOffset(param1:int, param2:int) : void
      {
         while(t <= param2)
         {
            t = Number(t) + 1;
            a[Number(t)] = 0;
         }
         var _loc3_:* = param2;
         var _loc4_:* = a[_loc3_] + param1;
         a[_loc3_] = _loc4_;
         while(a[param2] >= 1073741824)
         {
            _loc4_ = param2;
            _loc3_ = a[_loc4_] - 1073741824;
            a[_loc4_] = _loc3_;
            param2++;
            if(param2 >= t)
            {
               t = Number(t) + 1;
               a[Number(t)] = 0;
            }
            _loc3_ = a;
            _loc4_ = param2;
            var _loc5_:* = _loc3_[_loc4_] + 1;
            _loc3_[_loc4_] = _loc5_;
         }
      }
      
      public function pow(param1:int) : BigInteger
      {
         return exp(param1,new NullReduction());
      }
      
      bi_internal function multiplyLowerTo(param1:BigInteger, param2:int, param3:BigInteger) : void
      {
         var _loc5_:int = 0;
         var _loc4_:int = Math.min(t + param1.t,param2);
         param3.s = 0;
         param3.t = _loc4_;
         while(_loc4_ > 0)
         {
            _loc4_--;
            param3.a[_loc4_] = 0;
         }
         _loc5_ = param3.t - t;
         while(_loc4_ < _loc5_)
         {
            param3.a[_loc4_ + t] = am(0,param1.a[_loc4_],param3,_loc4_,0,t);
            _loc4_++;
         }
         _loc5_ = Math.min(param1.t,param2);
         while(_loc4_ < _loc5_)
         {
            am(0,param1.a[_loc4_],param3,_loc4_,0,param2 - _loc4_);
            _loc4_++;
         }
         param3.clamp();
      }
      
      bi_internal function multiplyUpperTo(param1:BigInteger, param2:int, param3:BigInteger) : void
      {
         param2--;
         var _loc5_:* = t + param1.t - param2;
         param3.t = _loc5_;
         var _loc4_:* = _loc5_;
         param3.s = 0;
         while(true, true)
         {
            _loc4_--;
            if(_loc4_ < 0)
            {
               break;
            }
            param3.a[_loc4_] = 0;
         }
         _loc4_ = int(Math.max(param2 - t,0));
         while(_loc4_ < param1.t)
         {
            param3.a[t + _loc4_ - param2] = am(param2 - _loc4_,param1.a[_loc4_],param3,0,0,t + _loc4_ - param2);
            _loc4_++;
         }
         param3.clamp();
         param3.drShiftTo(1,param3);
      }
      
      public function modPow(param1:BigInteger, param2:BigInteger) : BigInteger
      {
         var _loc10_:int = 0;
         var _loc16_:* = null;
         var _loc11_:* = null;
         var _loc15_:* = 0;
         var _loc14_:* = null;
         var _loc8_:int = param1.bitLength();
         var _loc13_:* = nbv(1);
         if(_loc8_ <= 0)
         {
            return _loc13_;
         }
         if(_loc8_ < 18)
         {
            _loc10_ = 1;
         }
         else if(_loc8_ < 48)
         {
            _loc10_ = 3;
         }
         else if(_loc8_ < 144)
         {
            _loc10_ = 4;
         }
         else if(_loc8_ < 768)
         {
            _loc10_ = 5;
         }
         else
         {
            _loc10_ = 6;
         }
         if(_loc8_ < 8)
         {
            _loc16_ = new ClassicReduction(param2);
         }
         else if(param2.isEven())
         {
            _loc16_ = new BarrettReduction(param2);
         }
         else
         {
            _loc16_ = new MontgomeryReduction(param2);
         }
         var _loc7_:Array = [];
         var _loc12_:* = 3;
         var _loc5_:int = _loc10_ - 1;
         var _loc4_:int = (1 << _loc10_) - 1;
         _loc7_[1] = _loc16_.convert(this);
         if(_loc10_ > 1)
         {
            _loc11_ = new BigInteger();
            _loc16_.sqrTo(_loc7_[1],_loc11_);
            while(_loc12_ <= _loc4_)
            {
               _loc7_[_loc12_] = new BigInteger();
               _loc16_.mulTo(_loc11_,_loc7_[_loc12_ - 2],_loc7_[_loc12_]);
               _loc12_ = int(_loc12_ + 2);
            }
         }
         var _loc9_:int = param1.t - 1;
         var _loc6_:Boolean = true;
         var _loc3_:* = new BigInteger();
         _loc8_ = nbits(param1.a[_loc9_]) - 1;
         while(_loc9_ >= 0)
         {
            if(_loc8_ >= _loc5_)
            {
               _loc15_ = param1.a[_loc9_] >> _loc8_ - _loc5_ & _loc4_;
            }
            else
            {
               _loc15_ = (param1.a[_loc9_] & (1 << _loc8_ + 1) - 1) << _loc5_ - _loc8_;
               if(_loc9_ > 0)
               {
                  _loc15_ = _loc15_ | param1.a[_loc9_ - 1] >> 30 + _loc8_ - _loc5_;
               }
            }
            _loc12_ = _loc10_;
            while((_loc15_ & 1) == 0)
            {
               _loc15_ = _loc15_ >> 1;
               _loc12_--;
            }
            _loc8_ = _loc8_ - _loc12_;
            if(_loc8_ - _loc12_ < 0)
            {
               _loc8_ = _loc8_ + 30;
               _loc9_--;
            }
            if(_loc6_)
            {
               _loc7_[_loc15_].copyTo(_loc13_);
               _loc6_ = false;
            }
            else
            {
               while(_loc12_ > 1)
               {
                  _loc16_.sqrTo(_loc13_,_loc3_);
                  _loc16_.sqrTo(_loc3_,_loc13_);
                  _loc12_ = int(_loc12_ - 2);
               }
               if(_loc12_ > 0)
               {
                  _loc16_.sqrTo(_loc13_,_loc3_);
               }
               else
               {
                  _loc14_ = _loc13_;
                  _loc13_ = _loc3_;
                  _loc3_ = _loc14_;
               }
               _loc16_.mulTo(_loc3_,_loc7_[_loc15_],_loc13_);
            }
            while(_loc9_ >= 0 && (param1.a[_loc9_] & 1 << _loc8_) == 0)
            {
               _loc16_.sqrTo(_loc13_,_loc3_);
               _loc14_ = _loc13_;
               _loc13_ = _loc3_;
               _loc3_ = _loc14_;
               _loc8_--;
               if(_loc8_ < 0)
               {
                  _loc8_ = 30 - 1;
                  _loc9_--;
               }
            }
         }
         return _loc16_.revert(_loc13_);
      }
      
      public function gcd(param1:BigInteger) : BigInteger
      {
         var _loc2_:* = null;
         var _loc4_:* = s < 0?negate():clone();
         var _loc5_:* = param1.s < 0?param1.negate():param1.clone();
         if(_loc4_.compareTo(_loc5_) < 0)
         {
            _loc2_ = _loc4_;
            _loc4_ = _loc5_;
            _loc5_ = _loc2_;
         }
         var _loc6_:int = _loc4_.getLowestSetBit();
         var _loc3_:* = int(_loc5_.getLowestSetBit());
         if(_loc3_ < 0)
         {
            return _loc4_;
         }
         if(_loc6_ < _loc3_)
         {
            _loc3_ = _loc6_;
         }
         if(_loc3_ > 0)
         {
            _loc4_.rShiftTo(_loc3_,_loc4_);
            _loc5_.rShiftTo(_loc3_,_loc5_);
         }
         while(_loc4_.sigNum() > 0)
         {
            _loc6_ = _loc4_.getLowestSetBit();
            if(_loc4_.getLowestSetBit() > 0)
            {
               _loc4_.rShiftTo(_loc6_,_loc4_);
            }
            _loc6_ = _loc5_.getLowestSetBit();
            if(_loc5_.getLowestSetBit() > 0)
            {
               _loc5_.rShiftTo(_loc6_,_loc5_);
            }
            if(_loc4_.compareTo(_loc5_) >= 0)
            {
               _loc4_.subTo(_loc5_,_loc4_);
               _loc4_.rShiftTo(1,_loc4_);
            }
            else
            {
               _loc5_.subTo(_loc4_,_loc5_);
               _loc5_.rShiftTo(1,_loc5_);
            }
         }
         if(_loc3_ > 0)
         {
            _loc5_.lShiftTo(_loc3_,_loc5_);
         }
         return _loc5_;
      }
      
      protected function modInt(param1:int) : int
      {
         var _loc4_:int = 0;
         if(param1 <= 0)
         {
            return 0;
         }
         var _loc3_:int = 1073741824 % param1;
         var _loc2_:int = s < 0?param1 - 1:0;
         if(t > 0)
         {
            if(_loc3_ == 0)
            {
               _loc2_ = a[0] % param1;
            }
            else
            {
               _loc4_ = t - 1;
               while(_loc4_ >= 0)
               {
                  _loc2_ = (_loc3_ * _loc2_ + a[_loc4_]) % param1;
                  _loc4_--;
               }
            }
         }
         return _loc2_;
      }
      
      public function modInverse(param1:BigInteger) : BigInteger
      {
         var _loc3_:Boolean = param1.isEven();
         if(isEven() && _loc3_ || param1.sigNum() == 0)
         {
            return BigInteger.ZERO;
         }
         var _loc7_:BigInteger = param1.clone();
         var _loc8_:BigInteger = clone();
         var _loc2_:BigInteger = nbv(1);
         var _loc4_:BigInteger = nbv(0);
         var _loc5_:BigInteger = nbv(0);
         var _loc6_:BigInteger = nbv(1);
         while(_loc7_.sigNum() != 0)
         {
            while(_loc7_.isEven())
            {
               _loc7_.rShiftTo(1,_loc7_);
               if(_loc3_)
               {
                  if(!_loc2_.isEven() || !_loc4_.isEven())
                  {
                     _loc2_.addTo(this,_loc2_);
                     _loc4_.subTo(param1,_loc4_);
                  }
                  _loc2_.rShiftTo(1,_loc2_);
               }
               else if(!_loc4_.isEven())
               {
                  _loc4_.subTo(param1,_loc4_);
               }
               _loc4_.rShiftTo(1,_loc4_);
            }
            while(_loc8_.isEven())
            {
               _loc8_.rShiftTo(1,_loc8_);
               if(_loc3_)
               {
                  if(!_loc5_.isEven() || !_loc6_.isEven())
                  {
                     _loc5_.addTo(this,_loc5_);
                     _loc6_.subTo(param1,_loc6_);
                  }
                  _loc5_.rShiftTo(1,_loc5_);
               }
               else if(!_loc6_.isEven())
               {
                  _loc6_.subTo(param1,_loc6_);
               }
               _loc6_.rShiftTo(1,_loc6_);
            }
            if(_loc7_.compareTo(_loc8_) >= 0)
            {
               _loc7_.subTo(_loc8_,_loc7_);
               if(_loc3_)
               {
                  _loc2_.subTo(_loc5_,_loc2_);
               }
               _loc4_.subTo(_loc6_,_loc4_);
            }
            else
            {
               _loc8_.subTo(_loc7_,_loc8_);
               if(_loc3_)
               {
                  _loc5_.subTo(_loc2_,_loc5_);
               }
               _loc6_.subTo(_loc4_,_loc6_);
            }
         }
         if(_loc8_.compareTo(BigInteger.ONE) != 0)
         {
            return BigInteger.ZERO;
         }
         if(_loc6_.compareTo(param1) >= 0)
         {
            return _loc6_.subtract(param1);
         }
         if(_loc6_.sigNum() < 0)
         {
            _loc6_.addTo(param1,_loc6_);
            if(_loc6_.sigNum() < 0)
            {
               return _loc6_.add(param1);
            }
            return _loc6_;
         }
         return _loc6_;
      }
      
      public function isProbablePrime(param1:int) : Boolean
      {
         var _loc3_:int = 0;
         var _loc5_:int = 0;
         var _loc4_:int = 0;
         var _loc2_:BigInteger = abs();
         if(_loc2_.t == 1 && _loc2_.a[0] <= lowprimes[lowprimes.length - 1])
         {
            _loc3_ = 0;
            while(_loc3_ < lowprimes.length)
            {
               if(_loc2_[0] == lowprimes[_loc3_])
               {
                  return true;
               }
               _loc3_++;
            }
            return false;
         }
         if(_loc2_.isEven())
         {
            return false;
         }
         _loc3_ = 1;
         while(_loc3_ < lowprimes.length)
         {
            _loc5_ = lowprimes[_loc3_];
            _loc4_ = _loc3_ + 1;
            while(_loc4_ < lowprimes.length && _loc5_ < lplim)
            {
               _loc4_++;
               _loc5_ = _loc5_ * lowprimes[_loc4_];
            }
            _loc5_ = _loc2_.modInt(_loc5_);
            while(_loc3_ < _loc4_)
            {
               _loc3_++;
               if(_loc5_ % lowprimes[_loc3_] == 0)
               {
                  return false;
               }
            }
         }
         return _loc2_.millerRabin(param1);
      }
      
      protected function millerRabin(param1:int) : Boolean
      {
         var _loc5_:int = 0;
         var _loc6_:* = null;
         var _loc7_:int = 0;
         var _loc4_:BigInteger = subtract(BigInteger.ONE);
         var _loc8_:int = _loc4_.getLowestSetBit();
         if(_loc8_ <= 0)
         {
            return false;
         }
         var _loc3_:BigInteger = _loc4_.shiftRight(_loc8_);
         param1 = param1 + 1 >> 1;
         if(param1 > lowprimes.length)
         {
            param1 = int(lowprimes.length);
         }
         var _loc2_:BigInteger = new BigInteger();
         _loc5_ = 0;
         while(_loc5_ < param1)
         {
            _loc2_.fromInt(lowprimes[_loc5_]);
            _loc6_ = _loc2_.modPow(_loc3_,this);
            if(_loc6_.compareTo(BigInteger.ONE) != 0 && _loc6_.compareTo(_loc4_) != 0)
            {
               _loc7_ = 1;
               while(true, true)
               {
                  _loc7_++;
                  if(!(_loc7_ < _loc8_ && _loc6_.compareTo(_loc4_) != 0))
                  {
                     break;
                  }
                  _loc6_ = _loc6_.modPowInt(2,this);
                  if(_loc6_.compareTo(BigInteger.ONE) == 0)
                  {
                     return false;
                  }
               }
               if(_loc6_.compareTo(_loc4_) != 0)
               {
                  return false;
               }
            }
            _loc5_++;
         }
         return true;
      }
      
      public function primify(param1:int, param2:int) : void
      {
         if(!testBit(param1 - 1))
         {
            bitwiseTo(BigInteger.ONE.shiftLeft(param1 - 1),op_or,this);
         }
         if(isEven())
         {
            dAddOffset(1,0);
         }
         while(!isProbablePrime(param2))
         {
            dAddOffset(2,0);
            while(bitLength() > param1)
            {
               subTo(BigInteger.ONE.shiftLeft(param1 - 1),this);
            }
         }
      }
   }
}
