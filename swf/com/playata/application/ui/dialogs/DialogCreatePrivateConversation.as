package com.playata.application.ui.dialogs
{
   import com.playata.application.data.stream.PrivateConversation;
   import com.playata.application.data.user.User;
   import com.playata.application.ui.ViewManager;
   import com.playata.application.ui.elements.generic.button.UiButton;
   import com.playata.application.ui.elements.generic.button.UiTextButton;
   import com.playata.application.ui.elements.generic.dialog.UiDialog;
   import com.playata.application.ui.elements.generic.dialog.UiInfoDialog;
   import com.playata.application.ui.elements.generic.dialog.UiTwoChoiceDialog;
   import com.playata.application.ui.elements.generic.scrollbar.UiScrollBar;
   import com.playata.framework.application.Environment;
   import com.playata.framework.application.request.ActionRequestResponse;
   import com.playata.framework.core.Runtime;
   import com.playata.framework.core.util.StringUtil;
   import com.playata.framework.display.ui.controls.ITextInput;
   import com.playata.framework.display.ui.dialogs.Dialog;
   import com.playata.framework.input.InteractionEvent;
   import com.playata.framework.localization.LocText;
   import visuals.ui.dialogs.SymbolDialogCreatePrivateConversationGeneric;
   
   public class DialogCreatePrivateConversation extends UiDialog
   {
       
      
      private var _btnClose:UiButton = null;
      
      private var _btnSend:UiTextButton = null;
      
      private var _autoFillRecipient:Boolean = false;
      
      private var _autoFillSubject:Boolean = false;
      
      private var _autoFillMessage:Boolean = false;
      
      private var _scrollBar:UiScrollBar = null;
      
      private var _guildMassMail:Boolean = false;
      
      public function DialogCreatePrivateConversation(param1:String = null, param2:String = null, param3:String = null, param4:Boolean = false)
      {
         var _loc5_:SymbolDialogCreatePrivateConversationGeneric = new SymbolDialogCreatePrivateConversationGeneric();
         super(_loc5_);
         _autoFillRecipient = param1 != null;
         _autoFillSubject = param2 != null;
         _autoFillMessage = param3 != null;
         _guildMassMail = param4;
         _queued = false;
         _loc5_.txtDialogTitle.text = LocText.current.text("dialog/create_private_conversation/title");
         _loc5_.txtMessageCaption.text = LocText.current.text("dialog/mail_compose/message_caption");
         _loc5_.txtReceiverCaption.text = LocText.current.text("dialog/mail_compose/receiver_caption");
         _loc5_.txtSubjectCaption.text = LocText.current.text("dialog/create_private_conversation/title_caption");
         _loc5_.inputMessage.text = "";
         _loc5_.inputSubject.text = "";
         _loc5_.inputReceiver.text = "";
         if(isGuildMassMail)
         {
            _loc5_.bgReceiver.visible = false;
            _loc5_.inputReceiver.readOnly = true;
            _loc5_.txtDialogTitle.text = LocText.current.text("dialog/create_guild_mass_mail/title");
         }
         else
         {
            _loc5_.inputReceiver.onChange.add(onReceiverChanged);
         }
         _btnClose = new UiButton(_loc5_.btnClose,"",onClickClose);
         _btnSend = new UiTextButton(_loc5_.btnSend,LocText.current.text("dialog/mail_compose/button_send"),"",onClickSend);
         _tabObjects.push(_loc5_.inputReceiver);
         _tabObjects.push(_loc5_.inputSubject);
         _tabObjects.push(_loc5_.inputMessage);
         _scrollBar = new UiScrollBar(_loc5_.scrollKnob,_loc5_.scrollLine,_loc5_.inputMessage);
         _loc5_.inputMessage.verticalScrollBar = _scrollBar;
         showSingelConversation();
         if(param1 != null)
         {
            _loc5_.inputReceiver.text = param1;
            if(isGroupConversation)
            {
               showGroupConversation();
            }
         }
         if(param2 != null)
         {
            _loc5_.inputSubject.text = param2;
         }
         if(param3 != null)
         {
            _loc5_.inputMessage.text = param3;
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
      
      private function onReceiverChanged(param1:ITextInput) : void
      {
         if(isGroupConversation)
         {
            showGroupConversation();
         }
         else
         {
            showSingelConversation();
         }
      }
      
      private function showGroupConversation() : void
      {
         var _loc1_:SymbolDialogCreatePrivateConversationGeneric = _vo as SymbolDialogCreatePrivateConversationGeneric;
         if(_loc1_.inputSubject.visible)
         {
            return;
         }
         _loc1_.inputSubject.visible = true;
         _loc1_.inputBackgroundSubject.visible = true;
         _loc1_.txtSubjectCaption.visible = true;
         _loc1_.txtMessageCaption.y = _loc1_.txtSubjectCaption.y + 43;
         _loc1_.inputMessage.y = _loc1_.txtMessageCaption.y + 38;
         _loc1_.inputBackgroundMessage.y = _loc1_.txtMessageCaption.y + 30;
         _loc1_.scrollKnob.y = _loc1_.txtMessageCaption.y + 37;
         _loc1_.scrollLine.y = _loc1_.scrollKnob.y + 2;
         _loc1_.inputMessage.height = 253;
         _loc1_.inputBackgroundMessage.height = 267;
         _loc1_.scrollLine.height = 250;
         _tabObjects.splice(1,0,_loc1_.inputSubject);
         Runtime.delayFunction(_scrollBar.refresh,0.05);
      }
      
      private function showSingelConversation() : void
      {
         var _loc1_:SymbolDialogCreatePrivateConversationGeneric = _vo as SymbolDialogCreatePrivateConversationGeneric;
         if(!_loc1_.inputSubject.visible)
         {
            return;
         }
         _loc1_.inputSubject.visible = false;
         _loc1_.inputBackgroundSubject.visible = false;
         _loc1_.txtSubjectCaption.visible = false;
         _loc1_.txtMessageCaption.y = _loc1_.txtSubjectCaption.y;
         _loc1_.inputMessage.y = _loc1_.txtMessageCaption.y + 38;
         _loc1_.inputBackgroundMessage.y = _loc1_.txtMessageCaption.y + 30;
         _loc1_.scrollKnob.y = _loc1_.txtMessageCaption.y + 37;
         _loc1_.scrollLine.y = _loc1_.scrollKnob.y + 2;
         _loc1_.inputMessage.height = 296;
         _loc1_.inputBackgroundMessage.height = 310;
         _loc1_.scrollLine.height = 293;
         if(_tabObjects.length == 3)
         {
            _tabObjects.slice(1,1);
         }
         Runtime.delayFunction(_scrollBar.refresh,0.05);
      }
      
      private function get isGuildMassMail() : Boolean
      {
         return _guildMassMail;
      }
      
      private function get isGroupConversation() : Boolean
      {
         if(isGuildMassMail)
         {
            return true;
         }
         var _loc1_:SymbolDialogCreatePrivateConversationGeneric = _vo as SymbolDialogCreatePrivateConversationGeneric;
         return _loc1_.inputReceiver.text.indexOf(",") != -1;
      }
      
      private function setFocus() : void
      {
         var _loc1_:SymbolDialogCreatePrivateConversationGeneric = _vo as SymbolDialogCreatePrivateConversationGeneric;
         if(StringUtil.isEmpty(_loc1_.inputReceiver.text))
         {
            Dialog.focus = _loc1_.inputReceiver;
         }
         else if(isGroupConversation && _loc1_.inputSubject.visible && StringUtil.isEmpty(_loc1_.inputSubject.text))
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
         var _loc2_:SymbolDialogCreatePrivateConversationGeneric = _vo as SymbolDialogCreatePrivateConversationGeneric;
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
         var _loc3_:SymbolDialogCreatePrivateConversationGeneric = _vo as SymbolDialogCreatePrivateConversationGeneric;
         var _loc2_:String = StringUtil.remove(StringUtil.remove(_loc3_.inputReceiver.text,",")," ");
         if(StringUtil.isEmpty(_loc3_.inputReceiver.text) || _loc2_.length == 0)
         {
            Environment.panelManager.showDialog(new UiInfoDialog(LocText.current.text("dialog/mail_compose/receiver_empty_title"),LocText.current.text("dialog/mail_compose/receiver_empty_text"),LocText.current.text("general/button_ok"),setFocus));
         }
         else if(isGroupConversation && StringUtil.isEmpty(_loc3_.inputSubject.text))
         {
            if(isGuildMassMail)
            {
               Environment.panelManager.showDialog(new UiInfoDialog(LocText.current.text("dialog/mail_compose/subject_empty_title"),LocText.current.text("dialog/mail_compose/subject_empty_text"),LocText.current.text("general/button_ok"),setFocus));
            }
            else
            {
               Environment.panelManager.showDialog(new UiInfoDialog(LocText.current.text("error/private_conversation/title/title_empty_title"),LocText.current.text("error/private_conversation/title/title_empty_text"),LocText.current.text("general/button_ok"),setFocus));
            }
         }
         else if(StringUtil.isEmpty(_loc3_.inputMessage.text))
         {
            Environment.panelManager.showDialog(new UiInfoDialog(LocText.current.text("dialog/mail_compose/message_empty_title"),LocText.current.text("dialog/mail_compose/message_empty_text"),LocText.current.text("general/button_ok"),setFocus));
         }
         else if(isGuildMassMail)
         {
            Environment.application.sendActionRequest("sendGuildMassMail",{
               "title":_loc3_.inputSubject.text,
               "message":_loc3_.inputMessage.text
            },handleRequests);
         }
         else
         {
            Environment.application.sendActionRequest("createPrivateConversation",{
               "title":_loc3_.inputSubject.text,
               "message":_loc3_.inputMessage.text,
               "to":_loc3_.inputReceiver.text
            },handleRequests);
         }
      }
      
      private function handleRequests(param1:ActionRequestResponse) : void
      {
         var _loc2_:* = null;
         var _loc3_:* = null;
         var _loc4_:* = param1.action;
         switch(_loc4_)
         {
            case "createPrivateConversation":
               if(param1.error == "")
               {
                  Environment.application.updateData(param1.data);
                  close();
                  if(ViewManager.instance.baseUserPanel.streamsPanel.isOpen)
                  {
                     _loc2_ = User.current.character.streams.privateConversations.getPrivateConversation(param1.appResponse.private_conversation.id);
                     if(_loc2_)
                     {
                        ViewManager.instance.baseUserPanel.streamsPanel.openPrivateConversation(_loc2_);
                     }
                  }
               }
               else if(param1.error == "errCreateNotAllowed")
               {
                  Environment.panelManager.showDialog(new UiInfoDialog(LocText.current.text("error/private_conversation_not_allowed/title"),LocText.current.text("error/create_private_conversation_not_allowed/text"),LocText.current.text("general/button_ok")));
               }
               else if(param1.error == "errCreatePrivateConversationNoMember")
               {
                  Environment.panelManager.showDialog(new UiInfoDialog(LocText.current.text("dialog/mail_compose/self_recipient_title"),LocText.current.text("dialog/mail_compose/self_recipient_text"),LocText.current.text("general/button_ok")));
               }
               else if(param1.error == "errCreatePrivateConversationSelfMember")
               {
                  Environment.panelManager.showDialog(new UiInfoDialog(LocText.current.text("dialog/mail_compose/self_recipient_title"),LocText.current.text("dialog/mail_compose/self_recipient_text"),LocText.current.text("general/button_ok")));
               }
               else if(param1.error == "errCreatePrivateConversationMemberLimitReached")
               {
                  Environment.panelManager.showDialog(new UiInfoDialog(LocText.current.text("dialog/mail_compose/too_many_recipients_title"),LocText.current.text("dialog/mail_compose/too_many_recipients_text"),LocText.current.text("general/button_ok")));
               }
               else if(param1.error.indexOf("errCreatePrivateConversationInvalidMemberLevel") != -1)
               {
                  _loc3_ = param1.error.substr("errCreatePrivateConversationInvalidMemberLevel_".length);
                  Environment.panelManager.showDialog(new UiInfoDialog(LocText.current.text("dialog/mail_compose/recipient_invalid_level_title"),LocText.current.text("dialog/mail_compose/recipient_invalid_level_text",_loc3_),LocText.current.text("general/button_ok")));
               }
               else if(param1.error.indexOf("errCreatePrivateConversationInvalidMember") != -1)
               {
                  _loc3_ = param1.error.substr("errCreatePrivateConversationInvalidMember_".length);
                  Environment.panelManager.showDialog(new UiInfoDialog(LocText.current.text("dialog/mail_compose/invalid_recipient_title"),LocText.current.text("dialog/mail_compose/invalid_recipient_text",_loc3_),LocText.current.text("general/button_ok")));
               }
               else if(param1.error == "errCreatePrivateConversationCooldown")
               {
                  Environment.panelManager.showDialog(new UiInfoDialog(LocText.current.text("dialog/mail_compose/cooldown_title"),LocText.current.text("dialog/mail_compose/cooldown_text"),LocText.current.text("general/button_ok")));
               }
               else if(param1.error == "errCreatePrivateConversationInvalidSenderLevel")
               {
                  Environment.panelManager.showDialog(new UiInfoDialog(LocText.current.text("dialog/mail_compose/sender_invalid_level_title"),LocText.current.text("dialog/mail_compose/sender_invalid_level_text"),LocText.current.text("general/button_ok")));
               }
               else
               {
                  Environment.reportError(param1.error,param1.request);
               }
               break;
            case "sendGuildMassMail":
               if(param1.error == "")
               {
                  Environment.application.updateData(param1.data);
                  close();
                  ViewManager.instance.baseUserPanel.syncGame();
               }
               else if(param1.error == "errCreatePrivateSystemMessageSubjectTooLong")
               {
                  Environment.panelManager.showDialog(new UiInfoDialog(LocText.current.text("dialog/mail_compose/subject_too_long_title"),LocText.current.text("dialog/mail_compose/subject_too_long_text"),LocText.current.text("general/button_ok")));
               }
               else if(param1.error == "errSendGuildMassMailInvalidGuild")
               {
                  Environment.panelManager.showDialog(new UiInfoDialog(LocText.current.text("dialog/mail_compose/invalid_guild_title"),LocText.current.text("dialog/mail_compose/invalid_guild_text"),LocText.current.text("general/button_ok")));
               }
               else if(param1.error == "errSendGuildMassMailNoGuildMembers")
               {
                  Environment.panelManager.showDialog(new UiInfoDialog(LocText.current.text("dialog/mail_compose/no_guild_members_title"),LocText.current.text("dialog/mail_compose/no_guild_members_text"),LocText.current.text("general/button_ok")));
               }
               else if(param1.error == "errSendGuildMassMailInvalidSenderLevel")
               {
                  Environment.panelManager.showDialog(new UiInfoDialog(LocText.current.text("dialog/mail_compose/sender_invalid_level_title"),LocText.current.text("dialog/mail_compose/sender_invalid_level_text"),LocText.current.text("general/button_ok")));
               }
               else
               {
                  Environment.reportError(param1.error,param1.request);
               }
               break;
            default:
               throw new Error("Unsupported request action \'" + param1.action + "\'!");
         }
      }
      
      override public function onEscape() : void
      {
         onClickClose(null);
      }
   }
}
