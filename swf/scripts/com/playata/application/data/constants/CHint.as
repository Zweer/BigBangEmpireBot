package com.playata.application.data.constants
{
   import com.playata.framework.core.TypedObject;
   import com.playata.framework.data.constants.ConstantsData;
   
   public class CHint extends ConstantsData
   {
      
      public static const CONSTANTS_KEY:String = "hints";
      
      public static const ID_NAME:String = "identifier";
       
      
      public function CHint(param1:TypedObject)
      {
         super(param1);
      }
      
      public static function get constantsData() : *
      {
         return ConstantsData.getConstantsData("hints");
      }
      
      public static function get count() : int
      {
         return ConstantsData.getCount("hints");
      }
      
      public static function get ids() : Vector.<String>
      {
         return ConstantsData.getStringVectorIds("hints");
      }
      
      public static function exists(param1:String) : Boolean
      {
         return ConstantsData.getIdExists("hints",param1);
      }
      
      public static function fromId(param1:String) : CHint
      {
         return ConstantsData.getConstantsDataObject(param1,CHint) as CHint;
      }
      
      public function get identifier() : String
      {
         return getString("identifier");
      }
      
      public function get requiredLevel() : int
      {
         return getInt("required_level");
      }
      
      public function get maxLevel() : int
      {
         return getInt("max_level");
      }
   }
}
