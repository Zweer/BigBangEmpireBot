package com.playata.application.data.constants
{
   import com.playata.framework.core.TypedObject;
   import com.playata.framework.data.constants.ConstantsData;
   
   public class CItemPattern extends ConstantsData
   {
      
      public static const CONSTANTS_KEY:String = "item_pattern";
      
      public static const ID_NAME:String = "identifier";
       
      
      public function CItemPattern(param1:TypedObject)
      {
         super(param1);
      }
      
      public static function get constantsData() : *
      {
         return ConstantsData.getConstantsData("item_pattern");
      }
      
      public static function get count() : int
      {
         return ConstantsData.getCount("item_pattern");
      }
      
      public static function get ids() : Vector.<String>
      {
         return ConstantsData.getStringVectorIds("item_pattern");
      }
      
      public static function exists(param1:String) : Boolean
      {
         return ConstantsData.getIdExists("item_pattern",param1);
      }
      
      public static function fromId(param1:String) : CItemPattern
      {
         return ConstantsData.getConstantsDataObject(param1,CItemPattern) as CItemPattern;
      }
      
      public function get identifier() : String
      {
         return getString("identifier");
      }
      
      public function get active() : Boolean
      {
         return getBoolean("active");
      }
      
      public function get lookupColumn() : String
      {
         return getString("lookup_column");
      }
      
      public function get tsAvailabilityStart() : String
      {
         return getString("ts_availability_start");
      }
      
      public function get tsAvailabilityEnd() : String
      {
         return getString("ts_availability_end");
      }
      
      public function get valueIds() : Vector.<int>
      {
         return getSubIntVectorIds("values");
      }
      
      public function hasValueId(param1:int) : Boolean
      {
         return valueIds.indexOf(param1) != -1;
      }
      
      public function getValue(param1:int) : CItemPatternValue
      {
         return getSubData("values",identifier,param1,CItemPatternValue) as CItemPatternValue;
      }
   }
}
