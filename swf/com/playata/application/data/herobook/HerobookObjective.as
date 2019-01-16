package com.playata.application.data.herobook
{
   import com.playata.application.data.GameUtil;
   import com.playata.application.data.constants.CHerobookObjective;
   import com.playata.application.data.dataobject.DOHerobookObjective;
   import com.playata.application.data.reward.Reward;
   import com.playata.application.data.user.User;
   import com.playata.application.platform.ServerInfo;
   import com.playata.framework.core.util.StringUtil;
   import com.playata.framework.core.util.TimeUtil;
   import com.playata.framework.localization.LocText;
   
   public class HerobookObjective extends DOHerobookObjective
   {
       
      
      private var _reward:Reward = null;
      
      public function HerobookObjective(param1:DOHerobookObjective)
      {
         super(param1);
      }
      
      public function get index() : int
      {
         if(hasData("index"))
         {
            return getInt("index");
         }
         return id;
      }
      
      public function get reference() : String
      {
         return CHerobookObjective.fromId(identifier).reference;
      }
      
      public function get isStarted() : Boolean
      {
         return status == 1;
      }
      
      public function get isCollectable() : Boolean
      {
         return status == 2;
      }
      
      public function get isCollected() : Boolean
      {
         return status == 3;
      }
      
      public function get isAborted() : Boolean
      {
         if(!this.hasData("status"))
         {
            return true;
         }
         return status == 4;
      }
      
      public function get name() : String
      {
         return LocText.current.text("herobook/objective/" + identifier + "/name");
      }
      
      public function get progress() : Number
      {
         return currentValue / maxValue;
      }
      
      public function get progressText() : String
      {
         return LocText.current.formatHugeNumber(Math.min(currentValue,maxValue)) + "/" + LocText.current.formatHugeNumber(maxValue);
      }
      
      public function get shortDescription() : String
      {
         return getValueText("herobook/objective/" + identifier + "/progress");
      }
      
      public function get longDescription() : String
      {
         return getValueText("herobook/objective/" + identifier + "/description");
      }
      
      public function getValueText(param1:String) : String
      {
         var _loc2_:String = LocText.current.text(param1);
         var _loc4_:String = null;
         var _loc3_:int = 0;
         var _loc5_:String = null;
         if(_loc2_.indexOf("[v:<target_value>") != -1)
         {
            _loc4_ = LocText.current.getParameterString(_loc2_,1,"<target_value>");
            _loc3_ = maxValue;
            _loc5_ = LocText.current.getPluralForm(_loc4_,_loc3_,LocText.current.formatHugeNumber(_loc3_));
            _loc2_ = StringUtil.replace(_loc2_,_loc4_,_loc5_);
         }
         else
         {
            _loc2_ = StringUtil.replace(_loc2_,"<target_value>",LocText.current.formatHugeNumber(maxValue));
         }
         if(_loc2_.indexOf("[v:<progress_value>") != -1)
         {
            _loc4_ = LocText.current.getParameterString(_loc2_,1,"<progress_value>");
            _loc3_ = Math.min(currentValue,maxValue);
            _loc5_ = LocText.current.getPluralForm(_loc4_,_loc3_,LocText.current.formatHugeNumber(_loc3_));
            _loc2_ = StringUtil.replace(_loc2_,_loc4_,_loc5_);
         }
         _loc2_ = StringUtil.replace(_loc2_,"<progress_value>",LocText.current.formatHugeNumber(Math.min(currentValue,maxValue)));
         return _loc2_;
      }
      
      public function get iconImageUrl() : String
      {
         var _loc1_:String = identifier;
         return ServerInfo.assetURL("herobook_objectives/" + _loc1_,"png");
      }
      
      public function get characterImageUrl() : String
      {
         var _loc1_:String = null;
         if(User.current.character.isMale)
         {
            _loc1_ = CHerobookObjective.fromId(identifier).characterIdentifierM;
         }
         else
         {
            _loc1_ = CHerobookObjective.fromId(identifier).characterIdentifierF;
         }
         return ServerInfo.assetURL("herobook_character/" + _loc1_,"png");
      }
      
      public function get rewardText() : String
      {
         if(isCoinReward)
         {
            return reward.gameCurrencyString;
         }
         if(isPremiumCurrencyReward)
         {
            return reward.premiumCurrencyString;
         }
         if(isStatPointReward)
         {
            return GameUtil.getStatPointString(reward.statPoints);
         }
         if(isXpReward)
         {
            return reward.xpString;
         }
         if(isItemReward)
         {
            return LocText.current.text("general/item_reward_text");
         }
         if(isQuestEnergyReward)
         {
            return GameUtil.getEnergyString(reward.questEnergy);
         }
         return "";
      }
      
      public function get genericRewardType() : int
      {
         if(isCoinReward)
         {
            return 1;
         }
         if(isPremiumCurrencyReward)
         {
            return 0;
         }
         if(isStatPointReward)
         {
            return 4;
         }
         if(isXpReward)
         {
            return 2;
         }
         if(isItemReward)
         {
            return 5;
         }
         if(isQuestEnergyReward)
         {
            return 3;
         }
         return -1;
      }
      
      public function get isPremiumCurrencyReward() : Boolean
      {
         return reward.premiumCurrency > 0;
      }
      
      public function get isCoinReward() : Boolean
      {
         return reward.gameCurrency > 0;
      }
      
      public function get isXpReward() : Boolean
      {
         return reward.xp > 0;
      }
      
      public function get isStatPointReward() : Boolean
      {
         return reward.statPoints > 0;
      }
      
      public function get isItemReward() : Boolean
      {
         return reward.itemId > 0;
      }
      
      public function get isQuestEnergyReward() : Boolean
      {
         return reward.questEnergy > 0;
      }
      
      public function get remainingSeconds() : int
      {
         var _loc1_:int = tsEnd;
         return Math.max(0,_loc1_ - TimeUtil.now);
      }
      
      public function get timeRemainingString() : String
      {
         var _loc1_:Number = remainingSeconds;
         if(_loc1_ > 86400)
         {
            return TimeUtil.secondsToString(_loc1_,true,true,true);
         }
         return TimeUtil.secondsToStringFormat(_loc1_,"H:m:s");
      }
      
      public function get timeRemainingLongString() : String
      {
         return TimeUtil.secondsToString(remainingSeconds);
      }
      
      public function get reward() : Reward
      {
         if(_reward)
         {
            return _reward;
         }
         if(this.hasData("rewards"))
         {
            _reward = new Reward(this.getString("rewards"));
            return _reward;
         }
         return null;
      }
   }
}
