package com.playata.application.data.constants
{
   import com.playata.framework.core.TypedObject;
   import com.playata.framework.data.constants.ConstantsData;
   
   public class CStreamingSetting extends ConstantsData
   {
      
      public static const CONSTANTS_KEY:String = "streaming_settings";
      
      public static const ID_NAME:String = "id";
       
      
      public function CStreamingSetting(param1:TypedObject)
      {
         super(param1);
      }
      
      public static function get constantsData() : *
      {
         return ConstantsData.getConstantsData("streaming_settings");
      }
      
      public static function get count() : int
      {
         return ConstantsData.getCount("streaming_settings");
      }
      
      public static function get ids() : Vector.<int>
      {
         return ConstantsData.getIntVectorIds("streaming_settings");
      }
      
      public static function exists(param1:int) : Boolean
      {
         return ConstantsData.getIdExists("streaming_settings",param1);
      }
      
      public static function fromId(param1:int) : CStreamingSetting
      {
         return ConstantsData.getConstantsDataObject(param1,CStreamingSetting) as CStreamingSetting;
      }
      
      public function get id() : int
      {
         return getInt("id");
      }
      
      public function get identifier() : String
      {
         return getString("identifier");
      }
      
      public function get relativeChance() : int
      {
         return getInt("relative_chance");
      }
      
      public function get unlockType() : int
      {
         return getInt("unlock_type");
      }
      
      public function get unlockValue() : int
      {
         return getInt("unlock_value");
      }
      
      public function get durationMultiplier() : Number
      {
         return getNumber("duration_multiplier");
      }
      
      public function get rewardMultiplier() : Number
      {
         return getNumber("reward_multiplier");
      }
      
      public function get warforgeSource() : int
      {
         return getInt("warforge_source");
      }
   }
}
