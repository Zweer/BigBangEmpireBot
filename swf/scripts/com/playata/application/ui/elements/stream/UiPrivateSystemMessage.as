package com.playata.application.ui.elements.stream
{
   import com.playata.application.AppEnvironment;
   import com.playata.application.data.GameUtil;
   import com.playata.application.data.item.Item;
   import com.playata.application.data.stream.PrivateSystemMessage;
   import com.playata.application.data.user.User;
   import com.playata.application.ui.AppUiUtil;
   import com.playata.application.ui.ViewManager;
   import com.playata.application.ui.dialogs.DialogCreatePrivateConversation;
   import com.playata.application.ui.elements.generic.button.UiButton;
   import com.playata.application.ui.elements.generic.button.UiTextButton;
   import com.playata.application.ui.elements.generic.dialog.UiInfoDialog;
   import com.playata.application.ui.elements.generic.dialog.UiTwoChoiceDialog;
   import com.playata.application.ui.elements.generic.scrollbar.UiScrollBar;
   import com.playata.application.ui.elements.item.UiItemSlot;
   import com.playata.framework.application.Environment;
   import com.playata.framework.application.request.ActionRequestResponse;
   import com.playata.framework.core.Runtime;
   import com.playata.framework.input.InteractionEvent;
   import com.playata.framework.localization.LocText;
   import visuals.ui.elements.stream.SymbolPrivateSystemMessageGeneric;
   
   public class UiPrivateSystemMessage
   {
       
      
      private var _privateSystemMessage:PrivateSystemMessage = null;
      
      private var _content:SymbolPrivateSystemMessageGeneric = null;
      
      private var _btnReply:UiButton = null;
      
      private var _btnDelete:UiButton = null;
      
      private var _btnGuildInvitationAccept:UiTextButton = null;
      
      private var _btnGuildInvitationDecline:UiTextButton = null;
      
      private var _btnGuildInvitationViewGuild:UiTextButton = null;
      
      private var _btnGuildApplicationAccept:UiTextButton = null;
      
      private var _btnGuildApplicationDecline:UiTextButton = null;
      
      private var _btnViewCharacter:UiButton = null;
      
      private var _btnSendMessage:UiButton = null;
      
      private var _btnPrivateConversationInviteAccept:UiTextButton = null;
      
      private var _btnPrivateConversationInviteDecline:UiTextButton = null;
      
      private var _btnLink:UiTextButton = null;
      
      private var _btnAcceptItem:UiTextButton = null;
      
      private var _btnGeneric:UiTextButton = null;
      
      private var _item1:UiItemSlot = null;
      
      private var _item2:UiItemSlot = null;
      
      private var _item3:UiItemSlot = null;
      
      private var _item4:UiItemSlot = null;
      
      private var _item5:UiItemSlot = null;
      
      private var _scrollBar:UiScrollBar = null;
      
      private var _originalBackgroundHight:int = 0;
      
      private var _originalMessageHeight:int = 0;
      
      private var _originalScrollLineHeight:int = 0;
      
      private var _originalSubjectWidth:int = 0;
      
      private var _originalItem1X:Number = 0;
      
      private var _originalItem2X:Number = 0;
      
      private var _originalItem3X:Number = 0;
      
      private var _originalItem4X:Number = 0;
      
      private var _originalItem5X:Number = 0;
      
      private var _originalAcceptItemButtonX:Number = 0;
      
      private var _currentPartnerAdCaptionAdjustment:int = 0;
      
      public function UiPrivateSystemMessage(param1:SymbolPrivateSystemMessageGeneric)
      {
         super();
         _content = param1;
         _btnReply = new UiButton(_content.btnReply,LocText.current.text("dialog/mail_read/button_reply"),onClickReply);
         _btnDelete = new UiButton(_content.btnDelete,LocText.current.text("dialog/mail_read/button_delete"),onClickDelete);
         _btnReply.visible = false;
         _btnGuildInvitationAccept = new UiTextButton(_content.btnGuildAccept,LocText.current.text("dialog/mail_read/guild_invitation/button_accept"),"",onClickGuildInvitationAccept);
         _btnGuildInvitationDecline = new UiTextButton(_content.btnGuildDecline,LocText.current.text("dialog/mail_read/guild_invitation/button_decline"),"",onClickGuildInvitationDecline);
         _btnGuildInvitationViewGuild = new UiTextButton(_content.btnGuildView,LocText.current.text("dialog/mail_read/guild_invitation/button_view"),"",onClickGuildInvitationViewGuild);
         _btnGuildApplicationAccept = new UiTextButton(_content.btnGuildInviteYes,LocText.current.text("dialog/mail_read/guild_application/button_invite"),"",onClickGuildApplicationAccept);
         _btnGuildApplicationDecline = new UiTextButton(_content.btnGuildInviteNo,LocText.current.text("dialog/mail_read/guild_application/button_decline"),"",onClickGuildApplicationDecline);
         _btnViewCharacter = new UiButton(_content.btnCharacterView,LocText.current.text("dialog/leaderboard/button_show_player"),onClickViewCharacter);
         _btnSendMessage = new UiButton(_content.btnSendMessage,LocText.current.text("dialog/mail_compose/title"),onClickSendMessage);
         _btnPrivateConversationInviteAccept = new UiTextButton(_content.btnPrivateConversationInviteAccept,LocText.current.text("dialog/mail_read/private_conversation_invitation/button_accept"),"",onClickPrivateConversationInviteAccept);
         _btnPrivateConversationInviteDecline = new UiTextButton(_content.btnPrivateConversationInviteDecline,LocText.current.text("dialog/mail_read/private_conversation_invitation/button_decline"),"",onClickPrivateConversationInviteDecline);
         _btnLink = new UiTextButton(_content.btnPartnerAdParticipate,"","",onClickLink);
         _btnAcceptItem = new UiTextButton(_content.btnAcceptItem,LocText.current.text("dialog/mail_read/item/button_claim"),"",onClickAcceptItem,true,"left");
         _btnGeneric = new UiTextButton(_content.btnGeneric,"","",onClickGeneric);
         _scrollBar = new UiScrollBar(_content.scrollKnob,_content.scrollLine,_content.txtMessage);
         _content.txtMessage.verticalScrollBar = _scrollBar;
         _content.txtMessage.interactionEnabled = true;
         _content.txtMessage.selectable = true;
         _content.txtSubject.autoFontSize = true;
         _item1 = new UiItemSlot(_content.item1,0);
         _item2 = new UiItemSlot(_content.item2,0);
         _item3 = new UiItemSlot(_content.item3,0);
         _item4 = new UiItemSlot(_content.item4,0);
         _item5 = new UiItemSlot(_content.item5,0);
         _originalItem1X = _content.item1.x;
         _originalItem2X = _content.item2.x;
         _originalItem3X = _content.item3.x;
         _originalItem4X = _content.item4.x;
         _originalItem5X = _content.item5.x;
         _originalAcceptItemButtonX = _content.btnAcceptItem.x;
         _originalBackgroundHight = int(_content.messageBackground.height);
         _originalMessageHeight = int(_content.txtMessage.height);
         _originalScrollLineHeight = int(_content.scrollLine.height);
         _originalSubjectWidth = int(_content.txtSubject.width);
      }
      
      public function refreshLocalization() : void
      {
         _btnReply.tooltip = LocText.current.text("dialog/mail_read/button_reply");
         _btnDelete.tooltip = LocText.current.text("dialog/mail_read/button_delete");
         _btnGuildInvitationAccept.caption = LocText.current.text("dialog/mail_read/guild_invitation/button_accept");
         _btnGuildInvitationDecline.caption = LocText.current.text("dialog/mail_read/guild_invitation/button_decline");
         _btnGuildInvitationViewGuild.caption = LocText.current.text("dialog/mail_read/guild_invitation/button_view");
         _btnGuildApplicationAccept.caption = LocText.current.text("dialog/mail_read/guild_application/button_invite");
         _btnGuildApplicationDecline.caption = LocText.current.text("dialog/mail_read/guild_application/button_decline");
         _btnViewCharacter.tooltip = LocText.current.text("dialog/leaderboard/button_show_player");
         _btnSendMessage.tooltip = LocText.current.text("dialog/mail_compose/title");
         _btnPrivateConversationInviteAccept.caption = LocText.current.text("dialog/mail_read/private_conversation_invitation/button_accept");
         _btnPrivateConversationInviteDecline.caption = LocText.current.text("dialog/mail_read/private_conversation_invitation/button_decline");
         _btnAcceptItem.caption = LocText.current.text("dialog/mail_read/item/button_claim");
      }
      
      public function get content() : SymbolPrivateSystemMessageGeneric
      {
         return _content;
      }
      
      public function init() : void
      {
      }
      
      public function reset() : void
      {
         _content.visible = false;
         _privateSystemMessage = null;
      }
      
      public function open(param1:PrivateSystemMessage) : void
      {
         _privateSystemMessage = param1;
         _content.visible = true;
         _scrollBar.scrollToStart(0);
         refresh();
      }
      
      public function refresh() : void
      {
         if(!_content.visible || !_privateSystemMessage)
         {
            return;
         }
         var _loc1_:User = User.current;
         if(_currentPartnerAdCaptionAdjustment)
         {
            (_btnLink.content as Object).caption.x = (_btnLink.content as Object).caption.x + _currentPartnerAdCaptionAdjustment;
            _currentPartnerAdCaptionAdjustment = 0;
         }
         _content.txtDate.text = _privateSystemMessage.dateTime;
         _content.txtMessage.htmlText = _privateSystemMessage.formattedMessage;
         _content.txtSubject.text = _privateSystemMessage.subject;
         _content.txtMessageMarriage.visible = _privateSystemMessage.isPrivateConversationMarriageProposal;
         refreshBackground();
         _content.item1.visible = _privateSystemMessage.itemCount >= 1;
         _content.item2.visible = _privateSystemMessage.itemCount >= 2;
         _content.item3.visible = _privateSystemMessage.itemCount >= 3;
         _content.item4.visible = _privateSystemMessage.itemCount >= 4;
         _content.item5.visible = _privateSystemMessage.itemCount >= 5;
         _content.item1.x = _originalItem1X;
         _content.item2.x = _originalItem2X;
         _content.item3.x = _originalItem3X;
         _content.item4.x = _originalItem4X;
         _content.item5.x = _originalItem5X;
         _content.btnAcceptItem.x = _originalAcceptItemButtonX;
         if(_privateSystemMessage.itemCount == 1)
         {
            AppUiUtil.alignVerticallyCentered(_content.messageBackground,360,_content.btnAcceptItem,_content.item1);
         }
         else if(_privateSystemMessage.itemCount == 2)
         {
            AppUiUtil.alignVerticallyCentered(_content.messageBackground,360,_content.btnAcceptItem,_content.item1,_content.item2);
         }
         else if(_privateSystemMessage.itemCount == 3)
         {
            AppUiUtil.alignVerticallyCentered(_content.messageBackground,355,_content.btnAcceptItem,_content.item1,_content.item2,_content.item3);
         }
         else if(_privateSystemMessage.itemCount == 4)
         {
            AppUiUtil.alignVerticallyCentered(_content.messageBackground,350,_content.btnAcceptItem,_content.item1,_content.item2,_content.item3,_content.item4);
         }
         else if(_privateSystemMessage.itemCount == 5)
         {
            AppUiUtil.alignVerticallyCentered(_content.messageBackground,350,_content.btnAcceptItem,_content.item1,_content.item2,_content.item3,_content.item4,_content.item5);
         }
         _btnReply.visible = _privateSystemMessage.isGuildMassMessage;
         if(_btnReply.visible)
         {
            _content.txtSubject.width = _originalSubjectWidth;
         }
         else
         {
            _content.txtSubject.width = _originalSubjectWidth + (_btnDelete.x - _btnReply.x);
         }
         if(_privateSystemMessage.isItemMessage)
         {
            if(_privateSystemMessage.areItemsLoaded)
            {
               if(_privateSystemMessage.itemCount >= 1)
               {
                  _item1.item = _loc1_.character.getItemById(_privateSystemMessage.item1Id);
               }
               if(_privateSystemMessage.itemCount >= 2)
               {
                  _item2.item = _loc1_.character.getItemById(_privateSystemMessage.item2Id);
               }
               if(_privateSystemMessage.itemCount >= 3)
               {
                  _item3.item = _loc1_.character.getItemById(_privateSystemMessage.item3Id);
               }
               if(_privateSystemMessage.itemCount >= 4)
               {
                  _item4.item = _loc1_.character.getItemById(_privateSystemMessage.item4Id);
               }
               if(_privateSystemMessage.itemCount >= 5)
               {
                  _item5.item = _loc1_.character.getItemById(_privateSystemMessage.item5Id);
               }
            }
            else
            {
               Environment.application.sendActionRequest("getPrivateSystemMessageItems",{"message_id":_privateSystemMessage.id},handleRequests);
            }
         }
         _btnGuildInvitationAccept.visible = false;
         _btnGuildInvitationDecline.visible = false;
         _btnGuildInvitationViewGuild.visible = false;
         _btnGuildApplicationAccept.visible = false;
         _btnGuildApplicationDecline.visible = false;
         _btnViewCharacter.visible = false;
         _btnSendMessage.visible = false;
         _btnPrivateConversationInviteAccept.visible = false;
         _btnPrivateConversationInviteDecline.visible = false;
         _btnLink.visible = false;
         _btnAcceptItem.visible = false;
         _btnGeneric.visible = false;
         _content.txtInfo.visible = false;
         if(!_privateSystemMessage.isRead)
         {
            _privateSystemMessage.markAsRead();
            ViewManager.instance.baseUserPanel.refreshStreamUnreadCounters();
            Environment.application.sendActionRequest("markPrivateSystemMessageAsRead",{"message_id":_privateSystemMessage.id},null,false,true);
         }
         if(_privateSystemMessage.isGuildInvitationMessage)
         {
            _btnGuildInvitationAccept.visible = _privateSystemMessage.isGuildInvitationValid;
            _btnGuildInvitationDecline.visible = _privateSystemMessage.isGuildInvitationValid;
            _btnGuildInvitationViewGuild.visible = _privateSystemMessage.isGuildInvitationValid;
            _content.txtInfo.visible = !_privateSystemMessage.isGuildInvitationValid;
            if(_content.txtInfo.visible)
            {
               if(_privateSystemMessage.isGuildInvitationDeclined)
               {
                  _content.txtInfo.text = LocText.current.text("guild/invitation_declined/title");
               }
               else
               {
                  _content.txtInfo.text = LocText.current.text("guild/invitation_accepted/title");
               }
            }
         }
         else if(_privateSystemMessage.isGuildApplicationMessage)
         {
            _btnGuildApplicationAccept.visible = _privateSystemMessage.isGuildApplicationValid;
            _btnGuildApplicationDecline.visible = _privateSystemMessage.isGuildApplicationValid;
            _btnViewCharacter.visible = _privateSystemMessage.isGuildApplicationValid;
            _btnSendMessage.visible = _privateSystemMessage.isGuildApplicationValid;
            _content.txtInfo.visible = !_privateSystemMessage.isGuildApplicationValid;
            if(_content.txtInfo.visible)
            {
               if(_privateSystemMessage.isGuildApplicationDeclined)
               {
                  _content.txtInfo.text = LocText.current.text("guild/application_declined");
               }
               else
               {
                  _content.txtInfo.text = LocText.current.text("guild/application_accepted");
               }
            }
         }
         else if(_privateSystemMessage.isPrivateConversationInviteMessage)
         {
            _btnPrivateConversationInviteAccept.visible = _privateSystemMessage.isPrivateConversationInviteValid;
            _btnPrivateConversationInviteDecline.visible = _privateSystemMessage.isPrivateConversationInviteValid;
            _btnViewCharacter.visible = _privateSystemMessage.isPrivateConversationInviteValid;
            _btnSendMessage.visible = _privateSystemMessage.isPrivateConversationInviteValid;
            _content.txtInfo.visible = !_privateSystemMessage.isPrivateConversationInviteValid;
            if(_content.txtInfo.visible)
            {
               if(_privateSystemMessage.isPrivateConversationInviteDeclined)
               {
                  _content.txtInfo.text = LocText.current.text("dialog/mail_read/private_conversation_invite_declined");
               }
               else
               {
                  _content.txtInfo.text = LocText.current.text("dialog/mail_read/private_conversation_invite_accepted");
               }
            }
         }
         else if(_privateSystemMessage.isLinkMessage)
         {
            _btnLink.visible = true;
            (_btnLink.content as Object).checked.visible = _privateSystemMessage.buttonLabel == null;
            if(_privateSystemMessage.buttonLabel)
            {
               _btnLink.caption = _privateSystemMessage.buttonLabel;
               _currentPartnerAdCaptionAdjustment = 8;
               (_btnLink.content as Object).caption.x = (_btnLink.content as Object).caption.x - _currentPartnerAdCaptionAdjustment;
            }
            else
            {
               _btnLink.caption = LocText.current.text("dialog/mail_read/partner_ad/button_participate");
            }
         }
         else if(_privateSystemMessage.isItemMessage)
         {
            _btnAcceptItem.visible = _privateSystemMessage.hasItems;
            _content.txtInfo.visible = _privateSystemMessage.areItemsClaimed;
            if(_content.txtInfo.visible)
            {
               _content.txtInfo.text = LocText.current.text("dialog/mail_read/item_already_claimed");
            }
         }
         else if(_privateSystemMessage.isFriendInviteMessage)
         {
            _btnGeneric.visible = true;
            _btnGeneric.caption = LocText.current.text("dialog/leaderboard/button_show_player");
         }
         else if(_privateSystemMessage.isPrivateConversationMarriageProposal)
         {
            if(_privateSystemMessage.flagValue != "accepted" && _privateSystemMessage.flagValue != "")
            {
               _btnGeneric.visible = true;
               _btnGeneric.caption = LocText.current.text("dialog/mail_read/marriage_proposal/button_accept");
            }
            else
            {
               _content.txtInfo.visible = true;
               _content.txtInfo.text = LocText.current.text("dialog/mail_read/marriage_proposal_already_answered");
            }
            _content.txtMessageMarriage.text = LocText.current.text("dialog/propose_marriage/info");
            _content.txtMessageMarriage.autoFontSize = true;
         }
         if(_btnLink.visible && !_content.txtInfo.visible && _privateSystemMessage.flagValue.indexOf("gamelink/open_voucher_dialog") >= 0)
         {
            if(_privateSystemMessage.flagValue == "gamelink/open_voucher_dialog/")
            {
               _btnLink.visible = false;
               _content.txtInfo.visible = true;
               _content.txtInfo.text = LocText.current.text("dialog/mail_read/voucher_already_claimed");
            }
            else if(_privateSystemMessage.isVoucherExpired)
            {
               _btnLink.visible = false;
               _content.txtInfo.visible = true;
               _content.txtInfo.text = LocText.current.text("dialog/mail_read/voucher_expired");
            }
         }
      }
      
      private function refreshBackground() : void
      {
         var _loc1_:int = 0;
         if(_privateSystemMessage.isGuildInvitationMessage || _privateSystemMessage.isGuildApplicationMessage || _privateSystemMessage.isLinkMessage || _privateSystemMessage.isItemMessage || _privateSystemMessage.isFriendInviteMessage || _privateSystemMessage.isPrivateConversationInviteMessage)
         {
            _loc1_ = 70;
         }
         else if(_privateSystemMessage.isPrivateConversationMarriageProposal)
         {
            _loc1_ = 114;
         }
         _content.messageBackground.height = _originalBackgroundHight - _loc1_;
         _content.txtMessage.height = _originalMessageHeight - _loc1_;
         _content.scrollLine.height = _originalScrollLineHeight - _loc1_;
         _scrollBar.refresh();
      }
      
      private function onClickReply(param1:InteractionEvent) : void
      {
         if(!_privateSystemMessage.isGuildMassMessage)
         {
            return;
         }
         if(_privateSystemMessage.flagValue != User.current.character.name)
         {
            Environment.panelManager.showDialog(new UiTwoChoiceDialog(LocText.current.text("dialog/mail_read/team_mail_reply/title"),LocText.current.text("dialog/mail_read/team_mail_reply/text"),LocText.current.text("dialog/mail_read/team_mail_reply/button_sender"),LocText.current.text("dialog/mail_read/team_mail_reply/button_team"),onClickReplySender,onClickReplyTeam));
         }
         else
         {
            onClickReplyTeam();
         }
      }
      
      private function onClickReplySender() : void
      {
         Environment.panelManager.showDialog(new DialogCreatePrivateConversation(_privateSystemMessage.flagValue));
      }
      
      private function onClickReplyTeam() : void
      {
         Environment.panelManager.showDialog(new DialogCreatePrivateConversation(User.current.character.guild.name,_privateSystemMessage.subject,null,true));
      }
      
      private function onClickDelete(param1:InteractionEvent) : void
      {
         interactionEvent = param1;
         var deleteCallback:Function = function():void
         {
            _content.visible = false;
            _privateSystemMessage.markAsDeleted();
            var _loc1_:int = _privateSystemMessage.id;
            ViewManager.instance.baseUserPanel.refreshStreamUnreadCounters();
            ViewManager.instance.baseUserPanel.streamsPanel.privateSystemMessageStreamList.sync();
            Environment.application.sendActionRequest("deletePrivateSystemMessages",{"message_ids":_loc1_},handleRequests);
         };
         if(_privateSystemMessage.isItemMessage)
         {
            if(!_privateSystemMessage.areItemsClaimed)
            {
               Environment.panelManager.showDialog(new UiTwoChoiceDialog(LocText.current.text("general/mail/confirm_delete_title"),LocText.current.text("general/mail/confirm_items_delete_text"),LocText.current.text("general/button_yes"),LocText.current.text("general/button_no"),deleteCallback));
               return;
            }
         }
         if(_privateSystemMessage.isPrivateConversationMarriageProposal)
         {
            if(!_privateSystemMessage.flagValue)
            {
               Environment.panelManager.showDialog(new UiTwoChoiceDialog(LocText.current.text("general/mail/confirm_delete_title"),LocText.current.text("general/mail/confirm_marriage_proposal_delete_text"),LocText.current.text("general/button_yes"),LocText.current.text("general/button_no"),deleteCallback));
               return;
            }
         }
         Environment.panelManager.showDialog(new UiTwoChoiceDialog(LocText.current.text("general/mail/confirm_delete_title"),LocText.current.text("general/mail/confirm_delete_text"),LocText.current.text("general/button_yes"),LocText.current.text("general/button_no"),deleteCallback));
      }
      
      private function onClickGuildInvitationAccept(param1:InteractionEvent) : void
      {
         if(!_privateSystemMessage.isGuildInvitationMessage || !_privateSystemMessage.isGuildInvitationValid)
         {
            return;
         }
         Environment.application.sendActionRequest("joinGuild",{
            "guild_id":parseInt(_privateSystemMessage.flagValue),
            "invitation":true,
            "private_system_message_id":_privateSystemMessage.id
         },handleRequests);
      }
      
      private function onClickGuildInvitationDecline(param1:InteractionEvent) : void
      {
         if(!_privateSystemMessage.isGuildInvitationMessage || !_privateSystemMessage.isGuildInvitationValid)
         {
            return;
         }
         Environment.application.sendActionRequest("declineGuildInvitation",{
            "guild_id":parseInt(_privateSystemMessage.flagValue),
            "private_system_message_id":_privateSystemMessage.id
         },handleRequests);
      }
      
      private function onClickGuildInvitationViewGuild(param1:InteractionEvent) : void
      {
         interactionEvent = param1;
         if(!_privateSystemMessage.isGuildInvitationMessage || !_privateSystemMessage.isGuildInvitationValid)
         {
            return;
         }
         ViewManager.instance.loadGuild(parseInt(_privateSystemMessage.flagValue),function():void
         {
            closeStreamPanel();
         });
      }
      
      private function onClickGuildApplicationAccept(param1:InteractionEvent) : void
      {
         if(!_privateSystemMessage.isGuildApplicationMessage || !_privateSystemMessage.isGuildApplicationValid)
         {
            return;
         }
         Environment.application.sendActionRequest("inviteToGuild",{
            "name":_privateSystemMessage.flagValue,
            "private_system_message_id":_privateSystemMessage.id
         },handleRequests);
      }
      
      private function onClickGuildApplicationDecline(param1:InteractionEvent) : void
      {
         if(!_privateSystemMessage.isGuildApplicationMessage || !_privateSystemMessage.isGuildApplicationValid)
         {
            return;
         }
         Environment.application.sendActionRequest("inviteToGuild",{
            "name":_privateSystemMessage.flagValue,
            "private_system_message_id":_privateSystemMessage.id,
            "decline":true
         },handleRequests);
      }
      
      private function onClickViewCharacter(param1:InteractionEvent) : void
      {
         interactionEvent = param1;
         if(_privateSystemMessage.isGuildApplicationMessage)
         {
            if(!_privateSystemMessage.isGuildApplicationValid)
            {
               return;
            }
            ViewManager.instance.loadCharacterByName(_privateSystemMessage.flagValue,function():void
            {
               closeStreamPanel();
            });
         }
         else if(_privateSystemMessage.isPrivateConversationInviteMessage)
         {
            if(!_privateSystemMessage.isPrivateConversationInviteValid)
            {
               return;
            }
            ViewManager.instance.loadCharacterByName(_privateSystemMessage.privateConversationInviteCharacterName,function():void
            {
               closeStreamPanel();
            });
         }
      }
      
      private function onClickSendMessage(param1:InteractionEvent) : void
      {
         if(_privateSystemMessage.isGuildApplicationMessage)
         {
            if(!_privateSystemMessage.isGuildApplicationValid)
            {
               return;
            }
            ViewManager.instance.baseUserPanel.streamsPanel.createPrivateConversation(_privateSystemMessage.flagValue);
         }
         else if(_privateSystemMessage.isPrivateConversationInviteMessage)
         {
            if(!_privateSystemMessage.isPrivateConversationInviteValid)
            {
               return;
            }
            ViewManager.instance.baseUserPanel.streamsPanel.createPrivateConversation(_privateSystemMessage.privateConversationInviteCharacterName);
         }
      }
      
      private function onClickPrivateConversationInviteAccept(param1:InteractionEvent) : void
      {
         if(!_privateSystemMessage.isPrivateConversationInviteMessage || !_privateSystemMessage.isPrivateConversationInviteValid)
         {
            return;
         }
         Environment.application.sendActionRequest("joinPrivateConversation",{
            "private_conversation_id":_privateSystemMessage.privateConversationInvitePrivateConversationId,
            "private_system_message_id":_privateSystemMessage.id
         },handleRequests);
      }
      
      private function onClickPrivateConversationInviteDecline(param1:InteractionEvent) : void
      {
         if(!_privateSystemMessage.isPrivateConversationInviteMessage || !_privateSystemMessage.isPrivateConversationInviteValid)
         {
            return;
         }
         Environment.application.sendActionRequest("declinePrivateConversationInvitation",{
            "private_conversation_id":_privateSystemMessage.privateConversationInvitePrivateConversationId,
            "private_system_message_id":_privateSystemMessage.id
         },handleRequests);
      }
      
      private function onClickLink(param1:InteractionEvent) : void
      {
         _privateSystemMessage.openLink();
         if(_privateSystemMessage.isExternalLink)
         {
            Environment.application.sendActionRequest("trackAdvertisment",{
               "type":1,
               "value1":_privateSystemMessage.linkUrl,
               "value2":"",
               "value3":""
            },null,false);
         }
      }
      
      private function onClickAcceptItem(param1:InteractionEvent) : void
      {
         Environment.application.sendActionRequest("claimPrivateSystemMessageItems",{
            "message_id":_privateSystemMessage.id,
            "discard_item":false
         },handleRequests);
      }
      
      private function onClickGeneric(param1:InteractionEvent) : void
      {
         if(_privateSystemMessage.isFriendInviteMessage)
         {
            ViewManager.instance.loadCharacter(parseInt(_privateSystemMessage.flagValue),null);
            closeStreamPanel();
         }
         else if(_privateSystemMessage.isPrivateConversationMarriageProposal)
         {
            if(_privateSystemMessage.flagValue == "accepted" || _privateSystemMessage.flagValue == "")
            {
               return;
            }
            Environment.application.sendActionRequest("acceptMarriage",{"private_system_message_id":_privateSystemMessage.id},handleRequests);
         }
      }
      
      private function showGuildJoinSuccess() : void
      {
         Environment.panelManager.showDialog(new UiInfoDialog(LocText.current.text("dialog/mail_compose/join_guild/success/title"),LocText.current.text("dialog/mail_compose/join_guild/success/text",User.current.character.guild.name),LocText.current.text("general/button_ok")));
      }
      
      private function onClickGotoShop() : void
      {
         ViewManager.instance.baseUserPanel.streamsPanel.close();
         ViewManager.instance.showPanel("shop");
      }
      
      private function onClickDiscardItem() : void
      {
         Environment.application.sendActionRequest("claimPrivateSystemMessageItems",{
            "message_id":_privateSystemMessage.id,
            "discard_item":true
         },handleRequests);
      }
      
      private function closeStreamPanel() : void
      {
         Runtime.delayFunction(ViewManager.instance.baseUserPanel.streamsPanel.close,0.6);
      }
      
      private function refreshItems() : void
      {
         _item1.item = User.current.character.getItemById(_privateSystemMessage.item1Id);
         _item2.item = User.current.character.getItemById(_privateSystemMessage.item2Id);
         _item3.item = User.current.character.getItemById(_privateSystemMessage.item3Id);
         _item4.item = User.current.character.getItemById(_privateSystemMessage.item4Id);
         _item5.item = User.current.character.getItemById(_privateSystemMessage.item5Id);
      }
      
      private function handleRequests(param1:ActionRequestResponse) : void
      {
         var _loc2_:* = null;
         var _loc4_:* = null;
         var _loc5_:int = 0;
         var _loc3_:* = null;
         var _loc6_:* = param1.action;
         switch(_loc6_)
         {
            case "inviteToGuild":
               if(param1.error == "")
               {
                  _loc2_ = _privateSystemMessage.flagValue;
                  Environment.application.updateData(param1.data);
                  if(!param1.request.hasData("decline"))
                  {
                     Environment.panelManager.showDialog(new UiInfoDialog(LocText.current.text("dialog/guild_invitation/success_title"),LocText.current.text("dialog/guild_invitation/success_text",_loc2_),LocText.current.text("general/button_ok")));
                  }
                  refresh();
               }
               else if(param1.error.indexOf("errInviteToGuildInvalidCharacter") != -1)
               {
                  _loc4_ = param1.error.substr("errInviteToGuildInvalidCharacter_".length);
                  Environment.panelManager.showDialog(new UiInfoDialog(LocText.current.text("dialog/guild_invitation/invalid_name_title"),LocText.current.text("dialog/guild_invitation/invalid_name_text",_loc4_),LocText.current.text("general/button_ok")));
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
               break;
            case "joinGuild":
               if(param1.error == "")
               {
                  ViewManager.instance.showPanel("guild");
                  Environment.application.updateData(param1.data);
                  refresh();
                  AppEnvironment.friendBar.syncFriendBar(true);
                  if(User.current.character.guild.questBoosterActive)
                  {
                     Environment.application.sendActionRequest("refreshQuests",{},handleRequests);
                  }
                  else
                  {
                     closeStreamPanel();
                     Runtime.delayFunction(showGuildJoinSuccess,0.8);
                  }
               }
               else if(param1.error == "errJoinGuildAlreadyFull")
               {
                  Environment.panelManager.showDialog(new UiInfoDialog(LocText.current.text("dialog/mail_compose/join_guild/already_full/title"),LocText.current.text("dialog/mail_compose/join_guild/already_full/text"),LocText.current.text("general/button_ok")));
               }
               else if(param1.error == "errJoinGuildDeleted")
               {
                  Environment.panelManager.showDialog(new UiInfoDialog(LocText.current.text("dialog/mail_compose/join_guild/guild_deleted/title"),LocText.current.text("dialog/mail_compose/join_guild/guild_deleted/text"),LocText.current.text("general/button_ok")));
               }
               else if(param1.error == "errJoinGuildAlreadyInGuild")
               {
                  Environment.panelManager.showDialog(new UiInfoDialog(LocText.current.text("dialog/mail_compose/join_guild/already_in_guild/title"),LocText.current.text("dialog/mail_compose/join_guild/already_in_guild/text"),LocText.current.text("general/button_ok")));
               }
               else if(param1.error == "errJoinGuildAlreadyMember")
               {
                  Environment.panelManager.showDialog(new UiInfoDialog(LocText.current.text("dialog/mail_compose/join_guild/already_member/title"),LocText.current.text("dialog/mail_compose/join_guild/already_member/text"),LocText.current.text("general/button_ok")));
               }
               else if(param1.error == "errJoinGuildInvalidGuild")
               {
                  Environment.panelManager.showDialog(new UiInfoDialog(LocText.current.text("dialog/mail_compose/join_guild/invalid_guild/title"),LocText.current.text("dialog/mail_compose/join_guild/invalid_guild/text"),LocText.current.text("general/button_ok")));
               }
               else if(param1.error == "errJoinGuildInvalidInvitation")
               {
                  Environment.panelManager.showDialog(new UiInfoDialog(LocText.current.text("dialog/mail_compose/join_guild/invalid_invitation/title"),LocText.current.text("dialog/mail_compose/join_guild/invalid_invitation/text"),LocText.current.text("general/button_ok")));
               }
               else if(param1.error != "errJoinGuildLocked")
               {
                  Environment.reportError(param1.error,param1.request);
               }
               break;
            case "refreshQuests":
               if(param1.error == "")
               {
                  Environment.application.updateData(param1.data);
                  closeStreamPanel();
                  Runtime.delayFunction(showGuildJoinSuccess,0.8);
               }
               else
               {
                  Environment.reportError(param1.error,param1.request,false);
               }
               break;
            case "refreshTrainings":
               if(param1.error == "")
               {
                  Environment.application.updateData(param1.data);
                  closeStreamPanel();
                  Runtime.delayFunction(showGuildJoinSuccess,0.8);
               }
               else
               {
                  Environment.reportError(param1.error,param1.request,false);
               }
               break;
            case "declineGuildInvitation":
               if(param1.error == "")
               {
                  Environment.application.updateData(param1.data);
                  refresh();
               }
               else if(param1.error == "errGuildInvalidLeader")
               {
                  Environment.panelManager.showDialog(new UiInfoDialog(LocText.current.text("dialog/mail_compose/decline_invitation/invalid_guild/title"),LocText.current.text("dialog/mail_compose/decline_invitation/invalid_guild/text"),LocText.current.text("general/button_ok")));
               }
               else if(param1.error == "errDeclineGuildInvitationInvalidInvitation")
               {
                  Environment.panelManager.showDialog(new UiInfoDialog(LocText.current.text("dialog/mail_compose/decline_invitation/invalid_invitation/title"),LocText.current.text("dialog/mail_compose/decline_invitation/invalid_invitation/text"),LocText.current.text("general/button_ok")));
               }
               else
               {
                  Environment.reportError(param1.error,param1.request);
               }
               break;
            case "deletePrivateSystemMessages":
               if(param1.error == "")
               {
                  Environment.application.updateData(param1.data);
               }
               else
               {
                  Environment.reportError(param1.error,param1.request);
               }
               break;
            case "claimPrivateSystemMessageItems":
               if(param1.error == "")
               {
                  Environment.application.updateData(param1.data);
                  refresh();
               }
               else if(param1.error == "errInventoryNoEmptySlot")
               {
                  _loc5_ = 0;
                  if(_item1.item)
                  {
                     _loc5_ = _loc5_ + _item1.item.sellPrice;
                  }
                  if(_item2.item)
                  {
                     _loc5_ = _loc5_ + _item2.item.sellPrice;
                  }
                  if(_item3.item)
                  {
                     _loc5_ = _loc5_ + _item3.item.sellPrice;
                  }
                  if(_item4.item)
                  {
                     _loc5_ = _loc5_ + _item4.item.sellPrice;
                  }
                  if(_item5.item)
                  {
                     _loc5_ = _loc5_ + _item5.item.sellPrice;
                  }
                  Environment.panelManager.showDialog(new UiTwoChoiceDialog(LocText.current.text("dialog/no_free_slot/title"),LocText.current.text("dialog/no_free_slot/text",GameUtil.getGameCurrencyString(_loc5_)),LocText.current.text("dialog/no_free_slot/button_go_to_shop"),LocText.current.text("dialog/no_free_slot/button_discard_item"),onClickGotoShop,onClickDiscardItem));
               }
               else if(param1.error != "errClaimPrivateSystemMessageItemsInvalidItem")
               {
                  if(param1.error != "errCollectGoalAlreadyExists")
                  {
                     if(param1.error != "errInvalidItem")
                     {
                        Environment.reportError(param1.error,param1.request);
                     }
                  }
               }
               break;
            case "getPrivateSystemMessageItems":
               if(param1.error == "")
               {
                  Environment.application.updateData(param1.data);
                  _loc3_ = User.current.character.getItemById(_privateSystemMessage.item1Id);
                  if(_loc3_ && _loc3_.isMarriageRewardItem)
                  {
                     Environment.application.sendActionRequest("getMarriageData",{},handleRequests);
                  }
                  else
                  {
                     refreshItems();
                  }
               }
               else if(param1.error != "errInvalidItem")
               {
                  Environment.reportError(param1.error,param1.request);
               }
               break;
            case "joinPrivateConversation":
               if(param1.error == "")
               {
                  Environment.application.updateData(param1.data);
                  if(ViewManager.instance.baseUserPanel.streamsPanel.isOpen)
                  {
                     ViewManager.instance.baseUserPanel.streamsPanel.openPrivateConversations();
                  }
               }
               else if(param1.error != "errAddMemberNoInvite")
               {
                  if(param1.error != "errAddMemberAlreadyMember")
                  {
                     if(param1.error == "errAddMemberLimitReached")
                     {
                        Environment.panelManager.showDialog(new UiInfoDialog(LocText.current.text("message/private_conversation_invite/subject"),LocText.current.text("dialog/mail_compose/too_many_recipients_title"),LocText.current.text("general/button_ok")));
                     }
                     else
                     {
                        Environment.reportError(param1.error,param1.request);
                     }
                  }
               }
               break;
            case "declinePrivateConversationInvitation":
               if(param1.error == "")
               {
                  Environment.application.updateData(param1.data);
                  refresh();
               }
               else if(param1.error != "errMarkAsDeclinedInvalidInvitation")
               {
                  Environment.reportError(param1.error,param1.request);
               }
               break;
            case "acceptMarriage":
               if(param1.error == "")
               {
                  Environment.application.updateData(param1.data);
                  refresh();
               }
               else if(param1.error == "errCreateMarriageProposalSelfToManyMarriages")
               {
                  Environment.panelManager.showDialog(new UiInfoDialog(LocText.current.text("dialog/propose_marriage/to_many_marriages_title"),LocText.current.text("dialog/propose_marriage/to_many_marriages_text"),LocText.current.text("general/button_ok")));
               }
               else if(param1.error == "errCreateMarriageProposalRecipientToManyMarriages")
               {
                  Environment.panelManager.showDialog(new UiInfoDialog(LocText.current.text("dialog/propose_marriage/recipient_to_many_marriages_title"),LocText.current.text("dialog/accept_marriage/recipient_to_many_marriages_text"),LocText.current.text("general/button_ok")));
               }
               else
               {
                  Environment.reportError(param1.error,param1.request);
               }
               break;
            case "getMarriageData":
               if(param1.error == "")
               {
                  Environment.application.updateData(param1.data);
                  refreshItems();
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
   }
}
