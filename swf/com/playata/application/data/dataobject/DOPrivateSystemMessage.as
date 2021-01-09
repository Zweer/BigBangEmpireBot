package com.playata.application.data.dataobject
{
   import com.playata.framework.data.DataObject;
   
   public class DOPrivateSystemMessage extends DataObject
   {
       
      
      public function DOPrivateSystemMessage(param1:Object)
      {
         super(param1);
      }
      
      public function get id() : int
      {
         return getInt("id");
      }
      
      public function get characterId() : int
      {
         return getInt("character_id");
      }
      
      public function get tsCreation() : int
      {
         return getInt("ts_creation");
      }
      
      public function get status() : int
      {
         return getInt("status");
      }
      
      public function get subject() : String
      {
         return getString("subject");
      }
      
      public function get message() : String
      {
         return getString("message");
      }
      
      public function get html() : Boolean
      {
         return getBoolean("html");
      }
      
      public function get flag() : String
      {
         return getString("flag");
      }
      
      public function get flagValue() : String
      {
         return getString("flag_value");
      }
   }
}
