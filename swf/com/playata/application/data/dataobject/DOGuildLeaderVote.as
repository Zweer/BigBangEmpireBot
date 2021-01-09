package com.playata.application.data.dataobject
{
   import com.playata.framework.data.DataObject;
   
   public class DOGuildLeaderVote extends DataObject
   {
       
      
      public function DOGuildLeaderVote(param1:Object)
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
      
      public function get status() : int
      {
         return getInt("status");
      }
      
      public function get guildId() : int
      {
         return getInt("guild_id");
      }
      
      public function get initiatorCharacterId() : int
      {
         return getInt("initiator_character_id");
      }
      
      public function get allowedCharacterIds() : String
      {
         return getString("allowed_character_ids");
      }
      
      public function get voteResults() : String
      {
         return getString("vote_results");
      }
      
      public function get currentLeaderCharacterId() : int
      {
         return getInt("current_leader_character_id");
      }
      
      public function get newLeaderCharacterId() : int
      {
         return getInt("new_leader_character_id");
      }
   }
}
