package com.playata.application.data.dataobject
{
   import com.playata.framework.data.DataObject;
   
   public class DODuel extends DataObject
   {
       
      
      public function DODuel(param1:Object)
      {
         super(param1);
      }
      
      public function get id() : int
      {
         return getInt("id");
      }
      
      public function get tsCreation() : int
      {
         return getInt("ts_creation");
      }
      
      public function get battleId() : int
      {
         return getInt("battle_id");
      }
      
      public function get characterAId() : int
      {
         return getInt("character_a_id");
      }
      
      public function get characterBId() : int
      {
         return getInt("character_b_id");
      }
      
      public function get characterAStatus() : int
      {
         return getInt("character_a_status");
      }
      
      public function get characterBStatus() : int
      {
         return getInt("character_b_status");
      }
      
      public function get characterARewards() : String
      {
         return getString("character_a_rewards");
      }
      
      public function get characterBRewards() : String
      {
         return getString("character_b_rewards");
      }
   }
}
