package com.playata.application.ui.elements.friend
{
   import com.playata.application.data.user.User;
   import com.playata.application.ui.dialogs.DialogFriendInviteAddRecipient;
   import com.playata.application.ui.elements.generic.button.UiButton;
   import com.playata.application.ui.elements.generic.button.UiTextButton;
   import com.playata.application.ui.elements.generic.dialog.UiInfoDialog;
   import com.playata.application.ui.elements.generic.scrollbar.UiScrollBar;
   import com.playata.framework.application.Environment;
   import com.playata.framework.application.request.ActionRequestResponse;
   import com.playata.framework.core.util.StringUtil;
   import com.playata.framework.input.InteractionEvent;
   import com.playata.framework.localization.LocText;
   import visuals.ui.elements.friend.SymbolFriendInviteMailContentGeneric;
   
   public class UiFriendInviteMailContent
   {
       
      
      private var _content:SymbolFriendInviteMailContentGeneric = null;
      
      private var _btnAddRecipient:UiButton = null;
      
      private var _btnSend:UiTextButton = null;
      
      private var _scrollBar:UiScrollBar = null;
      
      private var _closeCallback:Function = null;
      
      public function UiFriendInviteMailContent(param1:SymbolFriendInviteMailContentGeneric, param2:Function)
      {
         super();
         _content = param1;
         _closeCallback = param2;
         _content.txtInfo.text = LocText.current.text("dialog/friend_invite/mail_info");
         _content.txtReceiverCaption.text = LocText.current.text("dialog/friend_invite/mail_caption_recipients");
         _content.txtMessageCaption.text = LocText.current.text("dialog/friend_invite/mail_caption_message");
         var _loc3_:String = !!User.current.hasWhiteLabelTextOverwrite("ingame_new_friend_template")?"/" + User.current.getWhiteLabelId():"";
         _content.inputMessage.text = LocText.current.text("dialog/friend_invite/mail_message_template" + _loc3_);
         _content.inputReceiver.text = LocText.current.text("dialog/friend_invite/mail_input_recipients_info");
         _content.inputReceiver.onClick.add(handleReceiverClick);
         _content.inputReceiver.alpha = 0.5;
         _scrollBar = new UiScrollBar(_content.scrollKnob,_content.scrollLine,_content.inputMessage);
         _content.inputMessage.verticalScrollBar = _scrollBar;
         _btnAddRecipient = new UiButton(_content.btnAddRecipient,LocText.current.text("dialog/friend_invite/mail_button_add_recipient_tooltip"),onClickAddRecipient);
         _btnSend = new UiTextButton(_content.btnSend,LocText.current.text("dialog/friend_invite/mail_button_send"),"",onClickSend);
         setFocus();
      }
      
      public function dispose() : void
      {
         _scrollBar.dispose();
         _scrollBar = null;
         _btnAddRecipient.dispose();
         _btnAddRecipient = null;
         _btnSend.dispose();
         _btnSend = null;
      }
      
      public function get content() : SymbolFriendInviteMailContentGeneric
      {
         return _content;
      }
      
      private function handleReceiverClick(param1:InteractionEvent) : void
      {
         if(_content.inputReceiver.text == LocText.current.text("dialog/friend_invite/mail_input_recipients_info"))
         {
            _content.inputReceiver.text = "";
            _content.inputReceiver.alpha = 1;
         }
      }
      
      private function onClickAddRecipient(param1:InteractionEvent) : void
      {
         Environment.panelManager.showDialog(new DialogFriendInviteAddRecipient(addRecipient));
      }
      
      private function addRecipient(param1:String) : void
      {
         if(StringUtil.isEmpty(_content.inputReceiver.text) || _content.inputReceiver.text == LocText.current.text("dialog/friend_invite/mail_input_recipients_info"))
         {
            _content.inputReceiver.text = param1;
         }
         else
         {
            _content.inputReceiver.text = _content.inputReceiver.text + (", " + param1);
         }
      }
      
      private function onClickSend(param1:InteractionEvent) : void
      {
         if(StringUtil.isEmpty(_content.inputReceiver.text) || _content.inputReceiver.text == LocText.current.text("dialog/friend_invite/mail_input_recipients_info"))
         {
            Environment.panelManager.showDialog(new UiInfoDialog(LocText.current.text("error/friend_invite_mail/no_recipient/title"),LocText.current.text("error/friend_invite_mail/no_recipient/text"),LocText.current.text("general/button_ok"),setFocus));
         }
         else if(StringUtil.isEmpty(_content.inputMessage.text))
         {
            Environment.panelManager.showDialog(new UiInfoDialog(LocText.current.text("error/friend_invite_mail/no_message/title"),LocText.current.text("error/friend_invite_mail/no_message/text"),LocText.current.text("general/button_ok"),setFocus));
         }
         else
         {
            Environment.application.sendActionRequest("sendFriendInvitationMail",{
               "recipients":_content.inputReceiver.text,
               "message":_content.inputMessage.text
            },handleRequests);
         }
      }
      
      private function setFocus() : void
      {
         if(StringUtil.isEmpty(_content.inputReceiver.text))
         {
            Environment.display.focus = _content.inputReceiver;
         }
         else if(StringUtil.isEmpty(_content.inputMessage.text))
         {
            Environment.display.focus = _content.inputMessage;
         }
      }
      
      private function handleRequests(param1:ActionRequestResponse) : void
      {
         var _loc2_:* = null;
         var _loc3_:* = param1.action;
         if("sendFriendInvitationMail" !== _loc3_)
         {
            throw new Error("Unsupported request action \'" + param1.action + "\'!");
         }
         if(param1.error == "")
         {
            Environment.application.updateData(param1.data);
            Environment.panelManager.showDialog(new UiInfoDialog(LocText.current.text("success/friend_invite_mail/sent/title"),LocText.current.text("success/friend_invite_mail/sent/text"),LocText.current.text("general/button_ok")));
            _closeCallback();
         }
         else
         {
            _loc2_ = null;
            if(param1.error.indexOf("errSendMailInvalidEmail_") != -1)
            {
               _loc2_ = param1.error.substr("errSendMailInvalidEmail_".length);
               Environment.panelManager.showDialog(new UiInfoDialog(LocText.current.text("error/friend_invite_mail/invalid_email/title"),LocText.current.text("error/friend_invite_mail/invalid_email/text",_loc2_),LocText.current.text("general/button_ok")));
            }
            else if(param1.error == "errSendMailExistingSelf")
            {
               Environment.panelManager.showDialog(new UiInfoDialog(LocText.current.text("error/friend_invite_mail/email_existing_self/title"),LocText.current.text("error/friend_invite_mail/email_existing_self/text"),LocText.current.text("general/button_ok")));
            }
            else if(param1.error.indexOf("errSendMailAlreadyExists_") != -1)
            {
               _loc2_ = param1.error.substr("errSendMailAlreadyExists_".length);
               Environment.panelManager.showDialog(new UiInfoDialog(LocText.current.text("error/friend_invite_mail/email_existing/title"),LocText.current.text("error/friend_invite_mail/email_existing/text",_loc2_),LocText.current.text("general/button_ok")));
            }
            else
            {
               Environment.reportError(param1.error,param1.request);
            }
         }
      }
   }
}
