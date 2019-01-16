package com.playata.application.data.constants
{
   import com.playata.framework.core.TypedObject;
   import com.playata.framework.data.constants.ConstantsData;
   
   public class CBooster extends ConstantsData
   {
      
      public static const CONSTANTS_KEY:String = "boosters";
      
      public static const ID_NAME:String = "identifier";
       
      
      public function CBooster(param1:TypedObject)
      {
         super(param1);
      }
      
      public static function get constantsData() : *
      {
         return ConstantsData.getConstantsData("boosters");
      }
      
      public static function get count() : int
      {
         return ConstantsData.getCount("boosters");
      }
      
      public static function get ids() : Vector.<String>
      {
         return ConstantsData.getStringVectorIds("boosters");
      }
      
      public static function exists(param1:String) : Boolean
      {
         return ConstantsData.getIdExists("boosters",param1);
      }
      
      public static function fromId(param1:String) : CBooster
      {
         return ConstantsData.getConstantsDataObject(param1,CBooster) as CBooster;
      }
      
      public function get identifier() : String
      {
         return getString("identifier");
      }
      
      public function get type() : int
      {
         return getInt("type");
      }
      
      public function get amount() : int
      {
         return getInt("amount");
      }
      
      public function get duration() : int
      {
         return getInt("duration");
      }
      
      public function get premiumItem() : Boolean
      {
         return getBoolean("premium_item");
      }
   }
}
