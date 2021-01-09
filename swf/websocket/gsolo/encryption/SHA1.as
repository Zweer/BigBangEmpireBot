package websocket.gsolo.encryption
{
   public class SHA1
   {
      
      public static const HEX_FORMAT_LOWERCASE:uint = 0;
      
      public static const HEX_FORMAT_UPPERCASE:uint = 1;
      
      public static const BASE64_PAD_CHARACTER_DEFAULT_COMPLIANCE:String = "";
      
      public static const BASE64_PAD_CHARACTER_RFC_COMPLIANCE:String = "=";
      
      public static const BITS_PER_CHAR_ASCII:uint = 8;
      
      public static const BITS_PER_CHAR_UNICODE:uint = 8;
      
      public static var hexcase:uint = 0;
      
      public static var b64pad:String = "";
      
      public static var chrsz:uint = 8;
       
      
      public function SHA1()
      {
         super();
      }
      
      public static function encrypt(param1:String) : String
      {
         return hex_sha1(param1);
      }
      
      public static function hex_sha1(param1:String) : String
      {
         return binb2hex(core_sha1(str2binb(param1),param1.length * chrsz));
      }
      
      public static function b64_sha1(param1:String) : String
      {
         return binb2b64(core_sha1(str2binb(param1),param1.length * chrsz));
      }
      
      public static function str_sha1(param1:String) : String
      {
         return binb2str(core_sha1(str2binb(param1),param1.length * chrsz));
      }
      
      public static function hex_hmac_sha1(param1:String, param2:String) : String
      {
         return binb2hex(core_hmac_sha1(param1,param2));
      }
      
      public static function b64_hmac_sha1(param1:String, param2:String) : String
      {
         return binb2b64(core_hmac_sha1(param1,param2));
      }
      
      public static function str_hmac_sha1(param1:String, param2:String) : String
      {
         return binb2str(core_hmac_sha1(param1,param2));
      }
      
      public static function sha1_vm_test() : Boolean
      {
         return hex_sha1("abc") == "a9993e364706816aba3e25717850c26c9cd0d89d";
      }
      
      public static function core_sha1(param1:Array, param2:Number) : Array
      {
         var _loc9_:* = NaN;
         var _loc13_:* = NaN;
         var _loc14_:* = NaN;
         var _loc8_:* = NaN;
         var _loc10_:* = NaN;
         var _loc11_:* = NaN;
         var _loc12_:* = NaN;
         var _loc15_:Number = NaN;
         var _loc17_:* = param2 >> 5;
         var _loc18_:* = param1[_loc17_] | 128 << 24 - param2 % 32;
         param1[_loc17_] = _loc18_;
         param1[(param2 + 64 >> 9 << 4) + 15] = param2;
         var _loc16_:Array = new Array(80);
         var _loc3_:* = 1732584193;
         var _loc4_:* = -271733879;
         var _loc5_:* = -1732584194;
         var _loc6_:* = 271733878;
         var _loc7_:* = -1009589776;
         _loc9_ = 0;
         while(_loc9_ < param1.length)
         {
            _loc13_ = _loc3_;
            _loc14_ = _loc4_;
            _loc8_ = _loc5_;
            _loc10_ = _loc6_;
            _loc11_ = _loc7_;
            _loc12_ = 0;
            while(_loc12_ < 80)
            {
               if(_loc12_ < 16)
               {
                  _loc16_[_loc12_] = param1[_loc9_ + _loc12_];
               }
               else
               {
                  _loc16_[_loc12_] = rol(_loc16_[_loc12_ - 3] ^ _loc16_[_loc12_ - 8] ^ _loc16_[_loc12_ - 14] ^ _loc16_[_loc12_ - 16],1);
               }
               _loc15_ = safe_add(safe_add(rol(_loc3_,5),sha1_ft(_loc12_,_loc4_,_loc5_,_loc6_)),safe_add(safe_add(_loc7_,_loc16_[_loc12_]),sha1_kt(_loc12_)));
               _loc7_ = _loc6_;
               _loc6_ = _loc5_;
               _loc5_ = Number(rol(_loc4_,30));
               _loc4_ = _loc3_;
               _loc3_ = _loc15_;
               _loc12_++;
            }
            _loc3_ = Number(safe_add(_loc3_,_loc13_));
            _loc4_ = Number(safe_add(_loc4_,_loc14_));
            _loc5_ = Number(safe_add(_loc5_,_loc8_));
            _loc6_ = Number(safe_add(_loc6_,_loc10_));
            _loc7_ = Number(safe_add(_loc7_,_loc11_));
            _loc9_ = Number(_loc9_ + 16);
         }
         return [_loc3_,_loc4_,_loc5_,_loc6_,_loc7_];
      }
      
      public static function sha1_ft(param1:Number, param2:Number, param3:Number, param4:Number) : Number
      {
         if(param1 < 20)
         {
            return param2 & param3 | ~param2 & param4;
         }
         if(param1 < 40)
         {
            return param2 ^ param3 ^ param4;
         }
         if(param1 < 60)
         {
            return param2 & param3 | param2 & param4 | param3 & param4;
         }
         return param2 ^ param3 ^ param4;
      }
      
      public static function sha1_kt(param1:Number) : Number
      {
         return param1 < 20?1518500249:Number(param1 < 40?1859775393:Number(param1 < 60?-1894007588:-899497514));
      }
      
      public static function core_hmac_sha1(param1:String, param2:String) : Array
      {
         var _loc5_:* = NaN;
         var _loc4_:Array = str2binb(param1);
         if(_loc4_.length > 16)
         {
            _loc4_ = core_sha1(_loc4_,param1.length * chrsz);
         }
         var _loc6_:Array = new Array(16);
         var _loc3_:Array = new Array(16);
         _loc5_ = 0;
         while(_loc5_ < 16)
         {
            _loc6_[_loc5_] = _loc4_[_loc5_] ^ 909522486;
            _loc3_[_loc5_] = _loc4_[_loc5_] ^ 1549556828;
            _loc5_++;
         }
         var _loc7_:Array = core_sha1(_loc6_.concat(str2binb(param2)),512 + param2.length * chrsz);
         return core_sha1(_loc3_.concat(_loc7_),672);
      }
      
      public static function safe_add(param1:Number, param2:Number) : Number
      {
         var _loc4_:Number = (param1 & 65535) + (param2 & 65535);
         var _loc3_:Number = (param1 >> 16) + (param2 >> 16) + (_loc4_ >> 16);
         return _loc3_ << 16 | _loc4_ & 65535;
      }
      
      public static function rol(param1:Number, param2:Number) : Number
      {
         return param1 << param2 | param1 >>> 32 - param2;
      }
      
      public static function str2binb(param1:String) : Array
      {
         var _loc3_:* = NaN;
         var _loc2_:Array = [];
         var _loc4_:Number = (1 << chrsz) - 1;
         _loc3_ = 0;
         while(_loc3_ < param1.length * chrsz)
         {
            var _loc5_:* = _loc3_ >> 5;
            var _loc6_:* = _loc2_[_loc5_] | (param1.charCodeAt(_loc3_ / chrsz) & _loc4_) << 32 - chrsz - _loc3_ % 32;
            _loc2_[_loc5_] = _loc6_;
            _loc3_ = Number(_loc3_ + chrsz);
         }
         return _loc2_;
      }
      
      public static function binb2str(param1:Array) : String
      {
         var _loc3_:* = NaN;
         var _loc2_:String = "";
         var _loc4_:Number = (1 << chrsz) - 1;
         _loc3_ = 0;
         while(_loc3_ < param1.length * 32)
         {
            _loc2_ = _loc2_ + String.fromCharCode(param1[_loc3_ >> 5] >>> 32 - chrsz - _loc3_ % 32 & _loc4_);
            _loc3_ = Number(_loc3_ + chrsz);
         }
         return _loc2_;
      }
      
      public static function binb2hex(param1:Array) : String
      {
         var _loc4_:* = NaN;
         var _loc3_:String = !!hexcase?"0123456789ABCDEF":"0123456789abcdef";
         var _loc2_:String = "";
         _loc4_ = 0;
         while(_loc4_ < param1.length * 4)
         {
            _loc2_ = _loc2_ + (_loc3_.charAt(param1[_loc4_ >> 2] >> (3 - _loc4_ % 4) * 8 + 4 & 15) + _loc3_.charAt(param1[_loc4_ >> 2] >> (3 - _loc4_ % 4) * 8 & 15));
            _loc4_++;
         }
         return _loc2_;
      }
      
      public static function binb2b64(param1:Array) : String
      {
         var _loc5_:* = NaN;
         var _loc3_:Number = NaN;
         var _loc6_:* = NaN;
         var _loc4_:String = "ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz0123456789+/";
         var _loc2_:String = "";
         _loc5_ = 0;
         while(_loc5_ < param1.length * 4)
         {
            _loc3_ = (param1[_loc5_ >> 2] >> 8 * (3 - _loc5_ % 4) & 255) << 16 | (param1[_loc5_ + 1 >> 2] >> 8 * (3 - (_loc5_ + 1) % 4) & 255) << 8 | param1[_loc5_ + 2 >> 2] >> 8 * (3 - (_loc5_ + 2) % 4) & 255;
            _loc6_ = 0;
            while(_loc6_ < 4)
            {
               if(_loc5_ * 8 + _loc6_ * 6 > param1.length * 32)
               {
                  _loc2_ = _loc2_ + b64pad;
               }
               else
               {
                  _loc2_ = _loc2_ + _loc4_.charAt(_loc3_ >> 6 * (3 - _loc6_) & 63);
               }
               _loc6_++;
            }
            _loc5_ = Number(_loc5_ + 3);
         }
         return _loc2_;
      }
   }
}
