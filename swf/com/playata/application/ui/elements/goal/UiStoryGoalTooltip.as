package com.playata.application.ui.elements.goal
{
   import com.playata.application.AppConfig;
   import com.playata.application.data.character.Character;
   import com.playata.application.data.goal.GoalValue;
   import com.playata.application.data.user.User;
   import com.playata.application.ui.elements.generic.UiClosableTooltip;
   import com.playata.framework.display.IDisplayObject;
   import com.playata.framework.display.IInteractiveDisplayObject;
   import com.playata.framework.display.InteractiveDisplayObject;
   import com.playata.framework.display.ui.TextFieldAutoAdjustWidthHeight;
   import com.playata.framework.localization.LocText;
   import visuals.ui.elements.goal.SymbolStoryGoalTooltipGeneric;
   
   public class UiStoryGoalTooltip extends UiClosableTooltip
   {
      
      private static var _tooltipContent:SymbolStoryGoalTooltipGeneric;
      
      private static var _currentGoalValue:GoalValue = null;
       
      
      private var _goalValue:GoalValue = null;
      
      private var _interactiveDisplayObject:IInteractiveDisplayObject = null;
      
      public function UiStoryGoalTooltip(param1:IDisplayObject)
      {
         if(param1 is IInteractiveDisplayObject)
         {
            _interactiveDisplayObject = param1 as IInteractiveDisplayObject;
         }
         else if(param1)
         {
            _interactiveDisplayObject = new InteractiveDisplayObject(param1);
         }
         if(!_tooltipContent)
         {
            _tooltipContent = new SymbolStoryGoalTooltipGeneric();
            _tooltipContent.txtRewardsCaption.text = LocText.current.text("dialog/goals/info_rewards_caption");
            _tooltipContent.title.txtRewardTitle.text = LocText.current.text("general/title");
            _tooltipContent.txtRewardsCaption.autoFontSize = true;
            _tooltipContent.title.txtRewardTitle.autoFontSize = true;
            _tooltipContent.txtReward.autoFontSize = true;
            _tooltipContent.txtLocation.autoFontSize = true;
            _tooltipContent.txtTitle.autoAdjustWidthHeight = TextFieldAutoAdjustWidthHeight.VERTICAL;
            _tooltipContent.txtDescription.autoAdjustWidthHeight = TextFieldAutoAdjustWidthHeight.VERTICAL;
         }
         _tooltipContent.visible = false;
         super(_interactiveDisplayObject,_tooltipContent);
      }
      
      override public function dispose() : void
      {
         super.dispose();
      }
      
      override public function onAssigned() : void
      {
         if(_currentGoalValue == _goalValue)
         {
            return;
         }
         _currentGoalValue = _goalValue;
         if(_currentGoalValue == null)
         {
            _tooltipContent.visible = false;
            return;
         }
         _tooltipContent.visible = true;
         var _loc1_:Character = User.current.character;
         var _loc2_:String = "";
         switch(int(_currentGoalValue.storyGoalCategory) - 1)
         {
            case 0:
               _loc2_ = LocText.current.text("general/base_panel/character_tooltip");
               break;
            case 1:
               _loc2_ = !!AppConfig.dungeonsEnabled?LocText.current.text("general/base_panel/quests_and_dungeons_tooltip"):LocText.current.text("general/base_panel/quests_tooltip");
               break;
            case 2:
               _loc2_ = LocText.current.text("general/base_panel/item_shop_tooltip");
               break;
            case 3:
               _loc2_ = LocText.current.text("general/base_panel/duel_tooltip");
               break;
            case 4:
               _loc2_ = LocText.current.text("general/base_panel/work_tooltip");
               break;
            case 5:
               _loc2_ = LocText.current.text("general/base_panel/booster_tooltip");
               break;
            case 6:
               _loc2_ = LocText.current.text("general/base_panel/movie_tooltip");
               break;
            case 7:
               _loc2_ = LocText.current.text("general/base_panel/guild_tooltip");
               break;
            case 8:
               _loc2_ = LocText.current.text("general/base_panel/leaderboard_tooltip");
         }
         _tooltipContent.txtLocation.text = LocText.current.text("dialog/goals/location",_loc2_);
         _tooltipContent.txtTitle.text = _currentGoalValue.plainTitle;
         _tooltipContent.txtDescription.text = _currentGoalValue.shortDescription(_loc1_) + "\n\n" + _currentGoalValue.longDescription(_loc1_);
         _tooltipContent.txtReward.text = _currentGoalValue.rewardText;
         _tooltipContent.iconCoins.visible = _currentGoalValue.isGameCurrencyReward;
         _tooltipContent.iconPremiumCurrency.visible = _currentGoalValue.isPremiumCurrencyReward;
         _tooltipContent.iconXp.visible = _currentGoalValue.isXpReward;
         _tooltipContent.iconStatPoints.visible = _currentGoalValue.isStatPointReward;
         _tooltipContent.iconItem.visible = _currentGoalValue.isItemReward;
         _tooltipContent.iconQuestEnergy.visible = _currentGoalValue.isQuestEnergyReward;
         _tooltipContent.iconBooster.visible = _currentGoalValue.isBoosterReward;
         if(_currentGoalValue.hasTitleReward && AppConfig.titlesEnabled)
         {
            _tooltipContent.title.visible = true;
         }
         else
         {
            _tooltipContent.title.visible = false;
         }
         _tooltipContent.iconLocation.gotoAndStop(_currentGoalValue.storyGoalCategory);
         _tooltipContent.txtDescription.y = Math.round(_tooltipContent.txtTitle.y + _tooltipContent.txtTitle.textHeight + 10);
         _tooltipContent.txtRewardsCaption.y = Math.round(_tooltipContent.txtDescription.y + _tooltipContent.txtDescription.textHeight + 10);
         _tooltipContent.txtReward.y = _tooltipContent.txtRewardsCaption.y + 28;
         _tooltipContent.title.y = _tooltipContent.txtReward.y - 3;
         _tooltipContent.iconXp.y = _tooltipContent.txtReward.y - 3;
         _tooltipContent.iconCoins.y = _tooltipContent.txtReward.y - 3;
         _tooltipContent.iconPremiumCurrency.y = _tooltipContent.txtReward.y - 4;
         _tooltipContent.iconItem.y = _tooltipContent.txtReward.y - 3;
         _tooltipContent.iconStatPoints.y = _tooltipContent.txtReward.y - 2;
         _tooltipContent.iconQuestEnergy.y = _tooltipContent.txtReward.y - 1;
         _tooltipContent.iconBooster.y = _tooltipContent.txtReward.y - 5;
         _tooltipContent.backgroundLocation.y = _tooltipContent.txtReward.y + 40;
         _tooltipContent.txtLocation.y = _tooltipContent.backgroundLocation.y + 15;
         _tooltipContent.iconLocation.y = _tooltipContent.backgroundLocation.y + 12;
         var _loc3_:Number = _tooltipContent.backgroundLocation.y + _tooltipContent.backgroundLocation.height;
         _tooltipContent.background.height = _loc3_ + 30;
         placeCloseButton(_tooltipContent.background);
      }
      
      public function refresh(param1:GoalValue) : void
      {
         _goalValue = param1;
      }
   }
}
