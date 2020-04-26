package com.playata.application.data.dataobject
{
   import com.playata.framework.data.DataObject;
   
   public class DOMissedDuel extends DataObject
   {
       
      
      public function DOMissedDuel(param1:Object)
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
      
      public function get winner() : String
      {
         return getString("winner");
      }
      
      public function get characterBRewards() : String
      {
         return getString("character_b_rewards");
      }
      
      public function get opponentId() : int
      {
         return getInt("opponent_id");
      }
      
      public function get unread() : Boolean
      {
         return getBoolean("unread");
      }
   }
}
