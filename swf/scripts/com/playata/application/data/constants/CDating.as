package com.playata.application.data.constants
{
   import com.playata.framework.core.TypedObject;
   import com.playata.framework.data.constants.ConstantsData;
   
   public class CDating extends ConstantsData
   {
      
      public static const CONSTANTS_KEY:String = "dating";
      
      public static const ID_NAME:String = "index";
       
      
      public function CDating(param1:TypedObject)
      {
         super(param1);
      }
      
      public static function get constantsData() : *
      {
         return ConstantsData.getConstantsData("dating");
      }
      
      public static function get count() : int
      {
         return ConstantsData.getCount("dating");
      }
      
      public static function get ids() : Vector.<int>
      {
         return ConstantsData.getIntVectorIds("dating");
      }
      
      public static function exists(param1:int) : Boolean
      {
         return ConstantsData.getIdExists("dating",param1);
      }
      
      public static function fromId(param1:int) : CDating
      {
         return ConstantsData.getConstantsDataObject(param1,CDating) as CDating;
      }
      
      public function get index() : int
      {
         return getInt("index");
      }
      
      public function get identifier() : String
      {
         return getString("identifier");
      }
      
      public function get stage() : int
      {
         return getInt("stage");
      }
      
      public function get minLevel() : int
      {
         return getInt("min_level");
      }
      
      public function get stepIds() : Vector.<int>
      {
         return getSubIntVectorIds("steps");
      }
      
      public function hasStepId(param1:int) : Boolean
      {
         return stepIds.indexOf(param1) != -1;
      }
      
      public function getStep(param1:int) : CDatingStep
      {
         return getSubData("steps",index,param1,CDatingStep) as CDatingStep;
      }
   }
}
