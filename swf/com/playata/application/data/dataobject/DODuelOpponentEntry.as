package com.playata.application.data.dataobject
{
   import com.playata.framework.data.DataObject;
   
   public class DODuelOpponentEntry extends DataObject
   {
       
      
      public function DODuelOpponentEntry(param1:Object)
      {
         super(param1);
      }
      
      public function get id() : int
      {
         return getInt("id");
      }
      
      public function get name() : String
      {
         return getString("name");
      }
      
      public function get title() : String
      {
         return getString("title");
      }
      
      public function get level() : int
      {
         return getInt("level");
      }
      
      public function get honor() : int
      {
         return getInt("honor");
      }
      
      public function get gender() : String
      {
         return getString("gender");
      }
      
      public function get statTotalStamina() : int
      {
         return getInt("stat_total_stamina");
      }
      
      public function get statTotalStrength() : int
      {
         return getInt("stat_total_strength");
      }
      
      public function get statTotalCriticalRating() : int
      {
         return getInt("stat_total_critical_rating");
      }
      
      public function get statTotalDodgeRating() : int
      {
         return getInt("stat_total_dodge_rating");
      }
      
      public function get avatarImage() : String
      {
         return getString("avatar_image");
      }
      
      public function get onlineStatus() : int
      {
         return getInt("online_status");
      }
      
      public function get totalStats() : int
      {
         return getInt("total_stats");
      }
      
      public function get battleData() : String
      {
         return getString("battle_data");
      }
   }
}
