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
   import com.playata.application.ui.elements.generic.dialog.UiTwoChoiceDialog;
   import com.playata.application.ui.elements.generic.textfield.UiTextTooltip;
   import com.playata.application.ui.elements.guild.UiGuildChatTab;
   import com.playata.framework.application.Environment;
   import com.playata.framework.application.request.ActionRequestResponse;
   import com.playata.framework.core.util.StringUtil;
   import com.playata.framework.display.ui.TextInputType;
   import com.playata.framework.display.ui.controls.Button;
   import com.playata.framework.display.ui.controls.ITextInput;
   import com.playata.framework.display.ui.dialogs.Dialog;
   import com.playata.framework.input.InteractionEvent;
   import com.playata.framework.localization.LocText;
   import visuals.ui.dialogs.SymbolDialogGuildDonationGeneric;
   
   public class DialogGuildDonation extends UiDialog
   {
       
      
      private var _maxSpendablePremiumCurrency:int = -1;
      
      private var _btnClose:UiButton = null;
      
      private var _btnDonate:UiTextButton = null;
      
      private var _btnGameCurrencyDecrease:UiButton = null;
      
      private var _btnGameCurrencyIncrease:UiButton = null;
      
      private var _btnPremiumCurrencyDecrease:UiButton = null;
      
      private var _btnPremiumCurrencyIncrease:UiButton = null;
      
      private var _tooltipGameCurrencyIcon:UiTextTooltip = null;
      
      private var _tooltipGameCurrencyCaption:UiTextTooltip = null;
      
      private var _tooltipGameCurrencyInput:UiTextTooltip = null;
      
      private var _tooltipPremiumCurrencyIcon:UiTextTooltip = null;
      
      private var _tooltipPremiumCurrencyCaption:UiTextTooltip = null;
      
      private var _tooltipPremiumCurrencyInput:UiTextTooltip = null;
      
      private var _notifySuccess:Boolean = false;
      
      private var _neededGameCurrency:int = 0;
      
      private var _neededPremiumCurrency:int = 0;
      
      public function DialogGuildDonation(param1:int = 0, param2:int = 0, param3:Boolean = false)
      {
         var _loc4_:SymbolDialogGuildDonationGeneric = new SymbolDialogGuildDonationGeneric();
         super(_loc4_);
         _notifySuccess = param3;
         _neededGameCurrency = param1;
         _neededPremiumCurrency = param2;
         _queued = false;
         _loc4_.txtDialogTitle.text = LocText.current.text("dialog/guild_donation/title");
         _loc4_.txtInfo.text = LocText.current.text("dialog/guild_donation/info_text");
         _loc4_.txtCoins.text = LocText.current.text("dialog/guild_donation/game_currency");
         _loc4_.txtPremiumCurrency.text = LocText.current.text("dialog/guild_donation/premium_currency");
         _loc4_.inputCoins.inputType = TextInputType.NUMBER;
         _loc4_.inputCoins.restrict = "0-9";
         _loc4_.inputPremiumCurrency.inputType = TextInputType.NUMBER;
         _loc4_.inputPremiumCurrency.restrict = "0-9";
         _loc4_.inputCoins.text = Math.min(User.current.character.gameCurrency,param1).toString();
         _loc4_.inputPremiumCurrency.text = param2.toString();
         _btnClose = new UiButton(_loc4_.btnClose,"",onClickClose);
         _btnDonate = new UiTextButton(_loc4_.btnDonate,LocText.current.text("dialog/guild_donation/button_donate"),"",onClickDonate);
         _btnGameCurrencyDecrease = new UiButton(_loc4_.btnCoinDecrease,"",onClickGameCurrencyDecrease);
         _btnGameCurrencyIncrease = new UiButton(_loc4_.btnCoinIncrease,"",onClickGameCurrencyIncrease);
         _btnPremiumCurrencyDecrease = new UiButton(_loc4_.btnPremiumCurrencyDecrease,"",onClickPremiumCurrencyDecrease);
         _btnPremiumCurrencyIncrease = new UiButton(_loc4_.btnPremiumCurrencyIncrease,"",onClickPremiumCurrencyIncrease);
         _tooltipGameCurrencyIcon = new UiTextTooltip(_loc4_.iconCoin,"");
         _tooltipGameCurrencyCaption = new UiTextTooltip(_loc4_.txtCoins,"");
         _tooltipGameCurrencyInput = new UiTextTooltip(_loc4_.inputCoins,"");
         _tooltipPremiumCurrencyIcon = new UiTextTooltip(_loc4_.iconPremiumCurrency,"");
         _tooltipPremiumCurrencyCaption = new UiTextTooltip(_loc4_.txtPremiumCurrency,"");
         _tooltipPremiumCurrencyInput = new UiTextTooltip(_loc4_.inputPremiumCurrency,"");
         var _loc5_:* = 3;
         _tooltipPremiumCurrencyInput.positionType = _loc5_;
         _loc5_ = _loc5_;
         _tooltipPremiumCurrencyCaption.positionType = _loc5_;
         _loc5_ = _loc5_;
         _tooltipPremiumCurrencyIcon.positionType = _loc5_;
         _loc5_ = _loc5_;
         _btnPremiumCurrencyIncrease.textTooltip.positionType = _loc5_;
         _btnPremiumCurrencyDecrease.textTooltip.positionType = _loc5_;
         _loc5_ = -20;
         _tooltipPremiumCurrencyInput.offset = _loc5_;
         _loc5_ = _loc5_;
         _tooltipPremiumCurrencyCaption.offset = _loc5_;
         _loc5_ = _loc5_;
         _tooltipPremiumCurrencyIcon.offset = _loc5_;
         _loc5_ = _loc5_;
         _btnPremiumCurrencyIncrease.textTooltip.offset = _loc5_;
         _btnPremiumCurrencyDecrease.textTooltip.offset = _loc5_;
         _tabObjects.push(_loc4_.inputCoins);
         _tabObjects.push(_loc4_.inputPremiumCurrency);
         _loc4_.inputCoins.onChange.add(onInputChanged);
         _loc4_.inputPremiumCurrency.onChange.add(onInputChanged);
         refreshTooltips();
         if(!Environment.info.isTouchScreen)
         {
            setFocus();
         }
         MessageRouter.addListener("ViewMessage.notifyPaymentSuccess",handleMessages);
         getCharacterMaxSpendableAmount();
      }
      
      override public function dispose() : void
      {
         MessageRouter.removeAllListeners(handleMessages);
         var _loc1_:SymbolDialogGuildDonationGeneric = _vo as SymbolDialogGuildDonationGeneric;
         _btnClose.dispose();
         _btnClose = null;
         _btnDonate.dispose();
         _btnDonate = null;
         _btnGameCurrencyDecrease.dispose();
         _btnGameCurrencyDecrease = null;
         _btnGameCurrencyIncrease.dispose();
         _btnGameCurrencyIncrease = null;
         _btnPremiumCurrencyDecrease.dispose();
         _btnPremiumCurrencyDecrease = null;
         _btnPremiumCurrencyIncrease.dispose();
         _btnPremiumCurrencyIncrease = null;
         _tooltipGameCurrencyIcon.dispose();
         _tooltipGameCurrencyIcon = null;
         _tooltipGameCurrencyCaption.dispose();
         _tooltipGameCurrencyCaption = null;
         _tooltipGameCurrencyInput.dispose();
         _tooltipGameCurrencyInput = null;
         _tooltipPremiumCurrencyIcon.dispose();
         _tooltipPremiumCurrencyIcon = null;
         _tooltipPremiumCurrencyCaption.dispose();
         _tooltipPremiumCurrencyCaption = null;
         _tooltipPremiumCurrencyInput.dispose();
         _tooltipPremiumCurrencyInput = null;
         super.dispose();
      }
      
      private function getCharacterMaxSpendableAmount() : void
      {
         Environment.application.sendActionRequest("getCharacterMaxSpendableAmount",{},handleRequests);
      }
      
      private function onInputChanged(param1:ITextInput) : void
      {
         if(!_btnClose)
         {
            return;
         }
         var _loc2_:SymbolDialogGuildDonationGeneric = _vo as SymbolDialogGuildDonationGeneric;
         if(isNaN(parseInt(_loc2_.inputCoins.text)))
         {
            _loc2_.inputCoins.text = "0";
         }
         else
         {
            _loc2_.inputCoins.text = Math.max(0,Math.min(User.current.character.gameCurrency,parseInt(_loc2_.inputCoins.text))).toString();
         }
         if(isNaN(parseInt(_loc2_.inputPremiumCurrency.text)))
         {
            _loc2_.inputPremiumCurrency.text = "0";
         }
         else
         {
            _loc2_.inputPremiumCurrency.text = Math.max(0,parseInt(_loc2_.inputPremiumCurrency.text)).toString();
         }
         refreshTooltips();
      }
      
      private function refreshTooltips() : void
      {
         var _loc4_:int = 0;
         var _loc1_:String = LocText.current.text("dialog/guild_donation/coin_tooltip",GameUtil.getGameCurrencyString(User.current.character.gameCurrency),GameUtil.getGameCurrencyString(currentGameCurrencyInput + User.current.character.guild.gameCurrency));
         var _loc2_:String = maxSpendablePremiumCurrency > 0?LocText.current.text("dialog/guild_donation/premium_currency_spendable_tooltip",GameUtil.getPremiumCurrencyString(maxSpendablePremiumCurrency),GameUtil.getPremiumCurrencyString(currentPremiumCurrencyInput + User.current.character.guild.premiumCurrency)):LocText.current.text("dialog/guild_donation/premium_currency_tooltip",GameUtil.getPremiumCurrencyString(currentPremiumCurrencyInput + User.current.character.guild.premiumCurrency));
         _btnGameCurrencyDecrease.tooltip = _loc1_;
         _btnGameCurrencyIncrease.tooltip = _loc1_;
         _btnPremiumCurrencyDecrease.tooltip = _loc2_;
         _btnPremiumCurrencyIncrease.tooltip = _loc2_;
         _tooltipGameCurrencyIcon.text = _loc1_;
         _tooltipGameCurrencyCaption.text = _loc1_;
         _tooltipGameCurrencyInput.text = _loc1_;
         _tooltipPremiumCurrencyIcon.text = _loc2_;
         _tooltipPremiumCurrencyCaption.text = _loc2_;
         _tooltipPremiumCurrencyInput.text = _loc2_;
         var _loc3_:SymbolDialogGuildDonationGeneric = _vo as SymbolDialogGuildDonationGeneric;
         if(currentPremiumCurrencyInput > Math.min(maxSpendablePremiumCurrency,User.current.premiumCurrency))
         {
            _loc3_.info.visible = true;
            _loc4_ = currentPremiumCurrencyInput - Math.min(maxSpendablePremiumCurrency,User.current.premiumCurrency);
            if(_loc4_ == currentPremiumCurrencyInput)
            {
               _loc3_.info.txtInfoPremiumCurrency.text = LocText.current.text("dialog/guild_donation/premium_currency_all_hint",GameUtil.getPremiumCurrencyString(_loc4_));
            }
            else
            {
               _loc3_.info.txtInfoPremiumCurrency.text = LocText.current.text("dialog/guild_donation/premium_currency_hint",_loc4_,currentPremiumCurrencyInput);
            }
         }
         else
         {
            _loc3_.info.visible = false;
         }
      }
      
      private function get currentGameCurrencyInput() : int
      {
         if(!_btnClose)
         {
            return 0;
         }
         var _loc1_:SymbolDialogGuildDonationGeneric = _vo as SymbolDialogGuildDonationGeneric;
         if(isNaN(parseInt(_loc1_.inputCoins.text)))
         {
            return 0;
         }
         return parseInt(_loc1_.inputCoins.text);
      }
      
      private function get currentPremiumCurrencyInput() : int
      {
         var _loc1_:SymbolDialogGuildDonationGeneric = _vo as SymbolDialogGuildDonationGeneric;
         if(isNaN(parseInt(_loc1_.inputPremiumCurrency.text)))
         {
            return 0;
         }
         return parseInt(_loc1_.inputPremiumCurrency.text);
      }
      
      private function get maxSpendablePremiumCurrency() : int
      {
         if(_maxSpendablePremiumCurrency == -1)
         {
            return User.current.premiumCurrency;
         }
         return _maxSpendablePremiumCurrency;
      }
      
      private function setFocus() : void
      {
         var _loc1_:SymbolDialogGuildDonationGeneric = _vo as SymbolDialogGuildDonationGeneric;
         if(StringUtil.isEmpty(_loc1_.inputCoins.text))
         {
            Dialog.focus = _loc1_.inputCoins;
         }
         else if(StringUtil.isEmpty(_loc1_.inputPremiumCurrency.text))
         {
            Dialog.focus = _loc1_.inputPremiumCurrency;
         }
         else
         {
            Dialog.focus = _loc1_.inputCoins;
            _loc1_.inputCoins.selectAll();
         }
      }
      
      private function onClickClose(param1:InteractionEvent) : void
      {
         close();
      }
      
      private function onClickGameCurrencyDecrease(param1:InteractionEvent) : void
      {
         var _loc2_:SymbolDialogGuildDonationGeneric = _vo as SymbolDialogGuildDonationGeneric;
         if(isNaN(parseInt(_loc2_.inputCoins.text)))
         {
            _loc2_.inputCoins.text = "0";
         }
         else
         {
            _loc2_.inputCoins.text = Math.max(0,parseInt(_loc2_.inputCoins.text) - 100).toString();
         }
         refreshTooltips();
      }
      
      private function onClickGameCurrencyIncrease(param1:InteractionEvent) : void
      {
         var _loc2_:SymbolDialogGuildDonationGeneric = _vo as SymbolDialogGuildDonationGeneric;
         if(isNaN(parseInt(_loc2_.inputCoins.text)))
         {
            _loc2_.inputCoins.text = "0";
         }
         else
         {
            _loc2_.inputCoins.text = Math.min(User.current.character.gameCurrency,parseInt(_loc2_.inputCoins.text) + 100).toString();
         }
         refreshTooltips();
      }
      
      private function onClickPremiumCurrencyDecrease(param1:InteractionEvent) : void
      {
         var _loc2_:SymbolDialogGuildDonationGeneric = _vo as SymbolDialogGuildDonationGeneric;
         if(isNaN(parseInt(_loc2_.inputPremiumCurrency.text)))
         {
            _loc2_.inputPremiumCurrency.text = "0";
         }
         else
         {
            _loc2_.inputPremiumCurrency.text = Math.max(0,parseInt(_loc2_.inputPremiumCurrency.text) - 1).toString();
         }
         refreshTooltips();
      }
      
      private function onClickPremiumCurrencyIncrease(param1:InteractionEvent) : void
      {
         var _loc2_:SymbolDialogGuildDonationGeneric = _vo as SymbolDialogGuildDonationGeneric;
         if(isNaN(parseInt(_loc2_.inputPremiumCurrency.text)))
         {
            _loc2_.inputPremiumCurrency.text = "0";
         }
         else
         {
            _loc2_.inputPremiumCurrency.text = (parseInt(_loc2_.inputPremiumCurrency.text) + 1).toString();
         }
         refreshTooltips();
      }
      
      private function onClickDonate(param1:InteractionEvent) : void
      {
         var _loc3_:int = 0;
         var _loc2_:SymbolDialogGuildDonationGeneric = _vo as SymbolDialogGuildDonationGeneric;
         if(isNaN(parseInt(_loc2_.inputCoins.text)) || parseInt(_loc2_.inputCoins.text) < 0)
         {
            Environment.panelManager.showDialog(new UiInfoDialog(LocText.current.text("dialog/guild_donation/invalid_game_currency_value/title"),LocText.current.text("dialog/guild_donation/invalid_game_currency_value/text"),LocText.current.text("general/button_ok")));
            return;
         }
         if(isNaN(parseInt(_loc2_.inputPremiumCurrency.text)) || parseInt(_loc2_.inputPremiumCurrency.text) < 0)
         {
            Environment.panelManager.showDialog(new UiInfoDialog(LocText.current.text("dialog/guild_donation/invalid_premium_currency_value/title"),LocText.current.text("dialog/guild_donation/invalid_premium_currency_value/text"),LocText.current.text("general/button_ok")));
            return;
         }
         if(parseInt(_loc2_.inputCoins.text) == 0 && parseInt(_loc2_.inputPremiumCurrency.text) == 0)
         {
            Environment.panelManager.showDialog(new UiInfoDialog(LocText.current.text("dialog/guild_donation/nothing_to_donate/title"),LocText.current.text("dialog/guild_donation/nothing_to_donate/text"),LocText.current.text("general/button_ok")));
            return;
         }
         if(currentPremiumCurrencyInput > Math.min(maxSpendablePremiumCurrency,User.current.premiumCurrency))
         {
            _loc3_ = currentPremiumCurrencyInput - Math.min(maxSpendablePremiumCurrency,User.current.premiumCurrency);
            ViewManager.instance.showNotEnoughPremiumDialog(_loc3_,true);
            return;
         }
         Environment.application.sendActionRequest("donateToGuild",{
            "game_currency_amount":_loc2_.inputCoins.text,
            "premium_currency_amount":_loc2_.inputPremiumCurrency.text
         },handleRequests);
      }
      
      private function handleRequests(param1:ActionRequestResponse) : void
      {
         response = param1;
         var _loc3_:* = response.action;
         switch(_loc3_)
         {
            case "getCharacterMaxSpendableAmount":
               if(response.error == "")
               {
                  _maxSpendablePremiumCurrency = response.appResponse.max_spendable_amount;
                  onInputChanged(null);
               }
               break;
            case "donateToGuild":
               var vo:SymbolDialogGuildDonationGeneric = _vo as SymbolDialogGuildDonationGeneric;
               if(response.error == "")
               {
                  Environment.application.updateData(response.data);
                  close();
                  Environment.audio.playFX("event_guild_donated.mp3");
                  UiGuildChatTab.instance.refreshGuildLog();
                  if(_notifySuccess)
                  {
                     if(_neededGameCurrency <= currentGameCurrencyInput && _neededPremiumCurrency <= currentPremiumCurrencyInput)
                     {
                        MessageRouter.dispatch(new Message("ViewMessage.notifyNeededGuildDonationMade",{},this));
                     }
                  }
               }
               else if(response.error == "errRemoveGameCurrencyNotEnough")
               {
                  ViewManager.instance.showNotEnoughGameCurrencyDialog(currentGameCurrencyInput);
               }
               else if(response.error == "errRemovePremiumCurrencyNotEnough")
               {
                  var toBuy:int = currentPremiumCurrencyInput - Math.min(maxSpendablePremiumCurrency,User.current.premiumCurrency);
                  ViewManager.instance.showNotEnoughPremiumDialog(toBuy);
               }
               else if(response.error == "errDonateToGuildUserNotConfirmed")
               {
                  var resendConfirmation:Function = function():void
                  {
                     Environment.application.sendActionRequest("resendUserConfirmationEmail",{},null);
                  };
                  Environment.panelManager.showDialog(new UiTwoChoiceDialog(LocText.current.text("dialog/guild_donation/user_not_confirmed/title"),LocText.current.text("dialog/guild_donation/user_not_confirmed/text"),LocText.current.text("dialog/guild_donation/user_not_confirmed/button_resend"),LocText.current.text("general/button_cancel"),resendConfirmation));
               }
               else if(response.error == "errDonateToGuildUserNoPayUser")
               {
                  Environment.panelManager.showDialog(new UiInfoDialog(LocText.current.text("dialog/guild_donation/no_pay_user/title"),LocText.current.text("dialog/guild_donation/no_pay_user/text"),LocText.current.text("general/button_ok")));
               }
               else if(response.error == "errDonateToGuildLevelNotEnough")
               {
                  Environment.panelManager.showDialog(new UiInfoDialog(LocText.current.text("dialog/guild_donation/level_not_enough/title"),LocText.current.text("dialog/guild_donation/level_not_enough/text",CConstant.guild_donation_min_level),LocText.current.text("general/button_ok")));
               }
               else if(response.error == "errDonateToGuildLimitReached")
               {
                  Environment.panelManager.showDialog(new UiInfoDialog(LocText.current.text("dialog/guild_donation/limit_reached/title"),LocText.current.text("dialog/guild_donation/limit_reached/text"),LocText.current.text("general/button_ok")));
               }
               else if(response.error == "errCharacterNoGuild")
               {
                  Environment.panelManager.showDialog(new UiInfoDialog(LocText.current.text("dialog/guild_donation/no_guild/title"),LocText.current.text("dialog/guild_donation/no_guild/text"),LocText.current.text("general/button_ok")));
                  close();
               }
               else
               {
                  Environment.reportError(response.error,response.request);
               }
               break;
            default:
               throw new Error("Unsupported request action \'" + response.action + "\'!");
         }
      }
      
      private function handleMessages(param1:Message) : void
      {
         var _loc2_:* = param1.type;
         if("ViewMessage.notifyPaymentSuccess" !== _loc2_)
         {
            throw new Error("Encountered unknown message type! type=" + param1.type);
         }
         getCharacterMaxSpendableAmount();
      }
      
      override public function get defaultButton() : Button
      {
         return _btnDonate;
      }
      
      override public function onEscape() : void
      {
         close();
      }
   }
}
