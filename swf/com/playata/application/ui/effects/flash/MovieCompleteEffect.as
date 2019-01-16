package com.playata.application.ui.effects.flash
{
   import flash.display.BitmapData;
   
   public class MovieCompleteEffect extends ExplosionEffect
   {
       
      
      public function MovieCompleteEffect(param1:Object)
      {
         super();
         _numSprites = 30;
         start(new <BitmapData>[new EffectBitmapDataFan()]);
      }
   }
}
