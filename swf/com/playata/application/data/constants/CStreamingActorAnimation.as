package com.playata.application.data.constants
{
   import com.playata.framework.core.TypedObject;
   import com.playata.framework.data.constants.ConstantsData;
   
   public class CStreamingActorAnimation extends ConstantsData
   {
      
      public static const ID_NAME:String = "animation";
       
      
      public function CStreamingActorAnimation(param1:TypedObject)
      {
         super(param1);
      }
      
      public function get animation() : int
      {
         return getInt("animation");
      }
      
      public function get sortIndex() : int
      {
         return getInt("sort_index");
      }
      
      public function get relativeChance() : int
      {
         return getInt("relative_chance");
      }
      
      public function get unlockType() : int
      {
         return getInt("unlock_type");
      }
      
      public function get unlockValue() : int
      {
         return getInt("unlock_value");
      }
      
      public function get premiumUnlockValue() : int
      {
         return getInt("premium_unlock_value");
      }
      
      public function get rewardType() : int
      {
         return getInt("reward_type");
      }
      
      public function get rewardMultiplier() : Number
      {
         return getNumber("reward_multiplier");
      }
      
      public function get rewardIdentifier() : String
      {
         return getString("reward_identifier");
      }
      
      public function get itemBonusLevel() : int
      {
         return getInt("item_bonus_level");
      }
   }
}
