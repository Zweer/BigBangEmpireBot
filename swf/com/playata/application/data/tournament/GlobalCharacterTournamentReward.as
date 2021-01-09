package com.playata.application.data.tournament
{
   import com.playata.application.data.dataobject.DOGlobalCharacterTournamentReward;
   import com.playata.application.data.reward.Reward;
   import com.playata.framework.core.TypedObject;
   import com.playata.framework.core.util.JsonUtil;
   
   public class GlobalCharacterTournamentReward extends DOGlobalCharacterTournamentReward
   {
       
      
      private var _reward:TypedObject = null;
      
      public function GlobalCharacterTournamentReward(param1:DOGlobalCharacterTournamentReward)
      {
         super(param1);
      }
      
      public function get rewardData() : TypedObject
      {
         if(!_reward)
         {
            _reward = new TypedObject(JsonUtil.decode(rewards));
         }
         return _reward;
      }
      
      public function hasTournamentData(param1:int) : Boolean
      {
         return rewardData.hasData(param1.toString());
      }
      
      public function getRank(param1:int) : int
      {
         var _loc2_:String = param1.toString();
         if(rewardData.hasData(_loc2_))
         {
            return rewardData.getTypedObject(_loc2_).getInt("rank");
         }
         return 0;
      }
      
      public function getValue(param1:int) : int
      {
         var _loc2_:String = param1.toString();
         if(rewardData.hasData(_loc2_))
         {
            return rewardData.getTypedObject(_loc2_).getInt("value");
         }
         return 0;
      }
      
      public function getRewards(param1:int) : Reward
      {
         var _loc2_:String = param1.toString();
         if(rewardData.hasData(_loc2_))
         {
            if(!rewardData.getTypedObject(_loc2_).hasData("reward",true))
            {
               return null;
            }
            return new Reward(rewardData.getTypedObject(_loc2_).getString("reward"));
         }
         return null;
      }
   }
}
