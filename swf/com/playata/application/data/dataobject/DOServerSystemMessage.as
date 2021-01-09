package com.playata.application.data.dataobject
{
   import com.playata.framework.data.DataObject;
   
   public class DOServerSystemMessage extends DataObject
   {
       
      
      public function DOServerSystemMessage(param1:Object)
      {
         super(param1);
      }
      
      public function get id() : int
      {
         return getInt("id");
      }
      
      public function get massSystemMessageId() : int
      {
         return getInt("mass_system_message_id");
      }
      
      public function get tsCreation() : int
      {
         return getInt("ts_creation");
      }
      
      public function get deleted() : Boolean
      {
         return getBoolean("deleted");
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
      
      public function get recipientSettings() : String
      {
         return getString("recipient_settings");
      }
      
      public function get sentCount() : int
      {
         return getInt("sent_count");
      }
      
      public function get readCount() : int
      {
         return getInt("read_count");
      }
      
      public function get clickCount() : int
      {
         return getInt("click_count");
      }
   }
}
