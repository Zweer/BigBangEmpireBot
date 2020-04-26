package com.playata.application.data.convention
{
   import com.playata.application.data.GameUtil;
   import com.playata.application.data.character.Character;
   import com.playata.application.data.constants.CConstant;
   import com.playata.application.data.dataobject.DOConventionShow;
   import com.playata.application.data.quest.IDurationEvent;
   import com.playata.application.data.user.User;
   import com.playata.framework.core.util.TimeUtil;
   import com.playata.framework.localization.LocText;
   
   public class ConventionShow extends DOConventionShow implements IDurationEvent
   {
       
      
      private var _previousStars:Vector.<String>;
      
      public function ConventionShow(param1:Object = null)
      {
         _previousStars = new Vector.<String>();
         super(param1);
      }
      
      public static function get showDuration() : int
      {
         var _loc1_:int = CConstant.quest_duration_short;
         var _loc3_:Character = User.current.character;
         var _loc5_:int = _loc3_.level;
         var _loc2_:int = CConstant.quest_level_full_duration;
         if(_loc5_ < _loc2_)
         {
            _loc1_ = _loc1_ * (_loc5_ / _loc2_);
         }
         _loc1_ = _loc1_ * (1 - _loc3_.activeQuestBoosterAmount / 100);
         var _loc4_:int = Math.round(_loc1_);
         _loc4_ = GameUtil.roundDuration(_loc4_);
         return _loc4_;
      }
      
      public function refreshPreviousStars(param1:Vector.<String>) : void
      {
         _previousStars = new Vector.<String>();
         var _loc4_:int = 0;
         var _loc3_:* = param1;
         for each(var _loc2_ in param1)
         {
            _previousStars.push(_loc2_);
         }
      }
      
      public function get previousStars() : Vector.<String>
      {
         return _previousStars;
      }
      
      public function getAllPreviousStarNames() : String
      {
         var _loc1_:String = "";
         var _loc4_:int = 0;
         var _loc3_:* = _previousStars;
         for each(var _loc2_ in _previousStars)
         {
            _loc1_ = _loc1_ + (_loc2_ + "\n");
         }
         return _loc1_;
      }
      
      public function getPreviousStarNames(param1:int) : String
      {
         var _loc4_:int = 0;
         var _loc6_:int = 0;
         var _loc2_:String = "";
         var _loc5_:int = 0;
         var _loc8_:int = 0;
         var _loc7_:* = _previousStars;
         for each(var _loc3_ in _previousStars)
         {
            if(_loc5_ < param1)
            {
               if(_loc5_ < 10)
               {
                  _loc2_ = _loc3_ + "\n" + _loc2_;
                  _loc5_++;
                  continue;
               }
               break;
            }
            break;
         }
         if(_previousStars.length > 10)
         {
            _loc2_ = _loc2_ + "\n";
            _loc4_ = 0;
            _loc6_ = 0;
            var _loc10_:int = 0;
            var _loc9_:* = _previousStars;
            for each(_loc3_ in _previousStars)
            {
               if(_loc6_ < 10)
               {
                  _loc6_++;
                  continue;
               }
               if(_loc4_ < 10)
               {
                  _loc2_ = _loc2_ + (_loc3_ + "\n");
                  _loc4_++;
                  continue;
               }
               break;
            }
         }
         return _loc2_;
      }
      
      public function get remainingSeconds() : int
      {
         var _loc2_:int = getInt("ts_complete");
         var _loc1_:int = _loc2_ - TimeUtil.now;
         if(_loc1_ < 0)
         {
            _loc1_ = 0;
         }
         return _loc1_;
      }
      
      public function get progress() : Number
      {
         return (1 - remainingSeconds / duration) * 100;
      }
      
      public function get remainingSecondsNonBoosted() : int
      {
         var _loc3_:int = getInt("duration_raw");
         var _loc1_:int = getInt("duration");
         var _loc2_:int = _loc3_ - _loc1_;
         return remainingSeconds + _loc2_;
      }
      
      public function get convention() : Convention
      {
         return User.current.character.getConvention(conventionId);
      }
      
      public function get isStarted() : Boolean
      {
         return status == 1;
      }
      
      public function get isRunning() : Boolean
      {
         return status == 1 && remainingSeconds > 0;
      }
      
      public function get isFinished() : Boolean
      {
         return status == 3;
      }
      
      public function get instantFinishPremiumAmount() : int
      {
         return GameUtil.getConventionShowInstantFinishCost(iterations);
      }
      
      public function get progressText() : String
      {
         return LocText.current.text("convention/" + convention.identifier + "/quest/" + getData("identifier") + "/briefing");
      }
      
      public function winText() : String
      {
         return LocText.current.text("convention/" + convention.identifier + "/quest/" + getData("identifier") + "/win");
      }
      
      public function get isTimeQuest() : Boolean
      {
         return false;
      }
      
      public function get isFightQuest() : Boolean
      {
         return false;
      }
      
      public function get isStatQuest() : Boolean
      {
         return false;
      }
      
      public function get isUserStoryQuest() : Boolean
      {
         return false;
      }
      
      public function get isConventionShow() : Boolean
      {
         return true;
      }
      
      public function get rewardString() : String
      {
         return LocText.current.text("general/reward/coins_name",rewardValue);
      }
      
      public function get rewardValue() : int
      {
         return getInt("reward");
      }
   }
}
