package com.playata.application.ui.effects.flash
{
   public class TitleEffect extends TargetEffect
   {
       
      
      public function TitleEffect(param1:Object)
      {
         super();
         createFromBitmapData(param1.emitter,95,560,new EffectBitmapDataTitle(0,0));
      }
   }
}
