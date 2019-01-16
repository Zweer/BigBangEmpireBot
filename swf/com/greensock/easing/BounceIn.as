package com.greensock.easing
{
   public final class BounceIn extends Ease
   {
      
      public static var ease:BounceIn = new BounceIn();
       
      
      public function BounceIn()
      {
         super();
      }
      
      override public function getRatio(param1:Number) : Number
      {
         if((param1 = 1 - param1) < 1 / 2.75)
         {
            return 1 - 7.5625 * param1 * param1;
         }
         if(param1 < 2 / 2.75)
         {
            return 1 - (7.5625 * (param1 = param1 - 1.5 / 2.75) * param1 + 0.75);
         }
         if(param1 < 2.5 / 2.75)
         {
            return 1 - (7.5625 * (param1 = param1 - 2.25 / 2.75) * param1 + 0.9375);
         }
         return 1 - (7.5625 * (param1 = param1 - 2.625 / 2.75) * param1 + 0.984375);
      }
   }
}
