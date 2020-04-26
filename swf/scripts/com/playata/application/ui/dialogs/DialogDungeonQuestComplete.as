package com.playata.application.ui.dialogs
{
   import com.playata.application.data.GameUtil;
   import com.playata.application.data.constants.CConstant;
   import com.playata.application.data.dungeon.DungeonQuest;
   import com.playata.application.data.item.Item;
   import com.playata.application.data.user.User;
   import com.playata.application.ui.ViewManager;
   import com.playata.application.ui.effects.EffectsLayer;
   import com.playata.application.ui.elements.generic.button.UiTextButton;
   import com.playata.application.ui.elements.generic.dialog.UiDialog;
   import com.playata.application.ui.elements.generic.dialog.UiTwoChoiceDialog;
   import com.playata.application.ui.elements.item.UiItemSlot;
   import com.playata.application.ui.panels.PanelDungeon;
   import com.playata.framework.application.Environment;
   import com.playata.framework.application.request.ActionRequestResponse;
   import com.playata.framework.core.util.TimeUtil;
   import com.playata.framework.display.ui.controls.Button;
   import com.playata.framework.input.InteractionEvent;
   import com.playata.framework.localization.LocText;
   import visuals.ui.dialogs.SymbolDialogDungeonQuestCompleteGeneric;
   
   public class DialogDungeonQuestComplete extends UiDialog
   {
      
      private static var _isOpen:Boolean = false;
       
      
      private var _btnClose:UiTextButton = null;
      
      private var _itemReward:UiItemSlot = null;
      
      private var _dungeonQuest:DungeonQuest = null;
      
      public function DialogDungeonQuestComplete(param1:DungeonQuest)
      {
         _isOpen = true;
         _dungeonQuest = param1;
         var _loc2_:SymbolDialogDungeonQuestCompleteGeneric = new SymbolDialogDungeonQuestCompleteGeneric();
         super(_loc2_);
         _queued = false;
         if(_dungeonQuest.isWon)
         {
            _loc2_.txtDialogTitle.text = LocText.current.text("dialog/dungeon_quest_complete/title_win");
            _loc2_.txtOutcome.text = _dungeonQuest.winText;
            _loc2_.txtRewardsCaption.text = LocText.current.text("dialog/dungeon_quest_complete/rewards");
            if(User.current.character.currentDungeon.numQuestsCompleted < User.current.character.currentDungeon.numQuestsTotal - 1 && CConstant.dungeon_quest_cooldown_win > 0)
            {
               _loc2_.txtLostInfo.text = LocText.current.text("dialog/dungeon_quest_complete/cooldown_won_info",TimeUtil.getMinuteString(CConstant.dungeon_quest_cooldown_win / 60));
            }
            else
            {
               _loc2_.txtLostInfo.visible = false;
            }
         }
         else
         {
            _loc2_.txtDialogTitle.text = LocText.current.text("dialog/dungeon_quest_complete/title_lose");
            _loc2_.txtOutcome.text = _dungeonQuest.lostText;
            _loc2_.txtRewardsCaption.text = LocText.current.text("dialog/dungeon_quest_complete/no_rewards");
            _loc2_.txtLostInfo.text = LocText.current.text("dialog/dungeon_quest_complete/cooldown_lost_info",TimeUtil.getMinuteString(CConstant.dungeon_quest_cooldown_lost / 60));
            _loc2_.txtLostInfo.y = 69;
         }
         _loc2_.txtOutcome.autoFontSize = true;
         _loc2_.itemReward.visible = _dungeonQuest.reward.itemId != 0;
         if(_dungeonQuest.reward.itemId != 0)
         {
            _itemReward = new UiItemSlot(_loc2_.itemReward,0);
            _itemReward.item = User.current.character.getItemById(_dungeonQuest.reward.itemId);
         }
         _loc2_.iconCoins.visible = _dungeonQuest.reward.gameCurrency > 0;
         _loc2_.txtCoins.visible = _dungeonQuest.reward.gameCurrency > 0;
         _loc2_.txtCoins.text = _dungeonQuest.reward.gameCurrencyString;
         _loc2_.iconXp.visible = _dungeonQuest.reward.xp > 0;
         _loc2_.txtXp.visible = _dungeonQuest.reward.xp > 0;
         _loc2_.txtXp.text = _dungeonQuest.reward.xpString;
         _loc2_.iconPremiumCurrency.visible = _dungeonQuest.reward.premiumCurrency > 0;
         _loc2_.txtPremiumCurrency.visible = _dungeonQuest.reward.premiumCurrency > 0;
         _loc2_.txtPremiumCurrency.text = _dungeonQuest.reward.premiumCurrencyString;
         _loc2_.txtXp.text = _dungeonQuest.reward.xpString;
         _loc2_.iconStatPoints.visible = _dungeonQuest.reward.statPoints > 0;
         _loc2_.txtStatPoints.visible = _dungeonQuest.reward.statPoints > 0;
         _loc2_.txtStatPoints.text = _dungeonQuest.reward.statPointsString;
         _btnClose = new UiTextButton(_loc2_.btnClose,LocText.current.text("general/button_ok"),"",onClickClose);
      }
      
      public static function get isOpen() : Boolean
      {
         return _isOpen;
      }
      
      override public function dispose() : void
      {
         if(_btnClose == null)
         {
            return;
         }
         _btnClose.dispose();
         _btnClose = null;
         super.dispose();
      }
      
      private function onClickClose(param1:InteractionEvent) : void
      {
         Environment.application.sendActionRequest("claimDungeonQuestRewards",{"discard_item":false},handleRequests);
      }
      
      override public function close(param1:Function = null) : void
      {
         _isOpen = false;
         super.close(param1);
      }
      
      private function onClickGotoShop() : void
      {
         ViewManager.instance.baseUserPanel.fadeInMainNavigationButtons();
         ViewManager.instance.showPanel("shop");
         close();
      }
      
      private function onClickDiscardItem() : void
      {
         Environment.application.sendActionRequest("claimDungeonQuestRewards",{"discard_item":true},handleRequests);
      }
      
      private function handleRequests(param1:ActionRequestResponse) : void
      {
         var _loc2_:* = param1.action;
         if("claimDungeonQuestRewards" !== _loc2_)
         {
            throw new Error("Unsupported request action \'" + param1.action + "\'!");
         }
         if(param1.error == "")
         {
            Environment.application.updateData(param1.data);
            showRewardEffect(!param1.request.getBoolean("discard_item"));
            close();
            PanelDungeon.visualizeProgress = _dungeonQuest.isWon;
            ViewManager.instance.baseUserPanel.fadeInMainNavigationButtons();
            if(ViewManager.instance.activePanel == "dungeon")
            {
               (ViewManager.instance.activePanelInstance as PanelDungeon).refreshBackground();
               (ViewManager.instance.activePanelInstance as PanelDungeon).refresh();
            }
            else
            {
               ViewManager.instance.showPanel("dungeon");
            }
         }
         else if(param1.error == "errInventoryNoEmptySlot")
         {
            Environment.panelManager.showDialog(new UiTwoChoiceDialog(LocText.current.text("dialog/no_free_slot/title"),LocText.current.text("dialog/no_free_slot/text",GameUtil.getGameCurrencyString(_itemReward.item.sellPrice)),LocText.current.text("dialog/no_free_slot/button_go_to_shop"),LocText.current.text("dialog/no_free_slot/button_discard_item"),onClickGotoShop,onClickDiscardItem,false));
         }
         else if(param1.error != "errClaimDungeonQuestRewardsNoActiveDungeonQuest")
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
            _loc3_ = _vo as SymbolDialogDungeonQuestCompleteGeneric;
            if(_loc3_.iconCoins.visible)
            {
               EffectsLayer.instance.show(0,{"emitter":_loc3_.iconCoins});
            }
            if(_loc3_.iconXp.visible)
            {
               EffectsLayer.instance.show(1,{"emitter":_loc3_.iconXp});
            }
            if(_loc3_.iconPremiumCurrency.visible)
            {
               EffectsLayer.instance.show(2,{"emitter":_loc3_.iconPremiumCurrency});
            }
            if(param1 && _itemReward != null)
            {
               _loc2_ = User.current.character.getItemById(_dungeonQuest.reward.itemId);
               EffectsLayer.instance.show(3,{
                  "emitter":_loc3_.itemReward,
                  "imageUrl":_loc2_.iconImageUrl
               });
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
         return _btnClose;
      }
   }
}
