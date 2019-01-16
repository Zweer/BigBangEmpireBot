package com.playata.application.ui.elements.goal
{
   import com.playata.application.AppConfig;
   import com.playata.application.data.character.Character;
   import com.playata.application.data.dating.DatingUtil;
   import com.playata.application.data.goal.GoalValue;
   import com.playata.application.data.titles.Titles;
   import com.playata.application.data.user.User;
   import com.playata.application.ui.elements.generic.button.UiButton;
   import com.playata.application.ui.elements.generic.textfield.UiTextTooltip;
   import com.playata.framework.input.InteractionEvent;
   import com.playata.framework.localization.LocText;
   import visuals.ui.elements.goal.SymbolGoalInfoGeneric;
   
   public class UiGoalInfo
   {
       
      
      private var _content:SymbolGoalInfoGeneric = null;
      
      private var _goalValue:GoalValue = null;
      
      private var _onClickBackFunction:Function = null;
      
      private var _btnBack:UiButton = null;
      
      private var _tooltipTitle:UiTextTooltip;
      
      private var _tooltipQuestEnergyIcon:UiTextTooltip;
      
      private var _tooltipQuestEnergyText:UiTextTooltip;
      
      private var _tooltipDatingIcon:UiTextTooltip;
      
      private var _tooltipDatingText:UiTextTooltip;
      
      public function UiGoalInfo(param1:SymbolGoalInfoGeneric, param2:Function)
      {
         super();
         _content = param1;
         _onClickBackFunction = param2;
         _content.txtProgressCaption.text = LocText.current.text("dialog/goals/info_progress_caption");
         _content.txtRewardsCaption.text = LocText.current.text("dialog/goals/info_rewards_caption");
         _content.txtDatingReward.text = LocText.current.text("dating/dating_step/reward_picture",LocText.current.text("dialog/goals/text_dating_picture_info"));
         _content.txtDatingReward.autoFontSize = true;
         _btnBack = new UiButton(_content.btnBack,"",onClickBack);
         _content.title.txtRewardTitle.text = LocText.current.text("general/title");
         _tooltipTitle = new UiTextTooltip(_content.title,"");
         _tooltipQuestEnergyIcon = new UiTextTooltip(_content.iconQuestEnergy,LocText.current.text("dialog/goals/quest_energy_tooltip"));
         _tooltipQuestEnergyText = new UiTextTooltip(_content.txtReward,"");
         _tooltipDatingIcon = new UiTextTooltip(_content.iconDating,LocText.current.text("dialog/tutorial_complete/dating_tooltip"));
         _tooltipDatingText = new UiTextTooltip(_content.txtDatingReward,LocText.current.text("dialog/tutorial_complete/dating_tooltip"));
      }
      
      private function onClickBack(param1:InteractionEvent) : void
      {
      }
      
      public function get content() : SymbolGoalInfoGeneric
      {
         return _content;
      }
      
      public function get goalValue() : GoalValue
      {
         return _goalValue;
      }
      
      public function dispose() : void
      {
         _tooltipTitle.dispose();
         _tooltipTitle = null;
         _btnBack.dispose();
         _btnBack = null;
         _tooltipDatingIcon.dispose();
         _tooltipDatingIcon = null;
         _tooltipDatingText.dispose();
         _tooltipDatingText = null;
         _tooltipQuestEnergyIcon.dispose();
         _tooltipQuestEnergyIcon = null;
         _tooltipQuestEnergyText.dispose();
         _tooltipQuestEnergyText = null;
      }
      
      public function refresh(param1:Character, param2:GoalValue) : void
      {
         _goalValue = param2;
         _content.iconGoal.setUriSprite(_goalValue.goal.iconImageUrl,60,60,true,5,null,true);
         _content.iconLock.visible = !_goalValue.isAvailable(param1) && !_goalValue.isCollected(param1) && !_goalValue.isCollectable(param1);
         _content.txtTitle.text = _goalValue.title;
         _content.txtDescription.text = _goalValue.longDescription(param1);
         _content.txtDescription.text = _content.txtDescription.text + _goalValue.stageInfo();
         _content.txtDescription.autoFontSize = true;
         _content.txtReward.text = _goalValue.rewardText;
         if(_content.iconLock.visible)
         {
            _content.txtProgress.text = LocText.current.text("dialog/goal/goal_locked");
         }
         else
         {
            _content.txtProgress.text = _goalValue.progressText(param1);
         }
         _content.iconGoal.x = _content.txtTitle.x + _content.txtTitle.width / 2 - _content.txtTitle.textWidth / 2 - 65;
         _content.iconLock.x = _content.iconGoal.x + 32;
         _content.iconCoins.visible = _goalValue.isGameCurrencyReward;
         _content.iconPremiumCurrency.visible = _goalValue.isPremiumCurrencyReward;
         _content.iconXp.visible = _goalValue.isXpReward;
         _content.iconStatPoints.visible = _goalValue.isStatPointReward;
         _content.iconItem.visible = _goalValue.isItemReward;
         _content.iconQuestEnergy.visible = _goalValue.isQuestEnergyReward;
         _content.iconBooster.visible = _goalValue.isBoosterReward;
         var _loc3_:* = DatingUtil.isAvailable && _goalValue.goal.identifier == "second_quests_completed";
         _content.txtDatingReward.visible = _loc3_;
         _content.iconDating.visible = _loc3_;
         if(_content.iconQuestEnergy.visible)
         {
            _tooltipQuestEnergyText.text = LocText.current.text("dialog/goals/quest_energy_tooltip");
         }
         else
         {
            _tooltipQuestEnergyText.text = "";
         }
         if(_goalValue.hasTitleReward && AppConfig.titlesEnabled)
         {
            _content.title.visible = true;
            _tooltipTitle.text = LocText.current.text("dialog/goals/info_progress_title",Titles.instance.getNameWithTitle(User.current.character.name,_goalValue.rewardTitle));
         }
         else
         {
            _content.title.visible = false;
            _tooltipTitle.text = "";
         }
      }
   }
}
