package starling.utils
{
   import starling.errors.AbstractClassError;
   
   public class Color
   {
      
      public static const WHITE:uint = 16777215;
      
      public static const SILVER:uint = 12632256;
      
      public static const GRAY:uint = 8421504;
      
      public static const BLACK:uint = 0;
      
      public static const RED:uint = 16711680;
      
      public static const MAROON:uint = 8388608;
      
      public static const YELLOW:uint = 16776960;
      
      public static const OLIVE:uint = 8421376;
      
      public static const LIME:uint = 65280;
      
      public static const GREEN:uint = 32768;
      
      public static const AQUA:uint = 65535;
      
      public static const TEAL:uint = 32896;
      
      public static const BLUE:uint = 255;
      
      public static const NAVY:uint = 128;
      
      public static const FUCHSIA:uint = 16711935;
      
      public static const PURPLE:uint = 8388736;
       
      
      public function Color()
      {
         super();
         throw new AbstractClassError();
      }
      
      public static function getAlpha(param1:uint) : int
      {
         return param1 >> 24 & 255;
      }
      
      public static function getRed(param1:uint) : int
      {
         return param1 >> 16 & 255;
      }
      
      public static function getGreen(param1:uint) : int
      {
         return param1 >> 8 & 255;
      }
      
      public static function getBlue(param1:uint) : int
      {
         return param1 & 255;
      }
      
      public static function setAlpha(param1:uint, param2:int) : uint
      {
         return param1 & 16777215 | (param2 & 255) << 24;
      }
      
      public static function setRed(param1:uint, param2:int) : uint
      {
         return param1 & 4278255615 | (param2 & 255) << 16;
      }
      
      public static function setGreen(param1:uint, param2:int) : uint
      {
         return param1 & 4294902015 | (param2 & 255) << 8;
      }
      
      public static function setBlue(param1:uint, param2:int) : uint
      {
         return param1 & 4294967040 | param2 & 255;
      }
      
      public static function rgb(param1:int, param2:int, param3:int) : uint
      {
         return param1 << 16 | param2 << 8 | param3;
      }
      
      public static function argb(param1:int, param2:int, param3:int, param4:int) : uint
      {
         return param1 << 24 | param2 << 16 | param3 << 8 | param4;
      }
      
      public static function hsv(param1:Number, param2:Number, param3:Number) : uint
      {
         var _loc10_:* = NaN;
         var _loc6_:* = NaN;
         var _loc7_:* = NaN;
         var _loc11_:Number = Math.floor(param1 * 6);
         var _loc9_:Number = param1 * 6 - _loc11_;
         var _loc4_:Number = param3 * (1 - param2);
         var _loc5_:Number = param3 * (1 - _loc9_ * param2);
         var _loc8_:Number = param3 * (1 - (1 - _loc9_) * param2);
         switch(int(_loc11_ % 6))
         {
            case 0:
               _loc7_ = param3;
               _loc10_ = _loc8_;
               _loc6_ = _loc4_;
               break;
            case 1:
               _loc7_ = _loc5_;
               _loc10_ = param3;
               _loc6_ = _loc4_;
               break;
            case 2:
               _loc7_ = _loc4_;
               _loc10_ = param3;
               _loc6_ = _loc8_;
               break;
            case 3:
               _loc7_ = _loc4_;
               _loc10_ = _loc5_;
               _loc6_ = param3;
               break;
            case 4:
               _loc7_ = _loc8_;
               _loc10_ = _loc4_;
               _loc6_ = param3;
               break;
            case 5:
               _loc7_ = param3;
               _loc10_ = _loc4_;
               _loc6_ = _loc5_;
         }
         return rgb(Math.ceil(_loc7_ * 255),Math.ceil(_loc10_ * 255),Math.ceil(_loc6_ * 255));
      }
      
      public static function hsl(param1:Number, param2:Number, param3:Number) : uint
      {
         var _loc7_:* = NaN;
         var _loc4_:* = NaN;
         var _loc5_:* = NaN;
         var _loc6_:Number = (1 - Math.abs(2 * param3 - 1)) * param2;
         var _loc9_:Number = param1 * 6;
         var _loc8_:Number = _loc6_ * (1 - Math.abs(_loc9_ % 2 - 1));
         var _loc10_:Number = param3 - _loc6_ / 2;
         switch(int(_loc9_ % 6))
         {
            case 0:
               _loc5_ = Number(_loc6_ + _loc10_);
               _loc7_ = Number(_loc8_ + _loc10_);
               _loc4_ = _loc10_;
               break;
            case 1:
               _loc5_ = Number(_loc8_ + _loc10_);
               _loc7_ = Number(_loc6_ + _loc10_);
               _loc4_ = _loc10_;
               break;
            case 2:
               _loc5_ = _loc10_;
               _loc7_ = Number(_loc6_ + _loc10_);
               _loc4_ = Number(_loc8_ + _loc10_);
               break;
            case 3:
               _loc5_ = _loc10_;
               _loc7_ = Number(_loc8_ + _loc10_);
               _loc4_ = Number(_loc6_ + _loc10_);
               break;
            case 4:
               _loc5_ = Number(_loc8_ + _loc10_);
               _loc7_ = _loc10_;
               _loc4_ = Number(_loc6_ + _loc10_);
               break;
            case 5:
               _loc5_ = Number(_loc6_ + _loc10_);
               _loc7_ = _loc10_;
               _loc4_ = Number(_loc8_ + _loc10_);
         }
         return rgb(Math.ceil(_loc5_ * 255),Math.ceil(_loc7_ * 255),Math.ceil(_loc4_ * 255));
      }
      
      public static function rgbToHsv(param1:uint, param2:Vector.<Number> = null) : Vector.<Number>
      {
         if(param2 == null)
         {
            param2 = new Vector.<Number>(3,true);
         }
         var _loc4_:Number = Color.getRed(param1) / 255;
         var _loc6_:Number = Color.getGreen(param1) / 255;
         var _loc5_:Number = Color.getBlue(param1) / 255;
         var _loc8_:Number = Math.max(_loc4_,_loc6_,_loc5_);
         var _loc3_:Number = Math.min(_loc4_,_loc6_,_loc5_);
         var _loc7_:Number = _loc8_ - _loc3_;
         if(_loc7_ == 0)
         {
            param2[0] = 0;
         }
         else if(_loc8_ == _loc4_)
         {
            param2[0] = (_loc6_ - _loc5_) / _loc7_ % 6 / 6;
         }
         else if(_loc8_ == _loc6_)
         {
            param2[0] = ((_loc5_ - _loc4_) / _loc7_ + 2) / 6;
         }
         else if(_loc8_ == _loc5_)
         {
            param2[0] = ((_loc4_ - _loc6_) / _loc7_ + 4) / 6;
         }
         while(param2[0] < 0)
         {
            var _loc9_:* = 0;
            var _loc10_:* = param2[_loc9_] + 1;
            param2[_loc9_] = _loc10_;
         }
         while(param2[0] >= 1)
         {
            _loc10_ = 0;
            _loc9_ = param2[_loc10_] - 1;
            param2[_loc10_] = _loc9_;
         }
         param2[2] = _loc8_;
         param2[1] = _loc8_ == 0?0:Number(_loc7_ / _loc8_);
         return param2;
      }
      
      public static function rgbToHsl(param1:uint, param2:Vector.<Number> = null) : Vector.<Number>
      {
         if(param2 == null)
         {
            param2 = new Vector.<Number>(3,true);
         }
         var _loc4_:Number = Color.getRed(param1) / 255;
         var _loc6_:Number = Color.getGreen(param1) / 255;
         var _loc5_:Number = Color.getBlue(param1) / 255;
         var _loc8_:Number = Math.max(_loc4_,_loc6_,_loc5_);
         var _loc3_:Number = Math.min(_loc4_,_loc6_,_loc5_);
         var _loc7_:Number = _loc8_ - _loc3_;
         if(_loc7_ == 0)
         {
            param2[0] = 0;
         }
         else if(_loc8_ == _loc4_)
         {
            param2[0] = (_loc6_ - _loc5_) / _loc7_ % 6 / 6;
         }
         else if(_loc8_ == _loc6_)
         {
            param2[0] = ((_loc5_ - _loc4_) / _loc7_ + 2) / 6;
         }
         else if(_loc8_ == _loc5_)
         {
            param2[0] = ((_loc4_ - _loc6_) / _loc7_ + 4) / 6;
         }
         while(param2[0] < 0)
         {
            var _loc9_:* = 0;
            var _loc10_:* = param2[_loc9_] + 1;
            param2[_loc9_] = _loc10_;
         }
         while(param2[0] >= 1)
         {
            _loc10_ = 0;
            _loc9_ = param2[_loc10_] - 1;
            param2[_loc10_] = _loc9_;
         }
         param2[2] = (_loc8_ + _loc3_) * 0.5;
         param2[1] = _loc7_ == 0?0:Number(_loc7_ / (1 - Math.abs(2 * param2[2] - 1)));
         return param2;
      }
      
      public static function toVector(param1:uint, param2:Vector.<Number> = null) : Vector.<Number>
      {
         if(param2 == null)
         {
            param2 = new Vector.<Number>(4,true);
         }
         param2[0] = (param1 >> 16 & 255) / 255;
         param2[1] = (param1 >> 8 & 255) / 255;
         param2[2] = (param1 & 255) / 255;
         param2[3] = (param1 >> 24 & 255) / 255;
         return param2;
      }
      
      public static function multiply(param1:uint, param2:Number) : uint
      {
         if(param2 == 0)
         {
            return 0;
         }
         var _loc6_:uint = (param1 >> 24 & 255) * param2;
         var _loc3_:uint = (param1 >> 16 & 255) * param2;
         var _loc4_:uint = (param1 >> 8 & 255) * param2;
         var _loc5_:uint = (param1 & 255) * param2;
         if(_loc6_ > 255)
         {
            _loc6_ = 255;
         }
         if(_loc3_ > 255)
         {
            _loc3_ = 255;
         }
         if(_loc4_ > 255)
         {
            _loc4_ = 255;
         }
         if(_loc5_ > 255)
         {
            _loc5_ = 255;
         }
         return argb(_loc6_,_loc3_,_loc4_,_loc5_);
      }
      
      public static function interpolate(param1:uint, param2:uint, param3:Number) : uint
      {
         var _loc11_:uint = param1 >> 24 & 255;
         var _loc15_:uint = param1 >> 16 & 255;
         var _loc6_:uint = param1 >> 8 & 255;
         var _loc9_:uint = param1 & 255;
         var _loc8_:uint = param2 >> 24 & 255;
         var _loc14_:uint = param2 >> 16 & 255;
         var _loc5_:uint = param2 >> 8 & 255;
         var _loc7_:uint = param2 & 255;
         var _loc12_:uint = _loc11_ + (_loc8_ - _loc11_) * param3;
         var _loc4_:uint = _loc15_ + (_loc14_ - _loc15_) * param3;
         var _loc13_:uint = _loc6_ + (_loc5_ - _loc6_) * param3;
         var _loc10_:uint = _loc9_ + (_loc7_ - _loc9_) * param3;
         return _loc12_ << 24 | _loc4_ << 16 | _loc13_ << 8 | _loc10_;
      }
   }
}
