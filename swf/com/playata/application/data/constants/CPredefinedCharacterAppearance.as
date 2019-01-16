package com.playata.application.data.constants
{
   import com.playata.framework.core.TypedObject;
   import com.playata.framework.data.constants.ConstantsData;
   
   public class CPredefinedCharacterAppearance extends ConstantsData
   {
      
      public static const CONSTANTS_KEY:String = "defined_character_appearances";
      
      public static const ID_NAME:String = "id";
       
      
      public function CPredefinedCharacterAppearance(param1:TypedObject)
      {
         super(param1);
      }
      
      public static function get constantsData() : *
      {
         return ConstantsData.getConstantsData("defined_character_appearances");
      }
      
      public static function get count() : int
      {
         return ConstantsData.getCount("defined_character_appearances");
      }
      
      public static function get ids() : Vector.<String>
      {
         return ConstantsData.getStringVectorIds("defined_character_appearances");
      }
      
      public static function exists(param1:String) : Boolean
      {
         return ConstantsData.getIdExists("defined_character_appearances",param1);
      }
      
      public static function fromId(param1:String) : CPredefinedCharacterAppearance
      {
         return ConstantsData.getConstantsDataObject(param1,CPredefinedCharacterAppearance) as CPredefinedCharacterAppearance;
      }
      
      public function get id() : String
      {
         return getString("id");
      }
      
      public function get appearanceHairType() : Vector.<int>
      {
         return getIntVector("appearance_hair_type");
      }
      
      public function get appearanceHeadType() : Vector.<int>
      {
         return getIntVector("appearance_head_type");
      }
      
      public function get appearanceEyesType() : Vector.<int>
      {
         return getIntVector("appearance_eyes_type");
      }
      
      public function get appearanceEyebrowsType() : Vector.<int>
      {
         return getIntVector("appearance_eyebrows_type");
      }
      
      public function get appearanceNoseType() : Vector.<int>
      {
         return getIntVector("appearance_nose_type");
      }
      
      public function get appearanceMouthType() : Vector.<int>
      {
         return getIntVector("appearance_mouth_type");
      }
      
      public function get appearanceFacialHairType() : Vector.<int>
      {
         return getIntVector("appearance_facial_hair_type");
      }
   }
}
