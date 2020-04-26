package com.greensock.easing
{
   public final class BounceInOut extends Ease
   {
      
      public static var ease:BounceInOut = new BounceInOut();
       
      
      public function BounceInOut()
      {
         super();
      }
      
      override public function getRatio(param1:Number) : Number
      {
         var _loc2_:Boolean = false;
         if(param1 < 0.5)
         {
            _loc2_ = true;
            param1 = 1 - param1 * 2;
         }
         else
         {
            param1 = param1 * 2 - 1;
         }
         if(param1 < 1 / 2.75)
         {
            param1 = 7.5625 * param1 * param1;
         }
         else if(param1 < 2 / 2.75)
         {
            param1 = 7.5625 * (param1 = param1 - 1.5 / 2.75) * param1 + 0.75;
         }
         else if(param1 < 2.5 / 2.75)
         {
            param1 = 7.5625 * (param1 = param1 - 2.25 / 2.75) * param1 + 0.9375;
         }
         else
         {
            param1 = 7.5625 * (param1 = param1 - 2.625 / 2.75) * param1 + 0.984375;
         }
         return !!_loc2_?Number((1 - param1) * 0.5):Number(param1 * 0.5 + 0.5);
      }
   }
}
