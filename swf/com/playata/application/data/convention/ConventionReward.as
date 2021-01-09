package com.playata.application.data.convention
{
   import com.playata.application.data.GameUtil;
   import com.playata.application.data.dataobject.DOConventionReward;
   import com.playata.application.data.reward.Reward;
   
   public class ConventionReward extends DOConventionReward
   {
       
      
      private var _additionalRewards:Reward;
      
      public function ConventionReward(param1:Object = null)
      {
         super(param1);
      }
      
      public function get xpString() : String
      {
         if(xp == 0)
         {
            return "";
         }
         return GameUtil.getXpString(xp);
      }
      
      public function get additionalRewards() : Reward
      {
         var _loc1_:String = getString("rewards");
         if(!_loc1_)
         {
            return null;
         }
         if(_additionalRewards == null)
         {
            _additionalRewards = new Reward(_loc1_);
         }
         return _additionalRewards;
      }
      
      public function get questEnergy() : int
      {
         if(!additionalRewards)
         {
            return 0;
         }
         return additionalRewards.questEnergy;
      }
      
      public function get streamingResource() : int
      {
         if(!additionalRewards)
         {
            return 0;
         }
         return additionalRewards.streamingResource;
      }
   }
}
