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
   import com.playata.application.ui.dialogs.DialogDatingPicture;
   import com.playata.application.ui.effects.EffectsLayer;
   import com.playata.application.ui.elements.booster.UiBoosterIcon;
   import com.playata.application.ui.elements.generic.button.UiTextButton;
   import com.playata.application.ui.elements.generic.dialog.UiTwoChoiceDialog;
   import com.playata.application.ui.elements.generic.textfield.UiTextTooltip;
   import com.playata.application.ui.elements.item.UiItemSlot;
   import com.playata.framework.application.Environment;
   import com.playata.framework.application.request.ActionRequestResponse;
   import com.playata.framework.core.util.TimeUtil;
   import com.playata.framework.input.InteractionEvent;
   import com.playata.framework.localization.LocText;
   import visuals.ui.elements.goal.SymbolGoalCompleteGeneric;
   
   public class UiGoalComplete
   {
       
      
      private var _content:SymbolGoalCompleteGeneric = null;
      
      private var _goalValue:GoalValue = null;
      
      private var _finishedFunction:Function = null;
      
      private var _closeFunction:Function = null;
      
      private var _btnCollect:UiTextButton = null;
      
      private var _itemReward:UiItemSlot = null;
      
      private var _boosterReward:UiBoosterIcon = null;
      
      private var _tooltipTitle:UiTextTooltip;
      
      private var _tooltipBooster:UiTextTooltip = null;
      
      private var _tooltipQuestEnergyIcon:UiTextTooltip = null;
      
      private var _tooltipQuestEnergyText:UiTextTooltip = null;
      
      private var _tooltipDatingIcon:UiTextTooltip = null;
      
      private var _tooltipDatingText:UiTextTooltip = null;
      
      public function UiGoalComplete(param1:SymbolGoalCompleteGeneric, param2:Function, param3:Function)
      {
         super();
         _content = param1;
         _finishedFunction = param2;
         _closeFunction = param3;
         _content.txtRewardsCaption.text = LocText.current.text("dialog/goals/complete_rewards_caption");
         _content.txtDescription.text = LocText.current.text("dialog/goals/complete_text");
         _content.txtDatingReward.text = LocText.current.text("dating/dating_step/reward_picture",LocText.current.text("dialog/goals/text_dating_picture_info"));
         _content.txtDatingReward.autoFontSize = true;
         _btnCollect = new UiTextButton(_content.btnCollect,LocText.current.text("dialog/goals/complete_button_collect"),"",onClickCollect);
         _itemReward = new UiItemSlot(_content.itemReward,0);
         _boosterReward = new UiBoosterIcon(_content.boosterReward,1);
         _tooltipBooster = new UiTextTooltip(_content.boosterReward,"");
         _tooltipQuestEnergyIcon = new UiTextTooltip(_content.iconQuestEnergy,LocText.current.text("dialog/goals/quest_energy_tooltip"));
         _tooltipQuestEnergyText = new UiTextTooltip(_content.txtReward,"");
         _tooltipDatingIcon = new UiTextTooltip(_content.iconDating,LocText.current.text("dialog/tutorial_complete/dating_tooltip"));
         _tooltipDatingText = new UiTextTooltip(_content.txtDatingReward,LocText.current.text("dialog/tutorial_complete/dating_tooltip"));
         _content.title.txtRewardTitle.text = LocText.current.text("general/title");
         _tooltipTitle = new UiTextTooltip(_content.title,"");
      }
      
      private function onClickCollect(param1:InteractionEvent) : void
      {
         if(_content.boosterReward.visible)
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
      
      public function get content() : SymbolGoalCompleteGeneric
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
         _btnCollect.dispose();
         _btnCollect = null;
         _boosterReward.dispose();
         _boosterReward = null;
         _tooltipBooster.dispose();
         _tooltipBooster = null;
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
         _content.itemReward.visible = false;
         _goalValue = param2;
         _content.iconGoal.setUriSprite(_goalValue.goal.iconImageUrl,60,60,true,5,null,true);
         _content.txtTitle.text = _goalValue.title;
         _content.txtReward.text = _goalValue.rewardText;
         _content.iconGoal.x = _content.txtTitle.x + _content.txtTitle.width / 2 - _content.txtTitle.textWidth / 2 - 65;
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
         _content.itemReward.visible = _goalValue.isItemReward;
         _content.boosterReward.visible = _goalValue.isBoosterReward;
         if(_content.boosterReward.visible)
         {
            _boosterReward.type = CBooster.fromId(_goalValue.rewardIdentifier).type;
            _boosterReward.refresh(_goalValue.rewardIdentifier,-1);
            _tooltipBooster.text = getBoosterTooltip(_goalValue.rewardIdentifier,_goalValue.rewardFactor);
         }
         if(_goalValue.isItemReward)
         {
            Environment.application.sendActionRequest("getGoalItemReward",{
               "identifier":_goalValue.goal.identifier,
               "value":_goalValue.value
            },handleRequests);
         }
         if(_goalValue.hasTitleReward && AppConfig.titlesEnabled)
         {
            _content.title.visible = true;
            _tooltipTitle.text = LocText.current.text("dialog/goals/complete_title",Titles.instance.getNameWithTitle(User.current.character.name,_goalValue.rewardTitle));
         }
         else
         {
            _content.title.visible = false;
            _tooltipTitle.text = "";
         }
      }
      
      private function refreshItemReward(param1:int) : void
      {
         if(_itemReward)
         {
            _itemReward.item = User.current.character.getItemById(param1);
         }
      }
      
      private function handleRequests(param1:ActionRequestResponse) : void
      {
         var _loc2_:* = param1.action;
         switch(_loc2_)
         {
            case "getGoalItemReward":
               if(param1.error == "")
               {
                  Environment.application.updateData(param1.data);
                  refreshItemReward(param1.appResponse.item.id);
               }
               else
               {
                  Environment.reportError(param1.error,param1.request);
               }
               break;
            case "collectGoalReward":
               _btnCollect.enabled = true;
               if(param1.error == "")
               {
                  Environment.application.updateData(param1.data);
                  Environment.audio.playFX("goal_collected.mp3");
                  showRewardEffect(!param1.request.getBoolean("discard_item"));
                  if(DatingUtil.isAvailable && _content.iconDating.visible)
                  {
                     Environment.panelManager.showDialog(new DialogDatingPicture(0,2));
                  }
                  _finishedFunction(true);
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
               break;
            default:
               throw new Error("Unsupported request action \'" + param1.action + "\'!");
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
      
      private function showRewardEffect(param1:Boolean) : void
      {
         try
         {
            if(_content.iconCoins.visible)
            {
               EffectsLayer.instance.show(0,{"emitter":_content.iconCoins});
            }
            if(_content.iconXp.visible)
            {
               EffectsLayer.instance.show(1,{"emitter":_content.iconXp});
            }
            if(_content.iconPremiumCurrency.visible)
            {
               EffectsLayer.instance.show(2,{
                  "emitter":_content.iconPremiumCurrency,
                  "amount":_goalValue.rewardAmount
               });
            }
            if(param1 && _goalValue.isItemReward)
            {
               EffectsLayer.instance.show(3,{
                  "emitter":_content.itemReward,
                  "imageUrl":_itemReward.item.iconImageUrl
               });
            }
            if(_content.iconStatPoints.visible)
            {
               EffectsLayer.instance.show(7,{
                  "emitter":_content.iconStatPoints,
                  "amount":Math.round(_goalValue.rewardAmount / 3)
               });
            }
            if(_content.title.visible)
            {
               EffectsLayer.instance.show(10,{"emitter":_content.title.iconTitle});
            }
            return;
         }
         catch(e:Error)
         {
            return;
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
   }
}
