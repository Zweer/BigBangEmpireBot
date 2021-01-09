package com.playata.application.data.constants
{
   import com.playata.framework.core.TypedObject;
   import com.playata.framework.data.constants.ConstantsData;
   
   public class CGlobalTournamentReward extends ConstantsData
   {
      
      public static const CONSTANTS_KEY:String = "global_tournament_rewards";
      
      public static const ID_NAME:String = "index";
       
      
      public function CGlobalTournamentReward(param1:TypedObject)
      {
         super(param1);
      }
      
      public static function get constantsData() : *
      {
         return ConstantsData.getConstantsData("global_tournament_rewards");
      }
      
      public static function get count() : int
      {
         return ConstantsData.getCount("global_tournament_rewards");
      }
      
      public static function get ids() : Vector.<int>
      {
         return ConstantsData.getIntVectorIds("global_tournament_rewards");
      }
      
      public static function exists(param1:int) : Boolean
      {
         return ConstantsData.getIdExists("global_tournament_rewards",param1);
      }
      
      public static function fromId(param1:int) : CGlobalTournamentReward
      {
         return ConstantsData.getConstantsDataObject(param1,CGlobalTournamentReward) as CGlobalTournamentReward;
      }
      
      public function get index() : int
      {
         return getInt("index");
      }
      
      public function get tournamentType() : int
      {
         return getInt("tournament_type");
      }
      
      public function get rankStart() : int
      {
         return getInt("rank_start");
      }
      
      public function get rankEnd() : int
      {
         return getInt("rank_end");
      }
      
      public function get rewardType() : int
      {
         return getInt("reward_type");
      }
      
      public function get rewardAmount() : int
      {
         return getInt("reward_amount");
      }
      
      public function get rewardType2() : int
      {
         return getInt("reward_type_2");
      }
      
      public function get rewardAmount2() : int
      {
         return getInt("reward_amount_2");
      }
   }
}
