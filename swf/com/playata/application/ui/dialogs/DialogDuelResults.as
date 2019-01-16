package com.playata.application.ui.dialogs
{
   import com.playata.application.Application;
   import com.playata.application.data.GameUtil;
   import com.playata.application.data.duel.Duel;
   import com.playata.application.data.item.Item;
   import com.playata.application.data.user.User;
   import com.playata.application.ui.ViewManager;
   import com.playata.application.ui.effects.EffectsLayer;
   import com.playata.application.ui.elements.generic.button.UiTextButton;
   import com.playata.application.ui.elements.generic.dialog.UiDialog;
   import com.playata.application.ui.elements.generic.dialog.UiTwoChoiceDialog;
   import com.playata.application.ui.elements.item.UiItemSlot;
   import com.playata.application.ui.elements.slotmachine.UiSlotMachineJetonReward;
   import com.playata.framework.application.Environment;
   import com.playata.framework.application.request.ActionRequestResponse;
   import com.playata.framework.core.Runtime;
   import com.playata.framework.core.util.NumberUtil;
   import com.playata.framework.display.ui.controls.Button;
   import com.playata.framework.input.InteractionEvent;
   import com.playata.framework.localization.LocText;
   import visuals.ui.dialogs.SymbolDialogDuelResultsGeneric;
   
   public class DialogDuelResults extends UiDialog
   {
       
      
      private var _duel:Duel = null;
      
      private var _itemReward:UiItemSlot = null;
      
      private var _btnClose:UiTextButton = null;
      
      private var _slotMachineJetonRewards:UiSlotMachineJetonReward = null;
      
      public function DialogDuelResults(param1:Duel)
      {
         _duel = param1;
         var _loc2_:SymbolDialogDuelResultsGeneric = new SymbolDialogDuelResultsGeneric();
         super(_loc2_);
         _queued = false;
         if(_duel.battle.profileAIsWinner)
         {
            _loc2_.txtDialogTitle.text = LocText.current.text("dialog/duel_results/title_win");
            if(_duel.characterReward.honor != 0)
            {
               _loc2_.txtRewardsCaption.text = LocText.current.text("dialog/duel_results/win_honor");
               _loc2_.txtDuelNoHonorMessage.visible = false;
            }
            else
            {
               _loc2_.txtRewardsCaption.text = LocText.current.text("dialog/duel_results/win_no_honor");
               _loc2_.txtDuelNoHonorMessage.visible = true;
               _loc2_.txtDuelNoHonorMessage.text = LocText.current.text("dialog/duel_results/win_no_honor_message");
            }
            if(_duel.battle.isClose)
            {
               _loc2_.txtDuelOutcomeMessage.text = LocText.current.text("dialog/duel_results/win_tough" + NumberUtil.randomInt(1,5));
            }
            else
            {
               _loc2_.txtDuelOutcomeMessage.text = LocText.current.text("dialog/duel_results/win_clear" + NumberUtil.randomInt(1,5));
            }
         }
         else
         {
            _loc2_.txtDialogTitle.text = LocText.current.text("dialog/duel_results/title_lose");
            if(_duel.characterReward.honor != 0)
            {
               _loc2_.txtRewardsCaption.text = LocText.current.text("dialog/duel_results/lose_honor");
               _loc2_.txtDuelNoHonorMessage.visible = false;
            }
            else
            {
               _loc2_.txtRewardsCaption.text = LocText.current.text("dialog/duel_results/lose_no_honor");
               _loc2_.txtDuelNoHonorMessage.visible = true;
               _loc2_.txtDuelNoHonorMessage.text = LocText.current.text("dialog/duel_results/lose_no_honor_message");
            }
            if(_duel.battle.isClose)
            {
               _loc2_.txtDuelOutcomeMessage.text = LocText.current.text("dialog/duel_results/lose_tough" + NumberUtil.randomInt(1,5));
            }
            else
            {
               _loc2_.txtDuelOutcomeMessage.text = LocText.current.text("dialog/duel_results/lose_clear" + NumberUtil.randomInt(1,5));
            }
         }
         _loc2_.itemReward.visible = _duel.characterReward.itemId != 0;
         if(_duel.characterReward.itemId != 0)
         {
            _itemReward = new UiItemSlot(_loc2_.itemReward,0);
            _itemReward.item = User.current.character.getItemById(_duel.characterReward.itemId);
         }
         _loc2_.slotmachineJetonReward.visible = _duel.characterReward.slotMachinJetons > 0;
         if(_loc2_.slotmachineJetonReward.visible)
         {
            _slotMachineJetonRewards = new UiSlotMachineJetonReward(_loc2_.slotmachineJetonReward);
            _slotMachineJetonRewards.amount = _duel.characterReward.slotMachinJetons;
         }
         _loc2_.iconCoins.visible = _duel.characterReward.gameCurrency > 0;
         _loc2_.txtCoins.visible = _duel.characterReward.gameCurrency > 0;
         _loc2_.txtCoins.text = _duel.characterReward.gameCurrencyString;
         _loc2_.iconHonor.visible = _duel.characterReward.honor != 0;
         _loc2_.txtHonor.visible = _duel.characterReward.honor != 0;
         _loc2_.txtHonor.text = _duel.characterReward.honorString;
         if(_duel.characterReward.honor == 0)
         {
            _loc2_.txtCoins.y = _loc2_.txtCoins.y + 13;
            _loc2_.iconCoins.y = _loc2_.iconCoins.y + 13;
         }
         _loc2_.iconPremiumCurrency.visible = _duel.characterReward.premiumCurrency > 0;
         _loc2_.txtPremiumCurrency.visible = _duel.characterReward.premiumCurrency > 0;
         _loc2_.txtPremiumCurrency.text = _duel.characterReward.premiumCurrencyString;
         _btnClose = new UiTextButton(_loc2_.btnClose,LocText.current.text("general/button_ok"),"",onClickClose);
      }
      
      override public function show() : void
      {
         super.show();
         if(_duel.battle.profileAIsWinner)
         {
            EffectsLayer.instance.show(104,{},_vo.parent,1);
         }
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
         Environment.application.sendActionRequest("claimDuelRewards",{"discard_item":false},handleRequests);
      }
      
      private function onClickGotoShop() : void
      {
         ViewManager.instance.baseUserPanel.fadeInMainNavigationButtons();
         ViewManager.instance.showPanel("shop");
         close();
      }
      
      private function onClickGotoDuel() : void
      {
         ViewManager.instance.showPanel("duels");
         close();
      }
      
      private function onClickDiscardItem() : void
      {
         Environment.application.sendActionRequest("claimDuelRewards",{"discard_item":true},handleRequests);
      }
      
      private function firstDuelFinished() : void
      {
         if(_duel.isWon)
         {
            Environment.panelManager.showDialog(new DialogTutorialPopup(LocText.current.text("tutorial/first_duel_won/title"),LocText.current.text("tutorial/first_duel_won/text"),showCharacterPanel));
         }
         else
         {
            Environment.panelManager.showDialog(new DialogTutorialPopup(LocText.current.text("tutorial/first_duel_lost/title"),LocText.current.text("tutorial/first_duel_lost/text"),showCharacterPanel));
         }
      }
      
      private function showTutorialFinishDialog() : void
      {
         Environment.panelManager.showDialog(new DialogTutorialComplete(showTutorialGoalArrow));
         User.current.character.setTutorialFlag("tutorial_finished");
      }
      
      private function showTutorialGoalArrow() : void
      {
         var _loc1_:* = null;
         ViewManager.instance.tutorialArrow.showTutorial(LocText.current.text("tutorial/storyggoals_arrow_text"),"right_side","up",125,110,1.5,0,false,"storygoals");
         showTopIcons();
         if(Environment.startupParams.indexOf("resource_request=") != -1)
         {
            _loc1_ = Environment.startupParams;
            _loc1_ = _loc1_.substring(_loc1_.indexOf("=") + 1);
            Environment.clearStartupParams();
            (Environment.application as Application).createResourceRequest(_loc1_);
         }
      }
      
      private function showTopIcons() : void
      {
         ViewManager.instance.baseUserPanel.showTopIcons(true);
      }
      
      private function showCharacterPanel() : void
      {
         ViewManager.instance.showPanel("character");
         Runtime.delayFunction(showTutorialFinishDialog,1);
      }
      
      private function handleRequests(param1:ActionRequestResponse) : void
      {
         var _loc2_:* = param1.action;
         if("claimDuelRewards" !== _loc2_)
         {
            throw new Error("Unsupported request action \'" + param1.action + "\'!");
         }
         if(param1.error == "")
         {
            Environment.application.updateData(param1.data);
            if(DialogLeaderboard.characterLeaderboardContext)
            {
               DialogLeaderboard.characterLeaderboardContext.lastCharacterLeaderboardRefresh = 0;
            }
            ViewManager.instance.baseUserPanel.fadeInMainNavigationButtons();
            showRewardEffect(!param1.request.getBoolean("discard_item"));
            if(User.current.character.hasNewTutorialFlag("first_duel"))
            {
               firstDuelFinished();
               close();
            }
            else if(User.current.character.hasRunOutMissiles())
            {
               Environment.panelManager.showDialog(new UiTwoChoiceDialog(LocText.current.text("dialog/run_out_missiles/title"),LocText.current.text("dialog/run_out_missiles/text"),LocText.current.text("dialog/run_out_missiles/button_shop"),LocText.current.text("dialog/run_out_missiles/button_cancel"),onClickGotoShop,onClickGotoDuel));
            }
            else
            {
               ViewManager.instance.showPanel("duels");
               close();
            }
         }
         else if(param1.error == "errInventoryNoEmptySlot")
         {
            Environment.panelManager.showDialog(new UiTwoChoiceDialog(LocText.current.text("dialog/no_free_slot/title"),LocText.current.text("dialog/no_free_slot/text",GameUtil.getGameCurrencyString(_itemReward.item.sellPrice)),LocText.current.text("dialog/no_free_slot/button_go_to_shop"),LocText.current.text("dialog/no_free_slot/button_discard_item"),onClickGotoShop,onClickDiscardItem,false));
         }
         else if(param1.error != "errClaimDuelRewardsNoActiveDuel")
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
            _loc3_ = _vo as SymbolDialogDuelResultsGeneric;
            if(_loc3_.iconCoins.visible)
            {
               EffectsLayer.instance.show(0,{"emitter":_loc3_.iconCoins});
            }
            if(_loc3_.iconPremiumCurrency.visible)
            {
               EffectsLayer.instance.show(2,{"emitter":_loc3_.iconPremiumCurrency});
            }
            if(_loc3_.iconHonor.visible && _duel.characterReward.honor > 0)
            {
               EffectsLayer.instance.show(6,{"emitter":_loc3_.iconHonor});
            }
            if(param1 && _itemReward != null)
            {
               _loc2_ = User.current.character.getItemById(_duel.characterReward.itemId);
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
