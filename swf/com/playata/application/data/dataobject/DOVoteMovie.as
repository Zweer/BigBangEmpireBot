package com.playata.application.data.dataobject
{
   import com.playata.framework.data.DataObject;
   
   public class DOVoteMovie extends DataObject
   {
       
      
      public function DOVoteMovie(param1:Object)
      {
         super(param1);
      }
      
      public function get id() : int
      {
         return getInt("id");
      }
      
      public function get guildName() : String
      {
         return getString("guild_name");
      }
      
      public function get characterName() : String
      {
         return getString("character_name");
      }
      
      public function get set() : String
      {
         return getString("set");
      }
      
      public function get title() : String
      {
         return getString("title");
      }
      
      public function get customTitle() : String
      {
         return getString("custom_title");
      }
      
      public function get cover() : String
      {
         return getString("cover");
      }
      
      public function get tsCompleted() : int
      {
         return getInt("ts_completed");
      }
   }
}
