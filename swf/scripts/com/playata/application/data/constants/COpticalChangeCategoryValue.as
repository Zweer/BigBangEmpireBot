package com.playata.application.data.constants
{
   import com.playata.framework.core.TypedObject;
   import com.playata.framework.data.constants.ConstantsData;
   
   public class COpticalChangeCategoryValue extends ConstantsData
   {
      
      public static const ID_NAME:String = "value";
       
      
      public function COpticalChangeCategoryValue(param1:TypedObject)
      {
         super(param1);
      }
      
      public function get value() : int
      {
         return getInt("value");
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
   }
}
