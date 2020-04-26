package com.playata.application.data.dataobject
{
   import com.playata.framework.data.DataObject;
   
   public class DOUserStory extends DataObject
   {
       
      
      public function DOUserStory(param1:Object)
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
      
      public function get characterId() : int
      {
         return getInt("character_id");
      }
      
      public function get characterName() : String
      {
         return getString("character_name");
      }
      
      public function get characterGender() : String
      {
         return getString("character_gender");
      }
      
      public function get serverId() : String
      {
         return getString("server_id");
      }
      
      public function get status() : int
      {
         return getInt("status");
      }
      
      public function get locale() : String
      {
         return getString("locale");
      }
      
      public function get stage() : int
      {
         return getInt("stage");
      }
      
      public function get tag() : int
      {
         return getInt("tag");
      }
      
      public function get title() : String
      {
         return getString("title");
      }
      
      public function get briefing() : String
      {
         return getString("briefing");
      }
      
      public function get outro() : String
      {
         return getString("outro");
      }
   }
}
