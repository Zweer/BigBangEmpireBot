package com.playata.application.data.constants
{
   import com.playata.framework.core.TypedObject;
   import com.playata.framework.data.constants.ConstantsData;
   
   public class CItemSetTemplate extends ConstantsData
   {
      
      public static const CONSTANTS_KEY:String = "item_set_templates";
      
      public static const ID_NAME:String = "identifier";
       
      
      public function CItemSetTemplate(param1:TypedObject)
      {
         super(param1);
      }
      
      public static function get constantsData() : *
      {
         return ConstantsData.getConstantsData("item_set_templates");
      }
      
      public static function get count() : int
      {
         return ConstantsData.getCount("item_set_templates");
      }
      
      public static function get ids() : Vector.<String>
      {
         return ConstantsData.getStringVectorIds("item_set_templates");
      }
      
      public static function exists(param1:String) : Boolean
      {
         return ConstantsData.getIdExists("item_set_templates",param1);
      }
      
      public static function fromId(param1:String) : CItemSetTemplate
      {
         return ConstantsData.getConstantsDataObject(param1,CItemSetTemplate) as CItemSetTemplate;
      }
      
      public function get identifier() : String
      {
         return getString("identifier");
      }
      
      public function get itemCount() : int
      {
         return getInt("item_count");
      }
      
      public function get bonusIds() : Vector.<int>
      {
         return getSubIntVectorIds("bonus");
      }
      
      public function hasBonusId(param1:int) : Boolean
      {
         return bonusIds.indexOf(param1) != -1;
      }
      
      public function getBonus(param1:int) : CItemSetTemplateBonus
      {
         return getSubData("bonus",identifier,param1,CItemSetTemplateBonus) as CItemSetTemplateBonus;
      }
   }
}
