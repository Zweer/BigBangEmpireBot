package com.playata.application.data.constants
{
   import com.playata.framework.core.TypedObject;
   import com.playata.framework.data.constants.ConstantsData;
   
   public class CQuestTemplate extends ConstantsData
   {
      
      public static const CONSTANTS_KEY:String = "quest_templates";
      
      public static const ID_NAME:String = "identifier";
       
      
      public function CQuestTemplate(param1:TypedObject)
      {
         super(param1);
      }
      
      public static function get constantsData() : *
      {
         return ConstantsData.getConstantsData("quest_templates");
      }
      
      public static function get count() : int
      {
         return ConstantsData.getCount("quest_templates");
      }
      
      public static function get ids() : Vector.<String>
      {
         return ConstantsData.getStringVectorIds("quest_templates");
      }
      
      public static function exists(param1:String) : Boolean
      {
         return ConstantsData.getIdExists("quest_templates",param1);
      }
      
      public static function fromId(param1:String) : CQuestTemplate
      {
         return ConstantsData.getConstantsDataObject(param1,CQuestTemplate) as CQuestTemplate;
      }
      
      public function get identifier() : String
      {
         return getString("identifier");
      }
      
      public function get type() : int
      {
         return getInt("type");
      }
      
      public function get stat() : int
      {
         return getInt("stat");
      }
      
      public function get gender() : String
      {
         return getString("gender");
      }
      
      public function get stage() : int
      {
         return getInt("stage");
      }
      
      public function get level() : int
      {
         return getInt("level");
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
      
      public function get tsAvailabilityStart() : String
      {
         return getString("ts_availability_start");
      }
      
      public function get tsAvailabilityEnd() : String
      {
         return getString("ts_availability_end");
      }
      
      public function get effect() : String
      {
         return getString("effect");
      }
      
      public function get visibleOnMap() : Boolean
      {
         return getBoolean("visible_on_map");
      }
      
      public function get unlockAfterStoryDungeonIndex() : int
      {
         return getInt("unlock_after_story_dungeon_index");
      }
   }
}
