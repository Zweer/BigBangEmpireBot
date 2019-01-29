package com.playata.application.data.dataobject
{
   import com.playata.framework.data.DataObject;
   
   public class DODailyBonusReward extends DataObject
   {
       
      
      public function DODailyBonusReward(param1:Object)
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
      
      public function get tsCreation() : int
      {
         return getInt("ts_creation");
      }
      
      public function get status() : int
      {
         return getInt("status");
      }
      
      public function get type() : int
      {
         return getInt("type");
      }
      
      public function get value() : int
      {
         return getInt("value");
      }
      
      public function get rewards() : String
      {
         return getString("rewards");
      }
   }
}
