package com.playata.application.ui.dialogs
{
   import com.playata.application.data.GameUtil;
   import com.playata.application.data.constants.CConstant;
   import com.playata.application.data.user.User;
   import com.playata.application.messaging.Message;
   import com.playata.application.messaging.MessageRouter;
   import com.playata.application.ui.ViewManager;
   import com.playata.application.ui.elements.generic.button.UiButton;
   import com.playata.application.ui.elements.generic.button.UiTextButton;
   import com.playata.application.ui.elements.generic.dialog.UiDialog;
   import com.playata.application.ui.elements.generic.dialog.UiInfoDialog;
   import com.playata.application.ui.elements.guild.UiGuildChatTab;
   import com.playata.framework.application.Environment;
   import com.playata.framework.application.request.ActionRequestResponse;
   import com.playata.framework.core.Runtime;
   import com.playata.framework.core.util.StringUtil;
   import com.playata.framework.display.ui.TextInputType;
   import com.playata.framework.display.ui.controls.Button;
   import com.playata.framework.display.ui.controls.ITextInput;
   import com.playata.framework.display.ui.dialogs.Dialog;
   import com.playata.framework.input.InteractionEvent;
   import com.playata.framework.localization.LocText;
   import visuals.ui.dialogs.SymbolDialogGuildRechargeMissilesGeneric;
   
   public class DialogGuildRechargeMissiles extends UiDialog
   {
       
      
      private var _btnClose:UiButton = null;
      
      private var _btnRecharge:UiTextButton = null;
      
      private var _btnDecrease:UiButton = null;
      
      private var _btnIncrease:UiButton = null;
      
      public function DialogGuildRechargeMissiles()
      {
         var _loc1_:SymbolDialogGuildRechargeMissilesGeneric = new SymbolDialogGuildRechargeMissilesGeneric();
         super(_loc1_);
         _queued = false;
         _loc1_.txtDialogTitle.text = LocText.current.text("dialog/guild_recharge_missiles/title");
         _loc1_.txtInfo.text = LocText.current.text("dialog/guild_recharge_missiles/info_text");
         _loc1_.txtMissiles.text = LocText.current.text("dialog/guild_recharge_missiles/missiles");
         _loc1_.txtCostCaption.text = "";
         _loc1_.inputAmount.inputType = TextInputType.NUMBER;
         _loc1_.inputAmount.restrict = "0-9";
         _loc1_.inputAmount.text = minAmount.toString();
         _btnClose = new UiButton(_loc1_.btnClose,"",onClickClose);
         _btnRecharge = new UiTextButton(_loc1_.btnRecharge,LocText.current.text("dialog/guild_recharge_missiles/button_recharge"),"",onClickRecharge);
         _btnDecrease = new UiButton(_loc1_.btnDecrease,"",onClickDecrease);
         _btnIncrease = new UiButton(_loc1_.btnIncrease,"",onClickIncrease);
         _tabObjects.push(_loc1_.inputAmount);
         _loc1_.inputAmount.onChange.add(onInputChanged);
         if(!Environment.info.isTouchScreen)
         {
            setFocus();
         }
         refreshElements();
         MessageRouter.addListener("ViewMessage.notifyNeededGuildDonationMade",handleMessages);
      }
      
      override public function dispose() : void
      {
         MessageRouter.removeAllListeners(handleMessages);
         if(_btnClose == null)
         {
            return;
         }
         _btnClose.dispose();
         _btnClose = null;
         _btnRecharge.dispose();
         _btnRecharge = null;
         _btnDecrease.dispose();
         _btnDecrease = null;
         _btnIncrease.dispose();
         _btnIncrease = null;
         super.dispose();
      }
      
      private function get minAmount() : int
      {
         return User.current.character.guild.missiles;
      }
      
      private function onInputChanged(param1:ITextInput) : void
      {
         var _loc2_:SymbolDialogGuildRechargeMissilesGeneric = _vo as SymbolDialogGuildRechargeMissilesGeneric;
         if(isNaN(parseInt(_loc2_.inputAmount.text)))
         {
            _loc2_.inputAmount.text = minAmount.toString();
         }
         else
         {
            _loc2_.inputAmount.text = Math.min(minAmount + 100,Math.max(minAmount,parseInt(_loc2_.inputAmount.text))).toString();
         }
         refreshElements();
      }
      
      private function refreshElements() : void
      {
         var _loc1_:SymbolDialogGuildRechargeMissilesGeneric = _vo as SymbolDialogGuildRechargeMissilesGeneric;
         _loc1_.txtCostCaption.text = LocText.current.text("dialog/guild_recharge_missiles/cost_caption",GameUtil.getGuildMissileString(currentNewAmount));
         _loc1_.txtPremiumCurrency.text = LocText.current.formatHugeNumber(currentPremiumCurrencyNeeded);
         _loc1_.txtCostCaption.visible = currentNewAmount > 0;
         _loc1_.txtPremiumCurrency.visible = currentNewAmount > 0;
         _loc1_.iconPremiumCurrency.visible = currentNewAmount > 0;
         _btnDecrease.buttonEnabled = currentAmountInput > minAmount;
         _btnIncrease.buttonEnabled = currentNewAmount < 100;
         _btnRecharge.buttonEnabled = currentAmountInput > minAmount && User.current.character.guildRank != 3;
         if(User.current.character.guildRank == 3)
         {
            _btnRecharge.tooltip = LocText.current.text("dialog/guild_recharge_missiles/recharge_button_no_permisison_tooltip");
         }
         else if(_btnRecharge.buttonEnabled)
         {
            _btnRecharge.tooltip = "";
         }
         else
         {
            _btnRecharge.tooltip = LocText.current.text("dialog/guild_recharge_missiles/recharge_button_no_missiles_tooltip");
         }
      }
      
      private function get currentAmountInput() : int
      {
         var _loc1_:SymbolDialogGuildRechargeMissilesGeneric = _vo as SymbolDialogGuildRechargeMissilesGeneric;
         if(isNaN(parseInt(_loc1_.inputAmount.text)))
         {
            return 0;
         }
         return parseInt(_loc1_.inputAmount.text);
      }
      
      private function get currentNewAmount() : int
      {
         return currentAmountInput - minAmount;
      }
      
      private function setFocus() : void
      {
         var _loc1_:SymbolDialogGuildRechargeMissilesGeneric = _vo as SymbolDialogGuildRechargeMissilesGeneric;
         if(StringUtil.isEmpty(_loc1_.inputAmount.text))
         {
            Dialog.focus = _loc1_.inputAmount;
         }
         else
         {
            Dialog.focus = _loc1_.inputAmount;
            _loc1_.inputAmount.selectRange(0,_loc1_.inputAmount.length);
         }
      }
      
      private function onClickClose(param1:InteractionEvent) : void
      {
         close();
      }
      
      private function onClickDecrease(param1:InteractionEvent) : void
      {
         var _loc2_:SymbolDialogGuildRechargeMissilesGeneric = _vo as SymbolDialogGuildRechargeMissilesGeneric;
         if(isNaN(parseInt(_loc2_.inputAmount.text)))
         {
            _loc2_.inputAmount.text = minAmount.toString();
         }
         else
         {
            _loc2_.inputAmount.text = Math.max(minAmount,parseInt(_loc2_.inputAmount.text) - 1).toString();
         }
         refreshElements();
      }
      
      private function onClickIncrease(param1:InteractionEvent) : void
      {
         var _loc2_:SymbolDialogGuildRechargeMissilesGeneric = _vo as SymbolDialogGuildRechargeMissilesGeneric;
         if(isNaN(parseInt(_loc2_.inputAmount.text)))
         {
            _loc2_.inputAmount.text = minAmount.toString();
         }
         else
         {
            _loc2_.inputAmount.text = (parseInt(_loc2_.inputAmount.text) + 1).toString();
         }
         refreshElements();
      }
      
      private function onClickRecharge(param1:InteractionEvent) : void
      {
         var _loc2_:SymbolDialogGuildRechargeMissilesGeneric = _vo as SymbolDialogGuildRechargeMissilesGeneric;
         if(isNaN(parseInt(_loc2_.inputAmount.text)) || parseInt(_loc2_.inputAmount.text) < 0)
         {
            Environment.panelManager.showDialog(new UiInfoDialog(LocText.current.text("dialog/guild_recharge_missiles/invalid_amount_value/title"),LocText.current.text("dialog/guild_recharge_missiles/invalid_amount_value/text"),LocText.current.text("general/button_ok")));
            return;
         }
         rechargeGuildMissiles();
      }
      
      private function rechargeGuildMissiles() : void
      {
         if(currentNewAmount == 0)
         {
            return;
         }
         Environment.application.sendActionRequest("rechargeGuildMissiles",{"amount":currentNewAmount},handleRequests);
      }
      
      private function get currentPremiumCurrencyNeeded() : int
      {
         var _loc1_:SymbolDialogGuildRechargeMissilesGeneric = _vo as SymbolDialogGuildRechargeMissilesGeneric;
         if(isNaN(parseInt(_loc1_.inputAmount.text)) || parseInt(_loc1_.inputAmount.text) < 0)
         {
            return 0;
         }
         return currentNewAmount * CConstant.guild_missile_premium_currency_amount;
      }
      
      private function closeDialog() : void
      {
         close();
      }
      
      private function handleRequests(param1:ActionRequestResponse) : void
      {
         var _loc2_:* = null;
         var _loc3_:* = param1.action;
         if("rechargeGuildMissiles" !== _loc3_)
         {
            throw new Error("Unsupported request action \'" + param1.action + "\'!");
         }
         _loc2_ = _vo as SymbolDialogGuildRechargeMissilesGeneric;
         if(param1.error == "")
         {
            Environment.application.updateData(param1.data);
            Environment.audio.playFX("guild_missiles_recharged.mp3");
            close();
            UiGuildChatTab.instance.refreshGuildLog();
         }
         else if(param1.error == "errRemoveGameCurrencyNotEnough" || param1.error == "errRemovePremiumCurrencyNotEnough")
         {
            ViewManager.instance.showGuildNotEnoughGameCurrencyPremiumCurrencyDialog(0,currentPremiumCurrencyNeeded,closeDialog);
         }
         else if(param1.error == "errProcessingGuildBattle")
         {
            Environment.panelManager.showDialog(new UiInfoDialog(LocText.current.text("dialog/processing_guild_battle/title"),LocText.current.text("dialog/processing_guild_battle/text"),LocText.current.text("general/button_ok")));
         }
         else
         {
            Environment.reportError(param1.error,param1.request);
         }
      }
      
      private function handleMessages(param1:Message) : void
      {
         var _loc2_:* = param1.type;
         if("ViewMessage.notifyNeededGuildDonationMade" !== _loc2_)
         {
            throw new Error("Encountered unknown message type! type=" + param1.type);
         }
         _btnRecharge.buttonEnabled = false;
         Runtime.delayFunction(rechargeGuildMissiles,0.3);
      }
      
      override public function get defaultButton() : Button
      {
         return _btnRecharge;
      }
      
      override public function onEscape() : void
      {
         close();
      }
   }
}
