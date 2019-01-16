package com.playata.application.data.constants
{
   import com.playata.framework.core.TypedObject;
   import com.playata.framework.data.constants.ConstantsData;
   
   public class CDungeonQuestTemplate extends ConstantsData
   {
      
      public static const CONSTANTS_KEY:String = "dungeon_quest_templates";
      
      public static const ID_NAME:String = "identifier";
       
      
      public function CDungeonQuestTemplate(param1:TypedObject)
      {
         super(param1);
      }
      
      public static function get constantsData() : *
      {
         return ConstantsData.getConstantsData("dungeon_quest_templates");
      }
      
      public static function get count() : int
      {
         return ConstantsData.getCount("dungeon_quest_templates");
      }
      
      public static function get ids() : Vector.<String>
      {
         return ConstantsData.getStringVectorIds("dungeon_quest_templates");
      }
      
      public static function exists(param1:String) : Boolean
      {
         return ConstantsData.getIdExists("dungeon_quest_templates",param1);
      }
      
      public static function fromId(param1:String) : CDungeonQuestTemplate
      {
         return ConstantsData.getConstantsDataObject(param1,CDungeonQuestTemplate) as CDungeonQuestTemplate;
      }
      
      public function get identifier() : String
      {
         return getString("identifier");
      }
      
      public function get level() : int
      {
         return getInt("level");
      }
      
      public function get type() : int
      {
         return getInt("type");
      }
      
      public function get stat() : int
      {
         return getInt("stat");
      }
      
      public function get statDifficulty() : int
      {
         return getInt("stat_difficulty");
      }
      
      public function get npcIdentifierM() : String
      {
         return getString("npc_identifier_m");
      }
      
      public function get npcIdentifierF() : String
      {
         return getString("npc_identifier_f");
      }
      
      public function get npcItemsCommons() : int
      {
         return getInt("npc_items_commons");
      }
      
      public function get npcItemsRares() : int
      {
         return getInt("npc_items_rares");
      }
      
      public function get npcItemsEpics() : int
      {
         return getInt("npc_items_epics");
      }
      
      public function get difficultyMultiplier() : Number
      {
         return getNumber("difficulty_multiplier");
      }
      
      public function get rewardMultiplier() : Number
      {
         return getNumber("reward_multiplier");
      }
      
      public function get rewardItemIdentifier() : String
      {
         return getString("reward_item_identifier");
      }
      
      public function get rewardItemLevelOffset() : int
      {
         return getInt("reward_item_level_offset");
      }
      
      public function get isBoss() : Boolean
      {
         return getBoolean("is_boss");
      }
      
      public function get index() : int
      {
         return getInt("index");
      }
   }
}
