package com.playata.application.data.constants
{
   import com.playata.framework.core.TypedObject;
   import com.playata.framework.data.constants.ConstantsData;
   
   public class CTitle extends ConstantsData
   {
      
      public static const CONSTANTS_KEY:String = "titles";
      
      public static const ID_NAME:String = "identifier";
       
      
      public function CTitle(param1:TypedObject)
      {
         super(param1);
      }
      
      public static function get constantsData() : *
      {
         return ConstantsData.getConstantsData("titles");
      }
      
      public static function get count() : int
      {
         return ConstantsData.getCount("titles");
      }
      
      public static function get ids() : Vector.<String>
      {
         return ConstantsData.getStringVectorIds("titles");
      }
      
      public static function exists(param1:String) : Boolean
      {
         return ConstantsData.getIdExists("titles",param1);
      }
      
      public static function fromId(param1:String) : CTitle
      {
         return ConstantsData.getConstantsDataObject(param1,CTitle) as CTitle;
      }
      
      public function get identifier() : String
      {
         return getString("identifier");
      }
      
      public function get index() : int
      {
         return getInt("index");
      }
      
      public function get source() : int
      {
         return getInt("source");
      }
      
      public function get priceFactor() : Number
      {
         return getNumber("price_factor");
      }
      
      public function get pricePremium() : int
      {
         return getInt("price_premium");
      }
      
      public function get dropChance() : Number
      {
         return getNumber("drop_chance");
      }
      
      public function get minLevel() : int
      {
         return getInt("min_level");
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
