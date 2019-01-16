package com.playata.application.data.goal
{
   import com.adobe.utils.StringUtil;
   import com.playata.application.data.GameUtil;
   import com.playata.application.data.character.Character;
   import com.playata.application.data.user.User;
   import com.playata.framework.application.Environment;
   import com.playata.framework.core.util.NumberUtil;
   import com.playata.framework.data.DataObject;
   import com.playata.framework.localization.LocText;
   
   public class GoalValue extends DataObject
   {
       
      
      private var _value:int = 0;
      
      private var _index:int = 0;
      
      private var _position:int = 0;
      
      private var _goal:Goal = null;
      
      private var _isNew:Boolean = false;
      
      public function GoalValue(param1:int, param2:Goal, param3:Object = null)
      {
         _value = param1;
         _goal = param2;
         super(param3);
      }
      
      public function isCollected(param1:Character) : Boolean
      {
         return param1.isGoalCollected(_goal,this);
      }
      
      public function collectedDate(param1:Character) : String
      {
         return param1.collectedGoalDate(_goal,this);
      }
      
      public function collectedDateTimestamp(param1:Character) : int
      {
         return param1.collectedGoalDateTimestamp(_goal,this);
      }
      
      public function get goal() : Goal
      {
         return _goal;
      }
      
      public function get value() : int
      {
         return _value;
      }
      
      public function get currentValue() : int
      {
         return _goal.currentValue(User.current.character);
      }
      
      public function get index() : int
      {
         return _index;
      }
      
      public function set index(param1:int) : void
      {
         _index = param1;
      }
      
      public function get position() : int
      {
         return _position;
      }
      
      public function set position(param1:int) : void
      {
         _position = param1;
      }
      
      public function get romanNumber() : String
      {
         return NumberUtil.romanize(index);
      }
      
      public function isCollectable(param1:Character) : Boolean
      {
         return value <= _goal.currentValue(param1);
      }
      
      public function isAvailable(param1:Character) : Boolean
      {
         if(!_goal.isAvailable(param1))
         {
            return false;
         }
         return _goal.currentTargetValue(param1) == this;
      }
      
      public function get isNew() : Boolean
      {
         return _isNew;
      }
      
      public function set isNew(param1:Boolean) : void
      {
         _isNew = param1;
      }
      
      public function get textIdentifier() : String
      {
         return getString("text");
      }
      
      public function get estimatedLevel() : int
      {
         return getInt("estimated_level");
      }
      
      public function get rewardType() : int
      {
         return getInt("reward_type");
      }
      
      public function get rewardFactor() : Number
      {
         return getNumber("reward_factor");
      }
      
      public function get rewardIdentifier() : String
      {
         return getString("reward_identifier");
      }
      
      public function get rewardTitle() : String
      {
         return getString("reward_title");
      }
      
      public function get isStoryGoal() : Boolean
      {
         return getBoolean("story_goal");
      }
      
      public function get storyGoalCategory() : int
      {
         return _goal.getInt("story_goal_category");
      }
      
      public function get title() : String
      {
         var _loc2_:String = _goal.getData("active") != true && Environment.info.isTestMode?"[INACTIVE] ":"";
         var _loc1_:String = !!goal.isHidden?"":_position.toString() + ". ";
         return _loc2_ + _loc1_ + plainTitle;
      }
      
      public function get plainTitle() : String
      {
         if(_goal.isNumberStep)
         {
            return LocText.current.text("goal/" + _goal.identifier + "/title") + " " + romanNumber;
         }
         return LocText.current.text("goal/" + _goal.identifier + "/title");
      }
      
      public function shortDescription(param1:Character) : String
      {
         var _loc5_:int = _goal.currentValue(param1,_goal.currentTargetValue(param1) == this && !isCollected(param1) && !isCollectable(param1));
         var _loc2_:String = LocText.current.text("goal/" + _goal.identifier + "/progress");
         var _loc4_:String = null;
         var _loc3_:int = 0;
         var _loc6_:String = null;
         if(_loc2_.indexOf("[v:<target_value>") != -1)
         {
            _loc4_ = LocText.current.getParameterString(_loc2_,1,"<target_value>");
            _loc3_ = value;
            _loc6_ = LocText.current.getPluralForm(_loc4_,_loc3_,LocText.current.formatHugeNumber(_loc3_));
            _loc2_ = StringUtil.replace(_loc2_,_loc4_,_loc6_);
            if(goal.displayAsTime)
            {
               _loc2_.replace(LocText.current.formatHugeNumber(_loc3_),getTimeString(_loc3_));
            }
         }
         else if(goal.displayAsTime)
         {
            _loc2_ = StringUtil.replace(_loc2_,"<target_value>",getTimeString(value));
         }
         else
         {
            _loc2_ = StringUtil.replace(_loc2_,"<target_value>",LocText.current.formatHugeNumber(value));
         }
         if(_loc2_.indexOf("[v:<progress_value>") != -1)
         {
            _loc4_ = LocText.current.getParameterString(_loc2_,1,"<progress_value>");
            _loc3_ = Math.min(_loc5_,value);
            _loc6_ = LocText.current.getPluralForm(_loc4_,_loc3_,LocText.current.formatHugeNumber(_loc3_));
            _loc2_ = StringUtil.replace(_loc2_,_loc4_,_loc6_);
            if(goal.displayAsTime)
            {
               _loc2_.replace(LocText.current.formatHugeNumber(_loc3_),getTimeString(_loc3_));
            }
         }
         if(goal.displayAsTime)
         {
            _loc2_ = StringUtil.replace(_loc2_,"<progress_value>",getTimeString(Math.min(_loc5_,value)));
         }
         else
         {
            _loc2_ = StringUtil.replace(_loc2_,"<progress_value>",LocText.current.formatHugeNumber(Math.min(_loc5_,value)));
         }
         return _loc2_;
      }
      
      public function longDescription(param1:Character) : String
      {
         var _loc5_:int = _goal.currentValue(param1,_goal.currentTargetValue(param1) == this && !isCollected(param1) && !isCollectable(param1));
         var _loc2_:String = LocText.current.text("goal/" + _goal.identifier + "/" + textIdentifier);
         var _loc4_:String = null;
         var _loc3_:* = 0;
         var _loc6_:String = null;
         if(_loc2_.indexOf("[v:<target_value>") != -1)
         {
            _loc4_ = LocText.current.getParameterString(_loc2_,1,"<target_value>");
            _loc3_ = int(value);
            _loc6_ = LocText.current.getPluralForm(_loc4_,_loc3_,LocText.current.formatHugeNumber(_loc3_));
            _loc2_ = StringUtil.replace(_loc2_,_loc4_,_loc6_);
            if(goal.displayAsTime)
            {
               _loc2_.replace(LocText.current.formatHugeNumber(_loc3_),getTimeString(_loc3_));
            }
         }
         else if(goal.displayAsTime)
         {
            _loc2_ = StringUtil.replace(_loc2_,"<target_value>",getTimeString(value));
         }
         else
         {
            _loc2_ = StringUtil.replace(_loc2_,"<target_value>",LocText.current.formatHugeNumber(value));
         }
         if(_loc2_.indexOf("[v:<progress_value>") != -1)
         {
            _loc4_ = LocText.current.getParameterString(_loc2_,1,"<progress_value>");
            _loc3_ = _loc5_;
            _loc6_ = LocText.current.getPluralForm(_loc4_,_loc3_,LocText.current.formatHugeNumber(_loc3_));
            _loc2_ = StringUtil.replace(_loc2_,_loc4_,_loc6_);
            if(goal.displayAsTime)
            {
               _loc2_.replace(LocText.current.formatHugeNumber(_loc3_),getTimeString(_loc3_));
            }
         }
         if(goal.displayAsTime)
         {
            _loc2_ = StringUtil.replace(_loc2_,"<progress_value>",getTimeString(_loc5_));
         }
         else
         {
            _loc2_ = StringUtil.replace(_loc2_,"<progress_value>",LocText.current.formatHugeNumber(_loc5_));
         }
         return _loc2_;
      }
      
      public function statisticsDescription(param1:Character) : String
      {
         var _loc2_:int = _goal.currentValue(param1);
         return LocText.current.text("goal/" + _goal.identifier + "/statistics_progress",LocText.current.formatHugeNumber(_loc2_));
      }
      
      public function progressText(param1:Character) : String
      {
         var _loc2_:int = _goal.currentValue(param1,_goal.currentTargetValue(param1) == this && !isCollected(param1) && !isCollectable(param1));
         if(goal.displayAsTime)
         {
            return getTimeString(Math.min(_loc2_,value)) + "/" + getTimeString(value);
         }
         return LocText.current.formatHugeNumber(Math.min(_loc2_,value)) + "/" + LocText.current.formatHugeNumber(value);
      }
      
      public function progressValue(param1:Character) : Number
      {
         var _loc2_:int = Math.min(_goal.currentValue(param1,_goal.currentTargetValue(param1) == this && !isCollected(param1) && !isCollectable(param1)),value);
         return _loc2_ / value;
      }
      
      public function getTimeString(param1:int) : String
      {
         var _loc2_:int = Math.floor(param1 / 3600);
         var _loc3_:int = Math.floor(param1 / 60 % 60);
         return _loc2_ + ":" + (_loc3_ < 10?"0" + _loc3_:_loc3_);
      }
      
      public function get rewardText() : String
      {
         var _loc1_:int = GameUtil.getGoalRewardAmount(rewardType,rewardFactor,estimatedLevel);
         switch(int(rewardType) - 1)
         {
            case 0:
               return GameUtil.getGameCurrencyString(_loc1_);
            case 1:
               return GameUtil.getPremiumCurrencyString(_loc1_);
            case 2:
               return GameUtil.getStatPointString(_loc1_);
            case 3:
               return GameUtil.getXpString(_loc1_);
            case 4:
               return LocText.current.text("general/item_reward_text");
            case 5:
               return GameUtil.getEnergyString(_loc1_);
            case 6:
               return LocText.current.text("general/base_panel/booster_tooltip");
         }
      }
      
      public function get rewardAmount() : int
      {
         return GameUtil.getGoalRewardAmount(rewardType,rewardFactor,estimatedLevel);
      }
      
      public function get isPremiumCurrencyReward() : Boolean
      {
         return rewardType == 2;
      }
      
      public function get isGameCurrencyReward() : Boolean
      {
         return rewardType == 1;
      }
      
      public function get isXpReward() : Boolean
      {
         return rewardType == 4;
      }
      
      public function get isStatPointReward() : Boolean
      {
         return rewardType == 3;
      }
      
      public function get isItemReward() : Boolean
      {
         return rewardType == 5;
      }
      
      public function get isQuestEnergyReward() : Boolean
      {
         return rewardType == 6;
      }
      
      public function get isBoosterReward() : Boolean
      {
         return rewardType == 7;
      }
      
      public function get hasTitleReward() : Boolean
      {
         return rewardTitle != null && rewardTitle != "";
      }
      
      public function get isCurrentStorygoal() : Boolean
      {
         return User.current.character.currentStoryGoal == this;
      }
      
      public function stageInfo() : String
      {
         var _loc1_:* = null;
         var _loc3_:String = "";
         var _loc2_:int = _goal.identifier.indexOf("_stage");
         if(_loc2_ >= 0)
         {
            _loc1_ = _goal.identifier.substring(_loc2_ + 6,_goal.identifier.indexOf("_",_loc2_ + 6));
            _loc3_ = "\n\n" + LocText.current.text("dialog/goals/stage_info",LocText.current.text("dialog/stage_unlocked/stage" + _loc1_ + "_title"));
         }
         return _loc3_;
      }
   }
}
