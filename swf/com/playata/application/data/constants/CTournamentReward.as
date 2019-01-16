package com.playata.application.data.constants
{
   import com.playata.framework.core.TypedObject;
   import com.playata.framework.data.constants.ConstantsData;
   
   public class CTournamentReward extends ConstantsData
   {
      
      public static const CONSTANTS_KEY:String = "tournament_rewards";
      
      public static const ID_NAME:String = "index";
       
      
      public function CTournamentReward(param1:TypedObject)
      {
         super(param1);
      }
      
      public static function get constantsData() : *
      {
         return ConstantsData.getConstantsData("tournament_rewards");
      }
      
      public static function get count() : int
      {
         return ConstantsData.getCount("tournament_rewards");
      }
      
      public static function get ids() : Vector.<int>
      {
         return ConstantsData.getIntVectorIds("tournament_rewards");
      }
      
      public static function exists(param1:int) : Boolean
      {
         return ConstantsData.getIdExists("tournament_rewards",param1);
      }
      
      public static function fromId(param1:int) : CTournamentReward
      {
         return ConstantsData.getConstantsDataObject(param1,CTournamentReward) as CTournamentReward;
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
   }
}
