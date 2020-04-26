package com.playata.application.data.constants
{
   import com.playata.framework.core.TypedObject;
   import com.playata.framework.data.constants.ConstantsData;
   
   public class CItemEffect extends ConstantsData
   {
      
      public static const CONSTANTS_KEY:String = "item_effects";
      
      public static const ID_NAME:String = "identifier";
       
      
      public function CItemEffect(param1:TypedObject)
      {
         super(param1);
      }
      
      public static function get constantsData() : *
      {
         return ConstantsData.getConstantsData("item_effects");
      }
      
      public static function get count() : int
      {
         return ConstantsData.getCount("item_effects");
      }
      
      public static function get ids() : Vector.<String>
      {
         return ConstantsData.getStringVectorIds("item_effects");
      }
      
      public static function exists(param1:String) : Boolean
      {
         return ConstantsData.getIdExists("item_effects",param1);
      }
      
      public static function fromId(param1:String) : CItemEffect
      {
         return ConstantsData.getConstantsDataObject(param1,CItemEffect) as CItemEffect;
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
