package com.greensock.easing
{
   public final class ElasticInOut extends Ease
   {
      
      private static const _2PI:Number = Math.PI * 2;
      
      public static var ease:ElasticInOut = new ElasticInOut();
       
      
      public function ElasticInOut(param1:Number = 1, param2:Number = 0.3)
      {
         super();
         _p1 = Number(param1) || 1;
         _p2 = Number(param2) || 0.45;
         _p3 = _p2 / _2PI * (Math.asin(1 / _p1) || 0);
      }
      
      override public function getRatio(param1:Number) : Number
      {
         return (param1 = Number(param1 * 2)) < 1?Number(-0.5 * (_p1 * Math.pow(2,10 * (param1 = Number(param1 - 1))) * Math.sin((param1 - _p3) * _2PI / _p2))):Number(_p1 * Math.pow(2,-10 * (param1 = Number(param1 - 1))) * Math.sin((param1 - _p3) * _2PI / _p2) * 0.5 + 1);
      }
      
      public function config(param1:Number = 1, param2:Number = 0.3) : ElasticInOut
      {
         return new ElasticInOut(param1,param2);
      }
   }
}
