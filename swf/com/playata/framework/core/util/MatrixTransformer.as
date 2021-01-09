package com.playata.framework.core.util
{
   import flash.geom.Matrix;
   
   public class MatrixTransformer
   {
       
      
      public function MatrixTransformer()
      {
         super();
      }
      
      public static function transform(param1:Matrix, param2:Number = 100, param3:Number = 100, param4:Number = 0, param5:Number = 0, param6:Number = 0, param7:Number = 0, param8:String = "right") : Matrix
      {
         param1 = MatrixTransformer.skew(param1,param7,param8);
         param1 = MatrixTransformer.scale(param1,param2,param3);
         param1 = MatrixTransformer.translate(param1,param4,param5);
         param1 = MatrixTransformer.rotate(param1,param6,"degrees");
         return param1;
      }
      
      public static function scale(param1:Matrix, param2:Number, param3:Number, param4:Boolean = true) : Matrix
      {
         if(param4)
         {
            param2 = param2 / 100;
            param3 = param3 / 100;
         }
         param1.scale(param2,param3);
         return param1;
      }
      
      public static function translate(param1:Matrix, param2:Number, param3:Number) : Matrix
      {
         param1.translate(param2,param3);
         return param1;
      }
      
      public static function rotate(param1:Matrix, param2:Number, param3:String = "radians") : Matrix
      {
         if(param3 == "degrees")
         {
            param2 = 3.14159265358979 * 2 * param2 / 360;
         }
         if(param3 == "gradients")
         {
            param2 = 3.14159265358979 * 2 * param2 / 100;
         }
         param1.rotate(param2);
         return param1;
      }
      
      public static function skew(param1:Matrix, param2:Number, param3:String = "right", param4:String = "degrees") : Matrix
      {
         if(param4 == "degrees")
         {
            param2 = 3.14159265358979 * 2 * param2 / 360;
         }
         if(param4 == "gradients")
         {
            param2 = 3.14159265358979 * 2 * param2 / 100;
         }
         var _loc5_:Matrix = new Matrix();
         if(param3 == "right")
         {
            _loc5_.b = Math.tan(param2);
         }
         else
         {
            _loc5_.c = Math.tan(param2);
         }
         param1.concat(_loc5_);
         return param1;
      }
   }
}
