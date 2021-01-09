package com.playata.application.data.constants
{
   import com.playata.framework.core.TypedObject;
   import com.playata.framework.data.constants.ConstantsData;
   
   public class COpticalChangeCategory extends ConstantsData
   {
      
      public static const CONSTANTS_KEY:String = "optical_change_categories";
      
      public static const ID_NAME:String = "type";
       
      
      public function COpticalChangeCategory(param1:TypedObject)
      {
         super(param1);
      }
      
      public static function get constantsData() : *
      {
         return ConstantsData.getConstantsData("optical_change_categories");
      }
      
      public static function get count() : int
      {
         return ConstantsData.getCount("optical_change_categories");
      }
      
      public static function get ids() : Vector.<int>
      {
         return ConstantsData.getIntVectorIds("optical_change_categories");
      }
      
      public static function exists(param1:int) : Boolean
      {
         return ConstantsData.getIdExists("optical_change_categories",param1);
      }
      
      public static function fromId(param1:int) : COpticalChangeCategory
      {
         return ConstantsData.getConstantsDataObject(param1,COpticalChangeCategory) as COpticalChangeCategory;
      }
      
      public function get type() : int
      {
         return getInt("type");
      }
      
      public function get category() : int
      {
         return getInt("category");
      }
      
      public function get guaranteedDropChance() : int
      {
         return getInt("guaranteed_drop_chance");
      }
      
      public function get valueIds() : Vector.<int>
      {
         return getSubIntVectorIds("values");
      }
      
      public function hasValueId(param1:int) : Boolean
      {
         return valueIds.indexOf(param1) != -1;
      }
      
      public function getValue(param1:int) : COpticalChangeCategoryValue
      {
         return getSubData("values",type,param1,COpticalChangeCategoryValue) as COpticalChangeCategoryValue;
      }
   }
}
