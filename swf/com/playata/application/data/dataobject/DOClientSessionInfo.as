package com.playata.application.data.dataobject
{
   import com.playata.framework.data.DataObject;
   
   public class DOClientSessionInfo extends DataObject
   {
       
      
      public function DOClientSessionInfo(param1:Object)
      {
         super(param1);
      }
      
      public function get userId() : int
      {
         return getInt("user_id");
      }
      
      public function get guildId() : int
      {
         return getInt("guild_id");
      }
      
      public function get guildIsOfficer() : Boolean
      {
         return getBoolean("guild_is_officer");
      }
      
      public function get conventionId() : int
      {
         return getInt("convention_id");
      }
      
      public function get friendCharacterIds() : Array
      {
         return getArray("friend_character_ids");
      }
   }
}
