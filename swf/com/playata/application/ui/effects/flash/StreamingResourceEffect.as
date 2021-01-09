package com.playata.application.ui.effects.flash
{
   public class StreamingResourceEffect extends TargetEffect
   {
       
      
      public function StreamingResourceEffect(param1:Object)
      {
         super();
         createFromBitmapData(param1.emitter,734,40,new EffectBitmapDataStreamingResource(0,0));
         _maxSprites = param1.amount;
      }
      
      override protected function getDurationVariation() : Number
      {
         return 0.1 - Math.random() * 0.2;
      }
      
      override protected function getStartXVariation() : Number
      {
         return 3 - Math.random() * 6;
      }
      
      override protected function getStartYVariation() : Number
      {
         return 3 - Math.random() * 6;
      }
      
      override protected function getTargetXVariation() : Number
      {
         return Math.random() * 40;
      }
      
      override protected function getTargetYVariation() : Number
      {
         return Math.random() * 10;
      }
   }
}
