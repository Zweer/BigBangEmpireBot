package com.playata.application.data.constants
{
   import com.playata.framework.core.TypedObject;
   import com.playata.framework.data.constants.ConstantsData;
   
   public class CGoalValue extends ConstantsData
   {
      
      public static const ID_NAME:String = "value";
       
      
      public function CGoalValue(param1:TypedObject)
      {
         super(param1);
      }
      
      public function get value() : int
      {
         return getInt("value");
      }
      
      public function get storyGoal() : Boolean
      {
         return getBoolean("story_goal");
      }
      
      public function get rewardType() : int
      {
         return getInt("reward_type");
      }
      
      public function get rewardFactor() : int
      {
         return getInt("reward_factor");
      }
      
      public function get rewardIdentifier() : String
      {
         return getString("reward_identifier");
      }
      
      public function get rewardTitleId() : String
      {
         return getString("reward_title");
      }
      
      public function get rewardTitle() : CTitle
      {
         return CTitle.fromId(getId("reward_title"));
      }
      
      public function get estimatedLevel() : int
      {
         return getInt("estimated_level");
      }
      
      public function get text() : String
      {
         return getString("text");
      }
   }
}
