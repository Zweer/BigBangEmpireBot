package com.playata.application.data.dataobject
{
   import com.playata.framework.data.DataObject;
   
   public class DOPrivateConversationMessage extends DataObject
   {
       
      
      public function DOPrivateConversationMessage(param1:Object)
      {
         super(param1);
      }
      
      public function get id() : int
      {
         return getInt("id");
      }
      
      public function get privateConversationId() : int
      {
         return getInt("private_conversation_id");
      }
      
      public function get tsCreation() : int
      {
         return getInt("ts_creation");
      }
      
      public function get characterFromId() : int
      {
         return getInt("character_from_id");
      }
      
      public function get message() : String
      {
         return getString("message");
      }
   }
}
