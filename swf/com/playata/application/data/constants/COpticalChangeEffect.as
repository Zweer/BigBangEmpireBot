package com.playata.application.data.constants
{
   import com.playata.framework.core.TypedObject;
   import com.playata.framework.data.constants.ConstantsData;
   
   public class COpticalChangeEffect extends ConstantsData
   {
      
      public static const CONSTANTS_KEY:String = "optical_change_effects";
      
      public static const ID_NAME:String = "identifier";
       
      
      public function COpticalChangeEffect(param1:TypedObject)
      {
         super(param1);
      }
      
      public static function get constantsData() : *
      {
         return ConstantsData.getConstantsData("optical_change_effects");
      }
      
      public static function get count() : int
      {
         return ConstantsData.getCount("optical_change_effects");
      }
      
      public static function get ids() : Vector.<String>
      {
         return ConstantsData.getStringVectorIds("optical_change_effects");
      }
      
      public static function exists(param1:String) : Boolean
      {
         return ConstantsData.getIdExists("optical_change_effects",param1);
      }
      
      public static function fromId(param1:String) : COpticalChangeEffect
      {
         return ConstantsData.getConstantsDataObject(param1,COpticalChangeEffect) as COpticalChangeEffect;
      }
      
      public function get identifier() : String
      {
         return getString("identifier");
      }
      
      public function get backAnimation() : Boolean
      {
         return getBoolean("back_animation");
      }
      
      public function get spine() : String
      {
         return getString("spine");
      }
   }
}
