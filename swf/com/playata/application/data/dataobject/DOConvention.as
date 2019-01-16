package com.playata.application.data.dataobject
{
   import com.playata.framework.data.DataObject;
   
   public class DOConvention extends DataObject
   {
       
      
      public function DOConvention(param1:Object)
      {
         super(param1);
      }
      
      public function get id() : int
      {
         return getInt("id");
      }
      
      public function get tsFinished() : int
      {
         return getInt("ts_finished");
      }
      
      public function get identifier() : String
      {
         return getString("identifier");
      }
      
      public function get status() : int
      {
         return getInt("status");
      }
      
      public function get tsStart() : int
      {
         return getInt("ts_start");
      }
      
      public function get tsEnd() : int
      {
         return getInt("ts_end");
      }
      
      public function get minLevel() : int
      {
         return getInt("min_level");
      }
      
      public function get maxLevel() : int
      {
         return getInt("max_level");
      }
      
      public function get stage() : int
      {
         return getInt("stage");
      }
      
      public function get rewardMultiplier() : int
      {
         return getInt("reward_multiplier");
      }
      
      public function get rewardTopRankItemIdentifier() : String
      {
         return getString("reward_top_rank_item_identifier");
      }
      
      public function get rewardTopRankItemLevelBonus() : int
      {
         return getInt("reward_top_rank_item_level_bonus");
      }
      
      public function get rewardTopPoolItemIdentifier() : String
      {
         return getString("reward_top_pool_item_identifier");
      }
      
      public function get rewardTopPoolItemLevelBonus() : int
      {
         return getInt("reward_top_pool_item_level_bonus");
      }
      
      public function get fansCurrent() : int
      {
         return getInt("fans_current");
      }
      
      public function get fansTotal() : int
      {
         return getInt("fans_total");
      }
      
      public function get showCount() : int
      {
         return getInt("show_count");
      }
      
      public function get topStarShowCount() : int
      {
         return getInt("top_star_show_count");
      }
      
      public function get topStarId() : int
      {
         return getInt("top_star_id");
      }
      
      public function get topStarName() : String
      {
         return getString("top_star_name");
      }
      
      public function get winningStarId() : int
      {
         return getInt("winning_star_id");
      }
      
      public function get winningStarName() : String
      {
         return getString("winning_star_name");
      }
      
      public function get difficultyFactor() : int
      {
         return getInt("difficulty_factor");
      }
   }
}
