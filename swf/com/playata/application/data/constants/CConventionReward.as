package com.playata.application.data.constants
{
   import com.playata.framework.core.TypedObject;
   import com.playata.framework.data.constants.ConstantsData;
   
   public class CConventionReward extends ConstantsData
   {
      
      public static const CONSTANTS_KEY:String = "convention_rewards";
      
      public static const ID_NAME:String = "id";
       
      
      public function CConventionReward(param1:TypedObject)
      {
         super(param1);
      }
      
      public static function get constantsData() : *
      {
         return ConstantsData.getConstantsData("convention_rewards");
      }
      
      public static function get count() : int
      {
         return ConstantsData.getCount("convention_rewards");
      }
      
      public static function get ids() : Vector.<int>
      {
         return ConstantsData.getIntVectorIds("convention_rewards");
      }
      
      public static function exists(param1:int) : Boolean
      {
         return ConstantsData.getIdExists("convention_rewards",param1);
      }
      
      public static function fromId(param1:int) : CConventionReward
      {
         return ConstantsData.getConstantsDataObject(param1,CConventionReward) as CConventionReward;
      }
      
      public function get id() : int
      {
         return getInt("id");
      }
      
      public function get maxPoolPercentage() : Number
      {
         return getNumber("max_pool_percentage");
      }
      
      public function get reward1Type() : int
      {
         return getInt("reward1_type");
      }
      
      public function get reward1Value() : int
      {
         return getInt("reward1_value");
      }
      
      public function get reward2Type() : int
      {
         return getInt("reward2_type");
      }
      
      public function get reward2Value() : int
      {
         return getInt("reward2_value");
      }
   }
}
