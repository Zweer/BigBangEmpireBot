package com.playata.application.ui.dialogs
{
   import com.playata.application.data.mailbox.Mailbox;
   import com.playata.application.ui.elements.generic.button.UiButton;
   import com.playata.application.ui.elements.generic.button.UiTextButton;
   import com.playata.application.ui.elements.generic.dialog.UiDialog;
   import com.playata.application.ui.elements.generic.dialog.UiInfoDialog;
   import com.playata.application.ui.elements.generic.dialog.UiTwoChoiceDialog;
   import com.playata.application.ui.elements.generic.scrollbar.UiScrollBar;
   import com.playata.framework.application.Environment;
   import com.playata.framework.application.request.ActionRequestResponse;
   import com.playata.framework.core.util.StringUtil;
   import com.playata.framework.display.ui.dialogs.Dialog;
   import com.playata.framework.input.InteractionEvent;
   import com.playata.framework.localization.LocText;
   import visuals.ui.dialogs.SymbolDialogMailComposeGeneric;
   
   public class DialogMailCompose extends UiDialog
   {
       
      
      private var _btnClose:UiButton = null;
      
      private var _btnSend:UiTextButton = null;
      
      private var _autoFillRecipient:Boolean = false;
      
      private var _autoFillSubject:Boolean = false;
      
      private var _autoFillMessage:Boolean = false;
      
      private var _scrollBar:UiScrollBar = null;
      
      private var _messageFlag:String = "";
      
      private var _messageFlagValue:String = "";
      
      public function DialogMailCompose(param1:String = null, param2:String = null, param3:String = null, param4:String = "", param5:String = "")
      {
         var _loc6_:SymbolDialogMailComposeGeneric = new SymbolDialogMailComposeGeneric();
         super(_loc6_);
         _autoFillRecipient = param1 != null;
         _autoFillSubject = param2 != null;
         _autoFillMessage = param3 != null;
         _messageFlag = param4;
         _messageFlagValue = param5;
         _queued = false;
         _loc6_.txtDialogTitle.text = LocText.current.text("dialog/mail_compose/title");
         _loc6_.txtMessageCaption.text = LocText.current.text("dialog/mail_compose/message_caption");
         _loc6_.txtReceiverCaption.text = LocText.current.text("dialog/mail_compose/receiver_caption");
         _loc6_.txtSubjectCaption.text = LocText.current.text("dialog/mail_compose/subject_caption");
         _loc6_.inputMessage.text = "";
         _loc6_.inputSubject.text = "";
         _loc6_.inputReceiver.text = "";
         if(param4 == "team_mail")
         {
            _loc6_.bgReceiver.visible = false;
            _loc6_.inputReceiver.readOnly = true;
         }
         _btnClose = new UiButton(_loc6_.btnClose,"",onClickClose);
         _btnSend = new UiTextButton(_loc6_.btnSend,LocText.current.text("dialog/mail_compose/button_send"),"",onClickSend);
         _tabObjects.push(_loc6_.inputReceiver);
         _tabObjects.push(_loc6_.inputSubject);
         _tabObjects.push(_loc6_.inputMessage);
         _scrollBar = new UiScrollBar(_loc6_.scrollKnob,_loc6_.scrollLine,_loc6_.inputMessage);
         _loc6_.inputMessage.verticalScrollBar = _scrollBar;
         if(param1 != null)
         {
            _loc6_.inputReceiver.text = param1;
         }
         if(param2 != null)
         {
            _loc6_.inputSubject.text = param2;
         }
         if(param3 != null)
         {
            _loc6_.inputMessage.text = param3;
         }
         setFocus();
      }
      
      override public function dispose() : void
      {
         _btnClose.dispose();
         _btnClose = null;
         _btnSend.dispose();
         _btnSend = null;
         _scrollBar.dispose();
         _scrollBar = null;
         super.dispose();
      }
      
      private function setFocus() : void
      {
         var _loc1_:SymbolDialogMailComposeGeneric = _vo as SymbolDialogMailComposeGeneric;
         if(StringUtil.isEmpty(_loc1_.inputReceiver.text))
         {
            Dialog.focus = _loc1_.inputReceiver;
         }
         else if(StringUtil.isEmpty(_loc1_.inputSubject.text))
         {
            Dialog.focus = _loc1_.inputSubject;
         }
         else if(StringUtil.isEmpty(_loc1_.inputMessage.text))
         {
            Dialog.focus = _loc1_.inputMessage;
         }
      }
      
      private function onClickClose(param1:InteractionEvent) : void
      {
         var _loc2_:SymbolDialogMailComposeGeneric = _vo as SymbolDialogMailComposeGeneric;
         if(!StringUtil.isEmpty(_loc2_.inputReceiver.text) && _autoFillRecipient == false || !StringUtil.isEmpty(_loc2_.inputSubject.text) && _autoFillSubject == false || !StringUtil.isEmpty(_loc2_.inputMessage.text) && _autoFillMessage == false)
         {
            if(!StringUtil.isEmpty(_loc2_.inputReceiver.text) && _loc2_.inputReceiver.text.indexOf(",") == -1)
            {
               Environment.panelManager.showDialog(new UiTwoChoiceDialog(LocText.current.text("dialog/mail_compose/discard_message_one_recipient_title"),LocText.current.text("dialog/mail_compose/discard_message_one_recipient_text",_loc2_.inputReceiver.text),LocText.current.text("dialog/mail_compose/button_discard"),LocText.current.text("general/button_cancel"),close));
            }
            else
            {
               Environment.panelManager.showDialog(new UiTwoChoiceDialog(LocText.current.text("dialog/mail_compose/discard_message_title"),LocText.current.text("dialog/mail_compose/discard_message_text"),LocText.current.text("dialog/mail_compose/button_discard"),LocText.current.text("general/button_cancel"),close));
            }
         }
         else
         {
            close();
         }
      }
      
      private function onClickSend(param1:InteractionEvent) : void
      {
         var _loc3_:SymbolDialogMailComposeGeneric = _vo as SymbolDialogMailComposeGeneric;
         var _loc2_:String = StringUtil.remove(StringUtil.remove(_loc3_.inputReceiver.text,",")," ");
         if(StringUtil.isEmpty(_loc3_.inputReceiver.text) || _loc2_.length == 0)
         {
            Environment.panelManager.showDialog(new UiInfoDialog(LocText.current.text("dialog/mail_compose/receiver_empty_title"),LocText.current.text("dialog/mail_compose/receiver_empty_text"),LocText.current.text("general/button_ok"),setFocus));
         }
         else if(StringUtil.isEmpty(_loc3_.inputSubject.text))
         {
            Environment.panelManager.showDialog(new UiInfoDialog(LocText.current.text("dialog/mail_compose/subject_empty_title"),LocText.current.text("dialog/mail_compose/subject_empty_text"),LocText.current.text("general/button_ok"),setFocus));
         }
         else if(StringUtil.isEmpty(_loc3_.inputMessage.text))
         {
            Environment.panelManager.showDialog(new UiInfoDialog(LocText.current.text("dialog/mail_compose/message_empty_title"),LocText.current.text("dialog/mail_compose/message_empty_text"),LocText.current.text("general/button_ok"),setFocus));
         }
         else
         {
            Environment.application.sendActionRequest("sendMessage",{
               "subject":_loc3_.inputSubject.text,
               "message":_loc3_.inputMessage.text,
               "to":_loc3_.inputReceiver.text,
               "flag":_messageFlag,
               "flag_value":_messageFlagValue
            },handleRequests);
         }
      }
      
      private function handleRequests(param1:ActionRequestResponse) : void
      {
         var _loc2_:* = null;
         var _loc3_:* = param1.action;
         if("sendMessage" !== _loc3_)
         {
            throw new Error("Unsupported request action \'" + param1.action + "\'!");
         }
         if(param1.error == "")
         {
            Mailbox.addSentMessage(param1.appResponse.message,param1.data.messages_character_info);
            close();
         }
         else if(param1.error == "errCreatePersonalMessageSelfRecipient")
         {
            Environment.panelManager.showDialog(new UiInfoDialog(LocText.current.text("dialog/mail_compose/self_recipient_title"),LocText.current.text("dialog/mail_compose/self_recipient_text"),LocText.current.text("general/button_ok")));
         }
         else if(param1.error == "errCreatePersonalMessageTooManyRecipients")
         {
            Environment.panelManager.showDialog(new UiInfoDialog(LocText.current.text("dialog/mail_compose/too_many_recipients_title"),LocText.current.text("dialog/mail_compose/too_many_recipients_text"),LocText.current.text("general/button_ok")));
         }
         else if(param1.error.indexOf("errSendMessageInvalidRecipient") != -1)
         {
            _loc2_ = param1.error.substr("errSendMessageInvalidRecipient_".length);
            Environment.panelManager.showDialog(new UiInfoDialog(LocText.current.text("dialog/mail_compose/invalid_recipient_title"),LocText.current.text("dialog/mail_compose/invalid_recipient_text",_loc2_),LocText.current.text("general/button_ok")));
         }
         else if(param1.error == "errCreatePersonalMessageSubjectTooLong")
         {
            Environment.panelManager.showDialog(new UiInfoDialog(LocText.current.text("dialog/mail_compose/subject_too_long_title"),LocText.current.text("dialog/mail_compose/subject_too_long_text"),LocText.current.text("general/button_ok")));
         }
         else if(param1.error == "errCreatePersonalMessageInvalidGuild")
         {
            Environment.panelManager.showDialog(new UiInfoDialog(LocText.current.text("dialog/mail_compose/invalid_guild_title"),LocText.current.text("dialog/mail_compose/invalid_guild_text"),LocText.current.text("general/button_ok")));
         }
         else if(param1.error == "errCreatePersonalMessageNoGuildMember")
         {
            Environment.panelManager.showDialog(new UiInfoDialog(LocText.current.text("dialog/mail_compose/no_guild_member_title"),LocText.current.text("dialog/mail_compose/no_guild_member_text"),LocText.current.text("general/button_ok")));
         }
         else if(param1.error == "errSendMessageNoGuildMembers")
         {
            Environment.panelManager.showDialog(new UiInfoDialog(LocText.current.text("dialog/mail_compose/no_guild_members_title"),LocText.current.text("dialog/mail_compose/no_guild_members_text"),LocText.current.text("general/button_ok")));
         }
         else if(param1.error.indexOf("errCreatePersonalMessageInvalidRecipientLevel") != -1)
         {
            _loc2_ = param1.error.substr("errCreatePersonalMessageInvalidRecipientLevel_".length);
            Environment.panelManager.showDialog(new UiInfoDialog(LocText.current.text("dialog/mail_compose/recipient_invalid_level_title"),LocText.current.text("dialog/mail_compose/recipient_invalid_level_text",_loc2_),LocText.current.text("general/button_ok")));
         }
         else
         {
            Environment.reportError(param1.error,param1.request);
         }
      }
      
      override public function onEscape() : void
      {
         onClickClose(null);
      }
   }
}
