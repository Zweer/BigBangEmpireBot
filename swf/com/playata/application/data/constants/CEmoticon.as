package com.playata.application.data.constants
{
   import com.playata.framework.core.TypedObject;
   import com.playata.framework.data.constants.ConstantsData;
   
   public class CEmoticon extends ConstantsData
   {
      
      public static const CONSTANTS_KEY:String = "emoticons";
      
      public static const ID_NAME:String = "identifier";
       
      
      public function CEmoticon(param1:TypedObject)
      {
         super(param1);
      }
      
      public static function get constantsData() : *
      {
         return ConstantsData.getConstantsData("emoticons");
      }
      
      public static function get count() : int
      {
         return ConstantsData.getCount("emoticons");
      }
      
      public static function get ids() : Vector.<String>
      {
         return ConstantsData.getStringVectorIds("emoticons");
      }
      
      public static function exists(param1:String) : Boolean
      {
         return ConstantsData.getIdExists("emoticons",param1);
      }
      
      public static function fromId(param1:String) : CEmoticon
      {
         return ConstantsData.getConstantsDataObject(param1,CEmoticon) as CEmoticon;
      }
      
      public function get identifier() : String
      {
         return getString("identifier");
      }
      
      public function get codes() : Vector.<String>
      {
         return getStringVector("codes");
      }
      
      public function get hidden() : Boolean
      {
         return getBoolean("hidden");
      }
      
      public function get index() : int
      {
         return getInt("index");
      }
   }
}
