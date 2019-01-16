package com.playata.application.ui.dialogs
{
   import com.playata.application.data.character.AppearanceSettings;
   import com.playata.application.data.user.User;
   import com.playata.application.ui.ViewManager;
   import com.playata.application.ui.elements.avatar.UiAppearanceConfiguratorBarber;
   import com.playata.application.ui.elements.avatar.UiAppearanceConfiguratorSurgeon;
   import com.playata.application.ui.elements.avatar.UiAppearanceConfiguratorTattoo;
   import com.playata.application.ui.elements.avatar.UiAppearanceConfiguratorUnderwear;
   import com.playata.application.ui.elements.generic.button.UiButton;
   import com.playata.application.ui.elements.generic.button.UiPremiumButton;
   import com.playata.application.ui.elements.generic.button.UiTextButton;
   import com.playata.application.ui.elements.generic.checkbox.UiCheckBox;
   import com.playata.application.ui.elements.generic.dialog.UiDialog;
   import com.playata.framework.application.Environment;
   import com.playata.framework.application.request.ActionRequestResponse;
   import com.playata.framework.input.InteractionEvent;
   import com.playata.framework.localization.LocText;
   import visuals.ui.dialogs.SymbolDialogCharacterAppearanceUnsavedChangesGeneric;
   
   public class DialogCharacterAppearanceUnsavedChanges extends UiDialog
   {
       
      
      private var _btnClose:UiButton = null;
      
      private var _btnSave:UiPremiumButton = null;
      
      private var _btnNoSave:UiTextButton = null;
      
      private var _ckbTattoo:UiCheckBox = null;
      
      private var _ckbBarber:UiCheckBox = null;
      
      private var _ckbSurgeon:UiCheckBox = null;
      
      private var _ckbUnderwear:UiCheckBox = null;
      
      private var _surgeonConfigurator:UiAppearanceConfiguratorSurgeon = null;
      
      private var _barberConfigurator:UiAppearanceConfiguratorBarber = null;
      
      private var _tattooConfigurator:UiAppearanceConfiguratorTattoo = null;
      
      private var _underwearConfigurator:UiAppearanceConfiguratorUnderwear = null;
      
      public function DialogCharacterAppearanceUnsavedChanges(param1:UiAppearanceConfiguratorSurgeon, param2:UiAppearanceConfiguratorBarber, param3:UiAppearanceConfiguratorTattoo, param4:UiAppearanceConfiguratorUnderwear, param5:Function)
      {
         var _loc6_:SymbolDialogCharacterAppearanceUnsavedChangesGeneric = new SymbolDialogCharacterAppearanceUnsavedChangesGeneric();
         super(_loc6_);
         _closeCallback = param5;
         _surgeonConfigurator = param1;
         _barberConfigurator = param2;
         _tattooConfigurator = param3;
         _underwearConfigurator = param4;
         _loc6_.txtDialogTitle.text = LocText.current.text("dialog/character_appearance_unsaved_changes/title");
         _loc6_.txtInfo.text = LocText.current.text("dialog/character_appearance_unsaved_changes/info");
         _loc6_.txtTattoo.text = LocText.current.text("dialog/character_appearance_unsaved_changes/tattoo");
         _loc6_.txtBarber.text = LocText.current.text("dialog/character_appearance_unsaved_changes/barber");
         _loc6_.txtSurgeon.text = LocText.current.text("dialog/character_appearance_unsaved_changes/surgeon");
         _loc6_.txtUnderwear.text = LocText.current.text("dialog/character_appearance_unsaved_changes/underwear");
         _ckbTattoo = new UiCheckBox(_loc6_.checkTattoo,true,"",onTattooChanged,null,_loc6_.txtTattoo);
         _ckbBarber = new UiCheckBox(_loc6_.checkBarber,true,"",onBarberChanged,null,_loc6_.txtBarber);
         _ckbSurgeon = new UiCheckBox(_loc6_.checkSurgeon,true,"",onSurgeonChanged,null,_loc6_.txtSurgeon);
         _ckbUnderwear = new UiCheckBox(_loc6_.checkUnderwear,true,"",onUnderwearChanged,null,_loc6_.txtUnderwear);
         _btnClose = new UiButton(_loc6_.btnClose,"",onClickClose);
         _btnSave = new UiPremiumButton(_loc6_.btnSave,0,"",LocText.current.text("dialog/character_appearance_unsaved_changes/button_save"),"","",onClickSaveChanges);
         _btnSave.premium = true;
         _btnNoSave = new UiTextButton(_loc6_.btnNosave,LocText.current.text("dialog/character_appearance_unsaved_changes/button_no_save"),"",onClickNoSave);
         resizeDialog(_loc6_);
         refresh();
      }
      
      private function resizeDialog(param1:SymbolDialogCharacterAppearanceUnsavedChangesGeneric) : void
      {
         var _loc4_:int = 36;
         var _loc5_:Number = param1.txtUnderwear.y;
         var _loc6_:Number = param1.txtTattoo.y;
         var _loc7_:Number = param1.checkUnderwear.y - param1.txtUnderwear.y;
         var _loc2_:Number = param1.iconPremiumCurrencyUnderwear.y - param1.txtUnderwear.y;
         var _loc3_:Number = param1.txtPremiumCurrencyUnderwear.y - param1.txtUnderwear.y;
         if(_underwearConfigurator.costPremium > 0)
         {
            _loc5_ = param1.txtSurgeon.y;
         }
         if(_surgeonConfigurator.costPremium > 0)
         {
            param1.txtSurgeon.y = _loc5_;
            param1.checkSurgeon.y = _loc5_ - _loc7_;
            param1.iconPremiumCurrencySurgeon.y = _loc5_ - _loc2_;
            param1.txtPremiumCurrencySurgeon.y = _loc5_ - _loc3_;
            _loc5_ = _loc5_ - _loc4_;
         }
         if(_barberConfigurator.costPremium > 0)
         {
            param1.txtBarber.y = _loc5_;
            param1.checkBarber.y = _loc5_ - _loc7_;
            param1.iconPremiumCurrencyBarber.y = _loc5_ - _loc2_;
            param1.txtPremiumCurrencyBarber.y = _loc5_ - _loc3_;
            _loc5_ = _loc5_ - _loc4_;
         }
         if(_tattooConfigurator.costPremium > 0)
         {
            param1.txtTattoo.y = _loc5_;
            param1.checkTattoo.y = _loc5_ - _loc7_;
            param1.iconPremiumCurrencyTattoo.y = _loc5_ - _loc2_;
            param1.txtPremiumCurrencyTattoo.y = _loc5_ - _loc3_;
            _loc5_ = _loc5_ - _loc4_;
         }
         param1.txtInfo.y = _loc5_ - 70;
         param1.txtDialogTitle.y = param1.txtInfo.y - 35;
         param1.btnClose.y = param1.txtDialogTitle.y - 29;
         param1.dialogBackground.height = param1.dialogBackground.height - (_loc5_ - _loc6_);
         param1.dialogBackground.y = param1.dialogBackground.y + (_loc5_ - _loc6_);
      }
      
      private function onTattooChanged(param1:Boolean) : void
      {
         _ckbTattoo.checked = param1;
         refresh();
      }
      
      private function onBarberChanged(param1:Boolean) : void
      {
         _ckbBarber.checked = param1;
         refresh();
      }
      
      private function onSurgeonChanged(param1:Boolean) : void
      {
         _ckbSurgeon.checked = param1;
         refresh();
      }
      
      private function onUnderwearChanged(param1:Boolean) : void
      {
         _ckbUnderwear.checked = param1;
         refresh();
      }
      
      override public function dispose() : void
      {
         _btnClose.dispose();
         _btnClose = null;
         _btnSave.dispose();
         _btnSave = null;
         _btnNoSave.dispose();
         _btnNoSave = null;
         _surgeonConfigurator = null;
         _barberConfigurator = null;
         _tattooConfigurator = null;
         _underwearConfigurator = null;
         super.dispose();
      }
      
      private function onClickClose(param1:InteractionEvent) : void
      {
         close();
      }
      
      private function onClickSaveChanges(param1:InteractionEvent) : void
      {
         var _loc2_:AppearanceSettings = User.current.character.getCurrentSettings();
         if(_ckbTattoo.checked)
         {
            _loc2_ = _tattooConfigurator.getRelevantSettings(_loc2_);
         }
         if(_ckbBarber.checked)
         {
            _loc2_ = _barberConfigurator.getRelevantSettings(_loc2_);
         }
         if(_ckbSurgeon.checked)
         {
            _loc2_ = _surgeonConfigurator.getRelevantSettings(_loc2_);
         }
         if(_ckbUnderwear.checked)
         {
            _loc2_ = _underwearConfigurator.getRelevantSettings(_loc2_);
         }
         Environment.application.sendActionRequest("setCharacterAppearance",_loc2_,handleRequests);
      }
      
      private function onClickNoSave(param1:InteractionEvent) : void
      {
         close(_closeCallback);
      }
      
      private function refresh() : void
      {
         var _loc2_:SymbolDialogCharacterAppearanceUnsavedChangesGeneric = _vo as SymbolDialogCharacterAppearanceUnsavedChangesGeneric;
         var _loc1_:int = 0;
         var _loc3_:* = _ckbTattoo.checked && _tattooConfigurator.costPremium > 0;
         _loc2_.iconPremiumCurrencyTattoo.visible = _loc3_;
         _loc2_.txtPremiumCurrencyTattoo.visible = _loc3_;
         _loc3_ = _tattooConfigurator.costCoins > 0 || _tattooConfigurator.costPremium > 0;
         _loc2_.checkTattoo.visible = _loc3_;
         _loc2_.txtTattoo.visible = _loc3_;
         if(_ckbTattoo.checked && _tattooConfigurator.costPremium > 0)
         {
            _loc1_ = _loc1_ + _tattooConfigurator.costPremium;
            _loc2_.txtPremiumCurrencyTattoo.text = LocText.current.formatHugeNumber(_tattooConfigurator.costPremium);
         }
         _loc3_ = _ckbBarber.checked && _barberConfigurator.costPremium > 0;
         _loc2_.iconPremiumCurrencyBarber.visible = _loc3_;
         _loc2_.txtPremiumCurrencyBarber.visible = _loc3_;
         _loc3_ = _barberConfigurator.costCoins > 0 || _barberConfigurator.costPremium > 0;
         _loc2_.checkBarber.visible = _loc3_;
         _loc2_.txtBarber.visible = _loc3_;
         if(_ckbBarber.checked && _barberConfigurator.costPremium > 0)
         {
            _loc1_ = _loc1_ + _barberConfigurator.costPremium;
            _loc2_.txtPremiumCurrencyBarber.text = LocText.current.formatHugeNumber(_barberConfigurator.costPremium);
         }
         _loc3_ = _ckbSurgeon.checked && _surgeonConfigurator.costPremium > 0;
         _loc2_.iconPremiumCurrencySurgeon.visible = _loc3_;
         _loc2_.txtPremiumCurrencySurgeon.visible = _loc3_;
         _loc3_ = _surgeonConfigurator.costCoins > 0 || _surgeonConfigurator.costPremium > 0;
         _loc2_.checkSurgeon.visible = _loc3_;
         _loc2_.txtSurgeon.visible = _loc3_;
         if(_ckbSurgeon.checked && _surgeonConfigurator.costPremium > 0)
         {
            _loc1_ = _loc1_ + _surgeonConfigurator.costPremium;
            _loc2_.txtPremiumCurrencySurgeon.text = LocText.current.formatHugeNumber(_surgeonConfigurator.costPremium);
         }
         _loc3_ = _ckbUnderwear.checked && _underwearConfigurator.costPremium > 0;
         _loc2_.iconPremiumCurrencyUnderwear.visible = _loc3_;
         _loc2_.txtPremiumCurrencyUnderwear.visible = _loc3_;
         _loc3_ = _underwearConfigurator.costCoins > 0 || _underwearConfigurator.costPremium > 0;
         _loc2_.checkUnderwear.visible = _loc3_;
         _loc2_.txtUnderwear.visible = _loc3_;
         if(_ckbUnderwear.checked && _underwearConfigurator.costPremium > 0)
         {
            _loc1_ = _loc1_ + _underwearConfigurator.costPremium;
            _loc2_.txtPremiumCurrencyUnderwear.text = LocText.current.formatHugeNumber(_underwearConfigurator.costPremium);
         }
         if(_loc1_ > 0)
         {
            _loc2_.txtPremiumCurrencySum.text = LocText.current.formatHugeNumber(_loc1_);
            _loc3_ = true;
            _loc2_.txtPremiumCurrencySum.visible = _loc3_;
            _loc2_.iconPremiumCurrencySum.visible = _loc3_;
         }
         else
         {
            _loc3_ = false;
            _loc2_.txtPremiumCurrencySum.visible = _loc3_;
            _loc2_.iconPremiumCurrencySum.visible = _loc3_;
         }
         _btnSave.premiumAmount = _loc1_;
         _btnSave.buttonEnabled = _loc1_ > 0;
      }
      
      protected function handleRequests(param1:ActionRequestResponse) : void
      {
         var _loc2_:* = param1.action;
         if("setCharacterAppearance" !== _loc2_)
         {
            throw new Error("Unsupported request action \'" + param1.action + "\'!");
         }
         if(param1.error == "")
         {
            Environment.application.updateData(param1.data);
            close(_closeCallback);
         }
         else if(param1.error == "errRemovePremiumCurrencyNotEnough")
         {
            ViewManager.instance.showNotEnoughPremiumDialog(_btnSave.premiumAmount);
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
