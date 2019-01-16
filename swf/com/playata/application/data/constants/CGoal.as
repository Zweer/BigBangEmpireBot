package com.playata.application.data.constants
{
   import com.playata.framework.core.TypedObject;
   import com.playata.framework.data.constants.ConstantsData;
   
   public class CGoal extends ConstantsData
   {
      
      public static const CONSTANTS_KEY:String = "goals";
      
      public static const ID_NAME:String = "identifier";
       
      
      public function CGoal(param1:TypedObject)
      {
         super(param1);
      }
      
      public static function get constantsData() : *
      {
         return ConstantsData.getConstantsData("goals");
      }
      
      public static function get count() : int
      {
         return ConstantsData.getCount("goals");
      }
      
      public static function get ids() : Vector.<String>
      {
         return ConstantsData.getStringVectorIds("goals");
      }
      
      public static function exists(param1:String) : Boolean
      {
         return ConstantsData.getIdExists("goals",param1);
      }
      
      public static function fromId(param1:String) : CGoal
      {
         return ConstantsData.getConstantsDataObject(param1,CGoal) as CGoal;
      }
      
      public function get identifier() : String
      {
         return getString("identifier");
      }
      
      public function get index() : int
      {
         return getInt("index");
      }
      
      public function get active() : Boolean
      {
         return getBoolean("active");
      }
      
      public function get goalType() : int
      {
         return getInt("goal_type");
      }
      
      public function get mechanicType() : int
      {
         return getInt("mechanic_type");
      }
      
      public function get lookupColumn() : String
      {
         return getString("lookup_column");
      }
      
      public function get category() : int
      {
         return getInt("category");
      }
      
      public function get storyGoalCategory() : int
      {
         return getInt("story_goal_category");
      }
      
      public function get requiredGoalId() : String
      {
         return getString("required_goal");
      }
      
      public function get requiredGoal() : CGoal
      {
         return CGoal.fromId(getId("required_goal"));
      }
      
      public function get requiredLevel() : int
      {
         return getInt("required_level");
      }
      
      public function get statistics() : Boolean
      {
         return getBoolean("statistics");
      }
      
      public function get hidden() : Boolean
      {
         return getBoolean("hidden");
      }
      
      public function get displayAsTime() : Boolean
      {
         return getBoolean("display_as_time");
      }
      
      public function get valueIds() : Vector.<int>
      {
         return getSubIntVectorIds("values");
      }
      
      public function hasValueId(param1:int) : Boolean
      {
         return valueIds.indexOf(param1) != -1;
      }
      
      public function getValue(param1:int) : CGoalValue
      {
         return getSubData("values",identifier,param1,CGoalValue) as CGoalValue;
      }
   }
}
