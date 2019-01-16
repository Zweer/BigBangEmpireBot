package com.greensock.easing
{
   public final class ElasticIn extends Ease
   {
      
      private static const _2PI:Number = Math.PI * 2;
      
      public static var ease:ElasticIn = new ElasticIn();
       
      
      public function ElasticIn(param1:Number = 1, param2:Number = 0.3)
      {
         super();
         _p1 = Number(param1) || 1;
         _p2 = Number(param2) || 0.3;
         _p3 = _p2 / _2PI * (Math.asin(1 / _p1) || 0);
      }
      
      override public function getRatio(param1:Number) : Number
      {
         return -(_p1 * Math.pow(2,10 * (param1 = Number(param1 - 1))) * Math.sin((param1 - _p3) * _2PI / _p2));
      }
      
      public function config(param1:Number = 1, param2:Number = 0.3) : ElasticIn
      {
         return new ElasticIn(param1,param2);
      }
   }
}
