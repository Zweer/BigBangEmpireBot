package com.playata.application.ui.dialogs
{
   import com.playata.application.Application;
   import com.playata.application.data.user.User;
   import com.playata.application.ui.elements.generic.button.UiButton;
   import com.playata.application.ui.elements.generic.button.UiTextButton;
   import com.playata.application.ui.elements.generic.checkbox.UiCheckBox;
   import com.playata.application.ui.elements.generic.dialog.UiDialog;
   import com.playata.application.ui.elements.generic.dialog.UiInfoDialog;
   import com.playata.application.ui.elements.generic.dialog.UiTwoChoiceDialog;
   import com.playata.framework.application.Environment;
   import com.playata.framework.application.request.ActionRequestResponse;
   import com.playata.framework.application.request.IActionRequestResponseErrorHandler;
   import com.playata.framework.core.util.StringUtil;
   import com.playata.framework.display.ui.controls.Button;
   import com.playata.framework.display.ui.dialogs.Dialog;
   import com.playata.framework.input.InteractionEvent;
   import com.playata.framework.localization.LocText;
   import com.playata.framework.network.NetworkCore;
   import visuals.ui.dialogs.SymbolDialogDeleteAccountGeneric;
   
   public class DialogDeleteAccount extends UiDialog implements IActionRequestResponseErrorHandler
   {
       
      
      private var _btnClose:UiButton = null;
      
      private var _btnDelete:UiTextButton = null;
      
      private var _ckbReactivationCode:UiCheckBox = null;
      
      public function DialogDeleteAccount()
      {
         var _loc1_:SymbolDialogDeleteAccountGeneric = new SymbolDialogDeleteAccountGeneric();
         super(_loc1_);
         _queued = false;
         _loc1_.txtDialogTitle.text = LocText.current.text("dialog/delete_account/title");
         _loc1_.txtInfo.text = LocText.current.text("dialog/delete_account/info_caption");
         _loc1_.txtPasswordCaption.text = LocText.current.text("dialog/delete_account/password_caption");
         _loc1_.txtReactivationInfo.text = LocText.current.text("dialog/delete_account/reactivation_info");
         _loc1_.txtReactivationInfo.autoFontSize = true;
         _ckbReactivationCode = new UiCheckBox(_loc1_.ckbReactivationCode,false);
         _btnClose = new UiButton(_loc1_.btnClose,"",onClickClose);
         _btnDelete = new UiTextButton(_loc1_.btnDelete,LocText.current.text("dialog/delete_account/button_delete"),"",onClickDelete);
         if(!User.current.hasStandaloneLogin)
         {
            _loc1_.txtInfo.visible = false;
            _loc1_.txtPasswordCaption.visible = false;
            _loc1_.inputPassword.visible = false;
            _loc1_.textfieldBackground.visible = false;
         }
         else
         {
            _tabObjects.push(_loc1_.inputPassword);
            setFocus();
         }
      }
      
      override public function dispose() : void
      {
         _btnClose.dispose();
         _btnClose = null;
         _btnDelete.dispose();
         _btnDelete = null;
         super.dispose();
      }
      
      private function onClickClose(param1:InteractionEvent) : void
      {
         close();
      }
      
      private function onClickDelete(param1:InteractionEvent) : void
      {
         interactionEvent = param1;
         var vo:SymbolDialogDeleteAccountGeneric = _vo as SymbolDialogDeleteAccountGeneric;
         if(StringUtil.isEmpty(vo.inputPassword.text) && !Environment.platform.isSSO)
         {
            Environment.panelManager.showDialog(new UiInfoDialog(LocText.current.text("dialog/delete_account/password_empty_title"),LocText.current.text("dialog/delete_account/password_empty_text"),LocText.current.text("general/button_ok"),setFocus));
         }
         else
         {
            var that:DialogDeleteAccount = this;
            var deleteCallback:Function = function():void
            {
               var _loc1_:String = vo.inputPassword.text;
               if(Environment.platform.isSSO)
               {
                  _loc1_ = "-";
               }
               User.current.deleteUser(_loc1_,that._ckbReactivationCode.checked,that,onDeleteUserSuccess);
            };
            Environment.panelManager.showDialog(new UiTwoChoiceDialog(LocText.current.text("dialog/delete_account/confirm_title"),LocText.current.text("dialog/delete_account/confirm_text"),LocText.current.text("dialog/delete_account/button_delete"),LocText.current.text("dialog/delete_account/button_cancel"),deleteCallback,null));
         }
      }
      
      private function setFocus() : void
      {
         var _loc1_:SymbolDialogDeleteAccountGeneric = _vo as SymbolDialogDeleteAccountGeneric;
         if(StringUtil.isEmpty(_loc1_.inputPassword.text))
         {
            Dialog.focus = _loc1_.inputPassword;
         }
      }
      
      private function onDeleteUserSuccess() : void
      {
         NetworkCore.current.serverConnection.disconnect();
         NetworkCore.current.serverConnection.socketTransportLayer.enabled = false;
         Application.userController.logoutUser();
         close();
      }
      
      public function handleResponseError(param1:ActionRequestResponse) : Boolean
      {
         if(param1.error == "errDeleteUserInvalidPassword")
         {
            Environment.panelManager.showDialog(new UiInfoDialog(LocText.current.text("error/delete_account/invalid_password_title"),LocText.current.text("error/delete_account/invalid_password_text"),LocText.current.text("general/button_ok")));
            return true;
         }
         if(param1.error == "errDeleteUserGuildLeader")
         {
            Environment.panelManager.showDialog(new UiInfoDialog(LocText.current.text("error/delete_account/guild_leader_title"),LocText.current.text("error/delete_account/guild_leader_text"),LocText.current.text("general/button_ok")));
            return true;
         }
         return false;
      }
      
      override public function get defaultButton() : Button
      {
         return _btnDelete;
      }
      
      override public function onEscape() : void
      {
         close();
      }
   }
}
