package com.playata.application.ui.effects.flash
{
   public class HonorEffect extends TargetEffect
   {
       
      
      public function HonorEffect(param1:Object)
      {
         super();
         createFromBitmapData(param1.emitter,960,110,new EffectBitmapDataHonor(0,0));
      }
      
      override protected function getStartXVariation() : Number
      {
         return 3 - Math.random() * 6;
      }
      
      override protected function getStartYVariation() : Number
      {
         return 3 - Math.random() * 6;
      }
      
      override protected function getTargetXVariation() : Number
      {
         return Math.random() * 40;
      }
      
      override protected function getTargetYVariation() : Number
      {
         return Math.random() * 10;
      }
   }
}
