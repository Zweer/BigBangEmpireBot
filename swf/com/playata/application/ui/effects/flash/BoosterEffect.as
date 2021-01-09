package com.playata.application.ui.effects.flash
{
   public class BoosterEffect extends TargetEffect
   {
       
      
      public function BoosterEffect(param1:Object)
      {
         super();
         createFromBitmapData(param1.emitter,560,570,new EffectBitmapDataBooster(0,0));
      }
   }
}
