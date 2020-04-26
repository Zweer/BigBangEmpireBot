package com.playata.application.data.constants
{
   import com.playata.framework.core.TypedObject;
   import com.playata.framework.data.constants.ConstantsData;
   
   public class CStoryDungeon extends ConstantsData
   {
      
      public static const CONSTANTS_KEY:String = "story_dungeons";
      
      public static const ID_NAME:String = "index";
       
      
      public function CStoryDungeon(param1:TypedObject)
      {
         super(param1);
      }
      
      public static function get constantsData() : *
      {
         return ConstantsData.getConstantsData("story_dungeons");
      }
      
      public static function get count() : int
      {
         return ConstantsData.getCount("story_dungeons");
      }
      
      public static function get ids() : Vector.<int>
      {
         return ConstantsData.getIntVectorIds("story_dungeons");
      }
      
      public static function exists(param1:int) : Boolean
      {
         return ConstantsData.getIdExists("story_dungeons",param1);
      }
      
      public static function fromId(param1:int) : CStoryDungeon
      {
         return ConstantsData.getConstantsDataObject(param1,CStoryDungeon) as CStoryDungeon;
      }
      
      public function get index() : int
      {
         return getInt("index");
      }
      
      public function get identifier() : String
      {
         return getString("identifier");
      }
      
      public function get stage() : int
      {
         return getInt("stage");
      }
      
      public function get minLevel() : int
      {
         return getInt("min_level");
      }
      
      public function get unlockPointsNeeded() : int
      {
         return getInt("unlock_points_needed");
      }
      
      public function get unlockPointChance() : int
      {
         return getInt("unlock_point_chance");
      }
      
      public function get unlockQuests() : String
      {
         return getString("unlock_quests");
      }
      
      public function get unlockQuestChance() : int
      {
         return getInt("unlock_quest_chance");
      }
      
      public function get npcIdentifierMId() : String
      {
         return getString("npc_identifier_m");
      }
      
      public function get npcIdentifierM() : CNPC
      {
         return CNPC.fromId(getId("npc_identifier_m"));
      }
      
      public function get npcIdentifierFId() : String
      {
         return getString("npc_identifier_f");
      }
      
      public function get npcIdentifierF() : CNPC
      {
         return CNPC.fromId(getId("npc_identifier_f"));
      }
      
      public function get npcLevel() : int
      {
         return getInt("npc_level");
      }
      
      public function get npcStatStamina() : int
      {
         return getInt("npc_stat_stamina");
      }
      
      public function get npcStatStrength() : int
      {
         return getInt("npc_stat_strength");
      }
      
      public function get npcStatCriticalRating() : int
      {
         return getInt("npc_stat_critical_rating");
      }
      
      public function get npcStatDodgeRating() : int
      {
         return getInt("npc_stat_dodge_rating");
      }
      
      public function get npcStatWeaponDamage() : int
      {
         return getInt("npc_stat_weapon_damage");
      }
      
      public function get npcBattleEffects() : String
      {
         return getString("npc_battle_effects");
      }
      
      public function get rewardItemIdentifierMId() : String
      {
         return getString("reward_item_identifier_m");
      }
      
      public function get rewardItemIdentifierM() : CItemTemplate
      {
         return CItemTemplate.fromId(getId("reward_item_identifier_m"));
      }
      
      public function get rewardItemIdentifierFId() : String
      {
         return getString("reward_item_identifier_f");
      }
      
      public function get rewardItemIdentifierF() : CItemTemplate
      {
         return CItemTemplate.fromId(getId("reward_item_identifier_f"));
      }
      
      public function get rewardItemLevelOffset() : int
      {
         return getInt("reward_item_level_offset");
      }
      
      public function get statPointReward() : int
      {
         return getInt("stat_point_reward");
      }
      
      public function get skipPrice() : int
      {
         return getInt("skip_price");
      }
      
      public function get minLevelRepeat() : int
      {
         return getInt("min_level_repeat");
      }
      
      public function get unlockPointsNeededRepeat() : int
      {
         return getInt("unlock_points_needed_repeat");
      }
      
      public function get unlockPointChanceRepeat() : int
      {
         return getInt("unlock_point_chance_repeat");
      }
      
      public function get unlockQuestChanceRepeat() : int
      {
         return getInt("unlock_quest_chance_repeat");
      }
      
      public function get rewardItemLevelOffsetRepeat() : int
      {
         return getInt("reward_item_level_offset_repeat");
      }
      
      public function get statPointRewardRepeat() : int
      {
         return getInt("stat_point_reward_repeat");
      }
      
      public function get skipPriceRepeat() : int
      {
         return getInt("skip_price_repeat");
      }
   }
}
