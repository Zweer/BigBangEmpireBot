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
   import visuals.ui.dialogs.SymbolDialogUnbindFromNetworkGeneric;
   
   public class DialogUnbindFromNetwork extends UiDialog implements IActionRequestResponseErrorHandler
   {
       
      
      private var _btnClose:UiButton = null;
      
      private var _btnUnbind:UiTextButton = null;
      
      public function DialogUnbindFromNetwork()
      {
         var _loc1_:SymbolDialogUnbindFromNetworkGeneric = new SymbolDialogUnbindFromNetworkGeneric();
         super(_loc1_);
         _queued = false;
         _loc1_.txtDialogTitle.text = LocText.current.text("dialog/unbind_from_network/title");
         _loc1_.txtEmailCaption.text = LocText.current.text("dialog/unbind_from_network/email_caption");
         _loc1_.txtPasswordCaption.text = LocText.current.text("dialog/unbind_from_network/password_caption");
         _loc1_.txtInfo.text = LocText.current.text("dialog/unbind_from_network/info",Environment.platform.name);
         _btnClose = new UiButton(_loc1_.btnClose,"",onClickClose);
         _btnUnbind = new UiTextButton(_loc1_.btnUnbind,LocText.current.text("dialog/unbind_from_network/button_unbind"),"",onClickUnbind);
         _tabObjects.push(_loc1_.inputEmail);
         _tabObjects.push(_loc1_.inputPassword);
         setFocus();
      }
      
      override public function dispose() : void
      {
         _btnClose.dispose();
         _btnClose = null;
         _btnUnbind.dispose();
         _btnUnbind = null;
         super.dispose();
      }
      
      private function onClickClose(param1:InteractionEvent) : void
      {
         close();
      }
      
      private function onClickUnbind(param1:InteractionEvent) : void
      {
         var _loc2_:SymbolDialogUnbindFromNetworkGeneric = _vo as SymbolDialogUnbindFromNetworkGeneric;
         if(StringUtil.isEmpty(_loc2_.inputEmail.text))
         {
            Environment.panelManager.showDialog(new UiInfoDialog(LocText.current.text("dialog/unbind_from_network/email_empty_title"),LocText.current.text("dialog/unbind_from_network/email_empty_text"),LocText.current.text("general/button_ok"),setFocus));
         }
         else if(StringUtil.isEmpty(_loc2_.inputPassword.text))
         {
            Environment.panelManager.showDialog(new UiInfoDialog(LocText.current.text("dialog/unbind_from_network/password_empty_title"),LocText.current.text("dialog/unbind_from_network/password_empty_text"),LocText.current.text("general/button_ok"),setFocus));
         }
         else
         {
            User.current.unbindSSO(_loc2_.inputEmail.text,_loc2_.inputPassword.text,this,onUnbindSSOSuccess);
         }
      }
      
      private function setFocus() : void
      {
         var _loc1_:SymbolDialogUnbindFromNetworkGeneric = _vo as SymbolDialogUnbindFromNetworkGeneric;
         if(StringUtil.isEmpty(_loc1_.inputEmail.text))
         {
            Dialog.focus = _loc1_.inputEmail;
         }
         else if(StringUtil.isEmpty(_loc1_.inputPassword.text))
         {
            Dialog.focus = _loc1_.inputPassword;
         }
      }
      
      private function onUnbindSSOSuccess() : void
      {
         Environment.panelManager.showDialog(new UiInfoDialog(LocText.current.text("dialog/unbind_from_network/success_title"),LocText.current.text("dialog/unbind_from_network/success_text"),LocText.current.text("general/button_ok")));
         close();
      }
      
      public function handleResponseError(param1:ActionRequestResponse) : Boolean
      {
         if(param1.error == "errSendUnbindFromNetworkUserAlreadyExists")
         {
            Environment.panelManager.showDialog(new UiInfoDialog(LocText.current.text("dialog/change_email/email_already_exists_title"),LocText.current.text("dialog/change_email/email_already_exists_text"),LocText.current.text("general/button_ok"),setFocus));
            return true;
         }
         if(param1.error == "errSendUnbindFromNetworkInvalidEmail")
         {
            Environment.panelManager.showDialog(new UiInfoDialog(LocText.current.text("error/register_invalid_email_title"),LocText.current.text("error/register_invalid_email_text"),LocText.current.text("general/button_ok")));
            return true;
         }
         return false;
      }
      
      override public function get defaultButton() : Button
      {
         return _btnUnbind;
      }
      
      override public function onEscape() : void
      {
         close();
      }
   }
}
