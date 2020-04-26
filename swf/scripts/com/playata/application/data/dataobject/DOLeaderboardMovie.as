package com.playata.application.data.dataobject
{
   import com.playata.framework.data.DataObject;
   
   public class DOLeaderboardMovie extends DataObject
   {
       
      
      public function DOLeaderboardMovie(param1:Object)
      {
         super(param1);
      }
      
      public function get rank() : int
      {
         return getInt("rank");
      }
      
      public function get visibleRank() : int
      {
         return getInt("visible_rank");
      }
      
      public function get id() : int
      {
         return getInt("id");
      }
      
      public function get title() : String
      {
         return getString("title");
      }
      
      public function get cover() : String
      {
         return getString("cover");
      }
      
      public function get characterId() : int
      {
         return getInt("character_id");
      }
      
      public function get characterName() : String
      {
         return getString("character_name");
      }
      
      public function get characterTitle() : String
      {
         return getString("character_title");
      }
      
      public function get characterOnlineStatus() : int
      {
         return getInt("character_online_status");
      }
      
      public function get characterGender() : String
      {
         return getString("character_gender");
      }
      
      public function get guildId() : int
      {
         return getInt("guild_id");
      }
      
      public function get guildName() : String
      {
         return getString("guild_name");
      }
   }
}
