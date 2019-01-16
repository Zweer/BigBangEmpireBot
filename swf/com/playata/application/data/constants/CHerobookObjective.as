package com.playata.application.data.constants
{
   import com.playata.framework.core.TypedObject;
   import com.playata.framework.data.constants.ConstantsData;
   
   public class CHerobookObjective extends ConstantsData
   {
      
      public static const CONSTANTS_KEY:String = "herobook_objectives";
      
      public static const ID_NAME:String = "identifier";
       
      
      public function CHerobookObjective(param1:TypedObject)
      {
         super(param1);
      }
      
      public static function get constantsData() : *
      {
         return ConstantsData.getConstantsData("herobook_objectives");
      }
      
      public static function get count() : int
      {
         return ConstantsData.getCount("herobook_objectives");
      }
      
      public static function get ids() : Vector.<String>
      {
         return ConstantsData.getStringVectorIds("herobook_objectives");
      }
      
      public static function exists(param1:String) : Boolean
      {
         return ConstantsData.getIdExists("herobook_objectives",param1);
      }
      
      public static function fromId(param1:String) : CHerobookObjective
      {
         return ConstantsData.getConstantsDataObject(param1,CHerobookObjective) as CHerobookObjective;
      }
      
      public function get identifier() : String
      {
         return getString("identifier");
      }
      
      public function get minLevel() : int
      {
         return getInt("min_level");
      }
      
      public function get scaling() : int
      {
         return getInt("scaling");
      }
      
      public function get daily() : int
      {
         return getInt("daily");
      }
      
      public function get weekly() : int
      {
         return getInt("weekly");
      }
      
      public function get variance() : int
      {
         return getInt("variance");
      }
      
      public function get type() : int
      {
         return getInt("type");
      }
      
      public function get reference() : String
      {
         return getString("reference");
      }
      
      public function get characterIdentifierM() : String
      {
         return getString("character_identifier_m");
      }
      
      public function get characterIdentifierF() : String
      {
         return getString("character_identifier_f");
      }
   }
}
