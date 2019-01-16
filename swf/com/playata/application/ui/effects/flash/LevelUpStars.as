package com.playata.application.ui.effects.flash
{
   import flash.display.BitmapData;
   
   public class LevelUpStars extends ExplosionEffect
   {
       
      
      public function LevelUpStars(param1:Object)
      {
         super();
         _numSprites = 50;
         _startXOffset = 210;
         _startYOffset = 230;
         start(new <BitmapData>[new EffectBitmapStar1(),new EffectBitmapStar2(),new EffectBitmapStar3()]);
      }
   }
}
