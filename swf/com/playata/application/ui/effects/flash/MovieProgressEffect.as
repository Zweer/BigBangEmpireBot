package com.playata.application.ui.effects.flash
{
   public class MovieProgressEffect extends TargetEffect
   {
       
      
      public function MovieProgressEffect(param1:Object)
      {
         super();
         createFromBitmapData(param1.emitter,57,510,new EffectBitmapDataMovieProgress(0,0));
      }
   }
}
