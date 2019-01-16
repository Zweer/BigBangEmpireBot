package com.playata.application.data.dataobject
{
   import com.playata.framework.data.DataObject;
   
   public class DOMessage extends DataObject
   {
       
      
      public function DOMessage(param1:Object)
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
      
      public function get characterFromId() : int
      {
         return getInt("character_from_id");
      }
      
      public function get characterToIds() : String
      {
         return getString("character_to_ids");
      }
      
      public function get subject() : String
      {
         return getString("subject");
      }
      
      public function get message() : String
      {
         return getString("message");
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
