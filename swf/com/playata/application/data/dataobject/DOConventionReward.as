package com.playata.application.data.dataobject
{
   import com.playata.framework.data.DataObject;
   
   public class DOConventionReward extends DataObject
   {
       
      
      public function DOConventionReward(param1:Object)
      {
         super(param1);
      }
      
      public function get id() : int
      {
         return getInt("id");
      }
      
      public function get conventionId() : int
      {
         return getInt("convention_id");
      }
      
      public function get characterId() : int
      {
         return getInt("character_id");
      }
      
      public function get xp() : int
      {
         return getInt("xp");
      }
      
      public function get itemId() : int
      {
         return getInt("item_id");
      }
      
      public function get rewards() : String
      {
         return getString("rewards");
      }
      
      public function get status() : int
      {
         return getInt("status");
      }
   }
}
