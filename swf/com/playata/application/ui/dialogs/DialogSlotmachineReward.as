package com.playata.application.ui.dialogs
{
   import com.playata.application.data.GameUtil;
   import com.playata.application.data.constants.CBooster;
   import com.playata.application.data.item.Item;
   import com.playata.application.data.reward.Reward;
   import com.playata.application.data.user.User;
   import com.playata.application.ui.ViewManager;
   import com.playata.application.ui.effects.EffectsLayer;
   import com.playata.application.ui.effects.IEffect;
   import com.playata.application.ui.elements.booster.UiBoosterIcon;
   import com.playata.application.ui.elements.generic.button.UiTextButton;
   import com.playata.application.ui.elements.generic.dialog.UiDialog;
   import com.playata.application.ui.elements.generic.dialog.UiTwoChoiceDialog;
   import com.playata.application.ui.elements.generic.textfield.UiTextTooltip;
   import com.playata.application.ui.elements.item.UiItemSlot;
   import com.playata.framework.application.Environment;
   import com.playata.framework.application.request.ActionRequestResponse;
   import com.playata.framework.core.TypedObject;
   import com.playata.framework.core.util.TimeUtil;
   import com.playata.framework.display.ui.controls.Button;
   import com.playata.framework.input.InteractionEvent;
   import com.playata.framework.localization.LocText;
   import visuals.ui.dialogs.SymbolDialogSlotmachineRewardGeneric;
   
   public class DialogSlotmachineReward extends UiDialog
   {
       
      
      private var _btnClose:UiTextButton = null;
      
      private var _itemReward:UiItemSlot = null;
      
      private var _boosterReward:UiBoosterIcon = null;
      
      private var _tooltipBooster:UiTextTooltip = null;
      
      private var _tooltipQuestEnergyIcon:UiTextTooltip = null;
      
      private var _tooltipRewardText:UiTextTooltip = null;
      
      private var _effectConfetti:IEffect;
      
      private var _reward:Reward = null;
      
      private var _rewardQuality:int = 0;
      
      private var _onCloseCallback:Function = null;
      
      public function DialogSlotmachineReward(param1:Reward, param2:int, param3:Function)
      {
         var _loc5_:* = null;
         _reward = param1;
         _rewardQuality = param2;
         _onCloseCallback = param3;
         var _loc4_:SymbolDialogSlotmachineRewardGeneric = new SymbolDialogSlotmachineRewardGeneric();
         super(_loc4_);
         _queued = false;
         _loc4_.txtTitle.text = LocText.current.text("dialog/slotmachine_reward/title");
         _loc4_.txtTitle.autoFontSize = true;
         if(param2 == 1)
         {
            _loc4_.txtOutcome.text = LocText.current.text("dialog/slotmachine_reward/outcome_1");
         }
         else if(param2 == 2)
         {
            _loc4_.txtOutcome.text = LocText.current.text("dialog/slotmachine_reward/outcome_2");
         }
         else if(param2 == 3)
         {
            _loc4_.txtOutcome.text = LocText.current.text("dialog/slotmachine_reward/outcome_3");
         }
         _loc4_.txtRewardsCaption.text = LocText.current.text("dialog/quest_complete/rewards");
         _loc4_.itemReward.visible = _reward.itemId != 0;
         if(_reward.itemId != 0)
         {
            _itemReward = new UiItemSlot(_loc4_.itemReward,0);
            _itemReward.item = User.current.character.getItemById(_reward.itemId);
         }
         _boosterReward = new UiBoosterIcon(_loc4_.boosterReward,1);
         _loc4_.boosterReward.visible = param1.reward.hasData("booster",true);
         _tooltipBooster = new UiTextTooltip(_loc4_.boosterReward,"");
         _tooltipQuestEnergyIcon = new UiTextTooltip(_loc4_.iconQuestEnergy,LocText.current.text("dialog/goals/quest_energy_tooltip"));
         _tooltipRewardText = new UiTextTooltip(_loc4_.txtReward,"");
         _loc4_.iconCoins.visible = _reward.gameCurrency > 0;
         _loc4_.iconXp.visible = _reward.xp > 0;
         _loc4_.iconStatPoints.visible = _reward.statPoints > 0;
         _loc4_.iconQuestEnergy.visible = _reward.questEnergy > 0;
         if(_loc4_.iconCoins.visible)
         {
            _loc4_.txtReward.text = _reward.gameCurrencyString;
         }
         else if(_loc4_.iconXp.visible)
         {
            _loc4_.txtReward.text = _reward.xpString;
         }
         else if(_loc4_.iconStatPoints.visible)
         {
            _loc4_.txtReward.text = GameUtil.getStatPointString(_reward.statPoints);
         }
         else if(_loc4_.iconQuestEnergy.visible)
         {
            _loc4_.txtReward.text = GameUtil.getEnergyString(_reward.questEnergy);
         }
         else
         {
            _loc4_.txtReward.text = "";
         }
         _loc4_.txtTitle.autoFontSize = true;
         _loc4_.txtReward.autoFontSize = true;
         if(_loc4_.boosterReward.visible)
         {
            _loc5_ = param1.reward.getTypedObject("booster");
            _boosterReward.type = CBooster.fromId(_loc5_.getString("booster_id")).type;
            _boosterReward.refresh(_loc5_.getString("booster_id"),-1);
            _tooltipBooster.text = getBoosterTooltip(_loc5_.getString("booster_id"),_loc5_.getInt("days"));
         }
         if(_loc4_.iconQuestEnergy.visible)
         {
            _tooltipRewardText.text = LocText.current.text("dialog/goals/quest_energy_tooltip");
         }
         else
         {
            _tooltipRewardText.text = "";
         }
         _btnClose = new UiTextButton(_loc4_.btnClose,LocText.current.text("general/button_ok"),"",onClickClose);
      }
      
      override public function dispose() : void
      {
         if(_btnClose == null)
         {
            return;
         }
         _btnClose.dispose();
         _btnClose = null;
         _boosterReward.dispose();
         _boosterReward = null;
         _tooltipBooster.dispose();
         _tooltipBooster = null;
         _tooltipQuestEnergyIcon.dispose();
         _tooltipQuestEnergyIcon = null;
         _tooltipRewardText.dispose();
         _tooltipRewardText = null;
         super.dispose();
      }
      
      override public function show() : void
      {
         super.show();
         Environment.audio.playFX("casino_win.mp3");
         var _loc1_:int = 50;
         switch(int(_rewardQuality) - 1)
         {
            case 0:
               _loc1_ = 50;
               break;
            case 1:
               _loc1_ = 100;
               break;
            case 2:
               _loc1_ = 200;
         }
         _effectConfetti = EffectsLayer.instance.show(101,{"numSprites":_loc1_},_vo.parent,1);
      }
      
      override public function close(param1:Function = null) : void
      {
         super.close(param1);
         if(_effectConfetti)
         {
            _effectConfetti.shutDown();
         }
      }
      
      private function onClickClose(param1:InteractionEvent) : void
      {
         Environment.application.sendActionRequest("applySlotMachineReward",{"discard_item":false},handleRequests);
      }
      
      private function onClickGotoShop() : void
      {
         ViewManager.instance.showPanel("shop");
         close();
      }
      
      private function onClickDiscardItem() : void
      {
         Environment.application.sendActionRequest("applySlotMachineReward",{"discard_item":true},handleRequests);
      }
      
      private function handleRequests(param1:ActionRequestResponse) : void
      {
         var _loc2_:* = param1.action;
         if("applySlotMachineReward" !== _loc2_)
         {
            throw new Error("Unsupported request action \'" + param1.action + "\'!");
         }
         if(param1.error == "")
         {
            Environment.application.updateData(param1.data);
            ViewManager.instance.showPanel("slotmachine");
            showRewardEffect(!param1.request.getBoolean("discard_item"));
            close(_onCloseCallback);
         }
         else if(param1.error == "errInventoryNoEmptySlot")
         {
            Environment.panelManager.showDialog(new UiTwoChoiceDialog(LocText.current.text("dialog/no_free_slot/title"),LocText.current.text("dialog/no_free_slot/text",GameUtil.getGameCurrencyString(_itemReward.item.sellPrice)),LocText.current.text("dialog/no_free_slot/button_go_to_shop"),LocText.current.text("dialog/no_free_slot/button_discard_item"),onClickGotoShop,onClickDiscardItem,false));
         }
         else if(param1.error == "errApplySlotmachineRewardCharacterHasNoActiveSpin")
         {
            close(_onCloseCallback);
         }
         else
         {
            Environment.reportError(param1.error,param1.request);
         }
      }
      
      private function showRewardEffect(param1:Boolean) : void
      {
         var _loc3_:* = null;
         var _loc2_:* = null;
         try
         {
            _loc3_ = _vo as SymbolDialogSlotmachineRewardGeneric;
            if(_loc3_.iconCoins.visible)
            {
               EffectsLayer.instance.show(0,{"emitter":_loc3_.iconCoins});
            }
            if(_loc3_.iconXp.visible)
            {
               EffectsLayer.instance.show(1,{"emitter":_loc3_.iconXp});
            }
            if(_loc3_.boosterReward.visible)
            {
               EffectsLayer.instance.show(5,{"emitter":_loc3_.boosterReward});
            }
            if(_loc3_.iconStatPoints.visible)
            {
               EffectsLayer.instance.show(7,{"emitter":_loc3_.iconStatPoints});
            }
            if(param1 && _itemReward != null)
            {
               _loc2_ = User.current.character.getItemById(_reward.itemId);
               if(_loc2_)
               {
                  EffectsLayer.instance.show(3,{
                     "emitter":_loc3_.itemReward,
                     "imageUrl":_loc2_.iconImageUrl
                  });
               }
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
      
      override public function get defaultButton() : Button
      {
         return _btnClose;
      }
   }
}
