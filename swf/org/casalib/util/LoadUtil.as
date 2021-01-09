package org.casalib.util
{
   import org.casalib.math.Percent;
   
   public class LoadUtil
   {
       
      
      public function LoadUtil()
      {
         super();
      }
      
      public static function calculateBps(param1:uint, param2:uint, param3:uint) : int
      {
         return Math.max(0,param1 / ConversionUtil.millisecondsToSeconds(param3 - param2));
      }
      
      public static function calculateKBps(param1:uint, param2:uint, param3:uint) : Number
      {
         return ConversionUtil.bytesToKilobytes(LoadUtil.calculateBps(param1,param2,param3));
      }
      
      public static function calculateBufferPercent(param1:uint, param2:uint, param3:uint, param4:uint, param5:uint) : Percent
      {
         var _loc6_:Number = param2 / (param1 / (param4 - param3)) - param5;
         var _loc7_:uint = LoadUtil.calculateMillisecondsUntilBuffered(param1,param2,param3,param4,param5);
         return _loc6_ == Number.POSITIVE_INFINITY?new Percent(0):new Percent(NumberUtil.constrain(1 - _loc7_ / _loc6_,0,1));
      }
      
      public static function calculateMillisecondsUntilBuffered(param1:uint, param2:uint, param3:uint, param4:uint, param5:uint) : uint
      {
         return Math.max(Math.ceil((param2 - param1) / (param1 / (param4 - param3))) - param5,0);
      }
   }
}
