package com.playata.application.ui.dialogs
{
   import com.playata.application.data.constants.CConstant;
   import com.playata.application.data.user.User;
   import com.playata.application.ui.ViewManager;
   import com.playata.application.ui.elements.generic.button.UiButton;
   import com.playata.application.ui.elements.generic.button.UiPremiumButton;
   import com.playata.application.ui.elements.generic.dialog.UiDialog;
   import com.playata.framework.application.Environment;
   import com.playata.framework.application.request.ActionRequestResponse;
   import com.playata.framework.input.InteractionEvent;
   import com.playata.framework.localization.LocText;
   import visuals.ui.dialogs.SymbolDialogOutOfEnergyUseStorageGeneric;
   
   public class DialogOutOfEnergyUseStorage extends UiDialog
   {
       
      
      private var _btnClose:UiButton = null;
      
      private var _btnBuyEnergyForPremiumCurrency:UiPremiumButton = null;
      
      private var _callback:Function = null;
      
      private var _premiumAmount:int;
      
      public function DialogOutOfEnergyUseStorage(param1:Function)
      {
         _callback = param1;
         var _loc2_:SymbolDialogOutOfEnergyUseStorageGeneric = new SymbolDialogOutOfEnergyUseStorageGeneric();
         super(_loc2_);
         _queued = false;
         if(User.current.character.currentEnergyStorage <= 50)
         {
            _premiumAmount = CConstant.energy_storage_cost_50;
         }
         else
         {
            _premiumAmount = CConstant.energy_storage_cost_100;
         }
         _loc2_.txtDialogTitle.text = LocText.current.text("dialog/not_enough_energy_use_storage/title");
         _loc2_.txtEnergyNotice.text = LocText.current.text("dialog/not_enough_energy_use_storage/text_notice",User.current.character.questEnergy);
         _loc2_.txtInstructionsCaption.text = LocText.current.text("dialog/not_enough_energy_use_storage/text_caption");
         _btnClose = new UiButton(_loc2_.btnClose,"",onClickClose);
         _btnBuyEnergyForPremiumCurrency = new UiPremiumButton(_loc2_.btnBuyEnergyForPremiumCurrency,_premiumAmount,"",LocText.current.text("dialog/not_enough_energy/button_buy_energy",User.current.character.currentEnergyStorage),"","",onClickBuyPremium);
         _btnBuyEnergyForPremiumCurrency.premium = true;
         if(User.current.character.isStorageUpgraded)
         {
            _loc2_.icon.gotoAndStop("upgraded");
         }
         else
         {
            _loc2_.icon.gotoAndStop("normal");
         }
      }
      
      override public function dispose() : void
      {
         _btnClose.dispose();
         _btnClose = null;
         _btnBuyEnergyForPremiumCurrency.dispose();
         _btnBuyEnergyForPremiumCurrency = null;
         super.dispose();
      }
      
      private function onClickClose(param1:InteractionEvent) : void
      {
         close();
      }
      
      private function onClickBuyPremium(param1:InteractionEvent) : void
      {
         Environment.application.sendActionRequest("useEnergyStorage",{"amount":User.current.character.currentEnergyStorage},handleRequests);
      }
      
      private function handleRequests(param1:ActionRequestResponse) : void
      {
         var _loc2_:* = param1.action;
         if("useEnergyStorage" !== _loc2_)
         {
            throw new Error("Unsupported request action \'" + param1.action + "\'!");
         }
         if(param1.error == "")
         {
            Environment.application.updateData(param1.data);
            close();
            if(_callback != null)
            {
               _callback();
            }
         }
         else if(param1.error == "errRemovePremiumCurrencyNotEnough")
         {
            ViewManager.instance.showNotEnoughPremiumDialog(_premiumAmount);
         }
      }
      
      override public function onEscape() : void
      {
         close();
      }
   }
}
