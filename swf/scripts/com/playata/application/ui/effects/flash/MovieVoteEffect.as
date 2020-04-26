package com.playata.application.ui.effects.flash
{
   public class MovieVoteEffect extends TargetEffect
   {
       
      
      public function MovieVoteEffect(param1:Object)
      {
         super();
         if(param1.hasOwnProperty("movie_panel") && param1["movie_panel"] == true)
         {
            createFromBitmapData(param1.emitter,360,462,new EffectBitmapDataMovieVote(0,0));
         }
         else
         {
            createFromBitmapData(param1.emitter,20,470,new EffectBitmapDataMovieVote(0,0));
         }
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
         return Math.random() * 50;
      }
      
      override protected function getTargetYVariation() : Number
      {
         return Math.random() * 50;
      }
   }
}
