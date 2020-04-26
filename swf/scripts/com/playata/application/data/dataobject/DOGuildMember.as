package com.playata.application.data.dataobject
{
   import com.playata.framework.data.DataObject;
   
   public class DOGuildMember extends DataObject
   {
       
      
      public function DOGuildMember(param1:Object)
      {
         super(param1);
      }
      
      public function get id() : int
      {
         return getInt("id");
      }
      
      public function get userId() : int
      {
         return getInt("user_id");
      }
      
      public function get serverId() : String
      {
         return getString("server_id");
      }
      
      public function get name() : String
      {
         return getString("name");
      }
      
      public function get title() : String
      {
         return getString("title");
      }
      
      public function get gender() : String
      {
         return getString("gender");
      }
      
      public function get level() : int
      {
         return getInt("level");
      }
      
      public function get honor() : int
      {
         return getInt("honor");
      }
      
      public function get guildRank() : int
      {
         return getInt("guild_rank");
      }
      
      public function get tsGuildJoined() : int
      {
         return getInt("ts_guild_joined");
      }
      
      public function get tsLastOnline() : int
      {
         return getInt("ts_last_online");
      }
      
      public function get lastAction() : int
      {
         return getInt("last_action");
      }
      
      public function get onlineStatus() : int
      {
         return getInt("online_status");
      }
      
      public function get gameCurrencyDonation() : int
      {
         return getInt("game_currency_donation");
      }
      
      public function get premiumCurrencyDonation() : int
      {
         return getInt("premium_currency_donation");
      }
      
      public function get guildCompetitionPointsGathered() : int
      {
         return getInt("guild_competition_points_gathered");
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
      
      public function get battleData() : String
      {
         return getString("battle_data");
      }
   }
}
