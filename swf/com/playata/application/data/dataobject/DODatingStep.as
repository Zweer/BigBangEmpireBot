package com.playata.application.data.dataobject
{
   import com.playata.framework.data.DataObject;
   
   public class DODatingStep extends DataObject
   {
       
      
      public function DODatingStep(param1:Object)
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
      
      public function get repeat() : Boolean
      {
         return getBoolean("repeat");
      }
      
      public function get datingIndex() : int
      {
         return getInt("dating_index");
      }
      
      public function get stepIndex() : int
      {
         return getInt("step_index");
      }
      
      public function get status() : int
      {
         return getInt("status");
      }
      
      public function get pointsCollected() : int
      {
         return getInt("points_collected");
      }
      
      public function get tsLastAttack() : int
      {
         return getInt("ts_last_attack");
      }
      
      public function get rewards() : String
      {
         return getString("rewards");
      }
   }
}
