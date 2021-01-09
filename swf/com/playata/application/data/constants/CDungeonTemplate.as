package com.playata.application.data.constants
{
   import com.playata.framework.core.TypedObject;
   import com.playata.framework.data.constants.ConstantsData;
   
   public class CDungeonTemplate extends ConstantsData
   {
      
      public static const CONSTANTS_KEY:String = "dungeon_templates";
      
      public static const ID_NAME:String = "identifier";
       
      
      public function CDungeonTemplate(param1:TypedObject)
      {
         super(param1);
      }
      
      public static function get constantsData() : *
      {
         return ConstantsData.getConstantsData("dungeon_templates");
      }
      
      public static function get count() : int
      {
         return ConstantsData.getCount("dungeon_templates");
      }
      
      public static function get ids() : Vector.<String>
      {
         return ConstantsData.getStringVectorIds("dungeon_templates");
      }
      
      public static function exists(param1:String) : Boolean
      {
         return ConstantsData.getIdExists("dungeon_templates",param1);
      }
      
      public static function fromId(param1:String) : CDungeonTemplate
      {
         return ConstantsData.getConstantsDataObject(param1,CDungeonTemplate) as CDungeonTemplate;
      }
      
      public function get identifier() : String
      {
         return getString("identifier");
      }
      
      public function get duration() : int
      {
         return getInt("duration");
      }
      
      public function get unlockPremiumAmount() : int
      {
         return getInt("unlock_premium_amount");
      }
      
      public function get levelIds() : Vector.<int>
      {
         return getSubIntVectorIds("levels");
      }
      
      public function hasLevelId(param1:int) : Boolean
      {
         return levelIds.indexOf(param1) != -1;
      }
      
      public function getLevel(param1:int) : CDungeonTemplateLevel
      {
         return getSubData("levels",identifier,param1,CDungeonTemplateLevel) as CDungeonTemplateLevel;
      }
   }
}
