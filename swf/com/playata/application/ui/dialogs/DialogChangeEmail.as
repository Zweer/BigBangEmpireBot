package com.playata.application.ui.dialogs
{
   import com.playata.application.data.user.User;
   import com.playata.application.ui.elements.generic.button.UiButton;
   import com.playata.application.ui.elements.generic.button.UiTextButton;
   import com.playata.application.ui.elements.generic.dialog.UiDialog;
   import com.playata.application.ui.elements.generic.dialog.UiInfoDialog;
   import com.playata.framework.application.Environment;
   import com.playata.framework.application.request.ActionRequestResponse;
   import com.playata.framework.application.request.IActionRequestResponseErrorHandler;
   import com.playata.framework.core.util.StringUtil;
   import com.playata.framework.display.ui.TextInputType;
   import com.playata.framework.display.ui.controls.Button;
   import com.playata.framework.display.ui.dialogs.Dialog;
   import com.playata.framework.input.InteractionEvent;
   import com.playata.framework.localization.LocText;
   import visuals.ui.dialogs.SymbolDialogChangeEmailGeneric;
   
   public class DialogChangeEmail extends UiDialog implements IActionRequestResponseErrorHandler
   {
       
      
      private var _btnClose:UiButton = null;
      
      private var _btnChange:UiTextButton = null;
      
      public function DialogChangeEmail()
      {
         var _loc1_:SymbolDialogChangeEmailGeneric = new SymbolDialogChangeEmailGeneric();
         super(_loc1_);
         _queued = false;
         _loc1_.txtDialogTitle.text = LocText.current.text("dialog/change_email/title");
         _loc1_.txtNewEmailCaption.text = LocText.current.text("dialog/change_email/new_email_caption");
         _loc1_.txtPasswordCaption.text = LocText.current.text("dialog/change_email/password_caption");
         _loc1_.inputNewEmail.inputType = TextInputType.EMAIL;
         _btnClose = new UiButton(_loc1_.btnClose,"",onClickClose);
         _btnChange = new UiTextButton(_loc1_.btnChange,LocText.current.text("dialog/change_email/button_change"),"",onClickChange);
         _tabObjects.push(_loc1_.inputNewEmail);
         _tabObjects.push(_loc1_.inputPassword);
         setFocus();
      }
      
      override public function dispose() : void
      {
         _btnClose.dispose();
         _btnClose = null;
         _btnChange.dispose();
         _btnChange = null;
         super.dispose();
      }
      
      private function onClickClose(param1:InteractionEvent) : void
      {
         close();
      }
      
      private function onClickChange(param1:InteractionEvent) : void
      {
         var _loc2_:SymbolDialogChangeEmailGeneric = _vo as SymbolDialogChangeEmailGeneric;
         if(StringUtil.isEmpty(_loc2_.inputNewEmail.text))
         {
            Environment.panelManager.showDialog(new UiInfoDialog(LocText.current.text("dialog/change_email/new_email_empty_title"),LocText.current.text("dialog/change_email/new_email_empty_text"),LocText.current.text("general/button_ok"),setFocus));
         }
         else if(StringUtil.isEmpty(_loc2_.inputPassword.text))
         {
            Environment.panelManager.showDialog(new UiInfoDialog(LocText.current.text("dialog/change_email/password_empty_title"),LocText.current.text("dialog/change_email/password_empty_text"),LocText.current.text("general/button_ok"),setFocus));
         }
         else
         {
            User.current.changeEmail(_loc2_.inputNewEmail.text,_loc2_.inputPassword.text,this,onChangeEmailSuccess);
         }
      }
      
      private function setFocus() : void
      {
         var _loc1_:SymbolDialogChangeEmailGeneric = _vo as SymbolDialogChangeEmailGeneric;
         if(StringUtil.isEmpty(_loc1_.inputNewEmail.text))
         {
            Dialog.focus = _loc1_.inputNewEmail;
         }
         else if(StringUtil.isEmpty(_loc1_.inputPassword.text))
         {
            Dialog.focus = _loc1_.inputPassword;
         }
      }
      
      private function onChangeEmailSuccess() : void
      {
         Environment.panelManager.showDialog(new UiInfoDialog(LocText.current.text("dialog/change_email/success_title"),LocText.current.text("dialog/change_email/success_text"),LocText.current.text("general/button_ok")));
         close();
      }
      
      public function handleResponseError(param1:ActionRequestResponse) : Boolean
      {
         if(param1.error == "errChangeEmailUserAlreadyExists")
         {
            Environment.panelManager.showDialog(new UiInfoDialog(LocText.current.text("dialog/change_email/email_already_exists_title"),LocText.current.text("dialog/change_email/email_already_exists_text"),LocText.current.text("general/button_ok"),setFocus));
            return true;
         }
         if(param1.error == "errChangeEmailSameEmail")
         {
            Environment.panelManager.showDialog(new UiInfoDialog(LocText.current.text("dialog/change_email/same_email_title"),LocText.current.text("dialog/change_email/same_email_text"),LocText.current.text("general/button_ok"),setFocus));
            return true;
         }
         if(param1.error == "errChangeEmailInvalidEmail")
         {
            Environment.panelManager.showDialog(new UiInfoDialog(LocText.current.text("error/register_invalid_email_title"),LocText.current.text("error/register_invalid_email_text"),LocText.current.text("general/button_ok")));
            return true;
         }
         if(param1.error == "errChangeEmailNotConfirmed")
         {
            Environment.panelManager.showDialog(new UiInfoDialog(LocText.current.text("error/change_email/not_confirmed_title"),LocText.current.text("error/change_email/not_confirmed_text"),LocText.current.text("general/button_ok")));
            return true;
         }
         if(param1.error == "errChangeEmailInvalidPassword")
         {
            Environment.panelManager.showDialog(new UiInfoDialog(LocText.current.text("error/change_email/invalid_password_title"),LocText.current.text("error/change_email/invalid_password_text"),LocText.current.text("general/button_ok")));
            return true;
         }
         return false;
      }
      
      override public function get defaultButton() : Button
      {
         return _btnChange;
      }
      
      override public function onEscape() : void
      {
         close();
      }
   }
}
