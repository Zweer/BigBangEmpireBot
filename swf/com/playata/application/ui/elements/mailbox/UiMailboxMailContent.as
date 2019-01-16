package com.playata.application.ui.elements.mailbox
{
   import com.playata.application.data.mailbox.Mailbox;
   import com.playata.application.data.mailbox.Message;
   import com.playata.application.data.user.User;
   import com.playata.application.ui.ViewManager;
   import com.playata.application.ui.dialogs.DialogMailCompose;
   import com.playata.application.ui.dialogs.DialogMailRead;
   import com.playata.application.ui.dialogs.DialogMailbox;
   import com.playata.application.ui.elements.generic.button.UiButton;
   import com.playata.application.ui.elements.generic.button.UiTextButton;
   import com.playata.application.ui.elements.generic.dialog.UiTwoChoiceDialog;
   import com.playata.application.ui.elements.generic.textfield.UiTextTooltip;
   import com.playata.framework.application.Environment;
   import com.playata.framework.application.request.ActionRequestResponse;
   import com.playata.framework.core.util.StringUtil;
   import com.playata.framework.display.InteractiveDisplayObject;
   import com.playata.framework.display.ui.controls.ITextInput;
   import com.playata.framework.input.InputCore;
   import com.playata.framework.input.InteractionEvent;
   import com.playata.framework.localization.LocText;
   import visuals.ui.elements.mail.SymbolMailboxMailContentGeneric;
   
   public class UiMailboxMailContent extends InteractiveDisplayObject
   {
      
      private static const MAX_LINES:int = 11;
      
      private static const SCROLL_VALUE:int = 5;
      
      private static var _currentMessagesReceived:Vector.<Message> = new Vector.<Message>();
      
      private static var _currentMessagesSent:Vector.<Message> = new Vector.<Message>();
      
      private static var _offsetReceived:int = 0;
      
      private static var _offsetSent:int = 0;
      
      private static var _receivedLoaded:Boolean = false;
      
      private static var _sentLoaded:Boolean = false;
       
      
      private var _mailBox:DialogMailbox = null;
      
      private var _content:SymbolMailboxMailContentGeneric = null;
      
      private var _btnRead:UiTextButton = null;
      
      private var _btnDelete:UiButton = null;
      
      private var _btnDeleteAll:UiButton = null;
      
      private var _btnComposeNew:UiTextButton = null;
      
      private var _btnScrollUp:UiButton = null;
      
      private var _btnScrollDown:UiButton = null;
      
      private var _tooltipFilter:UiTextTooltip = null;
      
      private var _filterReceived:String = "";
      
      private var _filterSent:String = "";
      
      private var _line1:UiMailboxLine = null;
      
      private var _line2:UiMailboxLine = null;
      
      private var _line3:UiMailboxLine = null;
      
      private var _line4:UiMailboxLine = null;
      
      private var _line5:UiMailboxLine = null;
      
      private var _line6:UiMailboxLine = null;
      
      private var _line7:UiMailboxLine = null;
      
      private var _line8:UiMailboxLine = null;
      
      private var _line9:UiMailboxLine = null;
      
      private var _line10:UiMailboxLine = null;
      
      private var _line11:UiMailboxLine = null;
      
      private var _selectedLine:UiMailboxLine = null;
      
      public function UiMailboxMailContent(param1:DialogMailbox, param2:SymbolMailboxMailContentGeneric)
      {
         _mailBox = param1;
         _content = param2;
         super(_content);
         _content.txtDateCaption.text = LocText.current.text("dialog/mailbox/date_caption");
         _content.txtNameCaption.text = LocText.current.text("dialog/mailbox/name_caption");
         _content.txtSubjectCaption.text = LocText.current.text("dialog/mailbox/subject_caption");
         _btnRead = new UiTextButton(_content.btnRead,LocText.current.text("dialog/mailbox/button_read"),"",onClickRead);
         _btnDelete = new UiButton(_content.btnDelete,LocText.current.text("dialog/mailbox/button_delete"),onClickDelete);
         _btnDeleteAll = new UiButton(_content.btnDeleteAll,LocText.current.text("dialog/mailbox/button_delete_all"),onClickDeleteAll);
         _btnComposeNew = new UiTextButton(_content.btnComposeNew,LocText.current.text("dialog/mailbox/button_compose_new"),"",onClickComposeNew);
         _btnScrollUp = new UiButton(_content.btnUp,"",onClickScrollUp);
         _btnScrollDown = new UiButton(_content.btnDown,"",onClickScrollDown);
         _line1 = new UiMailboxLine(_content.mail1,1,selectLine,doubleClickLine);
         _line2 = new UiMailboxLine(_content.mail2,2,selectLine,doubleClickLine);
         _line3 = new UiMailboxLine(_content.mail3,3,selectLine,doubleClickLine);
         _line4 = new UiMailboxLine(_content.mail4,4,selectLine,doubleClickLine);
         _line5 = new UiMailboxLine(_content.mail5,5,selectLine,doubleClickLine);
         _line6 = new UiMailboxLine(_content.mail6,6,selectLine,doubleClickLine);
         _line7 = new UiMailboxLine(_content.mail7,7,selectLine,doubleClickLine);
         _line8 = new UiMailboxLine(_content.mail8,8,selectLine,doubleClickLine);
         _line9 = new UiMailboxLine(_content.mail9,9,selectLine,doubleClickLine);
         _line10 = new UiMailboxLine(_content.mail10,10,selectLine,doubleClickLine);
         _line11 = new UiMailboxLine(_content.mail11,11,selectLine,doubleClickLine);
         onMouseWheel.add(handleMouseWheel);
         _tooltipFilter = new UiTextTooltip(_content.inputFilter,LocText.current.text("dialog/mailbox/filter_text_tooltip"));
         _content.inputFilter.text = LocText.current.text("dialog/mailbox/filter_text");
         _filterReceived = _content.inputFilter.text;
         _filterSent = _content.inputFilter.text;
         _content.inputFilter.onClick.add(handleFilterClick);
         _content.inputFilter.onChange.add(handleFilterChange);
         refreshList();
      }
      
      public static function reset() : void
      {
         _currentMessagesReceived = new Vector.<Message>();
         _currentMessagesSent = new Vector.<Message>();
         _offsetReceived = 0;
         _offsetSent = 0;
         _receivedLoaded = false;
         _sentLoaded = false;
      }
      
      override public function dispose() : void
      {
         _btnRead.dispose();
         _btnRead = null;
         _btnDelete.dispose();
         _btnDelete = null;
         _btnDeleteAll.dispose();
         _btnDeleteAll = null;
         _btnComposeNew.dispose();
         _btnComposeNew = null;
         _btnScrollUp.dispose();
         _btnScrollUp = null;
         _btnScrollDown.dispose();
         _btnScrollDown = null;
         _line1.dispose();
         _line1 = null;
         _line2.dispose();
         _line2 = null;
         _line3.dispose();
         _line3 = null;
         _line4.dispose();
         _line4 = null;
         _line5.dispose();
         _line5 = null;
         _line6.dispose();
         _line6 = null;
         _line7.dispose();
         _line7 = null;
         _line8.dispose();
         _line8 = null;
         _line9.dispose();
         _line9 = null;
         _line10.dispose();
         _line10 = null;
         _line11.dispose();
         _line11 = null;
         _tooltipFilter.dispose();
         _tooltipFilter = null;
         super.dispose();
      }
      
      public function get offset() : int
      {
         if(_mailBox.isSentTabbed)
         {
            return _offsetSent;
         }
         return _offsetReceived;
      }
      
      public function set offset(param1:int) : void
      {
         if(_mailBox.isSentTabbed)
         {
            _offsetSent = param1;
         }
         else
         {
            _offsetReceived = param1;
         }
      }
      
      public function get currentMessages() : Vector.<Message>
      {
         if(_mailBox.isSentTabbed)
         {
            return _currentMessagesSent;
         }
         return _currentMessagesReceived;
      }
      
      public function get currentMessage() : Message
      {
         if(currentMessages.length == 1)
         {
            return currentMessages[0];
         }
         return null;
      }
      
      public function addCurrentMessage(param1:Message) : void
      {
         var _loc2_:int = 0;
         if(_mailBox.isSentTabbed)
         {
            if(_currentMessagesSent.indexOf(param1) != -1)
            {
               _loc2_ = _currentMessagesSent.indexOf(param1);
               _currentMessagesSent.splice(_loc2_,1);
               return;
            }
            _currentMessagesSent.push(param1);
         }
         else
         {
            if(_currentMessagesReceived.indexOf(param1) != -1)
            {
               _loc2_ = _currentMessagesReceived.indexOf(param1);
               _currentMessagesReceived.splice(_loc2_,1);
               return;
            }
            _currentMessagesReceived.push(param1);
         }
      }
      
      public function clearCurrentMessages() : void
      {
         if(_mailBox.isSentTabbed)
         {
            _currentMessagesSent = new Vector.<Message>();
         }
         else
         {
            _currentMessagesReceived = new Vector.<Message>();
         }
      }
      
      public function get content() : SymbolMailboxMailContentGeneric
      {
         return _content;
      }
      
      public function get currentFilter() : String
      {
         if(_mailBox.isSentTabbed)
         {
            return _filterSent;
         }
         return _filterReceived;
      }
      
      public function set currentFilter(param1:String) : void
      {
         if(_mailBox.isSentTabbed)
         {
            _filterSent = param1;
         }
         else
         {
            _filterReceived = param1;
         }
      }
      
      public function loadMessages(param1:Boolean = true, param2:Boolean = false) : void
      {
         var _loc3_:int = 0;
         if(Mailbox.reload || param1 == true && _receivedLoaded == false || param2 == true && _sentLoaded == false)
         {
            offset = 0;
            _selectedLine = null;
            clearCurrentMessages();
            _loc3_ = 0;
            Environment.application.sendActionRequest("getMessageList",{
               "load_received":param1,
               "load_sent":param2,
               "load_ignored":true,
               "offset":0,
               "max_message_id":_loc3_
            },handleRequests);
         }
         else
         {
            _mailBox.refreshIgnoreContent();
         }
      }
      
      public function loadNextMessages() : void
      {
         var _loc1_:Vector.<Message> = null;
         if(_mailBox.isSentTabbed)
         {
            _loc1_ = Mailbox.sentMessages;
            Environment.application.sendActionRequest("getMessageList",{
               "load_received":false,
               "load_sent":true,
               "load_ignored":false,
               "offset":_loc1_.length,
               "max_message_id":0
            },handleRequests);
         }
         else
         {
            _loc1_ = Mailbox.receivedMessages;
            Environment.application.sendActionRequest("getMessageList",{
               "load_received":true,
               "load_sent":false,
               "load_ignored":false,
               "offset":_loc1_.length,
               "max_message_id":0
            },handleRequests);
         }
      }
      
      private function handleMouseWheel(param1:InteractionEvent) : void
      {
         if(param1.mouseWheelDelta > 0)
         {
            scrollUp(1,true);
         }
         else
         {
            scrollDown(1,true);
         }
      }
      
      private function handleFilterClick(param1:InteractionEvent) : void
      {
         if(currentFilter == LocText.current.text("dialog/mailbox/filter_text"))
         {
            _content.inputFilter.text = "";
            currentFilter = "";
         }
      }
      
      private function handleFilterChange(param1:ITextInput) : void
      {
         currentFilter = _content.inputFilter.text;
         offset = 0;
         clearCurrentMessages();
         _selectedLine = null;
         refreshList(false,true);
      }
      
      private function onClickRead(param1:InteractionEvent) : void
      {
         if(!currentMessage)
         {
            return;
         }
         var _loc2_:Message = Mailbox.getMessage(currentMessage.id);
         if(_loc2_ != null)
         {
            Environment.panelManager.showDialog(new DialogMailRead(_loc2_,refreshList,closeDialog));
         }
         else
         {
            Environment.application.sendActionRequest("getMessage",{"message_id":currentMessage.id},handleRequests);
         }
      }
      
      private function onClickDelete(param1:InteractionEvent) : void
      {
         interactionEvent = param1;
         var deleteCallback:Function = function():void
         {
            var _loc2_:String = "";
            var _loc4_:int = 0;
            var _loc3_:* = currentMessages;
            for each(var _loc1_ in currentMessages)
            {
               if(_loc2_ != "")
               {
                  _loc2_ = _loc2_ + ";";
               }
               _loc2_ = _loc2_ + _loc1_.id.toString();
            }
            Environment.application.sendActionRequest("deleteMessages",{"message_ids":_loc2_},handleRequests);
         };
         if(_mailBox.isReceivedTabbed)
         {
            var _loc4_:int = 0;
            var _loc3_:* = currentMessages;
            for each(msg in currentMessages)
            {
               if(msg.flag == "item" || msg.flag == "item_html")
               {
                  if(!msg.areItemsClaimed)
                  {
                     if(currentMessages.length == 1)
                     {
                        Environment.panelManager.showDialog(new UiTwoChoiceDialog(LocText.current.text("general/mail/confirm_delete_title"),LocText.current.text("general/mail/confirm_items_delete_text"),LocText.current.text("general/button_yes"),LocText.current.text("general/button_no"),deleteCallback));
                     }
                     else
                     {
                        Environment.panelManager.showDialog(new UiTwoChoiceDialog(LocText.current.text("general/mail/confirm_delete_title"),LocText.current.text("general/mail/confirm_multiple_items_delete_text"),LocText.current.text("general/button_yes"),LocText.current.text("general/button_no"),deleteCallback));
                     }
                     return;
                  }
               }
            }
         }
         Environment.panelManager.showDialog(new UiTwoChoiceDialog(LocText.current.text("general/mail/confirm_delete_title"),LocText.current.text("general/mail/confirm_delete_text"),LocText.current.text("general/button_yes"),LocText.current.text("general/button_no"),deleteCallback));
      }
      
      private function onClickDeleteAll(param1:InteractionEvent) : void
      {
         interactionEvent = param1;
         var deleteCallback:Function = function():void
         {
            Environment.application.sendActionRequest("deleteAllMessages",{
               "sent_messages":_mailBox.isSentTabbed,
               "max_message_id":Mailbox.getMaxMessageId()
            },handleRequests);
         };
         if(_mailBox.isReceivedTabbed)
         {
            var _loc4_:int = 0;
            var _loc3_:* = Mailbox.receivedMessages;
            for each(msg in Mailbox.receivedMessages)
            {
               if(msg.flag == "item" || msg.flag == "item_html")
               {
                  if(!msg.areItemsClaimed)
                  {
                     Environment.panelManager.showDialog(new UiTwoChoiceDialog(LocText.current.text("general/mail/confirm_delete_title"),LocText.current.text("general/mail/confirm_multiple_items_delete_text"),LocText.current.text("general/button_yes"),LocText.current.text("general/button_no"),deleteCallback));
                     return;
                  }
               }
            }
         }
         Environment.panelManager.showDialog(new UiTwoChoiceDialog(LocText.current.text("general/mail/confirm_delete_all_title"),LocText.current.text("general/mail/confirm_delete_all_text"),LocText.current.text("general/button_yes"),LocText.current.text("general/button_no"),deleteCallback));
      }
      
      private function onClickComposeNew(param1:InteractionEvent) : void
      {
         closeDialog();
         Environment.panelManager.showDialog(new DialogMailCompose());
      }
      
      private function onClickScrollUp(param1:InteractionEvent) : void
      {
         scrollUp(5,false);
      }
      
      private function onClickScrollDown(param1:InteractionEvent) : void
      {
         scrollDown(5,false);
      }
      
      private function scrollUp(param1:int, param2:Boolean) : void
      {
         if(!_btnScrollUp.visible)
         {
            return;
         }
         offset = offset - param1;
         if(offset < 0)
         {
            offset = 0;
            param2 = false;
         }
         if(param2)
         {
            Environment.audio.playFX("ui_button_click.mp3");
         }
         refreshList();
      }
      
      private function scrollDown(param1:int, param2:Boolean) : void
      {
         if(!_btnScrollDown.visible)
         {
            return;
         }
         offset = offset + param1;
         if(offset > currentMessageCount - 11)
         {
            offset = currentMessageCount - 11;
            param2 = false;
            if(_mailBox.isReceivedTabbed)
            {
               if(!Mailbox.allReceivedMessagesLoaded())
               {
                  loadNextMessages();
               }
            }
            else if(_mailBox.isSentTabbed)
            {
               if(!Mailbox.allSentMessagesLoaded())
               {
                  loadNextMessages();
               }
            }
         }
         if(param2)
         {
            Environment.audio.playFX("ui_button_click.mp3");
         }
         refreshList();
      }
      
      private function get currentMessageCount() : int
      {
         if(_mailBox.isSentTabbed)
         {
            return Mailbox.sentMessages.length;
         }
         return Mailbox.receivedMessages.length;
      }
      
      public function closeDialog() : void
      {
         _mailBox.close();
      }
      
      public function resetList() : void
      {
         _selectedLine = null;
         if(_mailBox.isReceivedTabbed)
         {
            _content.txtNameCaption.text = LocText.current.text("dialog/mailbox/sender_caption");
         }
         else
         {
            _content.txtNameCaption.text = LocText.current.text("dialog/mailbox/recipients_caption");
         }
         _content.inputFilter.text = currentFilter;
      }
      
      public function refreshList(param1:Boolean = false, param2:Boolean = false) : void
      {
         if(!_mailBox || !_mailBox.isOpen)
         {
            return;
         }
         if(_mailBox.isSentTabbed && !_sentLoaded)
         {
            loadMessages(false,true);
            return;
         }
         _mailBox.refreshReceivedTabButton();
         if(_selectedLine != null && currentMessages.length == 0)
         {
            addCurrentMessage(_selectedLine.message);
         }
         var _loc4_:Vector.<Message> = Mailbox.receivedMessages;
         var _loc3_:Boolean = false;
         if(_mailBox.isSentTabbed)
         {
            _loc4_ = Mailbox.sentMessages;
            if(param2 || currentFilter.length > 0 && currentFilter != LocText.current.text("dialog/mailbox/filter_text"))
            {
               _content.txtNoMessages.text = LocText.current.text("dialog/mailbox/no_filtered_messages");
            }
            else
            {
               _content.txtNoMessages.text = LocText.current.text("dialog/mailbox/no_sent_messages");
            }
            _loc3_ = Mailbox.allSentMessagesLoaded();
         }
         else
         {
            if(param2 || currentFilter.length > 0 && currentFilter != LocText.current.text("dialog/mailbox/filter_text"))
            {
               _content.txtNoMessages.text = LocText.current.text("dialog/mailbox/no_filtered_messages");
            }
            else
            {
               _content.txtNoMessages.text = LocText.current.text("dialog/mailbox/no_received_messages");
            }
            _loc3_ = Mailbox.allReceivedMessagesLoaded();
         }
         _loc4_ = getFilteredMessages(_loc4_);
         _content.txtNoMessages.visible = _loc4_.length == 0;
         _btnScrollUp.visible = _loc4_.length > 11;
         _btnScrollDown.visible = _loc4_.length > 11;
         _btnScrollUp.buttonEnabled = offset > 0;
         if(!_loc3_)
         {
            _btnScrollDown.buttonEnabled = true;
         }
         else
         {
            _btnScrollDown.buttonEnabled = offset < currentMessageCount - 11;
         }
         _line1.refresh(_loc4_.length >= offset + 1?_loc4_[offset + 0]:null,1);
         _line2.refresh(_loc4_.length >= offset + 2?_loc4_[offset + 1]:null,2);
         _line3.refresh(_loc4_.length >= offset + 3?_loc4_[offset + 2]:null,3);
         _line4.refresh(_loc4_.length >= offset + 4?_loc4_[offset + 3]:null,4);
         _line5.refresh(_loc4_.length >= offset + 5?_loc4_[offset + 4]:null,5);
         _line6.refresh(_loc4_.length >= offset + 6?_loc4_[offset + 5]:null,6);
         _line7.refresh(_loc4_.length >= offset + 7?_loc4_[offset + 6]:null,7);
         _line8.refresh(_loc4_.length >= offset + 8?_loc4_[offset + 7]:null,8);
         _line9.refresh(_loc4_.length >= offset + 9?_loc4_[offset + 8]:null,9);
         _line10.refresh(_loc4_.length >= offset + 10?_loc4_[offset + 9]:null,10);
         _line11.refresh(_loc4_.length >= offset + 11?_loc4_[offset + 10]:null,11);
         if(currentMessages.length > 0)
         {
            _line1.highlight(currentMessages.indexOf(_line1.message) != -1);
            _line2.highlight(currentMessages.indexOf(_line2.message) != -1);
            _line3.highlight(currentMessages.indexOf(_line3.message) != -1);
            _line4.highlight(currentMessages.indexOf(_line4.message) != -1);
            _line5.highlight(currentMessages.indexOf(_line5.message) != -1);
            _line6.highlight(currentMessages.indexOf(_line6.message) != -1);
            _line7.highlight(currentMessages.indexOf(_line7.message) != -1);
            _line8.highlight(currentMessages.indexOf(_line8.message) != -1);
            _line9.highlight(currentMessages.indexOf(_line9.message) != -1);
            _line10.highlight(currentMessages.indexOf(_line10.message) != -1);
            _line11.highlight(currentMessages.indexOf(_line11.message) != -1);
            refreshButtons();
         }
         else if(_line1.message != null && param1)
         {
            selectLine(_line1);
         }
         refreshButtons();
         _tooltipFilter.text = LocText.current.text("dialog/mailbox/filter_text_tooltip");
         if(_loc3_)
         {
            if(_tooltipFilter.text.indexOf("\n") != -1)
            {
               _tooltipFilter.text = _tooltipFilter.text.substr(0,_tooltipFilter.text.indexOf("\n"));
            }
            else if(_tooltipFilter.text.indexOf("\r") != -1)
            {
               _tooltipFilter.text = _tooltipFilter.text.substr(0,_tooltipFilter.text.indexOf("\r"));
            }
         }
      }
      
      private function getFilteredMessages(param1:Vector.<Message>) : Vector.<Message>
      {
         var _loc3_:Boolean = false;
         if(StringUtil.isEmpty(currentFilter) || currentFilter == LocText.current.text("dialog/mailbox/filter_text"))
         {
            return param1;
         }
         var _loc2_:Vector.<Message> = new Vector.<Message>();
         var _loc4_:String = currentFilter.toLowerCase();
         var _loc7_:int = 0;
         var _loc6_:* = param1;
         for each(var _loc5_ in param1)
         {
            _loc3_ = false;
            if(_mailBox.isSentTabbed)
            {
               _loc3_ = _loc5_.recipientNames.toLowerCase().indexOf(_loc4_) != -1 || _loc5_.subject.toLowerCase().indexOf(_loc4_) != -1;
            }
            else
            {
               _loc3_ = _loc5_.sender.name.toLowerCase().indexOf(_loc4_) != -1 || _loc5_.subject.toLowerCase().indexOf(_loc4_) != -1;
            }
            if(_loc3_)
            {
               _loc2_.push(_loc5_);
            }
         }
         return _loc2_;
      }
      
      private function selectLine(param1:UiMailboxLine) : void
      {
         _selectedLine = param1;
         if(_selectedLine != null)
         {
            if(!InputCore.current.keyboard.isCtrlPressed)
            {
               clearCurrentMessages();
            }
            addCurrentMessage(_selectedLine.message);
         }
         _line1.highlight(currentMessages.indexOf(_line1.message) != -1);
         _line2.highlight(currentMessages.indexOf(_line2.message) != -1);
         _line3.highlight(currentMessages.indexOf(_line3.message) != -1);
         _line4.highlight(currentMessages.indexOf(_line4.message) != -1);
         _line5.highlight(currentMessages.indexOf(_line5.message) != -1);
         _line6.highlight(currentMessages.indexOf(_line6.message) != -1);
         _line7.highlight(currentMessages.indexOf(_line7.message) != -1);
         _line8.highlight(currentMessages.indexOf(_line8.message) != -1);
         _line9.highlight(currentMessages.indexOf(_line9.message) != -1);
         _line10.highlight(currentMessages.indexOf(_line10.message) != -1);
         _line11.highlight(currentMessages.indexOf(_line11.message) != -1);
         refreshButtons();
      }
      
      private function refreshButtons() : void
      {
         _btnRead.buttonEnabled = currentMessages.length == 1;
         _btnDelete.buttonEnabled = currentMessages.length > 0;
         _btnDeleteAll.buttonEnabled = _line1.message != null && (currentFilter.length == 0 || currentFilter == LocText.current.text("dialog/mailbox/filter_text"));
      }
      
      private function doubleClickLine(param1:UiMailboxLine) : void
      {
         clearCurrentMessages();
         selectLine(param1);
         onClickRead(null);
      }
      
      private function handleRequests(param1:ActionRequestResponse) : void
      {
         var _loc3_:* = null;
         var _loc4_:int = 0;
         var _loc6_:* = param1.action;
         switch(_loc6_)
         {
            case "getMessageList":
               if(param1.error == "")
               {
                  Mailbox.updateMessageData(param1.appResponse.messages,param1.appResponse.messages_character_info,param1.appResponse.messages_read,null,param1.appResponse.messages_ignored_character_info,param1.request.getBoolean("load_received"),param1.request.getBoolean("load_sent"),param1.appResponse.messages_sent_count,param1.appResponse.messages_received_count);
                  if(param1.appResponse.hasData("new_messages"))
                  {
                     User.current.character.newMessages = param1.appResponse.new_messages;
                  }
                  ViewManager.instance.baseUserPanel.refreshNewMessagesBubble();
                  _mailBox.refreshIgnoreContent();
                  if(param1.request.getBoolean("load_received") == true)
                  {
                     _receivedLoaded = true;
                  }
                  if(param1.request.getBoolean("load_sent") == true)
                  {
                     _sentLoaded = true;
                  }
                  refreshList(true);
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
                  _loc3_ = new Message(param1.appResponse.message);
                  Environment.panelManager.showDialog(new DialogMailRead(_loc3_,refreshList,closeDialog));
               }
               else
               {
                  Environment.reportError(param1.error,param1.request);
               }
               break;
            case "deleteMessages":
               if(param1.error == "")
               {
                  _loc4_ = 0;
                  _loc6_ = 0;
                  var _loc5_:* = currentMessages;
                  for each(var _loc2_ in currentMessages)
                  {
                     _loc2_.markAsDeleted();
                     if(!_loc2_.isRead)
                     {
                        _loc4_++;
                        _loc2_.markAsRead();
                     }
                  }
                  User.current.character.newMessages = User.current.character.newMessages - _loc4_;
                  ViewManager.instance.baseUserPanel.refreshNewMessagesBubble();
                  clearCurrentMessages();
                  _selectedLine = null;
                  refreshList();
               }
               else
               {
                  Environment.reportError(param1.error,param1.request);
               }
               break;
            case "deleteAllMessages":
               if(param1.error == "")
               {
                  User.current.character.newMessages = 0;
                  ViewManager.instance.baseUserPanel.refreshNewMessagesBubble();
                  Mailbox.maskMessagesAsDeleted(_mailBox.isSentTabbed);
                  offset = 0;
                  clearCurrentMessages();
                  _selectedLine = null;
                  refreshList();
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
