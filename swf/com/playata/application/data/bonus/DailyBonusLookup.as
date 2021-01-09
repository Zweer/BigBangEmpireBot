package com.playata.application.data.bonus
{
   import com.playata.application.data.dataobject.DODailyBonusLookup;
   import com.playata.application.data.dataobject.DODailyBonusReward;
   import com.playata.framework.application.Environment;
   import com.playata.framework.application.request.ActionRequestResponse;
   import com.playata.framework.core.TypedObject;
   import com.playata.framework.core.util.TimeUtil;
   import com.playata.framework.data.DataObjectArray;
   
   public class DailyBonusLookup extends DODailyBonusLookup
   {
       
      
      private var _rewards:Vector.<DailyBonusReward>;
      
      private var _rewardData:TypedObject = null;
      
      private var _tsRewardDataUpdated:int = 0;
      
      private var _rewardCallbacks:Vector.<Function>;
      
      public function DailyBonusLookup(param1:Object = null)
      {
         _rewards = new Vector.<DailyBonusReward>();
         _rewardCallbacks = new Vector.<Function>();
         super(param1);
      }
      
      public function refreshRewards(param1:DataObjectArray) : void
      {
         var _loc4_:int = 0;
         var _loc3_:* = param1;
         for each(var _loc2_ in param1)
         {
            refreshReward(_loc2_);
         }
      }
      
      public function refreshReward(param1:DODailyBonusReward) : void
      {
         var _loc2_:* = null;
         var _loc4_:int = 0;
         var _loc3_:* = _rewards;
         for each(_loc2_ in _rewards)
         {
            if(_loc2_.id == param1.id)
            {
               _loc2_.update(param1);
               return;
            }
         }
         _loc2_ = new DailyBonusReward(param1);
         _rewards.push(_loc2_);
      }
      
      public function getReward(param1:int = 0, param2:int = 0, param3:int = 1) : DailyBonusReward
      {
         var _loc6_:int = 0;
         var _loc5_:* = _rewards;
         for each(var _loc4_ in _rewards)
         {
            if(!(param1 > 0 && _loc4_.type != param1))
            {
               if(!(param2 > 0 && _loc4_.value != param2))
               {
                  if(!(param3 > 0 && _loc4_.status != param3))
                  {
                     return _loc4_;
                  }
               }
            }
         }
         return null;
      }
      
      public function requestRewardData(param1:Function) : void
      {
         if(_rewardCallbacks.length > 0)
         {
            _rewardCallbacks.push(param1);
         }
         if(_rewardData && rewardDataIsUpToDate)
         {
            param1(_rewardData);
         }
         else
         {
            Environment.application.sendActionRequest("getDailyBonusRewardData",{},handleRequests);
            _rewardCallbacks.push(param1);
         }
      }
      
      public function get rewardDataIsUpToDate() : Boolean
      {
         return TimeUtil.serverDateTime.isToday(_tsRewardDataUpdated);
      }
      
      private function handleRequests(param1:ActionRequestResponse) : void
      {
         var _loc2_:int = 0;
         var _loc3_:* = param1.action;
         if("getDailyBonusRewardData" !== _loc3_)
         {
            throw new Error("Unsupported request action \'" + param1.action + "\'!");
         }
         if(param1.error == "")
         {
            _rewardData = param1.appResponse.daily_bonus_reward_data;
            _tsRewardDataUpdated = TimeUtil.now;
            Environment.application.updateData(param1.data);
            _loc2_ = 0;
            while(_loc2_ < _rewardCallbacks.length)
            {
               _rewardCallbacks[_loc2_](_rewardData);
               _loc2_++;
            }
            _rewardCallbacks.length = 0;
         }
         else
         {
            Environment.reportError(param1.error,param1.request);
         }
      }
   }
}
