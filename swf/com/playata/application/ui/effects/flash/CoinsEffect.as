package com.playata.application.ui.effects.flash
{
   public class CoinsEffect extends TargetEffect
   {
       
      
      public function CoinsEffect(param1:Object)
      {
         super();
         createFromBitmapData(param1.emitter,960,33,new EffectBitmapDataMoney(0,0));
         _maxSprites = 4;
      }
      
      override protected function getDurationVariation() : Number
      {
         return 0.1 - Math.random() * 0.2;
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
