package com.playata.application.ui.dialogs
{
   import com.greensock.easing.Back;
   import com.greensock.easing.Bounce;
   import com.playata.application.AppEnvironment;
   import com.playata.application.data.GameUtil;
   import com.playata.application.data.constants.CConstant;
   import com.playata.application.data.user.User;
   import com.playata.application.ui.ViewManager;
   import com.playata.application.ui.elements.generic.button.UiButton;
   import com.playata.application.ui.elements.generic.button.UiGameCurrencyButton;
   import com.playata.application.ui.elements.generic.button.UiPremiumDiscountButton;
   import com.playata.application.ui.elements.generic.dialog.UiDialog;
   import com.playata.framework.application.Environment;
   import com.playata.framework.application.request.ActionRequestResponse;
   import com.playata.framework.core.Runtime;
   import com.playata.framework.display.layout.LayoutUtil;
   import com.playata.framework.input.InteractionEvent;
   import com.playata.framework.localization.LocText;
   import visuals.ui.dialogs.SymbolDialogOutOfEnergyGeneric;
   
   public class DialogOutOfEnergy extends UiDialog
   {
       
      
      private var _btnClose:UiButton = null;
      
      private var _btnBuyEnergyForGameCurrency:UiGameCurrencyButton = null;
      
      private var _btnBuyEnergyForPremiumCurrency:UiPremiumDiscountButton = null;
      
      private var _callback:Function = null;
      
      public function DialogOutOfEnergy(param1:Function, param2:Boolean)
      {
         var _loc11_:int = 0;
         _callback = param1;
         var _loc10_:SymbolDialogOutOfEnergyGeneric = new SymbolDialogOutOfEnergyGeneric();
         super(_loc10_);
         _queued = false;
         var _loc5_:int = CConstant.quest_energy_refill_premium_amount;
         var _loc8_:* = 0;
         var _loc3_:Number = CConstant.quest_max_refill_amount_per_day / CConstant.quest_energy_refill_amount;
         if(AppEnvironment.appPlatform.isHidePantiesAllowed)
         {
            _loc8_ = Number(User.current.character.questEnergyRefillAmountToday / CConstant.quest_energy_refill_amount + 1);
            _loc5_ = Math.max(CConstant.quest_energy_refill_premium_amount,_loc8_ * CConstant.quest_energy_refill_premium_amount_increase_adult);
         }
         var _loc6_:int = CConstant.quest_energy_refill_amount;
         var _loc7_:int = CConstant.quest_max_refill_amount_per_day;
         var _loc9_:int = GameUtil.gameCurrencyCostEnergyRefill(User.current.character.level,User.current.character.questEnergyRefillAmountToday);
         if(param2)
         {
            _loc10_.txtDialogTitle.text = LocText.current.text("dialog/not_enough_energy/manual_title");
            _loc10_.txtEnergyNotice.text = LocText.current.text("dialog/not_enough_energy/text_manual_notice",User.current.character.questEnergy);
         }
         else
         {
            _loc10_.txtDialogTitle.text = LocText.current.text("dialog/not_enough_energy/title");
            _loc10_.txtEnergyNotice.text = LocText.current.text("dialog/not_enough_energy/text_notice",User.current.character.questEnergy);
         }
         _loc10_.txtInstructionsCaption.text = LocText.current.text("dialog/not_enough_energy/text_caption");
         _loc10_.txtInstructionsBuy.text = LocText.current.text("dialog/not_enough_energy/text_buy",(_loc7_ - User.current.character.questEnergyRefillAmountToday) / _loc6_);
         _btnClose = new UiButton(_loc10_.btnClose,"",onClickClose);
         _btnBuyEnergyForGameCurrency = new UiGameCurrencyButton(_loc10_.btnBuyEnergyForCoins,_loc9_,LocText.current.text("dialog/not_enough_energy/button_buy_energy",_loc6_),"",onClickBuyGameCurrency);
         _btnBuyEnergyForPremiumCurrency = new UiPremiumDiscountButton(_loc10_.btnBuyEnergyForPremiumCurrency,_loc5_,"",LocText.current.text("dialog/not_enough_energy/button_buy_energy",_loc6_),"","",onClickBuyPremium);
         _btnBuyEnergyForPremiumCurrency.premium = true;
         _loc10_.txtInstructionsBuy.visible = !User.current.character.hasUsedAllQuestEnergy;
         _btnBuyEnergyForGameCurrency.visible = !User.current.character.hasUsedAllQuestEnergy;
         _btnBuyEnergyForPremiumCurrency.visible = !User.current.character.hasUsedAllQuestEnergy;
         var _loc4_:int = GameUtil.getEnergyRefillDiscountMaxLevel(User.current.character.level);
         if(_loc4_ > 0 && _loc8_ <= _loc3_)
         {
            _loc10_.discountHint.level.text = _loc4_.toString();
            _loc11_ = 100 - GameUtil.premiumCostEnergyRefill(User.current.character.level) / _loc5_ * 100;
            _loc10_.discountHint.caption.text = LocText.current.text("dialog/not_enough_energy/discount_hint",_loc11_);
            _loc10_.discountHint.level.autoFontSize = true;
            _loc10_.discountHint.caption.autoFontSize = true;
            _loc10_.discountHint.caption.x = -(_loc10_.discountHint.level.width + _loc10_.discountHint.caption.width + 2) * 0.5;
            _loc10_.discountHint.level.x = _loc10_.discountHint.caption.x + _loc10_.discountHint.caption.width + 2;
            _loc10_.discountHint.bg.width = -_loc10_.discountHint.caption.x * 2 + 18;
         }
         else
         {
            _loc10_.discountHint.visible = false;
         }
         if(AppEnvironment.appPlatform.isHidePantiesAllowed)
         {
            _loc10_.txtInstructionsBuy.visible = false;
            if(_loc9_ <= 0)
            {
               _btnBuyEnergyForGameCurrency.visible = false;
               _btnBuyEnergyForPremiumCurrency.x = _btnBuyEnergyForPremiumCurrency.x - _btnBuyEnergyForPremiumCurrency.content.x;
            }
         }
         _loc10_.lady.alpha = 0;
         _loc10_.lady.y = _loc10_.lady.y + LayoutUtil.deviceAdjustedHeightCorrection / 2;
      }
      
      override public function show() : void
      {
         super.show();
         var _loc1_:SymbolDialogOutOfEnergyGeneric = _vo as SymbolDialogOutOfEnergyGeneric;
         _loc1_.lady.tweenTo(0.8,{
            "alpha":1,
            "delay":0.5
         });
         if(_loc1_.discountHint.visible)
         {
            Runtime.delayFunction(_btnBuyEnergyForPremiumCurrency.discountTo,1,[GameUtil.premiumCostEnergyRefill(User.current.character.level)]);
            _loc1_.discountHint.tweenFrom(1.5,{
               "delay":3,
               "scaleX":0,
               "scaleY":0,
               "ease":Bounce.easeOut
            });
            _loc1_.discountHint.tweenTo(0.5,{
               "delay":8,
               "scaleX":0,
               "scaleY":0,
               "ease":Back.easeIn
            });
         }
      }
      
      override public function dispose() : void
      {
         Runtime.killDelayedFunction(_btnBuyEnergyForPremiumCurrency.discountTo);
         var _loc1_:SymbolDialogOutOfEnergyGeneric = _vo as SymbolDialogOutOfEnergyGeneric;
         _loc1_.lady.killTweens();
         _loc1_.discountHint.killTweens();
         _btnClose.dispose();
         _btnClose = null;
         _btnBuyEnergyForGameCurrency.dispose();
         _btnBuyEnergyForGameCurrency = null;
         _btnBuyEnergyForPremiumCurrency.dispose();
         _btnBuyEnergyForPremiumCurrency = null;
         super.dispose();
      }
      
      private function onClickClose(param1:InteractionEvent) : void
      {
         close();
         (_vo as SymbolDialogOutOfEnergyGeneric).lady.visible = false;
      }
      
      private function onClickBuyGameCurrency(param1:InteractionEvent) : void
      {
         _btnBuyEnergyForGameCurrency.buttonEnabled = false;
         _btnBuyEnergyForPremiumCurrency.buttonEnabled = false;
         Environment.application.sendActionRequest("buyQuestEnergy",{"use_premium":false},handleRequests);
      }
      
      private function onClickBuyPremium(param1:InteractionEvent) : void
      {
         _btnBuyEnergyForGameCurrency.buttonEnabled = false;
         _btnBuyEnergyForPremiumCurrency.buttonEnabled = false;
         Environment.application.sendActionRequest("buyQuestEnergy",{"use_premium":true},handleRequests);
      }
      
      private function handleRequests(param1:ActionRequestResponse) : void
      {
         var _loc2_:int = 0;
         var _loc3_:* = param1.action;
         if("buyQuestEnergy" !== _loc3_)
         {
            throw new Error("Unsupported request action \'" + param1.action + "\'!");
         }
         if(param1.error == "")
         {
            if(param1.request.getData("use_premium") === false)
            {
               Environment.audio.playFX("energy_buy.mp3");
            }
            Environment.application.updateData(param1.data);
            close();
            if(_callback != null)
            {
               _callback();
            }
         }
         else
         {
            _btnBuyEnergyForGameCurrency.buttonEnabled = true;
            _btnBuyEnergyForPremiumCurrency.buttonEnabled = true;
            if(param1.error == "errRemovePremiumCurrencyNotEnough")
            {
               ViewManager.instance.showNotEnoughPremiumDialog(GameUtil.premiumCostEnergyRefill(User.current.character.level));
            }
            else if(param1.error == "errRemoveGameCurrencyNotEnough")
            {
               _loc2_ = GameUtil.gameCurrencyCostEnergyRefill(User.current.character.level,User.current.character.questEnergyRefillAmountToday);
               ViewManager.instance.showNotEnoughGameCurrencyDialog(_loc2_);
            }
            else
            {
               Environment.reportError(param1.error,param1.request);
            }
         }
      }
      
      override public function onEscape() : void
      {
         close();
      }
   }
}
