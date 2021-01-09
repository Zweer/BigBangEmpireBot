package com.playata.application.ui.elements.goal
{
   import com.playata.application.AppConfig;
   import com.playata.application.data.GameUtil;
   import com.playata.application.data.character.Character;
   import com.playata.application.data.constants.CBooster;
   import com.playata.application.data.dating.DatingUtil;
   import com.playata.application.data.goal.GoalValue;
   import com.playata.application.data.titles.Titles;
   import com.playata.application.data.user.User;
   import com.playata.application.ui.ViewManager;
   import com.playata.application.ui.effects.EffectOptions;
   import com.playata.application.ui.effects.EffectsLayer;
   import com.playata.application.ui.elements.booster.UiBoosterIcon;
   import com.playata.application.ui.elements.generic.button.UiTextButton;
   import com.playata.application.ui.elements.generic.dialog.UiTwoChoiceDialog;
   import com.playata.application.ui.elements.generic.textfield.UiTextTooltip;
   import com.playata.application.ui.elements.item.UiItemSlot;
   import com.playata.framework.application.Environment;
   import com.playata.framework.application.request.ActionRequestResponse;
   import com.playata.framework.core.util.TimeUtil;
   import com.playata.framework.display.IDisplayObject;
   import com.playata.framework.display.ui.IListItem;
   import com.playata.framework.display.ui.controls.ListLine;
   import com.playata.framework.input.InteractionEvent;
   import com.playata.framework.localization.LocText;
   import visuals.ui.elements.goal.SymbolGoalInfoLineGeneric;
   
   public class UiGoalInfoLine extends ListLine
   {
       
      
      private var _goalValue:GoalValue = null;
      
      private var _rawContent:SymbolGoalInfoLineGeneric = null;
      
      private var _btnCollect:UiTextButton;
      
      private var _itemReward:UiItemSlot;
      
      private var _boosterReward:UiBoosterIcon;
      
      private var _tooltipQuestEnergyIcon:UiTextTooltip;
      
      private var _tooltipRewardText:UiTextTooltip;
      
      private var _finishedTooltip:UiTextTooltip;
      
      private var _tooltipLock:UiTextTooltip;
      
      private var _tooltipBooster:UiTextTooltip;
      
      private var _tooltipTitle:UiTextTooltip;
      
      private var _tooltipDatingIcon:UiTextTooltip;
      
      private var _tooltipDatingText:UiTextTooltip;
      
      private var _character:Character;
      
      private var _onCloseFunction:Function;
      
      private var _onRewardCollected:Function;
      
      public function UiGoalInfoLine(param1:GoalValue, param2:int)
      {
         _goalValue = param1;
         _rawContent = new SymbolGoalInfoLineGeneric();
         super(_rawContent,param2);
         _btnCollect = new UiTextButton(_rawContent.btnCollect,LocText.current.text("dialog/goals/button_collect"),LocText.current.text("dialog/goals/button_collect_tooltip"),onClickCollect);
         _rawContent.txtNew.text = LocText.current.text("dialog/goals/new");
         _rawContent.txtDatingReward.text = LocText.current.text("dating/dating_step/reward_picture",LocText.current.text("dialog/goals/text_dating_picture_info"));
         _rawContent.txtDatingReward.autoFontSize = true;
         _itemReward = new UiItemSlot(_rawContent.itemReward,0);
         _boosterReward = new UiBoosterIcon(_rawContent.boosterReward,1);
         _tooltipQuestEnergyIcon = new UiTextTooltip(_rawContent.iconQuestEnergy,LocText.current.text("dialog/goals/quest_energy_tooltip"));
         _tooltipRewardText = new UiTextTooltip(_rawContent.txtReward,"");
         _finishedTooltip = new UiTextTooltip(_rawContent.iconCheckmark,"");
         _tooltipLock = new UiTextTooltip(_rawContent.iconLock,LocText.current.text("dialog/goals/goal_locked_tooltip"));
         _tooltipBooster = new UiTextTooltip(_rawContent.boosterReward,"");
         _tooltipTitle = new UiTextTooltip(_rawContent.title,"");
         _tooltipDatingIcon = new UiTextTooltip(_rawContent.iconDating,LocText.current.text("dialog/tutorial_complete/dating_tooltip"));
         _tooltipDatingText = new UiTextTooltip(_rawContent.txtDatingReward,LocText.current.text("dialog/tutorial_complete/dating_tooltip"));
         _rawContent.title.txtRewardTitle.text = LocText.current.text("general/title");
         _rawContent.txtStage.autoFontSize = true;
         _rawContent.txtProgress.autoFontSize = true;
         _rawContent.txtReward.autoFontSize = true;
      }
      
      override public function dispose() : void
      {
         _btnCollect.dispose();
         _btnCollect = null;
         _itemReward.dispose();
         _itemReward = null;
         _boosterReward.dispose();
         _boosterReward = null;
         _tooltipQuestEnergyIcon.dispose();
         _tooltipQuestEnergyIcon = null;
         _tooltipRewardText.dispose();
         _tooltipRewardText = null;
         _finishedTooltip.dispose();
         _finishedTooltip = null;
         _tooltipLock.dispose();
         _tooltipLock = null;
         _tooltipBooster.dispose();
         _tooltipBooster = null;
         _tooltipTitle.dispose();
         _tooltipTitle = null;
         _tooltipDatingIcon.dispose();
         _tooltipDatingIcon = null;
         _tooltipDatingText.dispose();
         _tooltipDatingText = null;
         super.dispose();
      }
      
      public function refreshLocalization() : void
      {
         _btnCollect.caption = LocText.current.text("dialog/goals/button_collect");
         _btnCollect.tooltip = LocText.current.text("dialog/goals/button_collect_tooltip");
         _rawContent.txtNew.text = LocText.current.text("dialog/goals/new");
         _tooltipQuestEnergyIcon.text = LocText.current.text("dialog/goals/quest_energy_tooltip");
         _tooltipLock.text = LocText.current.text("dialog/goals/goal_locked_tooltip");
      }
      
      private function onClickCollect(param1:InteractionEvent) : void
      {
         if(_rawContent.boosterReward.visible)
         {
            if(User.current.character.questBoosterActive && _boosterReward.type == 1)
            {
               if(User.current.character.activeQuestBoosterId != _boosterReward.boosterId)
               {
                  Environment.panelManager.showDialog(new UiTwoChoiceDialog(LocText.current.text("dialog/boosters/overwrite_title"),LocText.current.text("dialog/boosters/overwrite_text_quest"),LocText.current.text("general/button_yes"),LocText.current.text("general/button_no"),collectReward));
                  return;
               }
            }
            else if(User.current.character.statsBoosterActive && _boosterReward.type == 2)
            {
               if(User.current.character.activeStatsBoosterId != _boosterReward.boosterId)
               {
                  Environment.panelManager.showDialog(new UiTwoChoiceDialog(LocText.current.text("dialog/boosters/overwrite_title"),LocText.current.text("dialog/boosters/overwrite_text_stats"),LocText.current.text("general/button_yes"),LocText.current.text("general/button_no"),collectReward));
                  return;
               }
            }
            else if(User.current.character.workBoosterActive && _boosterReward.type == 3)
            {
               if(User.current.character.activeWorkBoosterId != _boosterReward.boosterId)
               {
                  Environment.panelManager.showDialog(new UiTwoChoiceDialog(LocText.current.text("dialog/boosters/overwrite_title"),LocText.current.text("dialog/boosters/overwrite_text_work"),LocText.current.text("general/button_yes"),LocText.current.text("general/button_no"),collectReward));
                  return;
               }
            }
         }
         collectReward();
      }
      
      private function collectReward() : void
      {
         _btnCollect.enabled = false;
         Environment.application.sendActionRequest("collectGoalReward",{
            "identifier":_goalValue.goal.identifier,
            "value":_goalValue.value,
            "discard_item":false
         },handleRequests);
      }
      
      override public function get height() : Number
      {
         return _rawContent.backgroundOdd.height;
      }
      
      override public function get backgroundOdd() : IDisplayObject
      {
         return _rawContent.backgroundOdd;
      }
      
      override public function get backgroundEven() : IDisplayObject
      {
         return _rawContent.backgroundEven;
      }
      
      override public function refresh(param1:IListItem, param2:int) : void
      {
         super.refresh(param1,param2);
         _goalValue = param1 as GoalValue;
         if(!param1)
         {
            return;
         }
         refreshContent();
      }
      
      private function refreshContent() : void
      {
         if(!_goalValue)
         {
            return;
         }
         try
         {
            useHandCursor = false;
            if(_goalValue.goal.currentGoalValue(_character) == _goalValue)
            {
               _rawContent.backgroundOdd.visible = false;
               _rawContent.backgroundEven.visible = false;
               _rawContent.backgroundHighlight.visible = true;
            }
            else
            {
               _rawContent.backgroundHighlight.visible = false;
            }
            _rawContent.iconLock.visible = !_goalValue.isAvailable(_character) && !_goalValue.isCollected(_character) && !_goalValue.isCollectable(_character);
            _rawContent.txtStage.text = _goalValue.goal.values.indexOf(_goalValue) + 1 + ".";
            if(_rawContent.iconLock.visible)
            {
               _rawContent.txtProgress.text = LocText.current.text("dialog/goal/goal_locked");
            }
            else
            {
               _rawContent.txtProgress.text = _goalValue.shortDescription(_character);
            }
            _rawContent.txtReward.text = _goalValue.rewardText;
            _rawContent.iconCoins.visible = _goalValue.isGameCurrencyReward;
            _rawContent.iconPremiumCurrency.visible = _goalValue.isPremiumCurrencyReward;
            _rawContent.iconXp.visible = _goalValue.isXpReward;
            _rawContent.iconStatPoints.visible = _goalValue.isStatPointReward;
            _rawContent.iconItem.visible = _goalValue.isItemReward;
            _rawContent.iconQuestEnergy.visible = _goalValue.isQuestEnergyReward;
            _rawContent.iconBooster.visible = _goalValue.isBoosterReward;
            _rawContent.itemReward.visible = false;
            _rawContent.boosterReward.visible = false;
            if(_rawContent.iconQuestEnergy.visible)
            {
               _tooltipRewardText.text = LocText.current.text("dialog/goals/quest_energy_tooltip");
            }
            else
            {
               _tooltipRewardText.text = "";
            }
            _rawContent.iconNew.visible = _goalValue.isNew;
            _rawContent.txtNew.visible = _rawContent.iconNew.visible;
            _rawContent.iconCheckmark.visible = _goalValue.isCollected(_character);
            _btnCollect.visible = false;
            if(_rawContent.iconCheckmark.visible)
            {
               _finishedTooltip.text = _goalValue.longDescription(_character) + "\n\n" + LocText.current.text("dialog/goal/collected_date",_goalValue.collectedDate(_character));
            }
            var _loc2_:* = DatingUtil.isAvailable && _goalValue.goal.identifier == "second_quests_completed";
            _rawContent.txtDatingReward.visible = _loc2_;
            _rawContent.iconDating.visible = _loc2_;
            if(_goalValue.hasTitleReward && AppConfig.titlesEnabled)
            {
               _rawContent.title.visible = true;
               _tooltipTitle.text = LocText.current.text("dialog/goals/info_progress_title",Titles.instance.getNameWithTitle(User.current.character.name,_goalValue.rewardTitle));
            }
            else
            {
               _rawContent.title.visible = false;
               _tooltipTitle.text = "";
            }
            if(_rawContent.title.visible || _rawContent.iconDating.visible)
            {
               _rawContent.backgroundHighlight.height = 79;
               _rawContent.backgroundOdd.height = 79;
               _rawContent.backgroundEven.height = 79;
            }
            else
            {
               _rawContent.backgroundHighlight.height = 49;
               _rawContent.backgroundOdd.height = 49;
               _rawContent.backgroundEven.height = 49;
            }
            if(_goalValue.isCollectable(_character) && !_goalValue.isCollected(_character))
            {
               _loc2_ = false;
               _rawContent.txtNew.visible = _loc2_;
               _rawContent.iconNew.visible = _loc2_;
               _btnCollect.visible = true;
               _rawContent.itemReward.visible = _goalValue.isItemReward;
               _rawContent.boosterReward.visible = _goalValue.isBoosterReward;
               if(_rawContent.boosterReward.visible)
               {
                  _rawContent.iconBooster.visible = false;
                  _boosterReward.type = CBooster.fromId(_goalValue.rewardIdentifier).type;
                  _boosterReward.refresh(_goalValue.rewardIdentifier,-1);
                  _tooltipBooster.text = getBoosterTooltip(_goalValue.rewardIdentifier,int(_goalValue.rewardFactor));
               }
               _itemReward.item = null;
               if(_rawContent.itemReward.visible)
               {
                  _rawContent.iconItem.visible = false;
                  if(UiGoalInfo.GOAL_ITEM_IDS.exists(_goalValue.itemId) && User.current.character.hasItem(UiGoalInfo.GOAL_ITEM_IDS.getData(_goalValue.itemId)))
                  {
                     _itemReward.item = User.current.character.getItemById(UiGoalInfo.GOAL_ITEM_IDS.getData(_goalValue.itemId));
                     _rawContent.txtReward.text = _itemReward.item.name;
                  }
               }
               _btnCollect.enabled = true;
            }
            if(_rawContent.txtReward.textHeight > 30)
            {
               _rawContent.txtReward.y = 5;
            }
            else
            {
               _rawContent.txtReward.y = 13;
            }
            if(_rawContent.txtProgress.textHeight > 30)
            {
               _rawContent.txtProgress.y = 5;
            }
            else
            {
               _rawContent.txtProgress.y = 13;
            }
            return;
         }
         catch(e:Error)
         {
            return;
         }
      }
      
      private function handleRequests(param1:ActionRequestResponse) : void
      {
         var _loc2_:* = param1.action;
         if("collectGoalReward" !== _loc2_)
         {
            throw new Error("Unsupported request action \'" + param1.action + "\'!");
         }
         if(param1.error == "")
         {
            Environment.application.updateData(param1.data);
            Environment.audio.playFX("goal_collected.mp3");
            showRewardEffect(!param1.request.getBoolean("discard_item"));
            _onRewardCollected();
            refreshContent();
         }
         else if(param1.error == "errInventoryNoEmptySlot")
         {
            Environment.panelManager.showDialog(new UiTwoChoiceDialog(LocText.current.text("dialog/no_free_slot/title"),LocText.current.text("dialog/no_free_slot/text",GameUtil.getGameCurrencyString(_itemReward.item.sellPrice)),LocText.current.text("dialog/no_free_slot/button_go_to_shop"),LocText.current.text("dialog/no_free_slot/button_discard_item"),onClickGotoShop,onClickDiscardItem));
         }
         else if(param1.error != "errCollectGoalAlreadyExists")
         {
            if(param1.error != "errGetItemRewardInvalidItem")
            {
               Environment.reportError(param1.error,param1.request);
            }
         }
      }
      
      private function onClickGotoShop() : void
      {
         ViewManager.instance.showPanel("shop");
      }
      
      private function onClickDiscardItem() : void
      {
         Environment.application.sendActionRequest("collectGoalReward",{
            "identifier":_goalValue.goal.identifier,
            "value":_goalValue.value,
            "discard_item":true
         },handleRequests);
      }
      
      private function showRewardEffect(param1:Boolean) : void
      {
         try
         {
            if(_rawContent.iconCoins.visible)
            {
               EffectsLayer.instance.show(0,EffectOptions.fromData({"emitter":_rawContent.iconCoins}),Environment.display.displayContext.stage);
            }
            if(_rawContent.iconXp.visible)
            {
               EffectsLayer.instance.show(1,EffectOptions.fromData({"emitter":_rawContent.iconXp}),Environment.display.displayContext.stage);
            }
            if(_rawContent.iconPremiumCurrency.visible)
            {
               EffectsLayer.instance.show(2,EffectOptions.fromData({
                  "emitter":_rawContent.iconPremiumCurrency,
                  "amount":_goalValue.rewardAmount
               }),Environment.display.displayContext.stage);
            }
            if(param1 && _goalValue.isItemReward && _itemReward && _itemReward.item)
            {
               EffectsLayer.instance.show(3,EffectOptions.fromData({
                  "emitter":_rawContent.itemReward,
                  "imageUrl":_itemReward.item.iconImageUrl
               }),Environment.display.displayContext.stage);
            }
            if(_rawContent.iconStatPoints.visible)
            {
               EffectsLayer.instance.show(7,EffectOptions.fromData({
                  "emitter":_rawContent.iconCoins,
                  "amount":Math.round(_goalValue.rewardAmount / 3)
               }),Environment.display.displayContext.stage);
            }
            if(_rawContent.title.visible)
            {
               EffectsLayer.instance.show(10,{"emitter":_rawContent.title.iconTitle},Environment.display.displayContext.stage);
            }
            return;
         }
         catch(e:Error)
         {
            return;
         }
      }
      
      public function getBoosterTooltip(param1:String, param2:int) : String
      {
         var _loc6_:CBooster = CBooster.fromId(param1);
         var _loc4_:int = _loc6_.amount;
         var _loc5_:int = _loc6_.type;
         var _loc3_:int = param2 * 60 * 60 * 24;
         switch(int(_loc5_) - 1)
         {
            case 0:
               return LocText.current.text("dialog/boosters/button_tooltip_quest",_loc4_,TimeUtil.secondsToString(_loc3_));
            case 1:
               return LocText.current.text("dialog/boosters/button_tooltip_stats",_loc4_,TimeUtil.secondsToString(_loc3_));
            case 2:
               return LocText.current.text("dialog/boosters/button_tooltip_work",_loc4_,TimeUtil.secondsToString(_loc3_));
         }
      }
      
      public function set character(param1:Character) : void
      {
         _character = param1;
      }
      
      public function set onCloseFunction(param1:Function) : void
      {
         _onCloseFunction = param1;
      }
      
      public function set onRewardCollected(param1:Function) : void
      {
         _onRewardCollected = param1;
      }
   }
}
