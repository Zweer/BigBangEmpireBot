package com.playata.application.ui.dialogs
{
   import com.playata.application.data.constants.CConstant;
   import com.playata.application.data.user.User;
   import com.playata.application.ui.ViewManager;
   import com.playata.application.ui.elements.generic.button.UiPremiumButton;
   import com.playata.application.ui.elements.generic.button.UiTextButton;
   import com.playata.application.ui.elements.generic.dialog.UiDialog;
   import com.playata.framework.application.Environment;
   import com.playata.framework.application.request.ActionRequestResponse;
   import com.playata.framework.input.InteractionEvent;
   import com.playata.framework.localization.LocText;
   import visuals.ui.dialogs.SymbolDialogUseEnergyStorageGeneric;
   
   public class DialogUseEnergyStorage extends UiDialog
   {
       
      
      private var _btnClose:UiTextButton = null;
      
      private var _btnUseStorage:UiPremiumButton = null;
      
      private var _usedCallback:Function;
      
      private var _premiumAmount:int;
      
      public function DialogUseEnergyStorage(param1:Function = null)
      {
         _usedCallback = param1;
         var _loc2_:SymbolDialogUseEnergyStorageGeneric = new SymbolDialogUseEnergyStorageGeneric();
         super(_loc2_);
         _queued = false;
         _loc2_.txtDialogTitle.text = LocText.current.text("dialog/use_energy_storage/title");
         _loc2_.txtInfo.text = LocText.current.text("dialog/use_energy_storage/info_use",User.current.character.currentEnergyStorage);
         _btnClose = new UiTextButton(_loc2_.btnClose,LocText.current.text("dialog/use_energy_storage/button_close"),"",onClickClose);
         if(User.current.character.currentEnergyStorage <= 50)
         {
            _premiumAmount = CConstant.energy_storage_cost_50;
         }
         else
         {
            _premiumAmount = CConstant.energy_storage_cost_100;
         }
         _btnUseStorage = new UiPremiumButton(_loc2_.btnUse,_premiumAmount,"",LocText.current.text("dialog/not_enough_energy/button_buy_energy",User.current.character.currentEnergyStorage),"","",onClickUse);
         _btnUseStorage.premium = true;
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
         _btnUseStorage.dispose();
         _btnUseStorage = null;
         _usedCallback = null;
         super.dispose();
      }
      
      private function onClickClose(param1:InteractionEvent) : void
      {
         close();
      }
      
      private function onClickUse(param1:InteractionEvent) : void
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
            if(_usedCallback != null)
            {
               _usedCallback();
            }
            close();
         }
         else if(param1.error == "errRemovePremiumCurrencyNotEnough")
         {
            ViewManager.instance.showNotEnoughPremiumDialog(_premiumAmount);
         }
         else
         {
            Environment.reportError(param1.error,param1.request);
         }
      }
      
      override public function onEscape() : void
      {
         close();
      }
   }
}
