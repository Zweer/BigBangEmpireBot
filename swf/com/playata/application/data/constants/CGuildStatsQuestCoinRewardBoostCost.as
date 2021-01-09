package com.playata.application.data.constants
{
   import com.playata.framework.core.TypedObject;
   import com.playata.framework.data.constants.ConstantsData;
   
   public class CGuildStatsQuestCoinRewardBoostCost extends ConstantsData
   {
      
      public static const CONSTANTS_KEY:String = "guild_stat_quest_game_currency_reward_boost_costs";
      
      public static const ID_NAME:String = "value";
       
      
      public function CGuildStatsQuestCoinRewardBoostCost(param1:TypedObject)
      {
         super(param1);
      }
      
      public static function get constantsData() : *
      {
         return ConstantsData.getConstantsData("guild_stat_quest_game_currency_reward_boost_costs");
      }
      
      public static function get count() : int
      {
         return ConstantsData.getCount("guild_stat_quest_game_currency_reward_boost_costs");
      }
      
      public static function get ids() : Vector.<int>
      {
         return ConstantsData.getIntVectorIds("guild_stat_quest_game_currency_reward_boost_costs");
      }
      
      public static function exists(param1:int) : Boolean
      {
         return ConstantsData.getIdExists("guild_stat_quest_game_currency_reward_boost_costs",param1);
      }
      
      public static function fromId(param1:int) : CGuildStatsQuestCoinRewardBoostCost
      {
         return ConstantsData.getConstantsDataObject(param1,CGuildStatsQuestCoinRewardBoostCost) as CGuildStatsQuestCoinRewardBoostCost;
      }
      
      public function get value() : int
      {
         return getInt("value");
      }
      
      public function get gameCurrencyCost() : int
      {
         return getInt("game_currency_cost");
      }
      
      public function get premiumCurrencyCost() : int
      {
         return getInt("premium_currency_cost");
      }
   }
}
