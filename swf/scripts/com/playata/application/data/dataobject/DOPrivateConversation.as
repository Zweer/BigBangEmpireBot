package com.playata.application.data.dataobject
{
   import com.playata.framework.data.DataObject;
   
   public class DOPrivateConversation extends DataObject
   {
       
      
      public function DOPrivateConversation(param1:Object)
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
      
      public function get tsLastAction() : int
      {
         return getInt("ts_last_action");
      }
      
      public function get status() : int
      {
         return getInt("status");
      }
      
      public function get characterCreatorId() : int
      {
         return getInt("character_creator_id");
      }
      
      public function get characterMemberIds() : String
      {
         return getString("character_member_ids");
      }
      
      public function get firstAvailableMessageIds() : String
      {
         return getString("first_available_message_ids");
      }
      
      public function get firstMessageId() : int
      {
         return getInt("first_message_id");
      }
      
      public function get lastMessageId() : int
      {
         return getInt("last_message_id");
      }
      
      public function get lastSenderCharacterId() : int
      {
         return getInt("last_sender_character_id");
      }
      
      public function get title() : String
      {
         return getString("title");
      }
      
      public function get conversationKey() : String
      {
         return getString("conversation_key");
      }
      
      public function get isGroup() : Boolean
      {
         return getBoolean("is_group");
      }
   }
}
