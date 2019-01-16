package com.playata.application.data.constants
{
   import com.playata.framework.core.TypedObject;
   import com.playata.framework.data.constants.ConstantsData;
   
   public class CItemSetTemplateBonus extends ConstantsData
   {
      
      public static const ID_NAME:String = "bonus";
       
      
      public function CItemSetTemplateBonus(param1:TypedObject)
      {
         super(param1);
      }
      
      public function get bonus() : int
      {
         return getInt("bonus");
      }
      
      public function get type() : int
      {
         return getInt("type");
      }
      
      public function get value() : Number
      {
         return getNumber("value");
      }
   }
}
