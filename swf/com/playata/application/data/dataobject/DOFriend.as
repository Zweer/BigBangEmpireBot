package com.playata.application.data.dataobject
{
   import com.playata.framework.data.DataObject;
   
   public class DOFriend extends DataObject
   {
       
      
      public function DOFriend(param1:Object)
      {
         super(param1);
      }
      
      public function get userId() : int
      {
         return getInt("user_id");
      }
      
      public function get characterId() : int
      {
         return getInt("character_id");
      }
      
      public function get characterName() : String
      {
         return getString("character_name");
      }
      
      public function get characterLevel() : int
      {
         return getInt("character_level");
      }
      
      public function get characterOnline() : Boolean
      {
         return getBoolean("character_online");
      }
      
      public function get avatarImage() : String
      {
         return getString("avatar_image");
      }
      
      public function get platformUserId() : String
      {
         return getString("platform_user_id");
      }
      
      public function get platformName() : String
      {
         return getString("platform_name");
      }
      
      public function get platformImageUrl() : String
      {
         return getString("platform_image_url");
      }
      
      public function get platformImageWidth() : int
      {
         return getInt("platform_image_width");
      }
      
      public function get platformImageHeight() : int
      {
         return getInt("platform_image_height");
      }
      
      public function get isFriend() : Boolean
      {
         return getBoolean("is_friend");
      }
      
      public function get isGuildMember() : Boolean
      {
         return getBoolean("is_guild_member");
      }
   }
}
