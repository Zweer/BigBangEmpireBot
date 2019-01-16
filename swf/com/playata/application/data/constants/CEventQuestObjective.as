package com.playata.application.data.constants
{
   import com.playata.framework.core.TypedObject;
   import com.playata.framework.data.constants.ConstantsData;
   
   public class CEventQuestObjective extends ConstantsData
   {
      
      public static const ID_NAME:String = "objective";
       
      
      public function CEventQuestObjective(param1:TypedObject)
      {
         super(param1);
      }
      
      public function get objective() : String
      {
         return getString("objective");
      }
      
      public function get index() : int
      {
         return getInt("index");
      }
      
      public function get type() : int
      {
         return getInt("type");
      }
      
      public function get reference() : String
      {
         return getString("reference");
      }
      
      public function get value() : int
      {
         return getInt("value");
      }
      
      public function get rewardType() : int
      {
         return getInt("reward_type");
      }
      
      public function get rewardFactor() : Number
      {
         return getNumber("reward_factor");
      }
      
      public function get rewardReference() : String
      {
         return getString("reward_reference");
      }
   }
}
