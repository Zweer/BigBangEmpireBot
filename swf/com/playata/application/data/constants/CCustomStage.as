package com.playata.application.data.constants
{
   import com.playata.framework.core.TypedObject;
   import com.playata.framework.data.constants.ConstantsData;
   
   public class CCustomStage extends ConstantsData
   {
      
      public static const CONSTANTS_KEY:String = "custom_stages";
      
      public static const ID_NAME:String = "identifier";
       
      
      public function CCustomStage(param1:TypedObject)
      {
         super(param1);
      }
      
      public static function get constantsData() : *
      {
         return ConstantsData.getConstantsData("custom_stages");
      }
      
      public static function get count() : int
      {
         return ConstantsData.getCount("custom_stages");
      }
      
      public static function get ids() : Vector.<String>
      {
         return ConstantsData.getStringVectorIds("custom_stages");
      }
      
      public static function exists(param1:String) : Boolean
      {
         return ConstantsData.getIdExists("custom_stages",param1);
      }
      
      public static function fromId(param1:String) : CCustomStage
      {
         return ConstantsData.getConstantsDataObject(param1,CCustomStage) as CCustomStage;
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
      
      public function get locales() : Vector.<String>
      {
         return getStringVector("locales");
      }
   }
}
