package com.playata.framework.core.util
{
   import com.playata.framework.core.error.Exception;
   import com.playata.framework.localization.LocText;
   
   public class NumberUtil
   {
      
      public static const PI:Number = 3.141592653589793;
      
      public static const PI_2:Number = 6.283185307179586;
      
      public static const DEG_TO_RAD_MULTIPLIER:Number = 0.017453292519943295;
      
      public static const RAD_TO_DEG_MULTIPLIER:Number = 57.29577951308232;
      
      public static const RAD_90:Number = degToRad(90);
      
      public static const RAD_180:Number = degToRad(180);
      
      public static const RAD_270:Number = degToRad(270);
       
      
      public function NumberUtil()
      {
         super();
         throw new Exception("This class may not be instantiated directly. Use its static functions instead.");
      }
      
      public static function roundDecimalFormatted(param1:Number, param2:int) : String
      {
         return roundDecimal(param1,param2).toString().replace(".",LocText.current.text("base/numbers/comma_separator"));
      }
      
      public static function roundDecimal(param1:Number, param2:int) : Number
      {
         var _loc4_:Number = Math.pow(10,param2);
         var _loc3_:Number = Math.round(param1 * _loc4_) / _loc4_;
         return _loc3_;
      }
      
      public static function randomInt(param1:Number, param2:Number) : int
      {
         return Math.floor(randomNumber(param1,param2 + 1));
      }
      
      public static function randomNumber(param1:Number, param2:Number) : Number
      {
         return param1 + Math.random() * (param2 - param1);
      }
      
      public static function get randomBool() : Boolean
      {
         return randomInt(0,1) == 1;
      }
      
      public static function chanceOneBased(param1:Number) : Boolean
      {
         return param1 > 0?randomNumber(0,1) < param1:false;
      }
      
      public static function romanize(param1:int) : String
      {
         var _loc5_:int = 0;
         var _loc6_:Array = ["M","CM","D","CD","C","XC","L","XL","X","IX","V","IV","I"];
         var _loc4_:Vector.<int> = new <int>[1000,900,500,400,100,90,50,40,10,9,5,4,1];
         var _loc2_:Object = {
            "M":1000,
            "CM":900,
            "D":500,
            "CD":400,
            "C":100,
            "XC":90,
            "L":50,
            "XL":40,
            "X":10,
            "IX":9,
            "V":5,
            "IV":4,
            "I":1
         };
         var _loc3_:String = "";
         _loc5_ = 0;
         while(_loc5_ < _loc4_.length)
         {
            while(param1 >= _loc4_[_loc5_])
            {
               _loc3_ = _loc3_ + _loc6_[_loc5_];
               param1 = param1 - _loc4_[_loc5_];
            }
            _loc5_++;
         }
         return _loc3_;
      }
      
      public static function roundToNearest(param1:Number, param2:Number, param3:Boolean = false) : Number
      {
         if(param3)
         {
            return Math.floor(param2 / param1) * param1;
         }
         return Math.round(param2 / param1) * param1;
      }
      
      public static function clamp(param1:int, param2:int, param3:int) : int
      {
         return param1 < param2?param2:int(param1 > param3?param3:int(param1));
      }
      
      public static function clampf(param1:Number, param2:Number, param3:Number) : Number
      {
         return param1 < param2?param2:Number(param1 > param3?param3:Number(param1));
      }
      
      public static function abs(param1:int) : int
      {
         return param1 < 0?-param1:param1;
      }
      
      public static function absf(param1:Number) : Number
      {
         return param1 < 0?-param1:Number(param1);
      }
      
      public static function max(param1:int, param2:int) : int
      {
         return param1 > param2?param1:int(param2);
      }
      
      public static function maxf(param1:Number, param2:Number) : Number
      {
         return param1 > param2?param1:Number(param2);
      }
      
      public static function min(param1:int, param2:int) : int
      {
         return param1 < param2?param1:int(param2);
      }
      
      public static function minf(param1:Number, param2:Number) : Number
      {
         return param1 < param2?param1:Number(param2);
      }
      
      public static function distance(param1:Number, param2:Number, param3:Number, param4:Number) : Number
      {
         var _loc5_:int = param1 - param3;
         var _loc6_:int = param2 - param4;
         return Math.sqrt(_loc5_ * _loc5_ + _loc6_ * _loc6_);
      }
      
      public static function angleBetween(param1:Number, param2:Number, param3:Number, param4:Number) : Number
      {
         var _loc5_:int = param1 - param3;
         var _loc6_:int = param2 - param4;
         return Math.atan2(_loc6_,_loc5_);
      }
      
      public static function degToRad(param1:Number) : Number
      {
         return param1 * 0.0174532925199433;
      }
      
      public static function radToDeg(param1:Number) : Number
      {
         return param1 * 57.2957795130823;
      }
      
      public static function map(param1:Number, param2:Number, param3:Number, param4:Number, param5:Number, param6:Boolean = false, param7:Boolean = true, param8:Boolean = true) : Number
      {
         if(param7 && param1 < param2)
         {
            return param4;
         }
         if(param8 && param1 > param3)
         {
            return param5;
         }
         var _loc9_:Number = (param1 - param2) / (param3 - param2);
         var _loc10_:Number = _loc9_ * (param5 - param4) + param4;
         if(param6)
         {
            return Math.round(_loc10_);
         }
         return _loc10_;
      }
   }
}
