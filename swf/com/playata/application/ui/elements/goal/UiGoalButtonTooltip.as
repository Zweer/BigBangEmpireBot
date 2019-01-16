package com.playata.application.ui.elements.goal
{
   import com.playata.application.AppConfig;
   import com.playata.application.data.goal.GoalValue;
   import com.playata.application.data.user.User;
   import com.playata.application.ui.elements.generic.UiClosableTooltip;
   import com.playata.application.ui.elements.generic.progressbar.UiProgressBarBig;
   import com.playata.framework.display.IInteractiveDisplayObject;
   import com.playata.framework.localization.LocText;
   import visuals.ui.base.SymbolUiGoalItemButtonTooltipGeneric;
   
   public class UiGoalButtonTooltip extends UiClosableTooltip
   {
      
      private static var _tooltipContent:SymbolUiGoalItemButtonTooltipGeneric = null;
      
      private static var _progressBar:UiProgressBarBig;
      
      private static var _currentGoalValue:GoalValue;
       
      
      private var _goalValue:GoalValue;
      
      public function UiGoalButtonTooltip(param1:IInteractiveDisplayObject, param2:GoalValue = null)
      {
         if(!_tooltipContent)
         {
            _tooltipContent = new SymbolUiGoalItemButtonTooltipGeneric();
            _tooltipContent.captionProgress.text = LocText.current.text("dialog/change_stage/goal_progress_tooltip");
            _tooltipContent.captionProgress.autoFontSize = true;
            _tooltipContent.captionReward.text = LocText.current.text("dialog/change_stage/goal_reward_tooltip");
            _tooltipContent.captionReward.autoFontSize = true;
            _progressBar = new UiProgressBarBig(_tooltipContent.progressBar);
            _tooltipContent.txtName.autoFontSize = true;
            _tooltipContent.txtReward.autoFontSize = true;
            _tooltipContent.title.txtRewardTitle.text = LocText.current.text("general/title");
            _tooltipContent.title.txtRewardTitle.autoFontSize = true;
         }
         _tooltipContent.visible = false;
         super(param1,_tooltipContent);
         this.goalValue = param2;
      }
      
      override public function dispose() : void
      {
         _goalValue = null;
         super.dispose();
      }
      
      override public function onAssigned() : void
      {
         if(_currentGoalValue == _goalValue)
         {
            return;
         }
         _currentGoalValue = _goalValue;
         if(_goalValue == null)
         {
            _tooltipContent.visible = false;
            return;
         }
         _tooltipContent.visible = true;
         var _loc1_:int = _goalValue.goal.currentValue(User.current.character,true);
         _progressBar.value = Math.round(_loc1_ / _goalValue.value * 100);
         _tooltipContent.txtName.text = LocText.current.text("goal/" + _goalValue.goal.identifier + "/title");
         _tooltipContent.txtProgress.text = _loc1_ + "/" + _goalValue.value;
         _tooltipContent.txtReward.text = _goalValue.rewardText;
         _tooltipContent.iconCoins.visible = _goalValue.isGameCurrencyReward;
         _tooltipContent.iconPremiumCurrency.visible = _goalValue.isPremiumCurrencyReward;
         _tooltipContent.iconXp.visible = _goalValue.isXpReward;
         _tooltipContent.iconStatPoints.visible = _goalValue.isStatPointReward;
         _tooltipContent.iconItem.visible = _goalValue.isItemReward;
         _tooltipContent.iconQuestEnergy.visible = _goalValue.isQuestEnergyReward;
         _tooltipContent.iconBooster.visible = _goalValue.isBoosterReward;
         if(_goalValue.hasTitleReward && AppConfig.titlesEnabled)
         {
            _tooltipContent.title.visible = true;
            _tooltipContent.background.height = 163;
         }
         else
         {
            _tooltipContent.title.visible = false;
            _tooltipContent.background.height = 138;
         }
         placeCloseButton(_tooltipContent.background);
      }
      
      public function set goalValue(param1:GoalValue) : void
      {
         _goalValue = param1;
      }
      
      public function get goalValue() : GoalValue
      {
         return _goalValue;
      }
   }
}
