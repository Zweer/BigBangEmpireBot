package com.playata.application.ui.dialogs
{
   import com.playata.application.ui.elements.generic.button.UiButton;
   import com.playata.application.ui.elements.generic.button.UiTextButton;
   import com.playata.application.ui.elements.generic.dialog.UiDialog;
   import com.playata.framework.core.util.StringUtil;
   import com.playata.framework.display.ui.controls.Button;
   import com.playata.framework.display.ui.dialogs.Dialog;
   import com.playata.framework.input.InteractionEvent;
   import com.playata.framework.localization.LocText;
   import visuals.ui.dialogs.SymbolDialogFriendInviteAddRecipientGeneric;
   
   public class DialogFriendInviteAddRecipient extends UiDialog
   {
       
      
      private var _btnClose:UiButton = null;
      
      private var _btnAdd:UiTextButton = null;
      
      private var _addRecipientCallback:Function = null;
      
      public function DialogFriendInviteAddRecipient(param1:Function)
      {
         _addRecipientCallback = param1;
         var _loc2_:SymbolDialogFriendInviteAddRecipientGeneric = new SymbolDialogFriendInviteAddRecipientGeneric();
         super(_loc2_);
         _queued = false;
         _loc2_.txtDialogTitle.text = LocText.current.text("dialog/friend_invite_add_recipient/title");
         _loc2_.txtInfo.text = LocText.current.text("dialog/friend_invite_add_recipient/info");
         _loc2_.txtRecipientCaption.text = LocText.current.text("dialog/friend_invite_add_recipient/caption_recipient");
         _btnClose = new UiButton(_loc2_.btnClose,"",onClickClose);
         _btnAdd = new UiTextButton(_loc2_.btnAdd,LocText.current.text("dialog/friend_invite_add_recipient/button_add"),"",onClickAdd);
         _tabObjects.push(_loc2_.inputRecipient);
         Dialog.focus = _loc2_.inputRecipient;
      }
      
      override public function dispose() : void
      {
         _btnClose.dispose();
         _btnClose = null;
         _btnAdd.dispose();
         _btnAdd = null;
         super.dispose();
      }
      
      private function onClickAdd(param1:InteractionEvent) : void
      {
         var _loc2_:SymbolDialogFriendInviteAddRecipientGeneric = _vo as SymbolDialogFriendInviteAddRecipientGeneric;
         if(StringUtil.isEmpty(_loc2_.inputRecipient.text))
         {
            Dialog.focus = _loc2_.inputRecipient;
            return;
         }
         _addRecipientCallback(_loc2_.inputRecipient.text);
         close();
      }
      
      private function onClickClose(param1:InteractionEvent) : void
      {
         close();
      }
      
      override public function onEscape() : void
      {
         close();
      }
      
      override public function get defaultButton() : Button
      {
         return _btnAdd;
      }
   }
}
