package com.playata.application.data.dataobject
{
   import com.playata.framework.data.DataObject;
   
   public class DOEventQuest extends DataObject
   {
       
      
      public function DOEventQuest(param1:Object)
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
      
      public function get identifier() : String
      {
         return getString("identifier");
      }
      
      public function get status() : int
      {
         return getInt("status");
      }
      
      public function get objective1Value() : int
      {
         return getInt("objective1_value");
      }
      
      public function get objective2Value() : int
      {
         return getInt("objective2_value");
      }
      
      public function get objective3Value() : int
      {
         return getInt("objective3_value");
      }
      
      public function get objective4Value() : int
      {
         return getInt("objective4_value");
      }
      
      public function get objective5Value() : int
      {
         return getInt("objective5_value");
      }
      
      public function get objective6Value() : int
      {
         return getInt("objective6_value");
      }
      
      public function get objective7Value() : int
      {
         return getInt("objective7_value");
      }
      
      public function get objective8Value() : int
      {
         return getInt("objective8_value");
      }
      
      public function get objective9Value() : int
      {
         return getInt("objective9_value");
      }
      
      public function get objective10Value() : int
      {
         return getInt("objective10_value");
      }
      
      public function get objective1RewardItemId() : int
      {
         return getInt("objective1_reward_item_id");
      }
      
      public function get objective2RewardItemId() : int
      {
         return getInt("objective2_reward_item_id");
      }
      
      public function get objective3RewardItemId() : int
      {
         return getInt("objective3_reward_item_id");
      }
      
      public function get objective4RewardItemId() : int
      {
         return getInt("objective4_reward_item_id");
      }
      
      public function get objective5RewardItemId() : int
      {
         return getInt("objective5_reward_item_id");
      }
      
      public function get objective6RewardItemId() : int
      {
         return getInt("objective6_reward_item_id");
      }
      
      public function get objective7RewardItemId() : int
      {
         return getInt("objective7_reward_item_id");
      }
      
      public function get objective8RewardItemId() : int
      {
         return getInt("objective8_reward_item_id");
      }
      
      public function get objective9RewardItemId() : int
      {
         return getInt("objective9_reward_item_id");
      }
      
      public function get objective10RewardItemId() : int
      {
         return getInt("objective10_reward_item_id");
      }
      
      public function get rewards() : String
      {
         return getString("rewards");
      }
      
      public function get rewardItem1Id() : int
      {
         return getInt("reward_item1_id");
      }
      
      public function get rewardItem2Id() : int
      {
         return getInt("reward_item2_id");
      }
      
      public function get rewardItem3Id() : int
      {
         return getInt("reward_item3_id");
      }
   }
}
