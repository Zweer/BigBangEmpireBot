package com.playata.application.data.dataobject
{
   import com.playata.framework.data.DataObject;
   
   public class DOBattle extends DataObject
   {
       
      
      public function DOBattle(param1:Object)
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
      
      public function get profileAStats() : String
      {
         return getString("profile_a_stats");
      }
      
      public function get profileBStats() : String
      {
         return getString("profile_b_stats");
      }
      
      public function get winner() : String
      {
         return getString("winner");
      }
      
      public function get rounds() : String
      {
         return getString("rounds");
      }
   }
}
