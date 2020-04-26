package com.playata.application.ui.dialogs
{
   import com.playata.application.ui.elements.generic.button.UiButton;
   import com.playata.application.ui.elements.generic.button.UiTextButton;
   import com.playata.application.ui.elements.generic.dialog.UiDialog;
   import com.playata.application.ui.elements.generic.dialog.UiInfoDialog;
   import com.playata.framework.application.Environment;
   import com.playata.framework.application.request.ActionRequestResponse;
   import com.playata.framework.core.util.StringUtil;
   import com.playata.framework.display.ui.controls.Button;
   import com.playata.framework.display.ui.dialogs.Dialog;
   import com.playata.framework.input.InteractionEvent;
   import com.playata.framework.localization.LocText;
   import visuals.ui.dialogs.SymbolDialogPrivateConversationRenameGeneric;
   
   public class DialogPrivateConversationRename extends UiDialog
   {
       
      
      private var _privateConversationId:int = 0;
      
      private var _btnClose:UiButton = null;
      
      private var _btnRename:UiTextButton = null;
      
      public function DialogPrivateConversationRename(param1:int)
      {
         _privateConversationId = param1;
         var _loc2_:SymbolDialogPrivateConversationRenameGeneric = new SymbolDialogPrivateConversationRenameGeneric();
         super(_loc2_);
         _queued = false;
         _loc2_.txtDialogTitle.text = LocText.current.text("dialog/rename_private_conversation/title");
         _loc2_.txtTitleCaption.text = LocText.current.text("dialog/create_private_conversation/title_caption");
         _btnClose = new UiButton(_loc2_.btnClose,"",onClickClose);
         _btnRename = new UiTextButton(_loc2_.btnRename,LocText.current.text("dialog/guild_rename/button_rename"),"",onClickRename);
         _tabObjects.push(_loc2_.inputTitle);
         setFocus();
      }
      
      override public function dispose() : void
      {
         _btnClose.dispose();
         _btnClose = null;
         _btnRename.dispose();
         _btnRename = null;
         super.dispose();
      }
      
      private function setFocus() : void
      {
         var _loc1_:SymbolDialogPrivateConversationRenameGeneric = _vo as SymbolDialogPrivateConversationRenameGeneric;
         if(StringUtil.isEmpty(_loc1_.inputTitle.text))
         {
            Dialog.focus = _loc1_.inputTitle;
         }
      }
      
      private function onClickClose(param1:InteractionEvent) : void
      {
         close();
      }
      
      private function onClickRename(param1:InteractionEvent) : void
      {
         var _loc2_:SymbolDialogPrivateConversationRenameGeneric = _vo as SymbolDialogPrivateConversationRenameGeneric;
         if(StringUtil.isEmpty(_loc2_.inputTitle.text))
         {
            Environment.panelManager.showDialog(new UiInfoDialog(LocText.current.text("error/private_conversation/title/title_empty_title"),LocText.current.text("error/private_conversation/title/title_empty_text"),LocText.current.text("general/button_ok"),setFocus));
         }
         else
         {
            renamePrivateConversation();
         }
      }
      
      private function renamePrivateConversation() : void
      {
         var _loc1_:SymbolDialogPrivateConversationRenameGeneric = _vo as SymbolDialogPrivateConversationRenameGeneric;
         Environment.application.sendActionRequest("renamePrivateConversation",{
            "private_conversation_id":_privateConversationId,
            "title":_loc1_.inputTitle.text
         },handleRequests);
      }
      
      private function closeDialog() : void
      {
         close();
      }
      
      private function handleRequests(param1:ActionRequestResponse) : void
      {
         var _loc2_:* = param1.action;
         if("renamePrivateConversation" !== _loc2_)
         {
            throw new Error("Unsupported request action \'" + param1.action + "\'!");
         }
         _btnRename.buttonEnabled = true;
         if(param1.error == "")
         {
            Environment.application.updateData(param1.data);
            close();
         }
         else if(param1.error == "errRenameInvalidTitle")
         {
            Environment.panelManager.showDialog(new UiInfoDialog(LocText.current.text("error/private_conversation/title/title_empty_title"),LocText.current.text("error/private_conversation/title/title_empty_text"),LocText.current.text("general/button_ok"),setFocus));
         }
         else if(param1.error == "errRenamePrivateConversationNoPermission")
         {
            Environment.panelManager.showDialog(new UiInfoDialog(LocText.current.text("error/private_conversation/rename_no_permission/title"),LocText.current.text("error/private_conversation/rename_no_permission/text"),LocText.current.text("general/button_ok"),setFocus));
         }
         else
         {
            Environment.reportError(param1.error,param1.request);
         }
      }
      
      override public function get defaultButton() : Button
      {
         return _btnRename;
      }
      
      override public function onEscape() : void
      {
         close();
      }
   }
}
