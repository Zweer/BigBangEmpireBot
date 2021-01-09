package com.playata.application.ui.elements.stream
{
   import com.playata.application.data.stream.PrivateConversation;
   import com.playata.application.data.stream.PrivateConversationMessage;
   import com.playata.application.data.user.User;
   import com.playata.application.ui.ViewManager;
   import com.playata.application.ui.dialogs.DialogPrivateConversationInvitation;
   import com.playata.application.ui.dialogs.DialogPrivateConversationRename;
   import com.playata.application.ui.elements.generic.button.UiButton;
   import com.playata.application.ui.elements.generic.dialog.UiInfoDialog;
   import com.playata.application.ui.elements.generic.dialog.UiTwoChoiceDialog;
   import com.playata.application.ui.elements.generic.scrollbar.UiScrollBar;
   import com.playata.framework.application.Environment;
   import com.playata.framework.application.request.ActionRequestResponse;
   import com.playata.framework.core.Runtime;
   import com.playata.framework.core.util.StringUtil;
   import com.playata.framework.display.ui.Direction;
   import com.playata.framework.display.ui.controls.ITextInput;
   import com.playata.framework.display.ui.controls.ScrollList;
   import com.playata.framework.input.InteractionEvent;
   import com.playata.framework.localization.LocText;
   import visuals.ui.elements.stream.SymbolPrivateConversationMessageContainerGeneric;
   
   public class UiPrivateConversationMessageContainer extends ScrollList
   {
       
      
      private var _content:SymbolPrivateConversationMessageContainerGeneric = null;
      
      private var _btnSend:UiButton = null;
      
      private var _btnDismiss:UiButton = null;
      
      private var _btnRename:UiButton = null;
      
      private var _btnInvite:UiButton = null;
      
      private var _btnLeave:UiButton = null;
      
      private var _moreMembers:UiPrivateConversationMemberMore = null;
      
      private var _initFooterY:Number = 0;
      
      private var _initHeight:Number = 0;
      
      private var _initScrollbarHeight:Number = 0;
      
      private var _lockSyncMessages:Boolean = false;
      
      private var _privateConversation:PrivateConversation = null;
      
      private var _members:Vector.<UiPrivateConversationMember>;
      
      private var _originalTitleWidth:int = 0;
      
      public function UiPrivateConversationMessageContainer(param1:SymbolPrivateConversationMessageContainerGeneric)
      {
         _members = new Vector.<UiPrivateConversationMember>(0);
         _content = param1;
         _moreMembers = new UiPrivateConversationMemberMore(_content.header.moreMembers);
         _content.header.members.removeAllChildren();
         _content.header.txtTitle.autoFontSize = true;
         _content.footer.inputMessage.onKeyDown.add(handleMessageKeyDown);
         _content.footer.inputMessage.onChange.add(handleMessageChange);
         _btnSend = new UiButton(_content.footer.btnSend,LocText.current.text("panel_streams/private_conversation_message/send_tooltip"),onClickSend);
         _btnDismiss = new UiButton(_content.header.btnDelete,LocText.current.text("panel_streams/private_conversation_message/hide_tooltip"),onClickDismiss);
         _btnRename = new UiButton(_content.header.btnRename,LocText.current.text("panel_streams/private_conversation_message/rename_tooltip"),onClickRename);
         _btnInvite = new UiButton(_content.header.btnInvite,LocText.current.text("panel_streams/private_conversation_message/invite_tooltip"),onClickInvite);
         _btnLeave = new UiButton(_content.header.btnLeave,LocText.current.text("panel_streams/private_conversation_message/leave_tooltip"),onClickLeave);
         _btnRename.visible = false;
         _btnInvite.visible = false;
         _btnLeave.visible = false;
         _content.header.txtTitle.autoFontSize = true;
         _originalTitleWidth = int(_content.header.txtTitle.width);
         super(_content.listContainer,UiPrivateConversationMessage,Direction.VERTICAL,new UiScrollBar(_content.scrollBarKnob,_content.scrollBarLine,this),null,null,false,false,sortById);
         if(Environment.info.isTouchScreen)
         {
            appendFromEnd = true;
            appendFromEndPadding = 5;
         }
      }
      
      public function refreshLocalization() : void
      {
         _btnSend.tooltip = LocText.current.text("panel_streams/private_conversation_message/send_tooltip");
         _btnDismiss.tooltip = LocText.current.text("panel_streams/private_conversation_message/hide_tooltip");
         _btnRename.tooltip = LocText.current.text("panel_streams/private_conversation_message/rename_tooltip");
         _btnInvite.tooltip = LocText.current.text("panel_streams/private_conversation_message/invite_tooltip");
         _btnLeave.tooltip = LocText.current.text("panel_streams/private_conversation_message/leave_tooltip");
         var _loc3_:int = 0;
         var _loc2_:* = _lines;
         for each(var _loc1_ in _lines)
         {
            _loc1_.refreshLocalization();
         }
      }
      
      public function get content() : SymbolPrivateConversationMessageContainerGeneric
      {
         return _content;
      }
      
      public function get privateConversation() : PrivateConversation
      {
         return _privateConversation;
      }
      
      public function init() : void
      {
         _content.footer.inputMessage.text = "";
      }
      
      public function reset() : void
      {
         _moreMembers.clear();
         _content.visible = false;
         clear();
         _members.length = 0;
         _privateConversation = null;
      }
      
      public function refresh() : void
      {
         if(!_content.visible)
         {
            return;
         }
         if(_privateConversation.hasPendingSync)
         {
            _privateConversation.sync(function():void
            {
               open(_privateConversation);
            });
            return;
         }
         _content.header.txtTitle.text = privateConversation.title;
         syncMessages();
      }
      
      public function open(param1:PrivateConversation) : void
      {
         var _loc2_:* = null;
         if(_initHeight == 0)
         {
            _initHeight = _content.height;
            _initFooterY = _content.footer.y;
            _initScrollbarHeight = _content.scrollBarLine.height;
         }
         _privateConversation = param1;
         _content.visible = true;
         _moreMembers.closeMembers();
         _moreMembers.clear();
         _moreMembers.visible = false;
         _content.header.txtTitle.text = param1.title;
         _content.header.members.removeAllChildren(true);
         _members.length = 0;
         _content.footer.visible = _privateConversation.isGroup || !_privateConversation.singleConversationMember.isDeleted;
         _btnRename.visible = _content.footer.visible && _privateConversation.isGroup;
         _btnInvite.visible = _content.footer.visible && _privateConversation.isGroup;
         _btnLeave.visible = _content.footer.visible && _privateConversation.isGroup && _privateConversation.memberCount >= 1;
         if(_btnLeave.visible)
         {
            _content.header.txtTitle.width = _originalTitleWidth;
         }
         else
         {
            _content.header.txtTitle.width = _originalTitleWidth + (_btnDismiss.x - _btnLeave.x);
         }
         var _loc3_:* = 0;
         var _loc6_:int = 0;
         var _loc5_:* = param1.members.keys;
         for each(var _loc4_ in param1.members.keys)
         {
            if(!param1.members.getData(_loc4_).isMe)
            {
               _loc2_ = new UiPrivateConversationMember(param1,param1.members.getData(_loc4_),onMemberActionBarOpen);
               _loc2_.x = _loc3_;
               _members.push(_loc2_);
               _loc3_ = Number(_loc3_ + (_loc2_.width + 5));
               if(_loc3_ > 340)
               {
                  if(!_moreMembers.visible)
                  {
                     _moreMembers.x = _loc3_ - _loc2_.width;
                     _moreMembers.visible = true;
                  }
                  _moreMembers.addMember(_loc2_);
               }
               else
               {
                  _content.header.members.addChild(_loc2_);
               }
            }
         }
         syncMessages(true);
      }
      
      private function syncMessages(param1:Boolean = false) : void
      {
         forceToEnd = param1;
         if(_lockSyncMessages)
         {
            return;
         }
         var toEnd:Boolean = forceToEnd || isAtScrollMax(_direction);
         syncItemsFromCollection(privateConversation.messages);
         if(toEnd)
         {
            Runtime.delayFunction(function():void
            {
               scrollToEnd(_direction,0);
            },0.05);
         }
      }
      
      private function onMemberActionBarOpen(param1:UiPrivateConversationMember) : void
      {
         var _loc4_:int = 0;
         var _loc3_:* = _members;
         for each(var _loc2_ in _members)
         {
            if(_loc2_ != param1)
            {
               _loc2_.closeActionBar();
            }
         }
      }
      
      private function handleMessageKeyDown(param1:InteractionEvent) : void
      {
         if(param1.charCode == 13 && param1.controlKey)
         {
            sendMessage();
         }
         else if(param1.charCode == 27)
         {
            _content.footer.inputMessage.text = "";
         }
         else if(param1.charCode != 9)
         {
            if(param1.charCode == 8)
            {
               Runtime.delayFunction(updateFooterHeight,0.001);
            }
         }
      }
      
      private function handleMessageChange(param1:ITextInput) : void
      {
         Runtime.delayFunction(updateFooterHeight,0.001);
      }
      
      private function updateFooterHeight() : void
      {
         var _loc3_:Number = NaN;
         var _loc4_:int = Math.min(_content.footer.inputMessage.numLines,4);
         var _loc2_:* = 20.25;
         var _loc1_:Number = _loc2_ * _loc4_;
         if(_content.footer.inputMessage.height != _loc1_)
         {
            _loc3_ = _content.footer.inputMessage.height - _loc1_;
            _content.footer.inputMessage.height = _loc1_;
            _content.footer.inputMessage.y = _content.footer.inputMessage.y + _loc3_;
            _content.footer.textFieldBackground.height = _content.footer.textFieldBackground.height - _loc3_;
            _content.footer.textFieldBackground.y = _content.footer.textFieldBackground.y + _loc3_;
            _content.background.height = _content.background.height + _loc3_;
            _scrollContainer.height = _scrollContainer.height + _loc3_;
            _content.scrollBarLine.height = _content.scrollBarLine.height + _loc3_;
            refresh();
         }
      }
      
      private function onClickSend(param1:InteractionEvent) : void
      {
         sendMessage();
      }
      
      private function onClickDismiss(param1:InteractionEvent) : void
      {
         dismissPrivateConversation();
      }
      
      private function onClickRename(param1:InteractionEvent) : void
      {
         Environment.panelManager.showDialog(new DialogPrivateConversationRename(_privateConversation.id));
      }
      
      private function onClickInvite(param1:InteractionEvent) : void
      {
         Environment.panelManager.showDialog(new DialogPrivateConversationInvitation(_privateConversation.id));
      }
      
      private function onClickLeave(param1:InteractionEvent) : void
      {
         interactionEvent = param1;
         var leaveCallback:Function = function():void
         {
            Environment.application.sendActionRequest("leavePrivateConversation",{"private_conversation_id":_privateConversation.id},handleRequests);
         };
         Environment.panelManager.showDialog(new UiTwoChoiceDialog(LocText.current.text("panel_streams/private_conversation_message/confirm_leave_title"),LocText.current.text("panel_streams/private_conversation_message/confirm_leave_text"),LocText.current.text("general/button_yes"),LocText.current.text("general/button_no"),leaveCallback));
      }
      
      private function sendMessage() : void
      {
         if(StringUtil.isEmpty(_content.footer.inputMessage.text))
         {
            Environment.display.focus = _content.footer.inputMessage;
            return;
         }
         Environment.application.sendActionRequest("sendStreamMessage",{
            "stream_type":"p",
            "stream_id":_privateConversation.id,
            "message":_content.footer.inputMessage.text
         },handleRequests);
         _content.footer.inputMessage.text = "";
         updateFooterHeight();
      }
      
      private function dismissPrivateConversation() : void
      {
         Environment.application.sendActionRequest("dismissStream",{
            "stream_type":"p",
            "stream_id":_privateConversation.id,
            "last_read_message_id":_privateConversation.maxMessageId
         },handleRequests);
      }
      
      private function sortById(param1:PrivateConversationMessage, param2:PrivateConversationMessage) : int
      {
         if(param1.id < param2.id)
         {
            return -1;
         }
         if(param1.id > param2.id)
         {
            return 1;
         }
         return 0;
      }
      
      private function loadMoreMessages() : void
      {
         Environment.application.sendActionRequest("getStreamMessages",{
            "stream_type":"p",
            "stream_id":_privateConversation.id,
            "start_message_id":_privateConversation.minMessageId - 1
         },handleRequests);
      }
      
      private function handleRequests(param1:ActionRequestResponse) : void
      {
         var _loc4_:* = param1.action;
         switch(_loc4_)
         {
            case "sendStreamMessage":
               if(param1.error == "")
               {
                  _lockSyncMessages = true;
                  Environment.application.updateData(param1.data);
                  _lockSyncMessages = false;
                  open(_privateConversation);
                  User.current.character.streams.privateConversations.hasUpdates = true;
                  ViewManager.instance.baseUserPanel.streamsPanel.privateConversationStreamList.sync();
               }
               else if(param1.error == "errCreateNotAllowed")
               {
                  if(_privateConversation.isGroup)
                  {
                     Environment.panelManager.showDialog(new UiInfoDialog(LocText.current.text("error/private_conversation_not_allowed/title"),LocText.current.text("error/private_conversation_not_allowed_group/text"),LocText.current.text("general/button_ok")));
                  }
                  else
                  {
                     Environment.panelManager.showDialog(new UiInfoDialog(LocText.current.text("error/private_conversation_not_allowed/title"),LocText.current.text("error/private_conversation_not_allowed/text",_privateConversation.membersString),LocText.current.text("general/button_ok")));
                  }
               }
               else
               {
                  Environment.reportError(param1.error,param1.request);
               }
               break;
            case "dismissStream":
               if(param1.error == "")
               {
                  Environment.application.updateData(param1.data);
                  try
                  {
                     User.current.character.streams.privateConversations.removePrivateConversation(_privateConversation.id);
                     ViewManager.instance.baseUserPanel.streamsPanel.privateConversationStreamList.sync();
                     reset();
                  }
                  catch(e:Error)
                  {
                  }
               }
               else if(param1.error == "errDismissNewMessages")
               {
                  Environment.panelManager.showDialog(new UiInfoDialog(LocText.current.text("general/error"),LocText.current.text("mobile/notification/new_message/text"),LocText.current.text("general/button_ok")));
               }
               else
               {
                  Environment.reportError(param1.error,param1.request);
               }
               break;
            case "getStreamMessages":
               if(param1.error == "")
               {
                  Environment.application.updateData(param1.data);
                  syncMessages();
               }
               else
               {
                  Environment.reportError(param1.error,param1.request);
               }
               break;
            case "leavePrivateConversation":
               if(param1.error == "")
               {
                  Environment.application.updateData(param1.data);
                  User.current.character.streams.privateConversations.removePrivateConversation(param1.request.getInt("private_conversation_id"));
                  ViewManager.instance.baseUserPanel.streamsPanel.privateConversationStreamList.sync();
                  reset();
               }
               else if(param1.error == "errRemoveMemberInvalidMember")
               {
                  User.current.character.streams.privateConversations.removePrivateConversation(param1.request.getInt("private_conversation_id"));
                  ViewManager.instance.baseUserPanel.streamsPanel.privateConversationStreamList.sync();
                  reset();
               }
               else if(param1.error == "errLeavePrivateConversationNoPermission")
               {
                  User.current.character.streams.privateConversations.removePrivateConversation(param1.request.getInt("private_conversation_id"));
                  ViewManager.instance.baseUserPanel.streamsPanel.privateConversationStreamList.sync();
                  reset();
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
