package com.playata.application.ui.dialogs
{
   import com.playata.application.AppConfig;
   import com.playata.application.data.AppDateTime;
   import com.playata.application.data.GameUtil;
   import com.playata.application.data.character.Character;
   import com.playata.application.data.guild.Guild;
   import com.playata.application.data.item.Item;
   import com.playata.application.data.mailbox.Mailbox;
   import com.playata.application.data.mailbox.Message;
   import com.playata.application.data.user.User;
   import com.playata.application.platform.ServerInfo;
   import com.playata.application.ui.AppUiUtil;
   import com.playata.application.ui.ViewManager;
   import com.playata.application.ui.elements.generic.UiOnlinePoint;
   import com.playata.application.ui.elements.generic.button.UiButton;
   import com.playata.application.ui.elements.generic.button.UiTextButton;
   import com.playata.application.ui.elements.generic.button.UiTextWithIconButton;
   import com.playata.application.ui.elements.generic.dialog.UiDialog;
   import com.playata.application.ui.elements.generic.dialog.UiInfoDialog;
   import com.playata.application.ui.elements.generic.dialog.UiTwoChoiceDialog;
   import com.playata.application.ui.elements.generic.scrollbar.UiScrollBar;
   import com.playata.application.ui.elements.item.UiItemSlot;
   import com.playata.application.ui.elements.mailbox.UiSystemMailIcon;
   import com.playata.framework.application.Environment;
   import com.playata.framework.application.request.ActionRequestResponse;
   import com.playata.framework.core.Runtime;
   import com.playata.framework.core.util.StringUtil;
   import com.playata.framework.core.util.TimeUtil;
   import com.playata.framework.input.InteractionEvent;
   import com.playata.framework.localization.LocText;
   import visuals.ui.dialogs.SymbolDialogMailReadGeneric;
   
   public class DialogMailRead extends UiDialog
   {
      
      public static const FLAG_GUILD_INVITATION:String = "guild_invitation";
      
      public static const FLAG_GUILD_APPLICATION:String = "guild_application";
      
      public static const FLAG_PARTNER_AD:String = "partner_ad";
      
      public static const FLAG_TEAM_MAIL:String = "team_mail";
      
      public static const FLAG_SYSTEM_TEAM_MAIL:String = "system_team_mail";
      
      public static const FLAG_ITEM:String = "item";
      
      public static const FLAG_INVITE_REGISTRATION:String = "friend_invite";
      
      public static const FLAG_MARRIAGE_PROPOSAL:String = "marriage_proposal";
      
      public static const FLAG_PARTNER_AD_HTML:String = "partner_ad_html";
      
      public static const FLAG_SYSTEM_HTML:String = "system_html";
      
      public static const FLAG_ITEM_HTML:String = "item_html";
       
      
      private var _message:Message = null;
      
      private var _refreshMailbox:Function = null;
      
      private var _closeMailbox:Function = null;
      
      private var _btnClose:UiButton = null;
      
      private var _btnReply:UiTextButton = null;
      
      private var _btnDelete:UiButton = null;
      
      private var _btnShowSender:UiButton = null;
      
      private var _btnIgnore:UiButton = null;
      
      private var _btnReport:UiButton = null;
      
      private var _btnForward:UiButton = null;
      
      private var _btnGuildAccept:UiTextWithIconButton = null;
      
      private var _btnGuildDecline:UiTextButton = null;
      
      private var _btnGuildView:UiTextButton = null;
      
      private var _btnGuildInviteYes:UiTextButton = null;
      
      private var _btnGuildInviteNo:UiTextButton = null;
      
      private var _btnPartnerAdParticipate:UiTextWithIconButton = null;
      
      private var _btnAcceptItem:UiTextWithIconButton = null;
      
      private var _btnGeneric:UiTextButton = null;
      
      private var _item1:UiItemSlot = null;
      
      private var _item2:UiItemSlot = null;
      
      private var _item3:UiItemSlot = null;
      
      private var _item4:UiItemSlot = null;
      
      private var _item5:UiItemSlot = null;
      
      private var _btnLast:UiButton = null;
      
      private var _btnNext:UiButton = null;
      
      private var _senderOnlinePoint:UiOnlinePoint = null;
      
      private var _receiverOnlinePoint:UiOnlinePoint = null;
      
      private var _systemMailIcon:UiSystemMailIcon;
      
      private var _scrollBar:UiScrollBar = null;
      
      private var _originalMessageHeight:int = 0;
      
      private var _originalScrollLineHeight:Number = 0;
      
      private var _originalItem1X:Number = 0;
      
      private var _originalItem2X:Number = 0;
      
      private var _originalItem3X:Number = 0;
      
      private var _originalItem4X:Number = 0;
      
      private var _originalItem5X:Number = 0;
      
      private var _originalAcceptItemButtonX:Number = 0;
      
      public function DialogMailRead(param1:Message, param2:Function = null, param3:Function = null)
      {
         _message = param1;
         _refreshMailbox = param2;
         _closeMailbox = param3;
         var _loc4_:SymbolDialogMailReadGeneric = new SymbolDialogMailReadGeneric();
         super(_loc4_);
         _queued = false;
         _loc4_.txtDateCaption.text = LocText.current.text("dialog/mail_read/date_caption");
         _loc4_.txtSenderCaption.text = LocText.current.text("dialog/mail_read/sender_caption");
         _loc4_.txtReceiverCaption.text = LocText.current.text("dialog/mail_read/receiver_caption");
         _loc4_.txtSubjectCaption.text = LocText.current.text("dialog/mail_read/subject_caption");
         _loc4_.txtUnread.text = LocText.current.text("general/mail/new");
         _loc4_.txtMessage.selectable = true;
         _loc4_.txtAlreadyClaimed.text = LocText.current.text("dialog/mail_read/item_already_claimed");
         _btnClose = new UiButton(_loc4_.btnClose,"",onClickClose);
         _btnReply = new UiTextButton(_loc4_.btnReply,LocText.current.text("dialog/mail_read/button_reply"),"",onClickReply);
         _btnDelete = new UiButton(_loc4_.btnDelete,LocText.current.text("dialog/mail_read/button_delete"),onClickDelete);
         _btnShowSender = new UiButton(_loc4_.btnShowSender,LocText.current.text("dialog/mail_read/button_show_sender"),onClickShowSender);
         _btnIgnore = new UiButton(_loc4_.btnIgnore,"",onClickIgnore);
         _btnReport = new UiButton(_loc4_.btnReport,"",onClickReport);
         _btnForward = new UiButton(_loc4_.btnForward,"",onClickForward);
         _btnGuildAccept = new UiTextWithIconButton(_loc4_.btnGuildAccept,"","",onClickGuildAccept,_loc4_.btnGuildAccept.checked);
         _btnGuildDecline = new UiTextButton(_loc4_.btnGuildDecline,"","",onClickGuildDecline);
         _btnGuildView = new UiTextButton(_loc4_.btnGuildView,"","",onClickGuildView);
         _btnGuildInviteYes = new UiTextButton(_loc4_.btnGuildInviteYes,"","",onClickGuildInviteYes);
         _btnGuildInviteNo = new UiTextButton(_loc4_.btnGuildInviteNo,"","",onClickGuildInviteNo);
         _btnPartnerAdParticipate = new UiTextWithIconButton(_loc4_.btnPartnerAdParticipate,"","",onClickPartnerAdParticipate,_loc4_.btnPartnerAdParticipate.checked);
         _btnAcceptItem = new UiTextWithIconButton(_loc4_.btnAcceptItem,"","",onClickAcceptItem,_loc4_.btnAcceptItem.checked);
         _btnGeneric = new UiTextButton(_loc4_.btnGeneric,"","",onClickGeneric);
         _btnLast = new UiButton(_loc4_.btnLast,"",onClickLast);
         _btnNext = new UiButton(_loc4_.btnNext,"",onClickNext);
         _senderOnlinePoint = new UiOnlinePoint(_loc4_.iconSenderOnline,_loc4_.txtSender);
         _receiverOnlinePoint = new UiOnlinePoint(_loc4_.iconReceiverOnline,_loc4_.txtReceiverRight);
         _systemMailIcon = new UiSystemMailIcon(_loc4_.iconSenderSystemMail);
         _scrollBar = new UiScrollBar(_loc4_.scrollKnob,_loc4_.scrollLine,_loc4_.txtMessage);
         _loc4_.txtMessage.verticalScrollBar = _scrollBar;
         _loc4_.txtMessage.interactionEnabled = true;
         _scrollBar.refresh();
         _item1 = new UiItemSlot(_loc4_.item1,0);
         _item2 = new UiItemSlot(_loc4_.item2,0);
         _item3 = new UiItemSlot(_loc4_.item3,0);
         _item4 = new UiItemSlot(_loc4_.item4,0);
         _item5 = new UiItemSlot(_loc4_.item5,0);
         _originalItem1X = _loc4_.item1.x;
         _originalItem2X = _loc4_.item2.x;
         _originalItem3X = _loc4_.item3.x;
         _originalItem4X = _loc4_.item4.x;
         _originalItem5X = _loc4_.item5.x;
         _originalAcceptItemButtonX = _loc4_.btnAcceptItem.x;
         if(_message.isSent)
         {
            _btnLast.visible = Mailbox.sentMessages.length > 1;
            _btnNext.visible = Mailbox.sentMessages.length > 1;
         }
         else
         {
            _btnLast.visible = Mailbox.receivedMessages.length > 1;
            _btnNext.visible = Mailbox.receivedMessages.length > 1;
         }
         _originalMessageHeight = 245;
         _originalScrollLineHeight = _loc4_.scrollLine.height;
         if(_message.flag == "partner_ad_html" || _message.flag == "system_html" || _message.flag == "item_html" || _message.flag == "marriage_proposal")
         {
            _onShownCallback = onShownCallback;
            refresh(false);
         }
         else
         {
            refresh();
         }
      }
      
      public function onShownCallback() : void
      {
         refresh(true);
      }
      
      public function refresh(param1:Boolean = true) : void
      {
         var _loc4_:int = 0;
         var _loc6_:int = 0;
         var _loc8_:* = null;
         var _loc9_:* = null;
         var _loc5_:SymbolDialogMailReadGeneric = _vo as SymbolDialogMailReadGeneric;
         if(_message.isSent)
         {
            _loc5_.txtDialogTitle.text = LocText.current.text("dialog/mail_read/sent_title",StringUtil.cutLength(_message.recipientNames,30));
         }
         else
         {
            _loc5_.txtDialogTitle.text = LocText.current.text("dialog/mail_read/received_title",StringUtil.cutLength(_message.sender.name,15));
         }
         _loc5_.txtDate.text = _message.dateTime;
         var _loc2_:String = _message.message;
         var _loc3_:String = _message.subject;
         var _loc7_:int = 0;
         if(_message.sender.isSystem)
         {
            _loc2_ = StringUtil.replace(_loc2_,"[name]",User.current.character.name);
            _loc2_ = StringUtil.replace(_loc2_,"[email]",User.current.email);
            _loc2_ = StringUtil.replace(_loc2_,"[serverid]",ServerInfo.serverId);
            _loc2_ = StringUtil.replace(_loc2_,"[userid]",User.current.id.toString());
            _loc4_ = _loc2_.indexOf("[usertime:");
            if(_loc4_ >= 0)
            {
               _loc6_ = _loc2_.indexOf("]",_loc4_);
               _loc7_ = parseInt(_loc2_.substr(_loc4_ + 10,_loc6_ - _loc4_ - 10));
               _loc8_ = LocText.current.text("guild_battle/date_time_format",AppDateTime.timestampToLocalString(_loc7_,AppDateTime.dateFormat),AppDateTime.getFormattedTimestampHM(_loc7_));
               _loc2_ = _loc2_.replace("[usertime:" + _loc7_ + "]",_loc8_);
            }
            _loc2_ = StringUtil.replace(_loc2_,"[APPLICATION_NAME]",AppConfig.appName);
            _loc3_ = StringUtil.replace(_loc3_,"[APPLICATION_NAME]",AppConfig.appName);
         }
         if(_message.flag == "partner_ad_html" || _message.flag == "system_html" || _message.flag == "item_html")
         {
            if(param1)
            {
               _loc9_ = _loc2_;
               _loc9_ = _loc9_.split("\r").join("");
               _loc9_ = _loc9_.split("\n").join("");
               _loc5_.txtMessage.htmlText = _loc9_;
            }
            else
            {
               _loc5_.txtMessage.text = "";
            }
         }
         else
         {
            _loc5_.txtMessage.text = _loc2_;
         }
         if(_message.recipients.length == 1)
         {
            _loc5_.txtReceiver.text = "";
            _loc5_.txtReceiverRight.text = _message.recipientNames;
            _loc5_.txtReceiverRight.textColor = !!_message.recipients[0].isMyGuildMember?16711908:14342874;
            _loc5_.iconReceiverGenderMale.visible = _message.recipients[0].isMale;
            _loc5_.iconReceiverGenderFemale.visible = _message.recipients[0].isFemale;
            _loc5_.iconReceiverGuild.visible = false;
            _receiverOnlinePoint.refresh(_message.recipients[0].isOnline,_message.recipients[0].name);
         }
         else
         {
            if(_message.isTeamMail)
            {
               _loc5_.txtReceiver.text = "";
               _loc5_.txtReceiverRight.text = StringUtil.cutLength(_message.recipientNames,50);
            }
            else
            {
               _loc5_.txtReceiver.text = StringUtil.cutLength(_message.recipientNames,50);
               _loc5_.txtReceiverRight.text = "";
            }
            _loc5_.iconReceiverGenderMale.visible = false;
            _loc5_.iconReceiverGenderFemale.visible = false;
            _loc5_.iconReceiverGuild.visible = _message.isTeamMail;
            _receiverOnlinePoint.refresh(false,"");
         }
         _loc5_.txtSender.text = _message.sender.name;
         _loc5_.txtSender.textColor = !!_message.sender.isMyGuildMember?16711908:14342874;
         _loc5_.txtSubject.text = _loc3_;
         _loc5_.txtUnread.visible = !_message.isRead;
         _loc5_.specialBackdrop.visible = _message.hasFlag && !_message.isSent && !_message.isTeamMail && !_message.hasItems && _message.flag != "system_html" && _message.flag != "system_team_mail" && _message.flag != "marriage_proposal";
         _loc5_.specialBackdropAcceptItem.visible = _message.hasItems;
         _loc5_.specialBackdropMarriage.visible = _message.flag == "marriage_proposal";
         _loc5_.txtMessageMarriage.visible = _message.flag == "marriage_proposal";
         _loc5_.item1.visible = _message.itemCount >= 1;
         _loc5_.item2.visible = _message.itemCount >= 2;
         _loc5_.item3.visible = _message.itemCount >= 3;
         _loc5_.item4.visible = _message.itemCount >= 4;
         _loc5_.item5.visible = _message.itemCount >= 5;
         _loc5_.txtAlreadyClaimed.visible = _message.areItemsClaimed;
         _loc5_.item1.x = _originalItem1X;
         _loc5_.item2.x = _originalItem2X;
         _loc5_.item3.x = _originalItem3X;
         _loc5_.item4.x = _originalItem4X;
         _loc5_.item5.x = _originalItem5X;
         _loc5_.btnAcceptItem.x = _originalAcceptItemButtonX;
         if(_message.itemCount == 1)
         {
            AppUiUtil.alignVerticallyCentered(_loc5_,50,_loc5_.btnAcceptItem,_loc5_.item1);
         }
         else if(_message.itemCount == 2)
         {
            AppUiUtil.alignVerticallyCentered(_loc5_,50,_loc5_.btnAcceptItem,_loc5_.item1,_loc5_.item2);
         }
         else if(_message.itemCount == 3)
         {
            AppUiUtil.alignVerticallyCentered(_loc5_,45,_loc5_.btnAcceptItem,_loc5_.item1,_loc5_.item2,_loc5_.item3);
         }
         else if(_message.itemCount == 4)
         {
            AppUiUtil.alignVerticallyCentered(_loc5_,40,_loc5_.btnAcceptItem,_loc5_.item1,_loc5_.item2,_loc5_.item3,_loc5_.item4);
         }
         else if(_message.itemCount == 5)
         {
            AppUiUtil.alignVerticallyCentered(_loc5_,40,_loc5_.btnAcceptItem,_loc5_.item1,_loc5_.item2,_loc5_.item3,_loc5_.item4,_loc5_.item5);
         }
         if(_loc5_.specialBackdrop.visible)
         {
            _loc5_.txtMessage.height = _originalMessageHeight - _loc5_.specialBackdrop.height + 2;
            _loc5_.scrollLine.height = _originalScrollLineHeight - _loc5_.specialBackdrop.height + 2;
            _scrollBar.refresh();
         }
         else if(_loc5_.specialBackdropAcceptItem.visible)
         {
            if(_message.areItemsLoaded)
            {
               if(_message.itemCount >= 1)
               {
                  _item1.item = User.current.character.getItemById(_message.item1Id);
               }
               if(_message.itemCount >= 2)
               {
                  _item2.item = User.current.character.getItemById(_message.item2Id);
               }
               if(_message.itemCount >= 3)
               {
                  _item3.item = User.current.character.getItemById(_message.item3Id);
               }
               if(_message.itemCount >= 4)
               {
                  _item4.item = User.current.character.getItemById(_message.item4Id);
               }
               if(_message.itemCount >= 5)
               {
                  _item5.item = User.current.character.getItemById(_message.item5Id);
               }
            }
            else
            {
               Environment.application.sendActionRequest("getMessageItems",{"message_id":_message.id},handleRequests);
            }
            _loc5_.txtMessage.height = _originalMessageHeight - _loc5_.specialBackdropAcceptItem.height + 2;
            _loc5_.scrollLine.height = _originalScrollLineHeight - _loc5_.specialBackdropAcceptItem.height + 2;
            _scrollBar.refresh();
         }
         else if(_loc5_.specialBackdropMarriage.visible)
         {
            _loc5_.txtMessage.height = _originalMessageHeight - _loc5_.specialBackdropMarriage.height + 2;
            _loc5_.scrollLine.height = _originalScrollLineHeight - _loc5_.specialBackdropMarriage.height + 2;
            _scrollBar.refresh();
         }
         else
         {
            _loc5_.txtMessage.height = _originalMessageHeight;
            _loc5_.scrollLine.height = _originalScrollLineHeight;
            _scrollBar.refresh();
         }
         _scrollBar.scrollToStart(0);
         _btnGuildAccept.visible = _message.flag == "guild_invitation" && !_message.isSent;
         _btnGuildDecline.visible = _message.flag == "guild_invitation" && !_message.isSent;
         _btnGuildView.visible = _message.flag == "guild_invitation" && !_message.isSent;
         _btnGuildInviteYes.visible = _message.flag == "guild_application" && !_message.isSent;
         _btnGuildInviteNo.visible = _message.flag == "guild_application" && !_message.isSent;
         _btnPartnerAdParticipate.visible = (_message.flag == "partner_ad" || _message.flag == "partner_ad_html") && !_message.isSent;
         _btnAcceptItem.visible = _message.hasItems && !_message.isSent;
         _btnGeneric.visible = (_message.flag == "friend_invite" || _message.flag == "marriage_proposal" && !_message.flagValue) && !_message.isSent;
         _loc5_.iconSenderGenderMale.visible = _message.sender.isMale;
         _loc5_.iconSenderGenderFemale.visible = _message.sender.isFemale;
         _senderOnlinePoint.refresh(_message.sender.isOnline,_message.sender.name);
         _systemMailIcon.refresh(_message.sender.isSystem);
         _btnReply.buttonEnabled = !_message.sender.isSystem && !_message.isSent;
         _btnShowSender.buttonEnabled = !_message.sender.isSystem && !_message.isSent;
         _btnIgnore.buttonEnabled = !_message.sender.isSystem && !_message.isSent;
         _btnReport.buttonEnabled = !_message.sender.isSystem && !_message.isSent;
         _btnForward.buttonEnabled = !_message.sender.isSystem && !_message.isSent;
         if(_btnIgnore.buttonEnabled)
         {
            _btnIgnore.tooltip = LocText.current.text("dialog/mail_read/button_ignore_tooltip",_message.sender.name);
         }
         else
         {
            _btnIgnore.tooltip = "";
         }
         if(_btnReport.buttonEnabled)
         {
            _btnReport.tooltip = LocText.current.text("dialog/mail_read/button_report_tooltip",_message.sender.name);
         }
         else
         {
            _btnReport.tooltip = "";
         }
         if(_btnForward.buttonEnabled)
         {
            _btnForward.tooltip = LocText.current.text("dialog/mail_read/button_forward_tooltip");
         }
         else
         {
            _btnForward.tooltip = "";
         }
         if(!_message.isRead)
         {
            _message.markAsRead();
            User.current.character.newMessages = User.current.character.newMessages - 1;
            ViewManager.instance.baseUserPanel.refreshNewMessagesBubble();
            ViewManager.instance.baseUserPanel.refreshTitleBar();
            if(_refreshMailbox != null)
            {
               _refreshMailbox();
            }
         }
         if(_message.flag == "guild_invitation")
         {
            _btnGuildAccept.caption = LocText.current.text("dialog/mail_read/guild_invitation/button_accept");
            _btnGuildDecline.caption = LocText.current.text("dialog/mail_read/guild_invitation/button_decline");
            _btnGuildView.caption = LocText.current.text("dialog/mail_read/guild_invitation/button_view");
         }
         else if(_message.flag == "guild_application")
         {
            _btnGuildInviteYes.caption = LocText.current.text("dialog/mail_read/guild_application/button_invite");
            _btnGuildInviteNo.caption = LocText.current.text("dialog/mail_read/guild_application/button_decline");
         }
         else if(_message.flag == "partner_ad" || _message.flag == "partner_ad_html")
         {
            if(_message.buttonLabel)
            {
               _btnPartnerAdParticipate.caption = _message.buttonLabel;
            }
            else
            {
               _btnPartnerAdParticipate.caption = LocText.current.text("dialog/mail_read/partner_ad/button_participate");
            }
         }
         else if(_message.flag == "item" || _message.flag == "item_html")
         {
            _btnAcceptItem.caption = LocText.current.text("dialog/mail_read/item/button_claim");
         }
         else if(_message.flag == "friend_invite")
         {
            _btnGeneric.caption = LocText.current.text("dialog/leaderboard/button_show_player");
         }
         else if(_message.flag == "marriage_proposal")
         {
            _btnGeneric.caption = LocText.current.text("dialog/mail_read/marriage_proposal/button_accept");
            _loc5_.txtMessageMarriage.text = LocText.current.text("dialog/propose_marriage/info");
            _loc5_.txtMessageMarriage.autoFontSize = true;
         }
         if(_btnPartnerAdParticipate.visible && !_loc5_.txtAlreadyClaimed.visible && _message.flagValue.indexOf("gamelink/open_voucher_dialog") >= 0)
         {
            if(_message.flagValue == "gamelink/open_voucher_dialog/")
            {
               _btnPartnerAdParticipate.visible = false;
               _loc5_.txtAlreadyClaimed.visible = true;
               _loc5_.txtAlreadyClaimed.text = LocText.current.text("dialog/mail_read/voucher_already_claimed");
            }
            else if(_loc7_ && TimeUtil.now > _loc7_)
            {
               _btnPartnerAdParticipate.visible = false;
               _loc5_.txtAlreadyClaimed.visible = true;
               _loc5_.txtAlreadyClaimed.text = LocText.current.text("dialog/mail_read/voucher_expired");
            }
         }
      }
      
      override public function dispose() : void
      {
         if(_btnClose == null)
         {
            return;
         }
         _btnClose.dispose();
         _btnClose = null;
         _btnReply.dispose();
         _btnReply = null;
         _btnDelete.dispose();
         _btnDelete = null;
         _btnShowSender.dispose();
         _btnShowSender = null;
         _btnIgnore.dispose();
         _btnIgnore = null;
         _btnReport.dispose();
         _btnReport = null;
         _btnForward.dispose();
         _btnForward = null;
         _btnGuildAccept.dispose();
         _btnGuildAccept = null;
         _btnGuildDecline.dispose();
         _btnGuildDecline = null;
         _btnGuildView.dispose();
         _btnGuildView = null;
         _btnGuildInviteYes.dispose();
         _btnGuildInviteYes = null;
         _btnGuildInviteNo.dispose();
         _btnGuildInviteNo = null;
         _btnPartnerAdParticipate.dispose();
         _btnPartnerAdParticipate = null;
         _btnAcceptItem.dispose();
         _btnAcceptItem = null;
         _btnGeneric.dispose();
         _btnGeneric = null;
         _btnLast.dispose();
         _btnLast = null;
         _btnNext.dispose();
         _btnNext = null;
         _scrollBar.dispose();
         _scrollBar = null;
         _senderOnlinePoint.dispose();
         _senderOnlinePoint = null;
         _receiverOnlinePoint.dispose();
         _receiverOnlinePoint = null;
         super.dispose();
      }
      
      private function onClickClose(param1:InteractionEvent) : void
      {
         close();
      }
      
      private function onClickReply(param1:InteractionEvent) : void
      {
         if(_message.isTeamMail)
         {
            Environment.panelManager.showDialog(new UiTwoChoiceDialog(LocText.current.text("dialog/mail_read/team_mail_reply/title"),LocText.current.text("dialog/mail_read/team_mail_reply/text"),LocText.current.text("dialog/mail_read/team_mail_reply/button_sender"),LocText.current.text("dialog/mail_read/team_mail_reply/button_team"),onClickReplySender,onClickReplyTeam));
            return;
         }
         if(_message.recipients.length > 1)
         {
            Environment.panelManager.showDialog(new UiTwoChoiceDialog(LocText.current.text("dialog/mail_read/multi_mail_reply/title"),LocText.current.text("dialog/mail_read/multi_mail_reply/text"),LocText.current.text("dialog/mail_read/multi_mail_reply/button_sender"),LocText.current.text("dialog/mail_read/multi_mail_reply/button_all"),onClickReplySender,onClickReplyAll));
            return;
         }
         close();
         var _loc2_:String = "";
         if(_message.subject.indexOf(LocText.current.text("dialog/mail_read/reply_subject","")) === 0)
         {
            _loc2_ = _message.subject;
         }
         else
         {
            _loc2_ = LocText.current.text("dialog/mail_read/reply_subject",_message.subject);
         }
         Environment.panelManager.showDialog(new DialogMailCompose(_message.sender.name,_loc2_));
      }
      
      private function onClickForward(param1:InteractionEvent) : void
      {
         close();
         var _loc2_:String = "";
         if(_message.subject.indexOf(LocText.current.text("dialog/mail_read/forward_subject","")) === 0)
         {
            _loc2_ = _message.subject;
         }
         else
         {
            _loc2_ = LocText.current.text("dialog/mail_read/forward_subject",_message.subject);
         }
         var _loc3_:String = LocText.current.text("dialog/mail_read/forward_message",_message.sender.name,_message.message);
         Environment.panelManager.showDialog(new DialogMailCompose(null,_loc2_,_loc3_));
      }
      
      private function onClickReplySender() : void
      {
         close();
         var _loc1_:String = "";
         if(_message.subject.indexOf(LocText.current.text("dialog/mail_read/reply_subject","")) === 0)
         {
            _loc1_ = _message.subject;
         }
         else
         {
            _loc1_ = LocText.current.text("dialog/mail_read/reply_subject",_message.subject);
         }
         Environment.panelManager.showDialog(new DialogMailCompose(_message.sender.name,_loc1_));
      }
      
      private function onClickReplyTeam() : void
      {
         close();
         var _loc2_:String = "";
         if(_message.subject.indexOf(LocText.current.text("dialog/mail_read/reply_subject","")) === 0)
         {
            _loc2_ = _message.subject;
         }
         else
         {
            _loc2_ = LocText.current.text("dialog/mail_read/reply_subject",_message.subject);
         }
         var _loc3_:String = _message.sender.name;
         var _loc1_:String = "";
         var _loc4_:String = "";
         if(_message.isTeamMail)
         {
            _loc3_ = _message.recipientNames;
            _loc1_ = _message.flag;
            _loc4_ = _message.flagValue;
         }
         Environment.panelManager.showDialog(new DialogMailCompose(_loc3_,_loc2_,null,_loc1_,_loc4_));
      }
      
      private function onClickReplyAll() : void
      {
         close();
         var _loc1_:String = "";
         if(_message.subject.indexOf(LocText.current.text("dialog/mail_read/reply_subject","")) === 0)
         {
            _loc1_ = _message.subject;
         }
         else
         {
            _loc1_ = LocText.current.text("dialog/mail_read/reply_subject",_message.subject);
         }
         var _loc2_:String = _message.recipientNames.replace(User.current.character.name,_message.sender.name);
         Environment.panelManager.showDialog(new DialogMailCompose(_loc2_,_loc1_));
      }
      
      private function onClickDelete(param1:InteractionEvent) : void
      {
         interactionEvent = param1;
         var deleteCallback:Function = function():void
         {
            Environment.application.sendActionRequest("deleteMessages",{"message_ids":_message.id},handleRequests);
         };
         if(_message.flag == "item" || _message.flag == "item_html")
         {
            if(!_message.areItemsClaimed)
            {
               Environment.panelManager.showDialog(new UiTwoChoiceDialog(LocText.current.text("general/mail/confirm_delete_title"),LocText.current.text("general/mail/confirm_items_delete_text"),LocText.current.text("general/button_yes"),LocText.current.text("general/button_no"),deleteCallback));
               return;
            }
         }
         if(_message.flag == "marriage_proposal")
         {
            if(!_message.flagValue)
            {
               Environment.panelManager.showDialog(new UiTwoChoiceDialog(LocText.current.text("general/mail/confirm_delete_title"),LocText.current.text("general/mail/confirm_marriage_proposal_delete_text"),LocText.current.text("general/button_yes"),LocText.current.text("general/button_no"),deleteCallback));
               return;
            }
         }
         Environment.panelManager.showDialog(new UiTwoChoiceDialog(LocText.current.text("general/mail/confirm_delete_title"),LocText.current.text("general/mail/confirm_delete_text"),LocText.current.text("general/button_yes"),LocText.current.text("general/button_no"),deleteCallback));
      }
      
      private function onClickShowSender(param1:InteractionEvent) : void
      {
         if(_message.characterFromId == -1)
         {
            return;
         }
         if(_message.characterFromId == User.current.character.id)
         {
            ViewManager.instance.showPanel("character");
            close();
            Runtime.delayFunction(closeMailbox,0.6);
            return;
         }
         Environment.application.sendActionRequest("getCharacter",{"character_id":_message.characterFromId},handleRequests);
      }
      
      private function onClickIgnore(param1:InteractionEvent) : void
      {
         Environment.application.sendActionRequest("ignoreMessageCharacter",{"character_ignore_id":_message.characterFromId},handleRequests);
      }
      
      private function onClickReport(param1:InteractionEvent) : void
      {
         Environment.panelManager.showDialog(new DialogReportUser(_message));
      }
      
      private function onClickGuildAccept(param1:InteractionEvent) : void
      {
         if(_message.flag == "guild_invitation")
         {
            Environment.application.sendActionRequest("joinGuild",{
               "guild_id":parseInt(_message.flagValue),
               "invitation":true
            },handleRequests);
         }
      }
      
      private function onClickGuildDecline(param1:InteractionEvent) : void
      {
         if(_message.flag == "guild_invitation")
         {
            Environment.application.sendActionRequest("declineGuildInvitation",{"guild_id":parseInt(_message.flagValue)},handleRequests);
         }
      }
      
      private function onClickGuildView(param1:InteractionEvent) : void
      {
         if(_message.flag == "guild_invitation")
         {
            if(parseInt(_message.flagValue) == User.current.character.guildId)
            {
               ViewManager.instance.showPanel("guild");
               close();
               Runtime.delayFunction(closeMailbox,0.6);
               return;
            }
            Environment.application.sendActionRequest("getGuild",{"guild_id":parseInt(_message.flagValue)},handleRequests);
         }
      }
      
      private function onClickGuildInviteYes(param1:InteractionEvent) : void
      {
         if(_message.flag == "guild_application")
         {
            Environment.application.sendActionRequest("inviteToGuild",{"name":_message.sender.name},handleRequests);
         }
      }
      
      private function onClickGuildInviteNo(param1:InteractionEvent) : void
      {
         close();
      }
      
      private function onClickPartnerAdParticipate(param1:InteractionEvent) : void
      {
         var _loc2_:* = null;
         var _loc3_:String = _message.flagValue;
         _loc3_ = StringUtil.replace(_loc3_,"[serverid]",ServerInfo.serverId);
         _loc3_ = StringUtil.replace(_loc3_,"[userid]",User.current.id.toString());
         _loc3_ = StringUtil.replace(_loc3_,"[sessionid]",User.current.sessionId.toString());
         if(_loc3_.indexOf("!BL!:") != -1)
         {
            _loc3_ = _loc3_.substr(0,_loc3_.indexOf("!BL!:"));
         }
         if(_loc3_ == "gamelink/open_offerwall")
         {
            close();
            Runtime.delayFunction(closeMailbox,0.6);
            platform.showOfferwall(User.current.id);
         }
         else if(_loc3_ == "gamelink/open_premium_shop")
         {
            close();
            Runtime.delayFunction(closeMailbox,0.6);
            ViewManager.instance.showBuyCurrencyDialog();
         }
         else if(_loc3_ == "gamelink/open_item_offer_shop")
         {
            close();
            Runtime.delayFunction(closeMailbox,0.6);
            Environment.panelManager.showDialog(new DialogBuyItemOffers());
         }
         else
         {
            if(_loc3_.indexOf("gamelink/open_voucher_dialog") >= 0)
            {
               close();
               _loc2_ = new DialogRedeemVoucher();
               if(_loc3_.indexOf("gamelink/open_voucher_dialog/") >= 0)
               {
                  _loc2_.setVoucherCode(_loc3_.substr(29));
                  _loc2_.setVoucherMessageId(_message.id);
               }
               Environment.panelManager.showDialog(_loc2_);
               return;
            }
            platform.openLink(_loc3_);
            close();
         }
         Environment.application.sendActionRequest("trackAdvertisment",{
            "type":1,
            "value1":_loc3_,
            "value2":"",
            "value3":""
         },null,false);
         Environment.application.sendActionRequest("trackMessageLinkClick",{"message_id":_message.id},null,false);
         close();
      }
      
      private function onClickAcceptItem(param1:InteractionEvent) : void
      {
         Environment.application.sendActionRequest("claimMessageItems",{
            "message_id":_message.id,
            "discard_item":false
         },handleRequests);
      }
      
      private function onClickGeneric(param1:InteractionEvent) : void
      {
         if(_message.flag == "friend_invite")
         {
            if(_message.flagValue == "-1")
            {
               return;
            }
            Environment.application.sendActionRequest("getCharacter",{"character_id":_message.flagValue},handleRequests);
         }
         else if(_message.flag == "marriage_proposal")
         {
            if(_message.flagValue)
            {
               return;
            }
            Environment.application.sendActionRequest("acceptMarriage",{"message_id":_message.id},handleRequests);
         }
      }
      
      private function onClickLast(param1:InteractionEvent) : void
      {
         _message = Mailbox.getPreviousMessage(_message);
         if(!_message.isLoaded)
         {
            Environment.application.sendActionRequest("getMessage",{"message_id":_message.id},handleRequests);
         }
         else
         {
            refresh();
         }
      }
      
      private function onClickNext(param1:InteractionEvent) : void
      {
         if(!Mailbox.hasNextMessage(_message))
         {
            if(_message.isSent)
            {
               if(!Mailbox.allSentMessagesLoaded())
               {
                  _btnNext.buttonEnabled = false;
                  Environment.application.sendActionRequest("getMessageList",{
                     "load_received":false,
                     "load_sent":true,
                     "load_ignored":false,
                     "offset":Mailbox.sentMessages.length,
                     "max_message_id":0
                  },handleRequests);
                  return;
               }
            }
            else if(!Mailbox.allReceivedMessagesLoaded())
            {
               _btnNext.buttonEnabled = false;
               Environment.application.sendActionRequest("getMessageList",{
                  "load_received":true,
                  "load_sent":false,
                  "load_ignored":false,
                  "offset":Mailbox.receivedMessages.length,
                  "max_message_id":0
               },handleRequests);
               return;
            }
         }
         _message = Mailbox.getNextMessage(_message);
         if(!_message.isLoaded)
         {
            Environment.application.sendActionRequest("getMessage",{"message_id":_message.id},handleRequests);
         }
         else
         {
            refresh();
         }
      }
      
      private function closeMailbox() : void
      {
         if(_closeMailbox != null)
         {
            _closeMailbox();
         }
      }
      
      private function showGuildJoinSuccess() : void
      {
         Environment.panelManager.showDialog(new UiInfoDialog(LocText.current.text("dialog/mail_compose/join_guild/success/title"),LocText.current.text("dialog/mail_compose/join_guild/success/text",User.current.character.guild.name),LocText.current.text("general/button_ok")));
      }
      
      private function onClickGotoShop() : void
      {
         close();
         Runtime.delayFunction(closeMailbox,0.6);
         ViewManager.instance.showPanel("shop");
      }
      
      private function onClickDiscardItem() : void
      {
         Environment.application.sendActionRequest("claimMessageItems",{
            "message_id":_message.id,
            "discard_item":true
         },handleRequests);
      }
      
      private function refreshItems() : void
      {
         _item1.item = User.current.character.getItemById(_message.item1Id);
         _item2.item = User.current.character.getItemById(_message.item2Id);
         _item3.item = User.current.character.getItemById(_message.item3Id);
         _item4.item = User.current.character.getItemById(_message.item4Id);
         _item5.item = User.current.character.getItemById(_message.item5Id);
      }
      
      private function handleRequests(param1:ActionRequestResponse) : void
      {
         var _loc4_:* = null;
         var _loc5_:* = null;
         var _loc3_:* = null;
         var _loc6_:int = 0;
         var _loc2_:* = null;
         var _loc7_:* = param1.action;
         switch(_loc7_)
         {
            case "inviteToGuild":
               if(param1.error == "")
               {
                  Environment.application.updateData(param1.data);
                  close();
                  Environment.panelManager.showDialog(new UiInfoDialog(LocText.current.text("dialog/guild_invitation/success_title"),LocText.current.text("dialog/guild_invitation/success_text",_message.sender.name),LocText.current.text("general/button_ok")));
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
                  close();
                  Runtime.delayFunction(closeMailbox,0.6);
                  Runtime.delayFunction(showGuildJoinSuccess,0.8);
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
               else
               {
                  Environment.reportError(param1.error,param1.request);
               }
               break;
            case "declineGuildInvitation":
               if(param1.error == "")
               {
                  Environment.application.updateData(param1.data);
                  close();
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
            case "getGuild":
               if(param1.error == "")
               {
                  Environment.application.updateData(param1.data);
                  _loc5_ = Guild.fromData(param1.data);
                  if(_loc5_.status == 2)
                  {
                     Environment.panelManager.showDialog(new UiInfoDialog(LocText.current.text("dialog/mail_compose/decline_invitation/invalid_guild/title"),LocText.current.text("dialog/mail_compose/decline_invitation/invalid_guild/text"),LocText.current.text("general/button_ok")));
                  }
                  else
                  {
                     ViewManager.instance.showGuild(_loc5_);
                     close();
                     Runtime.delayFunction(closeMailbox,0.6);
                  }
               }
               else
               {
                  Environment.reportError(param1.error,param1.request);
               }
               break;
            case "getCharacter":
               if(param1.error == "")
               {
                  Environment.application.updateData(param1.data);
                  _loc3_ = Character.fromData(param1.data);
                  ViewManager.instance.showCharacter(_loc3_);
                  close();
                  Runtime.delayFunction(closeMailbox,0.6);
               }
               else
               {
                  Environment.reportError(param1.error,param1.request);
               }
               break;
            case "getMessage":
               if(param1.error == "")
               {
                  Mailbox.updateMessageData(param1.appResponse.messages,param1.appResponse.messages_character_info,param1.appResponse.messages_read,param1.appResponse.message,null);
                  _message = Mailbox.getMessage(param1.appResponse.message.id);
                  refresh();
               }
               else
               {
                  Environment.reportError(param1.error,param1.request);
               }
               break;
            case "getMessageList":
               _btnNext.buttonEnabled = true;
               if(param1.error == "")
               {
                  Mailbox.updateMessageData(param1.appResponse.messages,param1.appResponse.messages_character_info,param1.appResponse.messages_read,null,param1.appResponse.messages_ignored_character_info,param1.request.getBoolean("load_received"),param1.request.getBoolean("load_sent"),param1.appResponse.messages_sent_count,param1.appResponse.messages_received_count);
                  if(param1.appResponse.hasData("new_messages"))
                  {
                     User.current.character.newMessages = param1.appResponse.new_messages;
                  }
                  ViewManager.instance.baseUserPanel.refreshNewMessagesBubble();
                  if(param1.request.getInt("offset") >= 0)
                  {
                     onClickNext(null);
                  }
               }
               else
               {
                  Environment.reportError(param1.error,param1.request);
               }
               break;
            case "deleteMessages":
               if(param1.error == "")
               {
                  Mailbox.maskMessageAsDeleted(_message.id);
                  close();
               }
               else
               {
                  Environment.reportError(param1.error,param1.request);
               }
               break;
            case "ignoreMessageCharacter":
               if(param1.error == "")
               {
                  Mailbox.updateMessageData(null,null,null,null,param1.appResponse.messages_ignored_character_info);
                  if(ViewManager.instance.baseUserPanel.currentMailboxDialog)
                  {
                     ViewManager.instance.baseUserPanel.currentMailboxDialog.refreshIgnoreContent();
                  }
                  close();
               }
               else if(param1.error == "errAddRecordAlreadyIgnored")
               {
                  Environment.panelManager.showDialog(new UiInfoDialog(LocText.current.text("dialog/ignore_message_character/already_ignored/title"),LocText.current.text("dialog/ignore_message_character/already_ignored/text"),LocText.current.text("general/button_ok")));
               }
               else
               {
                  Environment.reportError(param1.error,param1.request);
               }
               break;
            case "claimMessageItems":
               if(param1.error == "")
               {
                  Environment.application.updateData(param1.data);
                  Mailbox.updateMessage(param1.appResponse.message);
                  close();
               }
               else if(param1.error == "errInventoryNoEmptySlot")
               {
                  _loc6_ = 0;
                  if(_item1.item)
                  {
                     _loc6_ = _loc6_ + _item1.item.sellPrice;
                  }
                  if(_item2.item)
                  {
                     _loc6_ = _loc6_ + _item2.item.sellPrice;
                  }
                  if(_item3.item)
                  {
                     _loc6_ = _loc6_ + _item3.item.sellPrice;
                  }
                  if(_item4.item)
                  {
                     _loc6_ = _loc6_ + _item4.item.sellPrice;
                  }
                  if(_item5.item)
                  {
                     _loc6_ = _loc6_ + _item5.item.sellPrice;
                  }
                  Environment.panelManager.showDialog(new UiTwoChoiceDialog(LocText.current.text("dialog/no_free_slot/title"),LocText.current.text("dialog/no_free_slot/text",GameUtil.getGameCurrencyString(_loc6_)),LocText.current.text("dialog/no_free_slot/button_go_to_shop"),LocText.current.text("dialog/no_free_slot/button_discard_item"),onClickGotoShop,onClickDiscardItem,false));
               }
               else if(param1.error != "errCollectGoalAlreadyExists")
               {
                  Environment.reportError(param1.error,param1.request);
               }
               break;
            case "getMessageItems":
               if(param1.error == "")
               {
                  Environment.application.updateData(param1.data);
                  _loc2_ = User.current.character.getItemById(_message.item1Id);
                  if(_loc2_ && _loc2_.isMarriageRewardItem)
                  {
                     Environment.application.sendActionRequest("getMarriageData",{},handleRequests);
                  }
                  else
                  {
                     refreshItems();
                  }
               }
               else
               {
                  Environment.reportError(param1.error,param1.request);
               }
               break;
            case "acceptMarriage":
               if(param1.error == "")
               {
                  Environment.application.updateData(param1.data);
                  Mailbox.updateMessage(param1.appResponse.message);
                  User.current.character.newMessages++;
                  Mailbox.reload = true;
                  ViewManager.instance.baseUserPanel.currentMailboxDialog.mailContent.loadMessages();
                  close();
               }
               else if(param1.error == "errCreateMarriageProposalSelfToManyMarriages")
               {
                  Environment.panelManager.showDialog(new UiInfoDialog(LocText.current.text("dialog/propose_marriage/to_many_marriages_title"),LocText.current.text("dialog/propose_marriage/to_many_marriages_text"),LocText.current.text("general/button_ok")));
               }
               else if(param1.error == "errCreateMarriageProposalRecipientToManyMarriages")
               {
                  _loc4_ = _message.sender.name;
                  Environment.panelManager.showDialog(new UiInfoDialog(LocText.current.text("dialog/propose_marriage/recipient_to_many_marriages_title"),LocText.current.text("dialog/propose_marriage/recipient_to_many_marriages_text",_loc4_),LocText.current.text("general/button_ok")));
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
      
      override public function close(param1:Function = null) : void
      {
         super.close(param1);
         if(_refreshMailbox != null)
         {
            _refreshMailbox();
         }
      }
      
      override public function onEscape() : void
      {
         close();
      }
   }
}
