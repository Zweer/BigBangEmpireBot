package com.playata.application.data.bonus
{
   import com.playata.application.data.dataobject.DODailyBonusReward;
   import com.playata.application.data.reward.Reward;
   import com.playata.framework.core.TypedObject;
   
   public class DailyBonusReward extends DODailyBonusReward
   {
       
      
      private var _reward:Reward = null;
      
      public function DailyBonusReward(param1:Object = null)
      {
         super(param1);
      }
      
      override public function update(param1:TypedObject) : void
      {
         super.update(param1);
         _reward = null;
      }
      
      public function get reward() : Reward
      {
         if(!_reward)
         {
            _reward = new Reward(rewards);
         }
         return _reward;
      }
   }
}
