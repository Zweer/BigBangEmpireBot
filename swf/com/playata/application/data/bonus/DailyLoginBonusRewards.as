package com.playata.application.data.bonus
{
   import com.playata.framework.core.TypedObject;
   
   public class DailyLoginBonusRewards extends TypedObject
   {
       
      
      public function DailyLoginBonusRewards(param1:TypedObject)
      {
         super(param1);
      }
      
      public function hasBonusDay(param1:int) : Boolean
      {
         return hasData(param1.toString());
      }
      
      public function getRewardType1(param1:int) : int
      {
         return _data[param1].rewardType1;
      }
      
      public function getRewardType2(param1:int) : int
      {
         return _data[param1].rewardType2;
      }
      
      public function getRewardType1Amount(param1:int) : int
      {
         return _data[param1].rewardType1Amount;
      }
      
      public function getRewardType2Amount(param1:int) : int
      {
         return _data[param1].rewardType2Amount;
      }
   }
}
