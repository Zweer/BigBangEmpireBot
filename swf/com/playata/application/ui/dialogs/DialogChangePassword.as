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
   import com.playata.framework.display.ui.controls.Button;
   import com.playata.framework.display.ui.dialogs.Dialog;
   import com.playata.framework.input.InteractionEvent;
   import com.playata.framework.localization.LocText;
   import visuals.ui.dialogs.SymbolDialogChangePasswordGeneric;
   
   public class DialogChangePassword extends UiDialog implements IActionRequestResponseErrorHandler
   {
       
      
      private var _btnClose:UiButton = null;
      
      private var _btnChange:UiTextButton = null;
      
      public function DialogChangePassword()
      {
         var _loc1_:SymbolDialogChangePasswordGeneric = new SymbolDialogChangePasswordGeneric();
         super(_loc1_);
         _queued = false;
         _loc1_.txtDialogTitle.text = LocText.current.text("dialog/change_password/title");
         _loc1_.txtOldPasswordCaption.text = LocText.current.text("dialog/change_password/old_password_caption");
         _loc1_.txtNewPasswordCaption.text = LocText.current.text("dialog/change_password/new_password_caption");
         _loc1_.txtNewPasswordRepeatCaption.text = LocText.current.text("dialog/change_password/new_password_repeat_caption");
         _btnClose = new UiButton(_loc1_.btnClose,"",onClickClose);
         _btnChange = new UiTextButton(_loc1_.btnChange,LocText.current.text("dialog/change_password/button_change"),"",onClickChange);
         _tabObjects.push(_loc1_.inputOldPassword);
         _tabObjects.push(_loc1_.inputNewPassword);
         _tabObjects.push(_loc1_.inputNewPasswordRepeat);
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
         var _loc2_:SymbolDialogChangePasswordGeneric = _vo as SymbolDialogChangePasswordGeneric;
         if(StringUtil.isEmpty(_loc2_.inputOldPassword.text))
         {
            Environment.panelManager.showDialog(new UiInfoDialog(LocText.current.text("dialog/change_password/old_password_empty_title"),LocText.current.text("dialog/change_password/old_password_empty_text"),LocText.current.text("general/button_ok"),setFocus));
         }
         else if(StringUtil.isEmpty(_loc2_.inputNewPassword.text))
         {
            Environment.panelManager.showDialog(new UiInfoDialog(LocText.current.text("dialog/change_password/new_password_empty_title"),LocText.current.text("dialog/change_password/new_password_empty_text"),LocText.current.text("general/button_ok"),setFocus));
         }
         else if(StringUtil.isEmpty(_loc2_.inputNewPasswordRepeat.text))
         {
            Environment.panelManager.showDialog(new UiInfoDialog(LocText.current.text("dialog/change_password/new_password_repeat_empty_title"),LocText.current.text("dialog/change_password/new_password_repeat_empty_text"),LocText.current.text("general/button_ok"),setFocus));
         }
         else if(_loc2_.inputNewPassword.text != _loc2_.inputNewPasswordRepeat.text)
         {
            Environment.panelManager.showDialog(new UiInfoDialog(LocText.current.text("dialog/change_password/passwords_nonmatching_title"),LocText.current.text("dialog/change_password/passwords_nonmatching_text"),LocText.current.text("general/button_ok"),setFocus));
         }
         else
         {
            User.current.changePassword(_loc2_.inputOldPassword.text,_loc2_.inputNewPassword.text,this,onChangePasswordSuccess);
         }
      }
      
      private function setFocus() : void
      {
         if(!_vo)
         {
            return;
         }
         var _loc1_:SymbolDialogChangePasswordGeneric = _vo as SymbolDialogChangePasswordGeneric;
         if(StringUtil.isEmpty(_loc1_.inputOldPassword.text))
         {
            Dialog.focus = _loc1_.inputOldPassword;
         }
         else if(StringUtil.isEmpty(_loc1_.inputNewPassword.text))
         {
            Dialog.focus = _loc1_.inputNewPassword;
         }
         else if(StringUtil.isEmpty(_loc1_.inputNewPasswordRepeat.text))
         {
            Dialog.focus = _loc1_.inputNewPasswordRepeat;
         }
         else if(_loc1_.inputNewPassword.text != _loc1_.inputNewPasswordRepeat.text)
         {
            Dialog.focus = _loc1_.inputNewPasswordRepeat;
         }
      }
      
      private function onChangePasswordSuccess() : void
      {
         Environment.panelManager.showDialog(new UiInfoDialog(LocText.current.text("dialog/change_password/success_title"),LocText.current.text("dialog/change_password/success_text"),LocText.current.text("general/button_ok")));
         close();
      }
      
      public function handleResponseError(param1:ActionRequestResponse) : Boolean
      {
         if(param1.error == "errNewPasswordInvalidOldPassword")
         {
            Environment.panelManager.showDialog(new UiInfoDialog(LocText.current.text("dialog/change_password/old_password_invalid_title"),LocText.current.text("dialog/change_password/old_password_invalid_text"),LocText.current.text("general/button_ok"),setFocus));
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
