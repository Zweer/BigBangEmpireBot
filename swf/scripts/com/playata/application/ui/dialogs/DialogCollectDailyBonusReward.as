package com.playata.application.ui.dialogs
{
   import com.playata.application.data.GameUtil;
   import com.playata.application.data.bonus.DailyBonusReward;
   import com.playata.application.data.item.Item;
   import com.playata.application.data.user.User;
   import com.playata.application.ui.ViewManager;
   import com.playata.application.ui.effects.EffectOptions;
   import com.playata.application.ui.effects.EffectsLayer;
   import com.playata.application.ui.elements.generic.button.UiTextButton;
   import com.playata.application.ui.elements.generic.dialog.UiDialog;
   import com.playata.application.ui.elements.generic.dialog.UiTwoChoiceDialog;
   import com.playata.application.ui.elements.item.UiItemSlot;
   import com.playata.framework.application.Environment;
   import com.playata.framework.application.request.ActionRequestResponse;
   import com.playata.framework.display.ui.controls.Button;
   import com.playata.framework.input.InteractionEvent;
   import com.playata.framework.localization.LocText;
   import visuals.ui.dialogs.SymbolDialogCollectDailyBonusRewardGeneric;
   
   public class DialogCollectDailyBonusReward extends UiDialog
   {
      
      public static var _isOpen:Boolean = false;
       
      
      private var _button:UiTextButton = null;
      
      private var _itemSlot:UiItemSlot;
      
      private var _reward:DailyBonusReward;
      
      public function DialogCollectDailyBonusReward(param1:DailyBonusReward)
      {
         _isOpen = true;
         var _loc2_:SymbolDialogCollectDailyBonusRewardGeneric = new SymbolDialogCollectDailyBonusRewardGeneric();
         super(_loc2_);
         _queued = false;
         _reward = param1;
         _loc2_.textTitle.text = LocText.current.text("dialog/collect_daily_bonus_reward/caption");
         _loc2_.txtRewardsCaption.text = LocText.current.text("dialog/collect_daily_bonus_reward/reward_caption");
         _loc2_.txtDesciption.autoFontSize = true;
         _itemSlot = new UiItemSlot(_loc2_.itemSlot,0);
         _button = new UiTextButton(_loc2_.btnClose,LocText.current.text("dialog/collect_daily_bonus_reward/btn_collect"),"",onClickCollect);
         refresh();
      }
      
      public function refresh() : void
      {
         var _loc1_:* = null;
         var _loc2_:SymbolDialogCollectDailyBonusRewardGeneric = _vo as SymbolDialogCollectDailyBonusRewardGeneric;
         switch(int(_reward.type) - 1)
         {
            case 0:
               _loc2_.txtDesciption.text = LocText.current.text("dialog/collect_daily_bonus_reward/herobook/description");
               break;
            case 1:
               _loc2_.txtDesciption.text = LocText.current.text("dialog/collect_daily_bonus_reward/duel_battles/description");
         }
         _loc2_.iconQuestEnergy.visible = _reward.reward.questEnergy > 0;
         _loc2_.iconXp.visible = _reward.reward.xp > 0;
         _itemSlot.visible = _reward.reward.itemId > 0;
         _loc2_.iconStatPoints.visible = _reward.reward.statPoints > 0;
         _loc2_.iconPremiumCurrency.visible = _reward.reward.premiumCurrency > 0;
         if(_reward.reward.questEnergy > 0)
         {
            _loc2_.txtReward.text = GameUtil.getEnergyString(_reward.reward.questEnergy);
         }
         else if(_reward.reward.xp > 0)
         {
            _loc2_.txtReward.text = _reward.reward.xpString;
         }
         else if(_reward.reward.itemId > 0)
         {
            _loc1_ = User.current.character.getItemById(_reward.reward.itemId);
            _loc2_.txtReward.text = _loc1_.name;
            _itemSlot.item = _loc1_;
         }
         else if(_reward.reward.statPoints > 0)
         {
            _loc2_.txtReward.text = GameUtil.getStatPointString(_reward.reward.statPoints);
         }
         else if(_reward.reward.premiumCurrency > 0)
         {
            _loc2_.txtReward.text = _reward.reward.premiumCurrencyString;
         }
      }
      
      override public function dispose() : void
      {
         _button.dispose();
         _button = null;
         _itemSlot.dispose();
         _itemSlot = null;
         super.dispose();
      }
      
      private function onClickCollect(param1:InteractionEvent) : void
      {
         if(!_button.enabled)
         {
            return;
         }
         _button.enabled = false;
         Environment.application.sendActionRequest("claimDailyBonusRewardReward",{
            "id":_reward.id,
            "discard_item":false
         },handleRequests);
      }
      
      private function onClickGotoShop() : void
      {
         ViewManager.instance.showPanel("shop");
         close();
      }
      
      override public function close(param1:Function = null) : void
      {
         _isOpen = false;
         super.close(param1);
      }
      
      private function onClickDiscardItem() : void
      {
         Environment.application.sendActionRequest("claimDailyBonusRewardReward",{
            "id":_reward.id,
            "discard_item":true
         },handleRequests);
      }
      
      private function handleRequests(param1:ActionRequestResponse) : void
      {
         var _loc2_:* = param1.action;
         if("claimDailyBonusRewardReward" !== _loc2_)
         {
            throw new Error("Unsupported request action \'" + param1.action + "\'!");
         }
         if(param1.error == "")
         {
            Environment.application.updateData(param1.data);
            showRewardEffect(!param1.request.getBoolean("discard_item"));
            close();
         }
         else if(param1.error == "errInventoryNoEmptySlot")
         {
            Environment.panelManager.showDialog(new UiTwoChoiceDialog(LocText.current.text("dialog/no_free_slot/title"),LocText.current.text("dialog/no_free_slot/text",GameUtil.getGameCurrencyString(_itemSlot.item.sellPrice)),LocText.current.text("dialog/no_free_slot/button_go_to_shop"),LocText.current.text("dialog/no_free_slot/button_discard_item"),onClickGotoShop,onClickDiscardItem));
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
            _loc3_ = _vo as SymbolDialogCollectDailyBonusRewardGeneric;
            if(_loc3_.iconXp.visible)
            {
               EffectsLayer.instance.show(1,EffectOptions.fromData({"emitter":_loc3_.iconXp}));
            }
            if(_loc3_.iconStatPoints.visible)
            {
               EffectsLayer.instance.show(7,EffectOptions.fromData({"emitter":_loc3_.iconStatPoints}));
            }
            if(_loc3_.iconPremiumCurrency.visible)
            {
               EffectsLayer.instance.show(2,EffectOptions.fromData({
                  "emitter":_loc3_.iconPremiumCurrency,
                  "amount":_reward.reward.premiumCurrency
               }));
            }
            if(param1 && _itemSlot != null)
            {
               _loc2_ = User.current.character.getItemById(_reward.reward.itemId);
               if(_loc2_)
               {
                  EffectsLayer.instance.show(3,EffectOptions.fromData({
                     "emitter":_loc3_.itemSlot,
                     "imageUrl":_loc2_.iconImageUrl
                  }));
               }
            }
            return;
         }
         catch(e:Error)
         {
            return;
         }
      }
      
      override public function get defaultButton() : Button
      {
         return _button;
      }
   }
}
