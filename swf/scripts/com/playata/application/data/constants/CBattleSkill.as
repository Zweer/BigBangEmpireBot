package com.playata.application.data.constants
{
   import com.playata.framework.core.TypedObject;
   import com.playata.framework.data.constants.ConstantsData;
   
   public class CBattleSkill extends ConstantsData
   {
      
      public static const CONSTANTS_KEY:String = "battle_skills";
      
      public static const ID_NAME:String = "id";
       
      
      public function CBattleSkill(param1:TypedObject)
      {
         super(param1);
      }
      
      public static function get constantsData() : *
      {
         return ConstantsData.getConstantsData("battle_skills");
      }
      
      public static function get count() : int
      {
         return ConstantsData.getCount("battle_skills");
      }
      
      public static function get ids() : Vector.<int>
      {
         return ConstantsData.getIntVectorIds("battle_skills");
      }
      
      public static function exists(param1:int) : Boolean
      {
         return ConstantsData.getIdExists("battle_skills",param1);
      }
      
      public static function fromId(param1:int) : CBattleSkill
      {
         return ConstantsData.getConstantsDataObject(param1,CBattleSkill) as CBattleSkill;
      }
      
      public function get id() : int
      {
         return getInt("id");
      }
      
      public function get identifier() : String
      {
         return getString("identifier");
      }
      
      public function get value1() : Number
      {
         return getNumber("value1");
      }
      
      public function get value2() : Number
      {
         return getNumber("value2");
      }
      
      public function get value3() : Number
      {
         return getNumber("value3");
      }
      
      public function get rolledValue() : String
      {
         return getString("rolled_value");
      }
      
      public function get type() : int
      {
         return getInt("type");
      }
      
      public function get charges() : int
      {
         return getInt("charges");
      }
   }
}
