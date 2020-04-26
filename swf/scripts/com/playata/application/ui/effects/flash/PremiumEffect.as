package com.playata.application.ui.effects.flash
{
   public class PremiumEffect extends TargetEffect
   {
       
      
      public function PremiumEffect(param1:Object)
      {
         super();
         createFromBitmapData(param1.emitter,960,70,new EffectBitmapDataPremium(0,0));
         if(!§§pop())
         {
            _maxSprites = param1.amount != 0?param1.amount:1;
         }
         if(_maxSprites > 10)
         {
            _maxSprites = 10;
         }
      }
   }
}
