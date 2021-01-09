package com.playata.application.data.event
{
   import com.playata.application.data.AppDateTime;
   import com.playata.application.data.constants.CEventQuest;
   import com.playata.application.data.dataobject.DOEventQuest;
   import com.playata.application.data.item.Item;
   import com.playata.application.data.reward.Reward;
   import com.playata.application.data.user.User;
   import com.playata.application.platform.ServerInfo;
   import com.playata.framework.core.util.DateTime;
   import com.playata.framework.core.util.TimeUtil;
   import com.playata.framework.localization.LocText;
   
   public class EventQuest extends DOEventQuest
   {
       
      
      private var _objectives:Vector.<EventQuestObjective>;
      
      private var _reward:Reward = null;
      
      public function EventQuest(param1:DOEventQuest)
      {
         _objectives = new Vector.<EventQuestObjective>();
         super(param1);
         var _loc4_:int = 0;
         var _loc3_:* = CEventQuest.fromId(identifier).objectiveIds;
         for each(var _loc2_ in CEventQuest.fromId(identifier).objectiveIds)
         {
            _objectives.push(new EventQuestObjective(this,_loc2_));
         }
         sortObjectives();
      }
      
      private static function sortObjectivesByIndex(param1:EventQuestObjective, param2:EventQuestObjective) : int
      {
         if(param1.isCollected && !param2.isCollected)
         {
            return 1;
         }
         if(!param1.isCollected && param2.isCollected)
         {
            return -1;
         }
         if(param1.index < param2.index)
         {
            return -1;
         }
         if(param1.index > param2.index)
         {
            return 1;
         }
         return 0;
      }
      
      public function sortObjectives() : void
      {
         _objectives.sort(sortObjectivesByIndex);
      }
      
      public function get reward() : Reward
      {
         if(_reward)
         {
            return _reward;
         }
         _reward = new Reward(rewards);
         return _reward;
      }
      
      public function get isUnassigned() : Boolean
      {
         return !hasData("id");
      }
      
      public function getObjectiveValueByIndex(param1:int) : int
      {
         if(!hasData("objective" + param1.toString() + "_value"))
         {
            return 0;
         }
         return getInt("objective" + param1.toString() + "_value");
      }
      
      public function get objectives() : Vector.<EventQuestObjective>
      {
         return _objectives;
      }
      
      public function isCompleted(param1:Boolean) : Boolean
      {
         var _loc4_:int = 0;
         var _loc3_:* = _objectives;
         for each(var _loc2_ in _objectives)
         {
            if(param1)
            {
               if(!_loc2_.isCollected)
               {
                  return false;
               }
            }
            else if(!_loc2_.isCollectable && !_loc2_.isCollected)
            {
               return false;
            }
         }
         return true;
      }
      
      public function get finishedObjectiveCount() : int
      {
         var _loc1_:int = 0;
         var _loc4_:int = 0;
         var _loc3_:* = _objectives;
         for each(var _loc2_ in _objectives)
         {
            if(_loc2_.isCollected || _loc2_.isCollectable)
            {
               _loc1_++;
            }
         }
         return _loc1_;
      }
      
      public function get collectableObjectiveCount() : int
      {
         var _loc1_:int = 0;
         var _loc4_:int = 0;
         var _loc3_:* = _objectives;
         for each(var _loc2_ in _objectives)
         {
            if(!_loc2_.isCollected && _loc2_.isCollectable)
            {
               _loc1_++;
            }
         }
         return _loc1_;
      }
      
      public function get progressValue() : int
      {
         var _loc1_:Number = finishedObjectiveCount / objectives.length * 100;
         var _loc2_:Number = 100 / objectives.length;
         var _loc5_:int = 0;
         var _loc4_:* = _objectives;
         for each(var _loc3_ in _objectives)
         {
            if(!_loc3_.isCollected && !_loc3_.isCollectable)
            {
               _loc1_ = _loc1_ + _loc3_.progressValue / 100 * _loc2_;
            }
         }
         if(finishedObjectiveCount < objectives.length)
         {
            return Math.min(Math.round(_loc1_),99);
         }
         return Math.round(_loc1_);
      }
      
      public function hasActiveObjectiveWithItem(param1:String) : Boolean
      {
         var _loc4_:int = 0;
         var _loc3_:* = _objectives;
         for each(var _loc2_ in _objectives)
         {
            if(_loc2_.type == 14)
            {
               if(!_loc2_.isCollected && !_loc2_.isCollectable)
               {
                  if(_loc2_.reference == param1)
                  {
                     return true;
                  }
               }
            }
         }
         return false;
      }
      
      public function get reward1Type() : int
      {
         return CEventQuest.fromId(identifier).reward1Type;
      }
      
      public function get reward2Type() : int
      {
         return CEventQuest.fromId(identifier).reward2Type;
      }
      
      public function get reward1Factor() : Number
      {
         return CEventQuest.fromId(identifier).reward1Factor;
      }
      
      public function get reward2Factor() : Number
      {
         return CEventQuest.fromId(identifier).reward2Factor;
      }
      
      public function get reward1Flag() : String
      {
         return CEventQuest.fromId(identifier).reward1Flag;
      }
      
      public function get reward2Flag() : String
      {
         return CEventQuest.fromId(identifier).reward2Flag;
      }
      
      public function get rewardTitle() : String
      {
         return CEventQuest.fromId(identifier).rewardTitleId;
      }
      
      public function get itemReward1() : String
      {
         return CEventQuest.fromId(identifier).rewardItem1Id;
      }
      
      public function get itemReward2() : String
      {
         return CEventQuest.fromId(identifier).rewardItem2Id;
      }
      
      public function get itemReward3() : String
      {
         return CEventQuest.fromId(identifier).rewardItem3Id;
      }
      
      public function get itemReward1Item() : Item
      {
         return User.current.character.getItemById(rewardItem1Id);
      }
      
      public function get itemReward2Item() : Item
      {
         return User.current.character.getItemById(rewardItem2Id);
      }
      
      public function get itemReward3Item() : Item
      {
         return User.current.character.getItemById(rewardItem3Id);
      }
      
      public function getObjectiveItemRewardByIndex(param1:int) : Item
      {
         if(!hasData("objective" + param1.toString() + "_reward_item_id"))
         {
            return null;
         }
         var _loc2_:int = getInt("objective" + param1.toString() + "_reward_item_id");
         if(_loc2_ == 0)
         {
            return null;
         }
         return User.current.character.getItemById(_loc2_);
      }
      
      public function get isFinished() : Boolean
      {
         return status == 2;
      }
      
      public function get isAborted() : Boolean
      {
         return status == 3;
      }
      
      public function get isAbortedButFinished() : Boolean
      {
         return status == 5;
      }
      
      public function get isStarted() : Boolean
      {
         return status == 1;
      }
      
      public function get hasConventionData() : Boolean
      {
         return hasData("convention_start_times");
      }
      
      public function get conventionStartTimes() : String
      {
         var _loc2_:int = 0;
         var _loc4_:int = 0;
         var _loc3_:int = 0;
         var _loc6_:Vector.<int> = new Vector.<int>(0);
         if(hasData("convention_start_times"))
         {
            _loc2_ = TimeUtil.now;
            var _loc8_:int = 0;
            var _loc7_:* = getData("convention_start_times");
            for each(var _loc5_ in getData("convention_start_times"))
            {
               _loc4_ = DateTime.fromStringServer(_loc5_).timestamp;
               if(_loc4_ > _loc2_)
               {
                  _loc6_.push(_loc4_);
                  if(_loc6_.length < 3)
                  {
                     continue;
                  }
                  break;
               }
            }
         }
         var _loc1_:String = "";
         _loc3_ = 0;
         while(_loc3_ < _loc6_.length)
         {
            if(_loc3_ > 0)
            {
               _loc1_ = _loc1_ + "\n";
            }
            _loc1_ = _loc1_ + AppDateTime.getDateTimeString(TimeUtil.localDateTime,_loc6_[_loc3_],1);
            _loc3_++;
         }
         return _loc1_;
      }
      
      public function get remainingConventionStartTimes() : int
      {
         var _loc1_:int = 0;
         var _loc2_:int = 0;
         var _loc4_:int = 0;
         if(hasData("convention_start_times"))
         {
            _loc1_ = TimeUtil.now;
            var _loc6_:int = 0;
            var _loc5_:* = getData("convention_start_times");
            for each(var _loc3_ in getData("convention_start_times"))
            {
               _loc2_ = DateTime.fromStringServer(_loc3_).timestamp;
               if(_loc2_ > _loc1_)
               {
                  _loc4_++;
               }
            }
         }
         return _loc4_;
      }
      
      public function get isAvailable() : Boolean
      {
         return remainingSeconds > 0;
      }
      
      public function get remainingSeconds() : int
      {
         var _loc1_:String = getString("end_date");
         return Math.max(0,DateTime.fromStringServer(_loc1_).timestamp - TimeUtil.now);
      }
      
      public function get timeRemainingString() : String
      {
         var _loc2_:Number = remainingSeconds;
         var _loc1_:Vector.<int> = new Vector.<int>(0);
         _loc1_.push(Math.floor(_loc2_ / 86400));
         _loc1_.push(Math.floor(_loc2_ / 3600 % 24));
         if(_loc1_[0] > 0)
         {
            return TimeUtil.getDayString(_loc1_[0]) + ", " + TimeUtil.getHourString(_loc1_[1]);
         }
         return TimeUtil.secondsToString(remainingSeconds,true,true);
      }
      
      public function get name() : String
      {
         return LocText.current.text("event_quest/" + identifier + "/name");
      }
      
      public function get callerName() : String
      {
         return LocText.current.text("event_quest/" + identifier + "/caller");
      }
      
      public function get introText() : String
      {
         return LocText.current.text("event_quest/" + identifier + "/intro_description");
      }
      
      public function get outroWonText() : String
      {
         return LocText.current.text("event_quest/" + identifier + "/outro_win_description");
      }
      
      public function get outroLostText() : String
      {
         return LocText.current.text("event_quest/" + identifier + "/outro_lose_description");
      }
      
      public function get logoImageUrl() : String
      {
         return ServerInfo.assetURL("event_quests/" + identifier + "_logo","png");
      }
      
      public function get iconImageUrl() : String
      {
         return ServerInfo.assetURL("event_quests/" + identifier + "_i","png");
      }
      
      public function get headerImageUrl() : String
      {
         return ServerInfo.assetURL("event_quests/" + identifier + "_header","png");
      }
   }
}
