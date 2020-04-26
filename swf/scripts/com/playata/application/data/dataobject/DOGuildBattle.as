package com.playata.application.data.dataobject
{
   import com.playata.framework.data.DataObject;
   
   public class DOGuildBattle extends DataObject
   {
       
      
      public function DOGuildBattle(param1:Object)
      {
         super(param1);
      }
      
      public function get id() : int
      {
         return getInt("id");
      }
      
      public function get initiatorCharacterId() : int
      {
         return getInt("initiator_character_id");
      }
      
      public function get battleTime() : int
      {
         return getInt("battle_time");
      }
      
      public function get tsAttack() : int
      {
         return getInt("ts_attack");
      }
      
      public function get guildAttackerId() : int
      {
         return getInt("guild_attacker_id");
      }
      
      public function get guildDefenderId() : int
      {
         return getInt("guild_defender_id");
      }
      
      public function get guildWinnerId() : int
      {
         return getInt("guild_winner_id");
      }
      
      public function get status() : int
      {
         return getInt("status");
      }
      
      public function get attackerCharacterIds() : String
      {
         return getString("attacker_character_ids");
      }
      
      public function get defenderCharacterIds() : String
      {
         return getString("defender_character_ids");
      }
      
      public function get attackerCharacterProfiles() : String
      {
         return getString("attacker_character_profiles");
      }
      
      public function get defenderCharacterProfiles() : String
      {
         return getString("defender_character_profiles");
      }
      
      public function get rounds() : String
      {
         return getString("rounds");
      }
      
      public function get attackerRewards() : String
      {
         return getString("attacker_rewards");
      }
      
      public function get defenderRewards() : String
      {
         return getString("defender_rewards");
      }
   }
}
