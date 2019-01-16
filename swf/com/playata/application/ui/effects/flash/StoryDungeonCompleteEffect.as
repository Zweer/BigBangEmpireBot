package com.playata.application.ui.effects.flash
{
   import flash.display.BitmapData;
   
   public class StoryDungeonCompleteEffect extends ExplosionEffect
   {
       
      
      public function StoryDungeonCompleteEffect(param1:Object)
      {
         super();
         _numSprites = 50;
         start(new <BitmapData>[new EffectBitmapDataStatpoint(),new EffectBitmapDataMoreMission(),new EffectBitmapDataStageChanges(),new EffectBitmapStar1(),new EffectBitmapStar2(),new EffectBitmapStar3()]);
      }
   }
}
