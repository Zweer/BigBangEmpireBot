package org.casalib.util
{
   import org.casalib.math.Percent;
   
   public class NumberUtil
   {
       
      
      public function NumberUtil()
      {
         super();
      }
      
      public static function isEqual(param1:Number, param2:Number, param3:Number = 0) : Boolean
      {
         return Math.abs(param1 - param2) <= Math.abs(param3);
      }
      
      public static function min(param1:*, param2:*) : Number
      {
         if(isNaN(param1) && isNaN(param2) || param1 == null && param2 == null)
         {
            return NaN;
         }
         if(param1 == null || param2 == null)
         {
            return param2 == null?Number(param1):Number(param2);
         }
         if(isNaN(param1) || isNaN(param2))
         {
            return !!isNaN(param2)?Number(param1):Number(param2);
         }
         return Math.min(param1,param2);
      }
      
      public static function max(param1:*, param2:*) : Number
      {
         if(isNaN(param1) && isNaN(param2) || param1 == null && param2 == null)
         {
            return NaN;
         }
         if(param1 == null || param2 == null)
         {
            return param2 == null?Number(param1):Number(param2);
         }
         if(isNaN(param1) || isNaN(param2))
         {
            return !!isNaN(param2)?Number(param1):Number(param2);
         }
         return Math.max(param1,param2);
      }
      
      public static function randomWithinRange(param1:Number, param2:Number) : Number
      {
         return param1 + Math.random() * (param2 - param1);
      }
      
      public static function randomIntegerWithinRange(param1:int, param2:int) : int
      {
         return Math.round(NumberUtil.randomWithinRange(param1,param2));
      }
      
      public static function isEven(param1:Number) : Boolean
      {
         return (param1 & 1) == 0;
      }
      
      public static function isOdd(param1:Number) : Boolean
      {
         return !NumberUtil.isEven(param1);
      }
      
      public static function isInteger(param1:Number) : Boolean
      {
         return param1 % 1 == 0;
      }
      
      public static function isPrime(param1:Number) : Boolean
      {
         if(param1 == 1 || param1 == 2)
         {
            return true;
         }
         if(NumberUtil.isEven(param1))
         {
            return false;
         }
         var _loc2_:Number = Math.sqrt(param1);
         var _loc3_:* = 3;
         while(_loc3_ <= _loc2_)
         {
            if(param1 % _loc3_ == 0)
            {
               return false;
            }
            _loc3_++;
         }
         return true;
      }
      
      public static function roundDecimalToPlace(param1:Number, param2:uint) : Number
      {
         var _loc3_:Number = Math.pow(10,param2);
         return Math.round(param1 * _loc3_) / _loc3_;
      }
      
      public static function loopIndex(param1:int, param2:uint) : uint
      {
         if(param1 < 0)
         {
            param1 = param2 + param1 % param2;
         }
         if(param1 >= param2)
         {
            return param1 % param2;
         }
         return param1;
      }
      
      public static function isBetween(param1:Number, param2:Number, param3:Number) : Boolean
      {
         return !(param1 < Math.min(param2,param3) || param1 > Math.max(param2,param3));
      }
      
      public static function constrain(param1:Number, param2:Number, param3:Number) : Number
      {
         return Math.min(Math.max(param1,Math.min(param2,param3)),Math.max(param2,param3));
      }
      
      public static function createStepsBetween(param1:Number, param2:Number, param3:Number) : Array
      {
         param3++;
         var _loc4_:uint = 0;
         var _loc5_:Array = new Array();
         var _loc6_:Number = (param2 - param1) / param3;
         while(++_loc4_ < param3)
         {
            _loc5_.push(_loc4_ * _loc6_ + param1);
         }
         return _loc5_;
      }
      
      public static function interpolate(param1:Percent, param2:Number, param3:Number) : Number
      {
         return param2 + (param3 - param2) * param1.decimalPercentage;
      }
      
      public static function normalize(param1:Number, param2:Number, param3:Number) : Percent
      {
         return new Percent((param1 - param2) / (param3 - param2));
      }
      
      public static function map(param1:Number, param2:Number, param3:Number, param4:Number, param5:Number) : Number
      {
         return param4 + (param5 - param4) * ((param1 - param2) / (param3 - param2));
      }
      
      public static function getWeightedAverage(param1:Number, param2:Number, param3:Number) : Number
      {
         return param1 + (param2 - param1) / param3;
      }
      
      public static function format(param1:Number, param2:uint, param3:String = null, param4:String = null) : String
      {
         var _loc7_:Array = null;
         var _loc8_:uint = 0;
         var _loc9_:uint = 0;
         var _loc10_:String = null;
         var _loc5_:String = param1.toString();
         var _loc6_:uint = _loc5_.length;
         if(param3 != null)
         {
            _loc7_ = _loc5_.split("");
            _loc8_ = 3;
            _loc9_ = _loc7_.length;
            while(--_loc9_ > 0)
            {
               _loc8_--;
               if(_loc8_ == 0)
               {
                  _loc8_ = 3;
                  _loc7_.splice(_loc9_,0,param3);
               }
            }
            _loc5_ = _loc7_.join("");
         }
         if(param2 != 0)
         {
            if(_loc6_ < param2)
            {
               param2 = param2 - _loc6_;
               _loc10_ = param4 == null?"0":param4;
               while(param2--)
               {
                  _loc5_ = _loc10_ + _loc5_;
               }
            }
         }
         return _loc5_;
      }
      
      public static function getOrdinalSuffix(param1:int) : String
      {
         if(param1 >= 10 && param1 <= 20)
         {
            return "th";
         }
         if(param1 == 0)
         {
            return "";
         }
         switch(param1 % 10)
         {
            case 3:
               return "rd";
            case 2:
               return "nd";
            case 1:
               return "st";
            default:
               return "th";
         }
      }
      
      public static function addLeadingZero(param1:Number) : String
      {
         return param1 < 10?"0" + param1:param1.toString();
      }
   }
}
