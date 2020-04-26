package spine
{
   public class MathUtils
   {
      
      public static var radDeg:Number = 57.29577951308232;
      
      public static var degRad:Number = 0.017453292519943295;
       
      
      public function MathUtils()
      {
         super();
      }
      
      public static function cosDeg(param1:Number) : Number
      {
         return Math.cos(param1 * degRad);
      }
      
      public static function sinDeg(param1:Number) : Number
      {
         return Math.sin(param1 * degRad);
      }
      
      public static function clamp(param1:Number, param2:Number, param3:Number) : Number
      {
         if(param1 < param2)
         {
            return param2;
         }
         if(param1 > param3)
         {
            return param3;
         }
         return param1;
      }
      
      public static function signum(param1:Number) : Number
      {
         return param1 > 0?1:Number(param1 < 0?-1:0);
      }
   }
}
