package com.playata.application.data.dataobject
{
   import com.playata.framework.data.DataObject;
   
   public class DOGuild extends DataObject
   {
       
      
      public function DOGuild(param1:Object)
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
      
      public function get initiatorCharacterId() : int
      {
         return getInt("initiator_character_id");
      }
      
      public function get leaderCharacterId() : int
      {
         return getInt("leader_character_id");
      }
      
      public function get name() : String
      {
         return getString("name");
      }
      
      public function get description() : String
      {
         return getString("description");
      }
      
      public function get note() : String
      {
         return getString("note");
      }
      
      public function get officerNote() : String
      {
         return getString("officer_note");
      }
      
      public function get forumPage() : String
      {
         return getString("forum_page");
      }
      
      public function get premiumCurrency() : int
      {
         return getInt("premium_currency");
      }
      
      public function get gameCurrency() : int
      {
         return getInt("game_currency");
      }
      
      public function get status() : int
      {
         return getInt("status");
      }
      
      public function get acceptMembers() : Boolean
      {
         return getBoolean("accept_members");
      }
      
      public function get locale() : String
      {
         return getString("locale");
      }
      
      public function get pendingGuildBattleAttackId() : int
      {
         return getInt("pending_guild_battle_attack_id");
      }
      
      public function get pendingGuildBattleDefenseId() : int
      {
         return getInt("pending_guild_battle_defense_id");
      }
      
      public function get honor() : int
      {
         return getInt("honor");
      }
      
      public function get artifactIds() : String
      {
         return getString("artifact_ids");
      }
      
      public function get missiles() : int
      {
         return getInt("missiles");
      }
      
      public function get autoJoins() : int
      {
         return getInt("auto_joins");
      }
      
      public function get battlesFought() : int
      {
         return getInt("battles_fought");
      }
      
      public function get battlesAttacked() : int
      {
         return getInt("battles_attacked");
      }
      
      public function get battlesDefended() : int
      {
         return getInt("battles_defended");
      }
      
      public function get battlesWon() : int
      {
         return getInt("battles_won");
      }
      
      public function get battlesLost() : int
      {
         return getInt("battles_lost");
      }
      
      public function get artifactsWon() : int
      {
         return getInt("artifacts_won");
      }
      
      public function get artifactsLost() : int
      {
         return getInt("artifacts_lost");
      }
      
      public function get artifactsOwnedMax() : int
      {
         return getInt("artifacts_owned_max");
      }
      
      public function get artifactsOwnedCurrent() : int
      {
         return getInt("artifacts_owned_current");
      }
      
      public function get tsLastArtifactReleased() : int
      {
         return getInt("ts_last_artifact_released");
      }
      
      public function get missilesFired() : int
      {
         return getInt("missiles_fired");
      }
      
      public function get autoJoinsUsed() : int
      {
         return getInt("auto_joins_used");
      }
      
      public function get statPointsAvailable() : int
      {
         return getInt("stat_points_available");
      }
      
      public function get statGuildCapacity() : int
      {
         return getInt("stat_guild_capacity");
      }
      
      public function get statCharacterBaseStatsBoost() : int
      {
         return getInt("stat_character_base_stats_boost");
      }
      
      public function get statQuestXpRewardBoost() : int
      {
         return getInt("stat_quest_xp_reward_boost");
      }
      
      public function get statQuestGameCurrencyRewardBoost() : int
      {
         return getInt("stat_quest_game_currency_reward_boost");
      }
      
      public function get arenaBackground() : int
      {
         return getInt("arena_background");
      }
      
      public function get emblemBackgroundShape() : int
      {
         return getInt("emblem_background_shape");
      }
      
      public function get emblemBackgroundColor() : int
      {
         return getInt("emblem_background_color");
      }
      
      public function get emblemBackgroundBorderColor() : int
      {
         return getInt("emblem_background_border_color");
      }
      
      public function get emblemIconShape() : int
      {
         return getInt("emblem_icon_shape");
      }
      
      public function get emblemIconColor() : int
      {
         return getInt("emblem_icon_color");
      }
      
      public function get emblemIconSize() : int
      {
         return getInt("emblem_icon_size");
      }
      
      public function get studioRoom() : String
      {
         return getString("studio_room");
      }
      
      public function get studioQuarter() : String
      {
         return getString("studio_quarter");
      }
      
      public function get studioPopularity() : String
      {
         return getString("studio_popularity");
      }
      
      public function get studioMotivation() : String
      {
         return getString("studio_motivation");
      }
      
      public function get studioEquipment() : String
      {
         return getString("studio_equipment");
      }
      
      public function get studioActorsLeft() : String
      {
         return getString("studio_actors_left");
      }
      
      public function get studioActorsRight() : String
      {
         return getString("studio_actors_right");
      }
      
      public function get studioFreeCustomizations() : String
      {
         return getString("studio_free_customizations");
      }
      
      public function get useMissilesAttack() : Boolean
      {
         return getBoolean("use_missiles_attack");
      }
      
      public function get useMissilesDefense() : Boolean
      {
         return getBoolean("use_missiles_defense");
      }
      
      public function get useAutoJoinsAttack() : Boolean
      {
         return getBoolean("use_auto_joins_attack");
      }
      
      public function get useAutoJoinsDefense() : Boolean
      {
         return getBoolean("use_auto_joins_defense");
      }
      
      public function get pendingLeaderVoteId() : int
      {
         return getInt("pending_leader_vote_id");
      }
      
      public function get minApplyLevel() : int
      {
         return getInt("min_apply_level");
      }
      
      public function get minApplyHonor() : int
      {
         return getInt("min_apply_honor");
      }
      
      public function get applyOpen() : Boolean
      {
         return getBoolean("apply_open");
      }
      
      public function get applyOpenMail() : Boolean
      {
         return getBoolean("apply_open_mail");
      }
      
      public function get movies() : int
      {
         return getInt("movies");
      }
      
      public function get fans() : int
      {
         return getInt("fans");
      }
      
      public function get activeQuestBoosterId() : String
      {
         return getString("active_quest_booster_id");
      }
      
      public function get tsActiveQuestBoostExpires() : int
      {
         return getInt("ts_active_quest_boost_expires");
      }
      
      public function get activeDuelBoosterId() : String
      {
         return getString("active_duel_booster_id");
      }
      
      public function get tsActiveDuelBoostExpires() : int
      {
         return getInt("ts_active_duel_boost_expires");
      }
   }
}
