package com.playata.application.ui.effects.flash
{
   import flash.display.BitmapData;
   
   public class DuelCompleteEffect extends ExplosionEffect
   {
       
      
      public function DuelCompleteEffect(param1:Object, param2:Boolean = false)
      {
         super();
         _numSprites = 50;
         _startYOffset = !!param2?250:Number(150);
         if(param2)
         {
            start(new <BitmapData>[new EffectBitmapDataMoney(),new EffectBitmapDataHonorGuild(),new EffectBitmapStar1(),new EffectBitmapStar2(),new EffectBitmapStar3()]);
         }
         else
         {
            start(new <BitmapData>[new EffectBitmapDataMoney(),new EffectBitmapDataHonor(),new EffectBitmapStar1(),new EffectBitmapStar2(),new EffectBitmapStar3()]);
         }
      }
   }
}
