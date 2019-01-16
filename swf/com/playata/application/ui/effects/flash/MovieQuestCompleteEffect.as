package com.playata.application.ui.effects.flash
{
   import flash.display.BitmapData;
   
   public class MovieQuestCompleteEffect extends ExplosionEffect
   {
       
      
      public function MovieQuestCompleteEffect(param1:Object)
      {
         super();
         _numSprites = 50;
         start(new <BitmapData>[new EffectBitmapDataMoney(),new EffectBitmapDataXP(),new EffectBitmapStar1(),new EffectBitmapStar2(),new EffectBitmapStar3(),new EffectBitmapDataMovieProgress()]);
      }
   }
}
