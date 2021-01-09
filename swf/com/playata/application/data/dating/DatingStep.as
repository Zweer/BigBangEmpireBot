package com.playata.application.data.dating
{
   import com.playata.application.data.GameUtil;
   import com.playata.application.data.character.Character;
   import com.playata.application.data.constants.CConstant;
   import com.playata.application.data.constants.CDatingStep;
   import com.playata.application.data.dataobject.DODatingStep;
   import com.playata.application.data.outfit.Outfit;
   import com.playata.application.data.reward.Reward;
   import com.playata.application.data.user.User;
   import com.playata.application.platform.ServerInfo;
   import com.playata.framework.core.TypedObject;
   import com.playata.framework.core.util.StringUtil;
   import com.playata.framework.core.util.TimeUtil;
   import com.playata.framework.localization.LocText;
   
   public class DatingStep extends DODatingStep
   {
       
      
      private var _rewards:Reward = null;
      
      public function DatingStep(param1:Object = null)
      {
         super(param1);
      }
      
      override public function update(param1:TypedObject) : void
      {
         super.update(param1);
         if(_rewards)
         {
            _rewards = null;
         }
      }
      
      public function get reward() : Reward
      {
         if(_rewards)
         {
            return _rewards;
         }
         _rewards = new Reward(rewards);
         return _rewards;
      }
      
      public function get stage() : int
      {
         return DatingUtil.getDatingTemplate(datingIndex).stage;
      }
      
      public function get hasFreeAttack() : Boolean
      {
         return TimeUtil.now - tsLastAttack > CConstant.dating_attack_cooldown;
      }
      
      public function get secondsUntilFreeAttack() : int
      {
         return CConstant.dating_attack_cooldown - (TimeUtil.now - tsLastAttack);
      }
      
      public function get pointsNeeded() : int
      {
         if(!repeat)
         {
            return DatingUtil.getDatingStepTemplate(datingIndex,stepIndex).unlockPointsNeeded;
         }
         return DatingUtil.getDatingStepTemplate(datingIndex,stepIndex).unlockPointsNeededRepeat;
      }
      
      public function get identifier() : String
      {
         return DatingUtil.getDatingTemplate(datingIndex).identifier;
      }
      
      public function get rewardReference() : String
      {
         return DatingUtil.getDatingStepTemplate(datingIndex,stepIndex).reference;
      }
      
      public function allPointsCollected() : Boolean
      {
         return pointsCollected >= pointsNeeded;
      }
      
      public function get isStarted() : Boolean
      {
         return status == 2;
      }
      
      public function get isFinished() : Boolean
      {
         return status == 3;
      }
      
      public function get isRewardProcessed() : Boolean
      {
         return status == 4;
      }
      
      public function get questButtonImageUrl() : String
      {
         return ServerInfo.assetURL("dating/" + identifier + "_b","png");
      }
      
      public function get progress() : Number
      {
         return pointsCollected / pointsNeeded * 100;
      }
      
      public function get progressText() : String
      {
         var _loc3_:String = null;
         var _loc2_:int = 0;
         var _loc4_:String = null;
         var _loc1_:String = LocText.current.text("dating/" + identifier + "/" + stepIndex + "/progress");
         if(_loc1_.indexOf("[v:<target_value>") != -1)
         {
            _loc3_ = LocText.current.getParameterString(_loc1_,1,"<target_value>");
            _loc2_ = pointsNeeded;
            _loc4_ = LocText.current.getPluralForm(_loc3_,_loc2_,LocText.current.formatHugeNumber(_loc2_));
            _loc1_ = _loc1_.replace(_loc3_,_loc4_);
         }
         else
         {
            _loc1_ = StringUtil.replace(_loc1_,"<target_value>",LocText.current.formatHugeNumber(pointsNeeded));
         }
         if(_loc1_.indexOf("[v:<progress_value>") != -1)
         {
            _loc3_ = LocText.current.getParameterString(_loc1_,1,"<progress_value>");
            _loc2_ = Math.min(pointsCollected,pointsNeeded);
            _loc4_ = LocText.current.getPluralForm(_loc3_,_loc2_,LocText.current.formatHugeNumber(_loc2_));
            _loc1_ = _loc1_.replace(_loc3_,_loc4_);
         }
         _loc1_ = StringUtil.replace(_loc1_,"<progress_value>",LocText.current.formatHugeNumber(Math.min(pointsCollected,pointsNeeded)));
         return _loc1_;
      }
      
      public function get tooltipText() : String
      {
         var _loc3_:String = null;
         var _loc2_:int = 0;
         var _loc4_:String = null;
         var _loc1_:String = LocText.current.text("screen/quest/button_dating_tooltip/" + identifier + "/" + stepIndex);
         if(_loc1_.indexOf("[v:<target_value>") != -1)
         {
            _loc3_ = LocText.current.getParameterString(_loc1_,1,"<target_value>");
            _loc2_ = pointsNeeded;
            _loc4_ = LocText.current.getPluralForm(_loc3_,_loc2_,LocText.current.formatHugeNumber(_loc2_));
            _loc1_ = _loc1_.replace(_loc3_,_loc4_);
         }
         else
         {
            _loc1_ = StringUtil.replace(_loc1_,"<target_value>",LocText.current.formatHugeNumber(pointsNeeded));
         }
         if(_loc1_.indexOf("[v:<progress_value>") != -1)
         {
            _loc3_ = LocText.current.getParameterString(_loc1_,1,"<progress_value>");
            _loc2_ = Math.min(pointsCollected,pointsNeeded);
            _loc4_ = LocText.current.getPluralForm(_loc3_,_loc2_,LocText.current.formatHugeNumber(_loc2_));
            _loc1_ = _loc1_.replace(_loc3_,_loc4_);
         }
         _loc1_ = StringUtil.replace(_loc1_,"<progress_value>",LocText.current.formatHugeNumber(Math.min(pointsCollected,pointsNeeded)));
         return _loc1_;
      }
      
      public function get failedAttributeHint() : String
      {
         var _loc2_:* = null;
         var _loc1_:CDatingStep = DatingUtil.getDatingStepTemplate(datingIndex,stepIndex);
         var _loc4_:String = "";
         switch(int(_loc1_.statType) - 1)
         {
            case 0:
               _loc4_ = LocText.current.text("general/stat_stamina");
               break;
            case 1:
               _loc4_ = LocText.current.text("general/stat_strength");
               break;
            case 2:
               _loc4_ = LocText.current.text("general/stat_critical_rating");
               break;
            case 3:
               _loc4_ = LocText.current.text("general/stat_dodge_rating");
         }
         var _loc3_:int = 0;
         if(repeat)
         {
            _loc3_ = GameUtil.calculateNeededSatForStatQuest(User.current.character,_loc1_.statType,3);
         }
         else
         {
            _loc3_ = _loc1_.statValue;
         }
         if(!repeat)
         {
            return LocText.current.text("dialog/dating_fought/failed_attribute_hint",_loc3_,_loc4_);
         }
         var _loc7_:int = 0;
         switch(int(_loc1_.statType) - 1)
         {
            case 0:
               _loc7_ = 2;
               break;
            case 1:
               _loc7_ = 3;
               break;
            case 2:
               _loc7_ = 4;
               break;
            case 3:
               _loc7_ = 5;
         }
         var _loc5_:Character = User.current.character;
         var _loc6_:Outfit = _loc5_.outfits.getOutfitWithSetting(_loc7_);
         var _loc8_:int = 0;
         if(_loc6_)
         {
            _loc2_ = _loc5_.outfits.getCharacterStatsWithOutfit(_loc5_,_loc6_);
            switch(int(_loc1_.statType) - 1)
            {
               case 0:
                  _loc8_ = _loc2_.getInt("stat_total_stamina");
                  break;
               case 1:
                  _loc8_ = _loc2_.getInt("stat_total_strength");
                  break;
               case 2:
                  _loc8_ = _loc2_.getInt("stat_total_critical_rating");
                  break;
               case 3:
                  _loc8_ = _loc2_.getInt("stat_total_dodge_rating");
            }
            return LocText.current.text("dialog/quest_briefing/stat_quest/needed_stat_with_outfit",LocText.current.formatHugeNumber(_loc3_),LocText.current.formatHugeNumber(_loc8_),_loc4_,_loc6_.name);
         }
         switch(4 - 1)
         {
            case 0:
               _loc8_ = _loc5_.statTotalStamina;
               break;
            case 1:
               _loc8_ = _loc5_.statTotalStrength;
               break;
            case 2:
               _loc8_ = _loc5_.statTotalCriticalRating;
               break;
            case 3:
               _loc8_ = _loc5_.statTotalDodgeRating;
         }
         return LocText.current.text("dialog/quest_briefing/stat_quest/needed_stat",LocText.current.formatHugeNumber(_loc3_),LocText.current.formatHugeNumber(_loc8_),_loc4_);
      }
      
      public function get isLastStep() : Boolean
      {
         return stepIndex == 5;
      }
      
      public function get instantFinishCost() : int
      {
         var _loc1_:CDatingStep = DatingUtil.getDatingStepTemplate(datingIndex,stepIndex);
         var _loc2_:int = _loc1_.skipPrice;
         if(repeat)
         {
            _loc2_ = _loc1_.skipPriceRepeat;
         }
         return Math.ceil((100 - (progress as int)) / 100 * _loc2_);
      }
   }
}
