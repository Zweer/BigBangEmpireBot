package com.playata.application.ui.effects.flash
{
   public class StatpointEffect extends TargetEffect
   {
       
      
      public function StatpointEffect(param1:Object)
      {
         super();
         createFromBitmapData(param1.emitter,95,560,new EffectBitmapDataStatpoint(0,0));
         if(!§§pop())
         {
            _maxSprites = param1.amount != 0?param1.amount:1;
         }
      }
      
      override protected function getTargetXVariation() : Number
      {
         return Math.random() * 10;
      }
      
      override protected function getTargetYVariation() : Number
      {
         return Math.random() * 10;
      }
      
      override protected function getDurationVariation() : Number
      {
         return Math.random() * 0.1;
      }
   }
}
