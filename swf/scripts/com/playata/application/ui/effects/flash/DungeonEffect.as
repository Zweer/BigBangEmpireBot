package com.playata.application.ui.effects.flash
{
   public class DungeonEffect extends TargetEffect
   {
       
      
      public function DungeonEffect(param1:Object)
      {
         super();
         createFromBitmapData(param1.emitter,190,560,new EffectBitmapDataDungeonKey(0,0));
      }
      
      override protected function getDurationVariation() : Number
      {
         return Math.random() * 0.1;
      }
   }
}
