package com.playata.application.ui.effects.flash
{
   import flash.display.BitmapData;
   
   public class WorkCompleteEffect extends ExplosionEffect
   {
       
      
      public function WorkCompleteEffect(param1:Object)
      {
         super();
         _numSprites = 30;
         start(new <BitmapData>[new EffectBitmapDataMoney()]);
      }
   }
}
