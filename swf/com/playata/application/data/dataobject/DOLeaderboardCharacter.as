package com.playata.application.data.dataobject
{
   import com.playata.framework.data.DataObject;
   
   public class DOLeaderboardCharacter extends DataObject
   {
       
      
      public function DOLeaderboardCharacter(param1:Object)
      {
         super(param1);
      }
      
      public function get rank() : int
      {
         return getInt("rank");
      }
      
      public function get id() : int
      {
         return getInt("id");
      }
      
      public function get honor() : int
      {
         return getInt("honor");
      }
      
      public function get name() : String
      {
         return getString("name");
      }
      
      public function get locale() : String
      {
         return getString("locale");
      }
      
      public function get title() : String
      {
         return getString("title");
      }
      
      public function get guildId() : int
      {
         return getInt("guild_id");
      }
      
      public function get guildName() : String
      {
         return getString("guild_name");
      }
      
      public function get emblemBackgroundShape() : int
      {
         return getInt("emblem_background_shape");
      }
      
      public function get emblemBackgroundColor() : int
      {
         return getInt("emblem_background_color");
      }
      
      public function get emblemBackgroundBorderColor() : int
      {
         return getInt("emblem_background_border_color");
      }
      
      public function get emblemIconShape() : int
      {
         return getInt("emblem_icon_shape");
      }
      
      public function get emblemIconColor() : int
      {
         return getInt("emblem_icon_color");
      }
      
      public function get emblemIconSize() : int
      {
         return getInt("emblem_icon_size");
      }
      
      public function get gender() : String
      {
         return getString("gender");
      }
      
      public function get level() : int
      {
         return getInt("level");
      }
      
      public function get value() : int
      {
         return getInt("value");
      }
      
      public function get onlineStatus() : int
      {
         return getInt("online_status");
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
      
      public function get fans() : int
      {
         return getInt("fans");
      }
      
      public function get movies() : int
      {
         return getInt("movies");
      }
      
      public function get battleData() : String
      {
         return getString("battle_data");
      }
   }
}
