package com.playata.application.data.tournament
{
   import com.playata.application.data.AppDateTime;
   import com.playata.application.data.dataobject.DOTournamentMovieReward;
   import com.playata.application.data.reward.Reward;
   
   public class TournamentMovieReward extends DOTournamentMovieReward
   {
       
      
      private var _reward:Reward = null;
      
      public function TournamentMovieReward(param1:Object = null)
      {
         super(param1);
         _reward = new Reward(getString("reward"));
      }
      
      public function get rank() : int
      {
         return getInt("rank");
      }
      
      public function get votes() : int
      {
         return getInt("value");
      }
      
      public function get title() : String
      {
         return getString("movie_title");
      }
      
      public function get setIdentifier() : String
      {
         return getString("movie_set");
      }
      
      public function get coverSettings() : String
      {
         return getString("movie_cover");
      }
      
      public function get dateTime() : String
      {
         var _loc1_:int = getInt("movie_ts_completed");
         return AppDateTime.getPassedShortFormattedTimestamp(_loc1_);
      }
      
      public function get reward() : Reward
      {
         return _reward;
      }
   }
}
