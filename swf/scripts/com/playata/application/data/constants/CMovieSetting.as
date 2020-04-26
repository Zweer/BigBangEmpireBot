package com.playata.application.data.constants
{
   import com.playata.framework.core.TypedObject;
   import com.playata.framework.data.constants.ConstantsData;
   
   public class CMovieSetting extends ConstantsData
   {
      
      public static const CONSTANTS_KEY:String = "movie_settings";
      
      public static const ID_NAME:String = "identifier";
       
      
      public function CMovieSetting(param1:TypedObject)
      {
         super(param1);
      }
      
      public static function get constantsData() : *
      {
         return ConstantsData.getConstantsData("movie_settings");
      }
      
      public static function get count() : int
      {
         return ConstantsData.getCount("movie_settings");
      }
      
      public static function get ids() : Vector.<String>
      {
         return ConstantsData.getStringVectorIds("movie_settings");
      }
      
      public static function exists(param1:String) : Boolean
      {
         return ConstantsData.getIdExists("movie_settings",param1);
      }
      
      public static function fromId(param1:String) : CMovieSetting
      {
         return ConstantsData.getConstantsDataObject(param1,CMovieSetting) as CMovieSetting;
      }
      
      public function get identifier() : String
      {
         return getString("identifier");
      }
      
      public function get stat() : int
      {
         return getInt("stat");
      }
      
      public function get requiredGuildLevel() : int
      {
         return getInt("required_guild_level");
      }
      
      public function get specialFactor() : Number
      {
         return getNumber("special_factor");
      }
      
      public function get rewardFactor() : Number
      {
         return getNumber("reward_factor");
      }
      
      public function get layers() : Vector.<String>
      {
         return getStringVector("layers");
      }
      
      public function get tsAvailabilityStart() : String
      {
         return getString("ts_availability_start");
      }
      
      public function get tsAvailabilityEnd() : String
      {
         return getString("ts_availability_end");
      }
   }
}
