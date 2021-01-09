package com.playata.application.ui.dialogs
{
   import com.playata.application.ui.elements.generic.button.UiButton;
   import com.playata.application.ui.elements.generic.button.UiTextButton;
   import com.playata.application.ui.elements.generic.dialog.UiDialog;
   import com.playata.application.ui.elements.generic.dialog.UiInfoDialog;
   import com.playata.application.ui.elements.generic.scrollbar.UiScrollBar;
   import com.playata.framework.application.Environment;
   import com.playata.framework.application.request.ActionRequestResponse;
   import com.playata.framework.core.util.StringUtil;
   import com.playata.framework.display.ui.dialogs.Dialog;
   import com.playata.framework.input.InteractionEvent;
   import com.playata.framework.localization.LocText;
   import visuals.ui.dialogs.SymbolDialogPrivateConversationInvitationGeneric;
   
   public class DialogPrivateConversationInvitation extends UiDialog
   {
       
      
      private var _btnClose:UiButton = null;
      
      private var _btnInvite:UiTextButton = null;
      
      private var _scrollBar:UiScrollBar = null;
      
      private var _privateConversationId:int = 0;
      
      public function DialogPrivateConversationInvitation(param1:int, param2:String = null)
      {
         _privateConversationId = param1;
         var _loc3_:SymbolDialogPrivateConversationInvitationGeneric = new SymbolDialogPrivateConversationInvitationGeneric();
         super(_loc3_);
         _queued = false;
         _loc3_.txtDialogTitle.text = LocText.current.text("dialog/private_conversation_invitation/title");
         _loc3_.txtInfo.text = LocText.current.text("dialog/private_conversation_invitation/info_text");
         _loc3_.txtNameCaption.text = LocText.current.text("dialog/private_conversation_invitation/name_caption");
         _loc3_.txtMessageCaption.text = LocText.current.text("dialog/private_conversation_invitation/caption_message");
         _loc3_.inputMessage.text = "";
         _scrollBar = new UiScrollBar(_loc3_.scrollKnob,_loc3_.scrollLine,_loc3_.inputMessage);
         _loc3_.inputMessage.verticalScrollBar = _scrollBar;
         _btnClose = new UiButton(_loc3_.btnClose,"",onClickClose);
         _btnInvite = new UiTextButton(_loc3_.btnInvite,LocText.current.text("dialog/private_conversation_invitation/button_invite"),"",onClickInvite);
         _tabObjects.push(_loc3_.inputName);
         _tabObjects.push(_loc3_.inputMessage);
         if(param2 != null)
         {
            _loc3_.inputName.text = param2;
         }
         if(Environment.info.defaultLocale == "es_ES" || Environment.info.defaultLocale == "es_MX")
         {
            _loc3_.txtNameCaption.x = _loc3_.txtNameCaption.x - 15;
            _loc3_.txtNameCaption.width = _loc3_.txtNameCaption.width + 15;
         }
         setFocus();
      }
      
      override public function dispose() : void
      {
         _btnClose.dispose();
         _btnClose = null;
         _btnInvite.dispose();
         _btnInvite = null;
         super.dispose();
      }
      
      private function setFocus() : void
      {
         var _loc1_:SymbolDialogPrivateConversationInvitationGeneric = _vo as SymbolDialogPrivateConversationInvitationGeneric;
         if(StringUtil.isEmpty(_loc1_.inputName.text))
         {
            Dialog.focus = _loc1_.inputName;
         }
      }
      
      private function onClickClose(param1:InteractionEvent) : void
      {
         close();
      }
      
      private function onClickInvite(param1:InteractionEvent) : void
      {
         var _loc2_:SymbolDialogPrivateConversationInvitationGeneric = _vo as SymbolDialogPrivateConversationInvitationGeneric;
         if(StringUtil.isEmpty(_loc2_.inputName.text))
         {
            Environment.panelManager.showDialog(new UiInfoDialog(LocText.current.text("general/info"),LocText.current.text("error/dialog/private_conversation_invitation/empty_name"),LocText.current.text("general/button_ok"),setFocus));
         }
         else
         {
            Environment.application.sendActionRequest("inviteCharacterToPrivateConversation",{
               "private_conversation_id":_privateConversationId,
               "name":_loc2_.inputName.text,
               "message":_loc2_.inputMessage.text
            },handleRequests);
         }
      }
      
      private function handleRequests(param1:ActionRequestResponse) : void
      {
         var _loc2_:* = param1.action;
         if("inviteCharacterToPrivateConversation" !== _loc2_)
         {
            throw new Error("Unsupported request action \'" + param1.action + "\'!");
         }
         if(param1.error == "")
         {
            Environment.application.updateData(param1.data);
            close();
         }
         else if(param1.error == "errInviteMemberUnknownCharacter")
         {
            Environment.panelManager.showDialog(new UiInfoDialog(LocText.current.text("dialog/private_conversation_invitation/unknown_character_title"),LocText.current.text("dialog/private_conversation_invitation/unknown_character_text"),LocText.current.text("general/button_ok")));
         }
         else if(param1.error == "errInviteMemberNotAllowed")
         {
            Environment.panelManager.showDialog(new UiInfoDialog(LocText.current.text("dialog/private_conversation_invitation/invalid_character_level_title"),LocText.current.text("dialog/private_conversation_invitation/invalid_character_level_text"),LocText.current.text("general/button_ok")));
         }
         else if(param1.error == "errInviteMemberAlreadyMember")
         {
            Environment.panelManager.showDialog(new UiInfoDialog(LocText.current.text("dialog/private_conversation_invitation/already_member_title"),LocText.current.text("dialog/private_conversation_invitation/already_member_text"),LocText.current.text("general/button_ok")));
         }
         else if(param1.error == "errInviteCharacterToPrivateConversationNoPermission")
         {
            Environment.panelManager.showDialog(new UiInfoDialog(LocText.current.text("dialog/private_conversation_invitation/invalid_character_level_title"),LocText.current.text("dialog/private_conversation_invitation/invalid_character_level_text"),LocText.current.text("general/button_ok")));
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
