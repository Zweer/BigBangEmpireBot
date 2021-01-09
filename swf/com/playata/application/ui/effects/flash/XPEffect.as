package com.playata.application.ui.effects.flash
{
   public class XPEffect extends TargetEffect
   {
       
      
      public function XPEffect(param1:Object)
      {
         super();
         createFromBitmapData(param1.emitter,50,50,new EffectBitmapDataXP(0,0));
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
         return Math.random() * 80;
      }
      
      override protected function getTargetYVariation() : Number
      {
         return Math.random() * 8;
      }
   }
}
