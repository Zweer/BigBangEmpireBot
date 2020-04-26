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
   import visuals.ui.dialogs.SymbolDialogGuildInvitationGeneric;
   
   public class DialogGuildInvitation extends UiDialog
   {
       
      
      private var _btnClose:UiButton = null;
      
      private var _btnInvite:UiTextButton = null;
      
      private var _scrollBar:UiScrollBar = null;
      
      public function DialogGuildInvitation(param1:String = null)
      {
         var _loc2_:SymbolDialogGuildInvitationGeneric = new SymbolDialogGuildInvitationGeneric();
         super(_loc2_);
         _queued = false;
         _loc2_.txtDialogTitle.text = LocText.current.text("dialog/guild_invitation/title");
         _loc2_.txtInfo.text = LocText.current.text("dialog/guild_invitation/info_text");
         _loc2_.txtNameCaption.text = LocText.current.text("dialog/guild_invitation/name_caption");
         _loc2_.txtMessageCaption.text = LocText.current.text("dialog/guild_invitation/caption_message");
         _loc2_.inputMessage.text = "";
         _scrollBar = new UiScrollBar(_loc2_.scrollKnob,_loc2_.scrollLine,_loc2_.inputMessage);
         _loc2_.inputMessage.verticalScrollBar = _scrollBar;
         _btnClose = new UiButton(_loc2_.btnClose,"",onClickClose);
         _btnInvite = new UiTextButton(_loc2_.btnInvite,LocText.current.text("dialog/guild_invitation/button_invite"),"",onClickInvite);
         _tabObjects.push(_loc2_.inputName);
         _tabObjects.push(_loc2_.inputMessage);
         if(param1 != null)
         {
            _loc2_.inputName.text = param1;
         }
         if(Environment.info.defaultLocale == "es_ES" || Environment.info.defaultLocale == "es_MX")
         {
            _loc2_.txtNameCaption.x = _loc2_.txtNameCaption.x - 15;
            _loc2_.txtNameCaption.width = _loc2_.txtNameCaption.width + 15;
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
         var _loc1_:SymbolDialogGuildInvitationGeneric = _vo as SymbolDialogGuildInvitationGeneric;
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
         var _loc2_:SymbolDialogGuildInvitationGeneric = _vo as SymbolDialogGuildInvitationGeneric;
         if(StringUtil.isEmpty(_loc2_.inputName.text))
         {
            Environment.panelManager.showDialog(new UiInfoDialog(LocText.current.text("general/info"),LocText.current.text("error/dialog/guild_invitation/empty_name"),LocText.current.text("general/button_ok"),setFocus));
         }
         else
         {
            Environment.application.sendActionRequest("inviteToGuild",{
               "name":_loc2_.inputName.text,
               "message":_loc2_.inputMessage.text
            },handleRequests);
         }
      }
      
      private function handleRequests(param1:ActionRequestResponse) : void
      {
         var _loc3_:* = null;
         var _loc2_:* = null;
         var _loc4_:* = param1.action;
         if("inviteToGuild" !== _loc4_)
         {
            throw new Error("Unsupported request action \'" + param1.action + "\'!");
         }
         if(param1.error == "")
         {
            Environment.application.updateData(param1.data);
            close();
            if(!_vo)
            {
               return;
            }
            _loc3_ = _vo as SymbolDialogGuildInvitationGeneric;
            Environment.panelManager.showDialog(new UiInfoDialog(LocText.current.text("dialog/guild_invitation/success_title"),LocText.current.text("dialog/guild_invitation/success_text",_loc3_.inputName.text),LocText.current.text("general/button_ok")));
         }
         else if(param1.error.indexOf("errInviteToGuildInvalidCharacter") != -1)
         {
            _loc2_ = param1.error.substr("errInviteToGuildInvalidCharacter_".length);
            Environment.panelManager.showDialog(new UiInfoDialog(LocText.current.text("dialog/guild_invitation/invalid_name_title"),LocText.current.text("dialog/guild_invitation/invalid_name_text",_loc2_),LocText.current.text("general/button_ok")));
         }
         else if(param1.error == "errCreateSystemMessageInvalidRecipientLevel")
         {
            Environment.panelManager.showDialog(new UiInfoDialog(LocText.current.text("dialog/guild_invitation/invalid_character_level_title"),LocText.current.text("dialog/guild_invitation/invalid_character_level_text"),LocText.current.text("general/button_ok")));
         }
         else if(param1.error == "errInviteCharacterNoSelfInvite")
         {
            Environment.panelManager.showDialog(new UiInfoDialog(LocText.current.text("dialog/guild_invitation/self_invite_title"),LocText.current.text("dialog/guild_invitation/self_invite_text"),LocText.current.text("general/button_ok")));
         }
         else if(param1.error == "errInviteCharacterAlreadyMember")
         {
            Environment.panelManager.showDialog(new UiInfoDialog(LocText.current.text("dialog/guild_invitation/already_member_title"),LocText.current.text("dialog/guild_invitation/already_member_text"),LocText.current.text("general/button_ok")));
         }
         else if(param1.error == "errInviteCharacterNoPermission")
         {
            Environment.panelManager.showDialog(new UiInfoDialog(LocText.current.text("dialog/guild_invitation/no_permission_title"),LocText.current.text("dialog/guild_invitation/no_permission_text"),LocText.current.text("general/button_ok")));
         }
         else if(param1.error == "errCharacterNoGuild")
         {
            Environment.panelManager.showDialog(new UiInfoDialog(LocText.current.text("dialog/guild_invitation/no_guild_title"),LocText.current.text("dialog/guild_invitation/no_guild_text"),LocText.current.text("general/button_ok")));
         }
         else if(param1.error == "errCreatePrivateSystemMessageInvalidRecipientLevel")
         {
            Environment.panelManager.showDialog(new UiInfoDialog(LocText.current.text("dialog/guild_invitation/invalid_character_level_title"),LocText.current.text("dialog/guild_invitation/invalid_character_level_text"),LocText.current.text("general/button_ok")));
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
