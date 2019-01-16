package com.playata.application.ui.dialogs
{
   import com.playata.application.AppConfig;
   import com.playata.application.data.user.User;
   import com.playata.application.ui.elements.generic.button.UiButton;
   import com.playata.application.ui.elements.generic.button.UiTextButton;
   import com.playata.application.ui.elements.generic.checkbox.UiCheckBox;
   import com.playata.application.ui.elements.generic.dialog.UiDialog;
   import com.playata.application.ui.elements.generic.dialog.UiInfoDialog;
   import com.playata.framework.application.Environment;
   import com.playata.framework.input.InteractionEvent;
   import com.playata.framework.localization.LocText;
   import visuals.ui.dialogs.SymbolDialogAccountSettingsGeneric;
   
   public class DialogAccountSettings extends UiDialog
   {
       
      
      private var _btnClose:UiButton = null;
      
      private var _btnChangePassword:UiTextButton = null;
      
      private var _btnChangeEmail:UiTextButton = null;
      
      private var _btnDeleteAccount:UiTextButton = null;
      
      private var _btnRevokeConsent:UiTextButton = null;
      
      private var _btnResendConfirmation:UiTextButton = null;
      
      private var _btnUnbindFromNetwork:UiTextButton = null;
      
      private var _btnChangeLocale:UiTextButton = null;
      
      private var _ckbAutoLogoff:UiCheckBox = null;
      
      public function DialogAccountSettings()
      {
         var _loc4_:SymbolDialogAccountSettingsGeneric = new SymbolDialogAccountSettingsGeneric();
         super(_loc4_);
         _queued = false;
         _loc4_.txtDialogTitle.text = LocText.current.text("dialog/account_settings/title");
         _loc4_.txtNameCaption.text = LocText.current.text("dialog/account_settings/name_caption");
         _loc4_.txtEmailCaption.text = LocText.current.text("dialog/account_settings/email_caption");
         _loc4_.txtName.text = User.current.character.name;
         _loc4_.txtEmail.text = User.current.email;
         _loc4_.txtAutoLogoff.text = LocText.current.text("dialog/account_settings/auto_logoff");
         _ckbAutoLogoff = new UiCheckBox(_loc4_.checkAutoLogoff,User.current.autoLogoffActive,LocText.current.text("dialog/account_settings/auto_logoff_tooltip"),onAutoLogoffChanged,null,_loc4_.txtAutoLogoff);
         _btnClose = new UiButton(_loc4_.btnClose,"",onClickClose);
         _btnChangePassword = new UiTextButton(_loc4_.btnChangePassword,LocText.current.text("dialog/account_settings/button_change_password"),"",onClickChangePassword);
         _btnChangeEmail = new UiTextButton(_loc4_.btnChangeEmail,LocText.current.text("dialog/account_settings/button_change_email"),"",onClickChangeEmail);
         _btnDeleteAccount = new UiTextButton(_loc4_.btnDeleteAccount,LocText.current.text("dialog/account_settings/button_delete_account"),"",onClickDeleteAccount);
         _btnRevokeConsent = new UiTextButton(_loc4_.btnRevokeConsent,LocText.current.text("dialog/account_settings/button_revoke_consent"),"",onClickDeleteAccount);
         _btnResendConfirmation = new UiTextButton(_loc4_.btnResendConfirmation,LocText.current.text("dialog/account_settings/button_resend_confirmation"),"",onClickResendConfirmation);
         _btnUnbindFromNetwork = new UiTextButton(_loc4_.btnUnbindFromNetwork,LocText.current.text("dialog/account_settings/button_unbind_from_network"),"",onClickUnbindFromNetwork);
         _btnChangeLocale = new UiTextButton(_loc4_.btnChangeLocale,LocText.current.text("dialog/account_settings/button_change_locale"),"",onClickChangeLocale);
         _btnResendConfirmation.buttonEnabled = !User.current.isConfirmed;
         _btnChangePassword.changeWidth(250);
         _btnChangeEmail.changeWidth(250);
         _btnDeleteAccount.changeWidth(250);
         _btnRevokeConsent.changeWidth(250);
         _btnResendConfirmation.changeWidth(250);
         _btnUnbindFromNetwork.changeWidth(250);
         _btnChangeLocale.changeWidth(250);
         _btnChangePassword.fitText();
         _btnChangeEmail.fitText();
         _btnDeleteAccount.fitText();
         _btnRevokeConsent.fitText();
         _btnResendConfirmation.fitText();
         _btnUnbindFromNetwork.fitText();
         _btnChangeLocale.fitText();
         var _loc6_:Vector.<UiTextButton> = new Vector.<UiTextButton>(0);
         _loc6_.push(_btnChangePassword);
         _loc6_.push(_btnChangeEmail);
         _loc6_.push(_btnResendConfirmation);
         _loc6_.push(_btnUnbindFromNetwork);
         _loc6_.push(_btnChangeLocale);
         _loc6_.push(_btnDeleteAccount);
         _loc6_.push(_btnRevokeConsent);
         var _loc7_:Vector.<UiTextButton> = new Vector.<UiTextButton>(0);
         var _loc2_:Boolean = User.current.hasStandaloneLogin;
         _loc4_.txtEmailCaption.visible = _loc2_;
         _loc4_.txtEmail.visible = _loc2_;
         _loc4_.txtAutoLogoff.visible = _loc2_ && !Environment.info.isNativeMobile;
         _loc4_.checkAutoLogoff.visible = _loc2_ && !Environment.info.isNativeMobile;
         if(_loc2_)
         {
            _loc7_.push(_btnChangeEmail);
            _loc7_.push(_btnChangePassword);
            if(!User.current.isConfirmed)
            {
               _loc7_.push(_btnResendConfirmation);
            }
         }
         if(platform.isUnbindAllowed && !_loc2_)
         {
            _loc7_.push(_btnUnbindFromNetwork);
         }
         if(AppConfig.alternativeLocales != null)
         {
            _loc7_.push(_btnChangeLocale);
         }
         _loc7_.push(_btnDeleteAccount);
         _loc7_.push(_btnRevokeConsent);
         var _loc5_:int = 0;
         var _loc3_:int = 50;
         var _loc9_:int = 0;
         var _loc8_:* = _loc6_;
         for each(var _loc1_ in _loc6_)
         {
            _loc1_.visible = _loc7_.indexOf(_loc1_) != -1;
            if(_loc1_.visible)
            {
               _loc1_.y = _loc5_;
               _loc5_ = _loc5_ + _loc3_;
            }
         }
         _loc4_.dialogBackground.height = _loc4_.dialogBackground.height + _loc7_.length * _loc3_;
      }
      
      override public function dispose() : void
      {
         _btnClose.dispose();
         _btnClose = null;
         _btnChangePassword.dispose();
         _btnChangePassword = null;
         _btnChangeEmail.dispose();
         _btnChangeEmail = null;
         _btnDeleteAccount.dispose();
         _btnDeleteAccount = null;
         _btnRevokeConsent.dispose();
         _btnRevokeConsent = null;
         _btnResendConfirmation.dispose();
         _btnResendConfirmation = null;
         _btnUnbindFromNetwork.dispose();
         _btnUnbindFromNetwork = null;
         _btnChangeLocale.dispose();
         _btnChangeLocale = null;
         _ckbAutoLogoff.dispose();
         _ckbAutoLogoff = null;
         super.dispose();
      }
      
      private function onClickClose(param1:InteractionEvent) : void
      {
         close();
      }
      
      private function onClickChangePassword(param1:InteractionEvent) : void
      {
         close(openChangePasswordDialog);
      }
      
      private function openChangePasswordDialog() : void
      {
         Environment.panelManager.showDialog(new DialogChangePassword());
      }
      
      private function onClickChangeEmail(param1:InteractionEvent) : void
      {
         close(openClickChangeEmailDialog);
      }
      
      private function openClickChangeEmailDialog() : void
      {
         Environment.panelManager.showDialog(new DialogChangeEmail());
      }
      
      private function onClickChangeLocale(param1:InteractionEvent) : void
      {
         close(openClickChangeLocaleDialog);
      }
      
      private function openClickChangeLocaleDialog() : void
      {
         Environment.panelManager.showDialog(new DialogChangeLocale());
      }
      
      private function onClickDeleteAccount(param1:InteractionEvent) : void
      {
         close(openDeleteAccountDialog);
      }
      
      private function openDeleteAccountDialog() : void
      {
         Environment.panelManager.showDialog(new DialogDeleteAccount());
      }
      
      private function onClickResendConfirmation(param1:InteractionEvent) : void
      {
         Environment.application.sendActionRequest("resendUserConfirmationEmail",{},null);
         Environment.panelManager.showDialog(new UiInfoDialog(LocText.current.text("dialog/resend_confirmation_success/title"),LocText.current.text("dialog/resend_confirmation_success/text"),LocText.current.text("general/button_ok")));
      }
      
      private function onClickUnbindFromNetwork(param1:InteractionEvent) : void
      {
         close(openClickUnbindFromNetwork);
      }
      
      private function openClickUnbindFromNetwork() : void
      {
         Environment.panelManager.showDialog(new DialogUnbindFromNetwork());
      }
      
      private function onAutoLogoffChanged(param1:Boolean) : void
      {
         User.current.autoLogoffActive = param1;
      }
      
      override public function onEscape() : void
      {
         close();
      }
   }
}
