package com.playata.application.data.dataobject
{
   import com.playata.framework.data.DataObject;
   
   public class DOTournamentMovieReward extends DataObject
   {
       
      
      public function DOTournamentMovieReward(param1:Object)
      {
         super(param1);
      }
      
      public function get id() : int
      {
         return getInt("id");
      }
      
      public function get characterId() : int
      {
         return getInt("character_id");
      }
      
      public function get status() : int
      {
         return getInt("status");
      }
      
      public function get week() : int
      {
         return getInt("week");
      }
      
      public function get movieRewards() : String
      {
         return getString("movie_rewards");
      }
      
      public function get voteRewards() : String
      {
         return getString("vote_rewards");
      }
   }
}
