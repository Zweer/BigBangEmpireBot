package com.playata.application.ui.elements.guild
{
   import com.playata.application.AppConfig;
   import com.playata.application.data.AppDateTime;
   import com.playata.application.data.character.Character;
   import com.playata.application.data.guild.Guild;
   import com.playata.application.data.guild.GuildChatEmoticon;
   import com.playata.application.data.guild.GuildLogMessage;
   import com.playata.application.data.guild.GuildMember;
   import com.playata.application.data.item.LinkedBooster;
   import com.playata.application.data.item.LinkedGuildBooster;
   import com.playata.application.data.item.LinkedItem;
   import com.playata.application.data.server.SyncStates;
   import com.playata.application.data.user.User;
   import com.playata.application.ui.ViewManager;
   import com.playata.application.ui.dialogs.DialogGuildBattlePending;
   import com.playata.application.ui.dialogs.DialogGuildBattleView;
   import com.playata.application.ui.elements.generic.button.UiButton;
   import com.playata.application.ui.elements.generic.scrollbar.UiScrollBar;
   import com.playata.application.ui.elements.generic.textfield.UiChatOutputBase;
   import com.playata.application.ui.elements.generic.textfield.UiChatOutputRichTextArea;
   import com.playata.application.ui.elements.generic.textfield.UiChatOutputTextField;
   import com.playata.application.ui.elements.generic.textfield.UiTextTooltip;
   import com.playata.application.ui.panels.PanelBaseUser;
   import com.playata.application.ui.panels.PanelBattle;
   import com.playata.framework.application.Environment;
   import com.playata.framework.application.request.ActionRequestResponse;
   import com.playata.framework.core.Core;
   import com.playata.framework.core.Runtime;
   import com.playata.framework.core.collection.StringMap;
   import com.playata.framework.core.timer.ITimer;
   import com.playata.framework.core.util.StringUtil;
   import com.playata.framework.core.util.TimeUtil;
   import com.playata.framework.display.Sprite;
   import com.playata.framework.display.ui.controls.IScrollable;
   import com.playata.framework.display.ui.controls.ITextInput;
   import com.playata.framework.input.InteractionEvent;
   import com.playata.framework.localization.LocText;
   import com.playata.framework.network.NetworkCore;
   import visuals.ui.elements.guild.SymbolGuildChatTabGeneric;
   
   public class UiGuildChatTab
   {
      
      public static var CHAT_COMMAND_GUILD_MESSAGE_SHORT:String = "";
      
      public static var CHAT_COMMAND_GUILD_MESSAGE_LONG:String = "";
      
      public static var CHAT_COMMAND_GUILD_MESSAGE_SHORT_FALLBACK:String = "";
      
      public static var CHAT_COMMAND_GUILD_MESSAGE_LONG_FALLBACK:String = "";
      
      public static var CHAT_COMMAND_OFFICER_MESSAGE_SHORT:String = "";
      
      public static var CHAT_COMMAND_OFFICER_MESSAGE_LONG:String = "";
      
      public static var CHAT_COMMAND_OFFICER_MESSAGE_SHORT_FALLBACK:String = "";
      
      public static var CHAT_COMMAND_OFFICER_MESSAGE_LONG_FALLBACK:String = "";
      
      public static var CHAT_COMMAND_PRIVATE_MESSAGE:String = "";
      
      public static var CHAT_COMMAND_PRIVATE_MESSAGE_FALLBACK:String = "";
      
      public static var CHAT_COMMAND_ANSWER:String = "";
      
      public static var CHAT_COMMAND_ANSWER_FALLBACK:String = "";
      
      public static var CHAT_COMMAND_HELP:String = "";
      
      public static var CHAT_COMMAND_HELP_FALLBACK:String = "";
      
      public static var CHAT_COMMAND_EMOTE:String = "";
      
      public static var CHAT_COMMAND_HIDE_EVENTS:String = "";
      
      public static var CHAT_COMMAND_HIDE_EVENTS_FALLBACK:String = "";
      
      public static var CHAT_COMMAND_HIDE_EMOTICONS:String = "";
      
      public static var CHAT_COMMAND_HIDE_EMOTICONS_FALLBACK:String = "";
      
      public static var ITEM_PATTERN:RegExp = /[(]item[^)]*[)]/;
      
      public static var BOOSTER_Pattern:RegExp = /[(]booster[^)]*[)]/;
      
      public static var GUILD_BOOSTER_Pattern:RegExp = /[(]guildBooster[^)]*[)]/;
      
      public static var CHARACTER_ID_Pattern:RegExp = /[(]cid:[^)]*;name:[^)]*[)]/;
      
      public static var GUILD_ID_Pattern:RegExp = /[(]gid:[^)]*;name:[^)]*[)]/;
      
      private static var _instance:UiGuildChatTab = null;
      
      private static var _processedLogIds:StringMap = new StringMap();
       
      
      private const LOG_REFRESH_INTERVAL:int = 20000;
      
      private const INPUT_MODE_GUILD:int = 1;
      
      private const INPUT_MODE_PRIVATE:int = 2;
      
      private const INPUT_MODE_OFFICER:int = 3;
      
      private const GUILD_MESSAGE_COLOR:String = "#FFFFFF";
      
      private const PRIVATE_MESSAGE_COLOR:String = "#7FCBFD";
      
      private const OFFICER_MESSAGE_COLOR:String = "#7f7ffd";
      
      private const EMOTE_MESSAGE_COLOR:String = "#F2964D";
      
      private const EVENT_MESSAGE_COLOR:String = "#F0CC04";
      
      private const ERROR_MESSAGE_COLOR:String = "#FF4B4B";
      
      private const INFO_MESSAGE_COLOR:String = "#FFFAD3";
      
      private const LINK_MESSAGE_COLOR:String = "#F0CC04";
      
      private var _guild:Guild = null;
      
      protected var _content:SymbolGuildChatTabGeneric = null;
      
      private var _scrollBar:UiScrollBar = null;
      
      private var _tooltipPrefix:UiTextTooltip = null;
      
      private var _currentInputMode:int = 1;
      
      private var _currentPrivateName:String = "";
      
      private var _lastLogMessage:GuildLogMessage = null;
      
      private var _logRefreshTimer:ITimer = null;
      
      private var _btnBackgroundCollapse:UiButton = null;
      
      private var _btnBackgroundExpand:UiButton = null;
      
      private var _onCollapseChanged:Function = null;
      
      private var _initGuildLogRequest:Boolean = true;
      
      private var _guildLogRefreshing:Boolean = false;
      
      private var _guildSyncing:Boolean = false;
      
      private var _getGuildLogPending:Boolean = false;
      
      private var _delayedOutput:String = null;
      
      private var _messageCache:String = "";
      
      private var _chatOutput:UiChatOutputBase = null;
      
      private var _btnSend:UiButton = null;
      
      private var _btnEmoticon:UiButton = null;
      
      private var _emoticonPicker:UiGuildChatEmoticonPicker = null;
      
      private var _btnScrollDown:UiButton = null;
      
      private var _linkTooltip:UiGuildChatLinkTooltip;
      
      public function UiGuildChatTab(param1:SymbolGuildChatTabGeneric, param2:Function)
      {
         var _loc5_:int = 0;
         var _loc6_:int = 0;
         var _loc4_:* = null;
         super();
         _instance = this;
         CHAT_COMMAND_GUILD_MESSAGE_SHORT = LocText.current.text("chat/command/guild_short");
         CHAT_COMMAND_GUILD_MESSAGE_LONG = LocText.current.text("chat/command/guild_long");
         CHAT_COMMAND_GUILD_MESSAGE_SHORT_FALLBACK = LocText.current.text("chat/command/guild_short_fallback");
         CHAT_COMMAND_GUILD_MESSAGE_LONG_FALLBACK = LocText.current.text("chat/command/guild_long_fallback");
         if(CHAT_COMMAND_GUILD_MESSAGE_SHORT_FALLBACK.charAt(0) != "/")
         {
            CHAT_COMMAND_GUILD_MESSAGE_SHORT_FALLBACK = CHAT_COMMAND_GUILD_MESSAGE_SHORT;
         }
         if(CHAT_COMMAND_GUILD_MESSAGE_LONG_FALLBACK.charAt(0) != "/")
         {
            CHAT_COMMAND_GUILD_MESSAGE_LONG_FALLBACK = CHAT_COMMAND_GUILD_MESSAGE_LONG;
         }
         CHAT_COMMAND_OFFICER_MESSAGE_SHORT = LocText.current.text("chat/command/officer_short");
         CHAT_COMMAND_OFFICER_MESSAGE_LONG = LocText.current.text("chat/command/officer_long");
         CHAT_COMMAND_OFFICER_MESSAGE_SHORT_FALLBACK = LocText.current.text("chat/command/officer_short_fallback");
         CHAT_COMMAND_OFFICER_MESSAGE_LONG_FALLBACK = LocText.current.text("chat/command/officer_long_fallback");
         if(CHAT_COMMAND_OFFICER_MESSAGE_SHORT_FALLBACK.charAt(0) != "/")
         {
            CHAT_COMMAND_OFFICER_MESSAGE_SHORT_FALLBACK = CHAT_COMMAND_OFFICER_MESSAGE_SHORT;
         }
         if(CHAT_COMMAND_OFFICER_MESSAGE_LONG_FALLBACK.charAt(0) != "/")
         {
            CHAT_COMMAND_OFFICER_MESSAGE_LONG_FALLBACK = CHAT_COMMAND_OFFICER_MESSAGE_LONG;
         }
         CHAT_COMMAND_PRIVATE_MESSAGE = LocText.current.text("chat/command/private");
         CHAT_COMMAND_PRIVATE_MESSAGE_FALLBACK = LocText.current.text("chat/command/private_fallback");
         if(CHAT_COMMAND_PRIVATE_MESSAGE_FALLBACK.charAt(0) != "/")
         {
            CHAT_COMMAND_PRIVATE_MESSAGE_FALLBACK = CHAT_COMMAND_PRIVATE_MESSAGE;
         }
         CHAT_COMMAND_ANSWER = LocText.current.text("chat/command/answer");
         CHAT_COMMAND_ANSWER_FALLBACK = LocText.current.text("chat/command/answer_fallback");
         if(CHAT_COMMAND_ANSWER_FALLBACK.charAt(0) != "/")
         {
            CHAT_COMMAND_ANSWER_FALLBACK = CHAT_COMMAND_ANSWER;
         }
         CHAT_COMMAND_HELP = LocText.current.text("chat/command/help");
         CHAT_COMMAND_HELP_FALLBACK = LocText.current.text("chat/command/help_fallback");
         if(CHAT_COMMAND_HELP_FALLBACK.charAt(0) != "/")
         {
            CHAT_COMMAND_HELP_FALLBACK = CHAT_COMMAND_HELP;
         }
         CHAT_COMMAND_EMOTE = LocText.current.text("chat/command/emote");
         CHAT_COMMAND_HIDE_EVENTS = LocText.current.text("chat/command/hide_events");
         CHAT_COMMAND_HIDE_EVENTS_FALLBACK = LocText.current.text("chat/command/hide_events_fallback");
         if(CHAT_COMMAND_HIDE_EVENTS_FALLBACK.charAt(0) != "/")
         {
            CHAT_COMMAND_HIDE_EVENTS_FALLBACK = CHAT_COMMAND_HIDE_EVENTS;
         }
         CHAT_COMMAND_HIDE_EMOTICONS = LocText.current.text("chat/command/hide_emotions");
         CHAT_COMMAND_HIDE_EMOTICONS_FALLBACK = LocText.current.text("chat/command/hide_emotions_fallback");
         if(CHAT_COMMAND_HIDE_EMOTICONS_FALLBACK.charAt(0) != "/")
         {
            CHAT_COMMAND_HIDE_EMOTICONS_FALLBACK = CHAT_COMMAND_HIDE_EMOTICONS;
         }
         _content = param1;
         _content.btnSend.visible = false;
         _onCollapseChanged = param2;
         if(AppConfig.emoticonsEnabled != true)
         {
            _chatOutput = new UiChatOutputTextField(_content.txtOutput);
         }
         else
         {
            _chatOutput = new UiChatOutputRichTextArea(_content.txtOutput);
            _content.inputMessage.width = _content.inputMessage.width - (_content.btnEmoticon.width + 10);
         }
         _chatOutput.init(handleLink);
         _scrollBar = new UiScrollBar(_content.scrollKnob,_content.scrollLine,_chatOutput.textField);
         _chatOutput.textField.verticalScrollBar = _scrollBar;
         var _loc3_:String = LocText.current.text("guild/chat/prefix_tooltip");
         if(!AppConfig.emoticonsEnabled)
         {
            _loc5_ = _loc3_.indexOf(CHAT_COMMAND_HIDE_EMOTICONS);
            _loc6_ = _loc3_.indexOf("/",_loc5_ + 1);
            _loc4_ = _loc3_.substring(0,_loc5_);
            if(_loc6_ > 0)
            {
               _loc4_ = _loc4_ + _loc3_.substring(_loc6_);
            }
            _loc3_ = StringUtil.trim(_loc4_);
         }
         _loc3_ = _loc3_ + ("\n\n" + LocText.current.text("guild/chat/_character_guild_link_tooltip"));
         _tooltipPrefix = new UiTextTooltip(_content.txtPrefix,_loc3_,null,600);
         _content.inputMessage.onKeyDown.add(onInputKeyDown);
         _content.inputMessage.onChange.add(onInputChanged);
         _content.inputMessage.maxChars = 250;
         _btnBackgroundCollapse = new UiButton(btnCollapse,LocText.current.text("guild/bottom_frame/collapse_tooltip"),onClickBackgroundCollapse);
         _btnBackgroundExpand = new UiButton(btnExpand,LocText.current.text("guild/bottom_frame/expand_tooltip"),onClickBackgroundExpand);
         _btnSend = new UiButton(_content.btnSend,"",onClickSend);
         _btnEmoticon = new UiButton(_content.btnEmoticon,"",onClickEmoticon);
         _btnEmoticon.visible = _chatOutput is UiChatOutputRichTextArea;
         if(Environment.info.isTouchScreen)
         {
            _btnSend.visible = false;
            _chatOutput.textField.fontSize = 16;
            _content.txtPrefix.fontSize = 16;
         }
         _btnScrollDown = new UiButton(_content.btnScrollDown,LocText.current.text("guild/chat/btn_scroll_down"),scrollToBottom);
         _btnScrollDown.visible = false;
         _chatOutput.textField.onScroll.add(onScroll);
         _emoticonPicker = new UiGuildChatEmoticonPicker(_content.emoticonPicker,onEmoticonPickerOpen,onEmoticonPickerClose);
         if(Environment.info.isTouchScreen)
         {
            _content.emoticonPicker.x = _content.emoticonPicker.x - 120;
            _content.emoticonPicker.y = _content.emoticonPicker.y + 30;
            _content.emoticonPicker.scale = 0.9;
         }
         _content.btnScrollDown.bringToTop();
         _linkTooltip = new UiGuildChatLinkTooltip(_content.linkTooltip,processLink);
         _content.linkTooltip.bringToTop();
         collapse(true);
         setInputMode(1);
      }
      
      public static function get instance() : UiGuildChatTab
      {
         return _instance;
      }
      
      public static function resetProcessedLogIds() : void
      {
         _processedLogIds = new StringMap();
      }
      
      public function dispose() : void
      {
         _btnBackgroundCollapse.dispose();
         _btnBackgroundCollapse = null;
         _btnBackgroundExpand.dispose();
         _btnBackgroundExpand = null;
         _btnSend.dispose();
         _btnSend = null;
         _btnEmoticon.dispose();
         _btnEmoticon = null;
         _btnScrollDown.dispose();
         _btnScrollDown = null;
         if(_emoticonPicker)
         {
            _emoticonPicker.dispose();
            _emoticonPicker = null;
         }
         _tooltipPrefix.dispose();
         _tooltipPrefix = null;
         _scrollBar.dispose();
         _scrollBar = null;
         _linkTooltip.dispose();
         _linkTooltip = null;
         killRefreshTimer();
      }
      
      public function clearChatLog() : void
      {
         _chatOutput.clear();
      }
      
      protected function get bgCollapsed() : Sprite
      {
         return _content.bgCollapsed;
      }
      
      protected function get bgExpanded() : Sprite
      {
         return _content.bgExpanded;
      }
      
      protected function get btnCollapse() : Sprite
      {
         return _content.bgExpanded.btnCollapse;
      }
      
      protected function get btnExpand() : Sprite
      {
         return _content.bgCollapsed.btnExpand;
      }
      
      public function collapse(param1:Boolean) : void
      {
         bgCollapsed.visible = param1;
         bgExpanded.visible = !param1;
         var _loc2_:Boolean = _chatOutput.isAtBottom();
         if(bgCollapsed.visible)
         {
            _chatOutput.y = 13;
            _chatOutput.height = 77;
         }
         else
         {
            if(_chatOutput is UiChatOutputTextField)
            {
               _chatOutput.y = -173;
            }
            else
            {
               _chatOutput.y = -179;
            }
            _chatOutput.height = 269;
         }
         _content.scrollLine.y = _chatOutput.y;
         _content.scrollLine.height = _chatOutput.height - 3;
         _content.scrollKnob.y = _chatOutput.y;
         Runtime.delayFunction(_scrollBar.refresh,0.02);
         if(_loc2_)
         {
            Runtime.delayFunction(scrollToBottom,0.02);
         }
         _content.emoticonPicker.bringToTop();
      }
      
      public function setFocus() : void
      {
         Environment.display.focus = _content.inputMessage;
      }
      
      public function reset() : void
      {
         _guild = null;
         _currentPrivateName = "";
         _lastLogMessage = null;
         _messageCache = "";
         _chatOutput.clear();
         _content.inputMessage.text = "";
         setInputMode(1);
         killRefreshTimer();
         _initGuildLogRequest = true;
      }
      
      private function onLogRefreshTimerEvent() : void
      {
         refreshGuildLog();
      }
      
      public function refreshGuildLog(param1:Boolean = false) : void
      {
         if(PanelBaseUser.isGameSyncing)
         {
            return;
         }
         if(!User.current)
         {
            killRefreshTimer();
            return;
         }
         if(_guild != null && _guild.isOwnGuild)
         {
            if(_logRefreshTimer == null && _guild.memberCount > 1)
            {
               _logRefreshTimer = Environment.createTimer("UiGuildChatTab::logRefresh",20000,onLogRefreshTimerEvent);
               _logRefreshTimer.start();
            }
            if(_initGuildLogRequest && AppConfig.emoticonsEnabled)
            {
               UiChatOutputRichTextArea(_chatOutput).emoticonsEnabled = User.current.showGuildEmoticons;
            }
            if(NetworkCore.current.serverConnection.isSocketTransportActive && SyncStates.isGetGuildLogDataSynced)
            {
               return;
            }
            getGuildLog(param1);
         }
      }
      
      private function getGuildLog(param1:Boolean = false) : void
      {
         if(!User.current)
         {
            return;
         }
         if(!_guild || _guildLogRefreshing || _guildSyncing || _getGuildLogPending)
         {
            return;
         }
         _getGuildLogPending = true;
         Environment.application.sendActionRequest("getGuildLog",SyncStates.getGuildLogData(_initGuildLogRequest),handleRequests,param1);
         _initGuildLogRequest = false;
      }
      
      private function onClickBackgroundCollapse(param1:InteractionEvent) : void
      {
      }
      
      private function onClickBackgroundExpand(param1:InteractionEvent) : void
      {
      }
      
      private function onClickSend(param1:InteractionEvent) : void
      {
         sendMessage();
      }
      
      private function onClickEmoticon(param1:InteractionEvent) : void
      {
         _emoticonPicker.open(onEmoticonSelected);
      }
      
      private function onEmoticonPickerOpen() : void
      {
      }
      
      private function onEmoticonPickerClose() : void
      {
      }
      
      private function onEmoticonSelected(param1:GuildChatEmoticon) : void
      {
         _content.inputMessage.appendText(param1.codes[0]);
         if(!Environment.info.isTouchScreen)
         {
            Environment.display.focus = _content.inputMessage;
         }
      }
      
      private function handleLink(param1:InteractionEvent) : void
      {
         if(param1.linkVector && param1.linkVector.length > 2)
         {
            _linkTooltip.refresh(param1);
            return;
         }
         processLink(param1.linkText);
      }
      
      private function processLink(param1:String) : void
      {
         var _loc2_:* = null;
         var _loc3_:* = null;
         var _loc4_:* = null;
         if(param1.indexOf("whisper;") === 0)
         {
            _loc2_ = param1.substr(8);
            _currentPrivateName = _loc2_;
            setInputMode(2);
            Environment.display.focus = _content.inputMessage;
         }
         else if(param1.indexOf("guild;") === 0)
         {
            if(ViewManager.instance.activePanelInstance is PanelBattle)
            {
               return;
            }
            if(Environment.panelManager.dialogManager.hasVisibleDialog())
            {
               return;
            }
            _loc3_ = param1.substr(6);
            ViewManager.instance.loadGuild(parseInt(_loc3_),null);
         }
         else if(param1.indexOf("character;") === 0)
         {
            if(ViewManager.instance.activePanelInstance is PanelBattle)
            {
               return;
            }
            if(Environment.panelManager.dialogManager.hasVisibleDialog())
            {
               return;
            }
            _loc4_ = param1.substr(10);
            ViewManager.instance.loadCharacter(parseInt(_loc4_),null);
         }
         else if(param1.indexOf("http://") != -1 || param1.indexOf("https://") != -1)
         {
            Core.current.linkHandler.openLink(param1);
         }
         else if(param1.indexOf("www") != -1)
         {
            Core.current.linkHandler.openLink("http://" + param1);
         }
      }
      
      public function refresh(param1:Guild) : void
      {
         if(Environment.info.isTouchScreen)
         {
            _content.inputMessage.fontSize = 18;
         }
         _guild = param1;
         refreshGuildLog();
      }
      
      private function onInputKeyDown(param1:InteractionEvent) : void
      {
         var _loc2_:* = null;
         var _loc4_:* = null;
         var _loc3_:* = null;
         if(param1.charCode == 13)
         {
            sendMessage();
         }
         else if(param1.charCode == 27)
         {
            resetChatInput();
         }
         else if(param1.charCode == 9)
         {
            if(currentInput.toLowerCase() == CHAT_COMMAND_GUILD_MESSAGE_SHORT_FALLBACK || currentInput.toLowerCase() == CHAT_COMMAND_GUILD_MESSAGE_LONG_FALLBACK || currentInput.toLowerCase() == CHAT_COMMAND_GUILD_MESSAGE_SHORT || currentInput.toLowerCase() == CHAT_COMMAND_GUILD_MESSAGE_LONG)
            {
               setInputMode(1);
            }
            else if(currentInput.toLowerCase() == CHAT_COMMAND_OFFICER_MESSAGE_SHORT_FALLBACK || currentInput.toLowerCase() == CHAT_COMMAND_OFFICER_MESSAGE_LONG_FALLBACK || currentInput.toLowerCase() == CHAT_COMMAND_OFFICER_MESSAGE_SHORT || currentInput.toLowerCase() == CHAT_COMMAND_OFFICER_MESSAGE_LONG)
            {
               if(User.current.character.guildRank == 3)
               {
                  appendMessage(getMessage("#FF4B4B",LocText.current.text("guild/chat/error_no_officer_permission")));
                  resetChatInput();
                  return;
               }
               setInputMode(3);
            }
            else if(currentInput.toLowerCase() == CHAT_COMMAND_ANSWER_FALLBACK || currentInput.toLowerCase() == CHAT_COMMAND_ANSWER)
            {
               _loc2_ = User.current.character.guild.lastReceivedPrivateMessage;
               if(_loc2_ != null)
               {
                  _currentPrivateName = _loc2_.characterName;
                  setInputMode(2);
               }
            }
            else if(currentInput.toLowerCase().indexOf(CHAT_COMMAND_PRIVATE_MESSAGE + " ") == 0 || currentInput.toLowerCase().indexOf(CHAT_COMMAND_PRIVATE_MESSAGE_FALLBACK + " ") == 0)
            {
               _loc4_ = currentInput.substring(currentInput.indexOf(" ") + 1);
               if(StringUtil.isEmpty(_loc4_))
               {
                  return;
               }
               _loc3_ = _guild.findMember(_loc4_,true);
               if(_loc3_ != null)
               {
                  _currentPrivateName = _loc3_.name;
                  setInputMode(2);
               }
            }
         }
      }
      
      private function checkInputMode() : void
      {
         var _loc1_:* = null;
         var _loc2_:* = null;
         var _loc3_:String = null;
         if(currentInput.toLowerCase().indexOf(CHAT_COMMAND_GUILD_MESSAGE_SHORT_FALLBACK + " ") == 0 || currentInput.toLowerCase().indexOf(CHAT_COMMAND_GUILD_MESSAGE_LONG_FALLBACK + " ") == 0 || currentInput.toLowerCase().indexOf(CHAT_COMMAND_GUILD_MESSAGE_SHORT + " ") == 0 || currentInput.toLowerCase().indexOf(CHAT_COMMAND_GUILD_MESSAGE_LONG + " ") == 0)
         {
            _loc3_ = currentInput.substring(currentInput.indexOf(" ") + 1);
            setInputMode(1,_loc3_);
         }
         else if(currentInput.toLowerCase().indexOf(CHAT_COMMAND_OFFICER_MESSAGE_SHORT_FALLBACK + " ") == 0 || currentInput.toLowerCase().indexOf(CHAT_COMMAND_OFFICER_MESSAGE_LONG_FALLBACK + " ") == 0 || currentInput.toLowerCase().indexOf(CHAT_COMMAND_OFFICER_MESSAGE_SHORT + " ") == 0 || currentInput.toLowerCase().indexOf(CHAT_COMMAND_OFFICER_MESSAGE_LONG + " ") == 0)
         {
            if(User.current.character.guildRank == 3)
            {
               appendMessage(getMessage("#FF4B4B",LocText.current.text("guild/chat/error_no_officer_permission")));
               resetChatInput();
               return;
            }
            _loc3_ = currentInput.substring(currentInput.indexOf(" ") + 1);
            setInputMode(3,_loc3_);
         }
         else if(currentInput.toLowerCase().indexOf(CHAT_COMMAND_ANSWER_FALLBACK + " ") == 0 || currentInput.toLowerCase().indexOf(CHAT_COMMAND_ANSWER + " ") == 0)
         {
            _loc1_ = User.current.character.guild.lastReceivedPrivateMessage;
            if(_loc1_ != null)
            {
               _loc3_ = currentInput.substring(currentInput.indexOf(" ") + 1);
               _currentPrivateName = _loc1_.characterName;
               setInputMode(2,_loc3_);
            }
         }
         else if(currentInput.toLowerCase().indexOf(CHAT_COMMAND_PRIVATE_MESSAGE_FALLBACK + " ") == 0 && currentInput.indexOf(" ",3) != -1 || currentInput.toLowerCase().indexOf(CHAT_COMMAND_PRIVATE_MESSAGE + " ") == 0 && currentInput.indexOf(" ",4) != -1)
         {
            _loc3_ = currentInput.substring(currentInput.indexOf(" ") + 1);
            _currentPrivateName = currentInput.substring(currentInput.indexOf(" ") + 1);
            if(StringUtil.isEmpty(_currentPrivateName))
            {
               _content.inputMessage.text = currentInput.substring(0,currentInput.length - 1);
               return;
            }
            _currentPrivateName = _currentPrivateName.substring(0,_currentPrivateName.indexOf(" "));
            _loc3_ = StringUtil.trim(StringUtil.remove(_loc3_,_currentPrivateName));
            _loc2_ = _guild.getMember(_currentPrivateName);
            if(_loc2_ == null)
            {
               if(_loc3_ == "")
               {
                  appendMessage(getMessage("#FF4B4B",LocText.current.text("guild/chat/error_no_such_name",_currentPrivateName)));
                  _content.inputMessage.text = StringUtil.trim(currentInput);
                  return;
               }
               return;
            }
            if(_loc2_.isMe)
            {
               appendMessage(getMessage("#FF4B4B",LocText.current.text("guild/chat/error_own_private_message")));
               _content.inputMessage.text = StringUtil.trim(currentInput);
               return;
            }
            _currentPrivateName = _loc2_.name;
            setInputMode(2,_loc3_);
         }
      }
      
      private function onInputChanged(param1:ITextInput) : void
      {
         checkInputMode();
      }
      
      public function resetChatInput(param1:String = "") : void
      {
         _content.inputMessage.text = param1;
         _content.inputMessage.selectRange(_content.inputMessage.text.length,_content.inputMessage.text.length);
      }
      
      public function setInputMode(param1:int, param2:String = "") : void
      {
         _currentInputMode = param1;
         switch(int(_currentInputMode) - 1)
         {
            case 0:
               _content.txtPrefix.text = LocText.current.text("guild/chat/prefix_team");
               _content.txtPrefix.textColor = StringUtil.hexColorToUint("#FFFFFF");
               _content.inputMessage.textColor = StringUtil.hexColorToUint("#FFFFFF");
               break;
            case 1:
               _content.txtPrefix.text = LocText.current.text("guild/chat/prefix_user");
               _content.txtPrefix.text = _content.txtPrefix.text.replace("%s",_currentPrivateName);
               _content.txtPrefix.textColor = StringUtil.hexColorToUint("#7FCBFD");
               _content.inputMessage.textColor = StringUtil.hexColorToUint("#7FCBFD");
               break;
            case 2:
               _content.txtPrefix.text = LocText.current.text("guild/chat/prefix_officer");
               _content.txtPrefix.textColor = StringUtil.hexColorToUint("#7f7ffd");
               _content.inputMessage.textColor = StringUtil.hexColorToUint("#7f7ffd");
         }
         _content.txtPrefix.width = _content.txtPrefix.textWidth + 5;
         _content.inputMessage.x = _content.txtPrefix.x + _content.txtPrefix.width;
         resetChatInput(param2);
      }
      
      private function get currentInput() : String
      {
         return _content.inputMessage.text;
      }
      
      private function scrollToBottom(param1:InteractionEvent = null) : void
      {
         _chatOutput.scrollToBottom(param1 != null);
      }
      
      private function onScroll(param1:IScrollable) : void
      {
         if(_btnScrollDown.visible && _chatOutput.isAtBottom())
         {
            _btnScrollDown.visible = false;
         }
      }
      
      private function sendMessage() : void
      {
         var _loc2_:* = null;
         var _loc1_:* = null;
         var _loc5_:* = null;
         var _loc6_:* = null;
         var _loc3_:* = null;
         var _loc8_:int = 0;
         var _loc9_:int = 0;
         var _loc7_:* = null;
         var _loc10_:* = null;
         var _loc4_:* = null;
         if(!StringUtil.isEmpty(currentInput))
         {
            _loc2_ = StringUtil.trim(currentInput);
            if(currentInput.toLowerCase() == CHAT_COMMAND_GUILD_MESSAGE_SHORT_FALLBACK || currentInput.toLowerCase() == CHAT_COMMAND_GUILD_MESSAGE_LONG_FALLBACK || currentInput.toLowerCase() == CHAT_COMMAND_GUILD_MESSAGE_SHORT || currentInput.toLowerCase() == CHAT_COMMAND_GUILD_MESSAGE_LONG)
            {
               setInputMode(1);
               return;
            }
            if(currentInput.toLowerCase() == CHAT_COMMAND_OFFICER_MESSAGE_SHORT_FALLBACK || currentInput.toLowerCase() == CHAT_COMMAND_OFFICER_MESSAGE_LONG_FALLBACK || currentInput.toLowerCase() == CHAT_COMMAND_OFFICER_MESSAGE_SHORT || currentInput.toLowerCase() == CHAT_COMMAND_OFFICER_MESSAGE_LONG)
            {
               if(User.current.character.guildRank == 3)
               {
                  appendMessage(getMessage("#FF4B4B",LocText.current.text("guild/chat/error_no_officer_permission")));
                  resetChatInput();
                  return;
               }
               setInputMode(3);
               return;
            }
            if(currentInput.toLowerCase() == CHAT_COMMAND_ANSWER_FALLBACK || currentInput.toLowerCase() == CHAT_COMMAND_ANSWER)
            {
               _loc1_ = User.current.character.guild.lastReceivedPrivateMessage;
               if(_loc1_ != null)
               {
                  _currentPrivateName = _loc1_.characterName;
                  setInputMode(2);
               }
               return;
            }
            if(currentInput.toLowerCase().indexOf(CHAT_COMMAND_EMOTE + " ") == 0)
            {
               _loc5_ = currentInput.substring(currentInput.indexOf(" ") + 1);
               if(StringUtil.isEmpty(_loc5_))
               {
                  return;
               }
            }
            else
            {
               if(currentInput.toLowerCase().indexOf(CHAT_COMMAND_PRIVATE_MESSAGE_FALLBACK) == 0 || currentInput.toLowerCase().indexOf(CHAT_COMMAND_PRIVATE_MESSAGE) == 0)
               {
                  _currentPrivateName = currentInput.substring(currentInput.indexOf(" ") + 1);
                  if(StringUtil.isEmpty(_currentPrivateName))
                  {
                     return;
                  }
                  _loc6_ = _guild.getMember(_currentPrivateName);
                  if(_loc6_ == null)
                  {
                     appendMessage(getMessage("#FF4B4B",LocText.current.text("guild/chat/error_no_such_name",_currentPrivateName)));
                     _content.inputMessage.text = StringUtil.trim(currentInput);
                     return;
                  }
                  if(_loc6_.isMe)
                  {
                     appendMessage(getMessage("#FF4B4B",LocText.current.text("guild/chat/error_own_private_message")));
                     _content.inputMessage.text = StringUtil.trim(currentInput);
                     return;
                  }
                  _currentPrivateName = _loc6_.name;
                  setInputMode(2);
                  return;
               }
               if(_loc2_.toLowerCase() == CHAT_COMMAND_HELP || _loc2_.toLowerCase() == CHAT_COMMAND_HELP_FALLBACK)
               {
                  _loc3_ = LocText.current.text("guild/chat/list_commands");
                  if(!AppConfig.emoticonsEnabled)
                  {
                     _loc8_ = _loc3_.indexOf(CHAT_COMMAND_HIDE_EMOTICONS);
                     _loc9_ = _loc3_.indexOf("/",_loc8_ + 1);
                     _loc7_ = _loc3_.substring(0,_loc8_);
                     if(_loc9_ > 0)
                     {
                        _loc7_ = _loc7_ + _loc3_.substring(_loc9_);
                     }
                     _loc3_ = StringUtil.trim(_loc7_);
                  }
                  appendMessage(getMessage("#FFFAD3",_loc3_));
                  resetChatInput();
                  return;
               }
               if(_loc2_.toLowerCase() == CHAT_COMMAND_HIDE_EVENTS || _loc2_.toLowerCase() == CHAT_COMMAND_HIDE_EVENTS_FALLBACK)
               {
                  if(User.current.showGuildEvents === false)
                  {
                     User.current.showGuildEvents = true;
                     appendMessage(getMessage("#FFFAD3",LocText.current.text("guild/chat/hide_events_on")));
                  }
                  else
                  {
                     User.current.showGuildEvents = false;
                     appendMessage(getMessage("#FFFAD3",LocText.current.text("guild/chat/hide_events_off")));
                  }
                  resetChatInput();
                  return;
               }
               if(AppConfig.emoticonsEnabled && (_loc2_.toLowerCase() == CHAT_COMMAND_HIDE_EMOTICONS || _loc2_.toLowerCase() == CHAT_COMMAND_HIDE_EMOTICONS_FALLBACK))
               {
                  if(User.current.showGuildEmoticons === false)
                  {
                     UiChatOutputRichTextArea(_chatOutput).emoticonsEnabled = true;
                     User.current.showGuildEmoticons = true;
                     appendMessage(getMessage("#FFFAD3",LocText.current.text("guild/chat/hide_emoticons_on")));
                  }
                  else
                  {
                     UiChatOutputRichTextArea(_chatOutput).emoticonsEnabled = false;
                     User.current.showGuildEmoticons = false;
                     appendMessage(getMessage("#FFFAD3",LocText.current.text("guild/chat/hide_emoticons_off")));
                  }
                  resetChatInput();
                  return;
               }
               if(_loc2_.indexOf("/") == 0)
               {
                  appendMessage(getMessage("#FF4B4B",LocText.current.text("guild/chat/error_invalid_command")));
                  resetChatInput();
                  return;
               }
            }
            _loc10_ = StringUtil.htmlEscape(StringUtil.trim(currentInput));
            _loc4_ = "";
            if(_currentInputMode == 2)
            {
               _loc4_ = _currentPrivateName;
            }
            Environment.application.sendActionRequest("sendGuildChatMessage",{
               "message":_loc10_,
               "character_to_name":_loc4_,
               "officer_message":_currentInputMode == 3
            },handleRequests,false);
            if(_loc2_.toLowerCase().indexOf(CHAT_COMMAND_EMOTE + " ") == 0)
            {
               _loc10_ = User.current.character.name + _loc10_.substr(CHAT_COMMAND_EMOTE.length);
               appendMessage(getMessage("#F2964D",LocText.current.text("guild/chat_message_emote_format",AppDateTime.timestampToLocalString(TimeUtil.now,AppDateTime.timeFormatHM,true),_loc10_)));
            }
            else
            {
               switch(int(_currentInputMode) - 1)
               {
                  case 0:
                     appendMessage(getMessage("#FFFFFF",LocText.current.text("guild/chat_message_format",AppDateTime.timestampToLocalString(TimeUtil.now,AppDateTime.timeFormatHM,true),User.current.character.name,_loc10_)));
                     break;
                  case 1:
                     appendMessage(getMessage("#7FCBFD",LocText.current.text("guild/chat_message_private_format",AppDateTime.timestampToLocalString(TimeUtil.now,AppDateTime.timeFormatHM,true),User.current.character.name,_loc4_,_loc10_)));
                     break;
                  case 2:
                     appendMessage(getMessage("#7f7ffd",LocText.current.text("guild/chat_message_officer_format",AppDateTime.timestampToLocalString(TimeUtil.now,AppDateTime.timeFormatHM,true),User.current.character.name,_loc10_)));
               }
            }
         }
         resetChatInput();
      }
      
      private function getMessage(param1:String, param2:String) : String
      {
         var _loc9_:* = null;
         var _loc6_:int = 0;
         var _loc4_:* = null;
         var _loc8_:* = null;
         var _loc3_:* = null;
         var _loc7_:* = null;
         if(param2 == "")
         {
            return "";
         }
         var _loc10_:RegExp = /\b((?:https?:\/\/|www\d{0,3}[.]|[a-z0-9.\-]+[.][a-z]{2,4}\/)(?:[^\s()<>]+|\(([^\s()<>]+|(\([^\s()<>]+\)))*\))+(?:\(([^\s()<>]+|(\([^\s()<>]+\)))*\)|[^\s`!()\[\]{};:'".,<>?«»“”‘’]))/gi;
         var _loc5_:RegExp = /\"www/g;
         param2 = param2.replace(_loc10_,"<a href=\"$&\" target=\"_blank\"><font color=\'#F0CC04\'>$&</font></a>");
         param2 = param2.replace(_loc5_,"\"http://www");
         if(param2.indexOf("<a href") != -1)
         {
            _loc9_ = "abcdefghijklmnopqrstuvwxyz";
            _loc6_ = 0;
            while(_loc6_ < _loc9_.length)
            {
               param2 = param2.replace("<a href=\"" + _loc9_.charAt(_loc6_),"<a href=\"http://" + _loc9_.charAt(_loc6_));
               _loc6_++;
            }
            param2 = param2.replace("<a href=\"http://https://","<a href=\"https://");
            param2 = param2.replace("<a href=\"http://http://","<a href=\"http://");
         }
         if(AppConfig.emoticonsEnabled && param1 == "#F0CC04")
         {
            _loc4_ = null;
            if(ITEM_PATTERN.test(param2))
            {
               _loc4_ = ITEM_PATTERN.exec(param2);
            }
            if(_loc4_)
            {
               _loc8_ = new LinkedItem(_loc4_);
               (_chatOutput as UiChatOutputRichTextArea).registerItem(_loc4_,_loc8_.iconImageUrl,_loc8_);
            }
            else if(BOOSTER_Pattern.test(param2))
            {
               _loc4_ = BOOSTER_Pattern.exec(param2);
               _loc3_ = new LinkedBooster(_loc4_);
               (_chatOutput as UiChatOutputRichTextArea).registerItem(_loc4_,_loc3_.imageUrl,_loc3_);
            }
            else if(GUILD_BOOSTER_Pattern.test(param2))
            {
               _loc4_ = GUILD_BOOSTER_Pattern.exec(param2);
               _loc7_ = new LinkedGuildBooster(_loc4_);
               (_chatOutput as UiChatOutputRichTextArea).registerItem(_loc4_,_loc7_.imageUrl,_loc7_);
            }
         }
         return "<font color=\'" + param1 + "\'>" + param2 + "</font><br>";
      }
      
      private function appendMessage(param1:String) : void
      {
         message = param1;
         if(StringUtil.isEmpty(message))
         {
            return;
         }
         var isAtBottom:Boolean = _chatOutput.isAtBottom();
         var oldScrollPosition:Number = 0;
         if(!isAtBottom)
         {
            oldScrollPosition = _chatOutput.textField.verticalScrollBar.scrollValue;
         }
         _chatOutput.appendText(message);
         if(isAtBottom)
         {
            Runtime.delayFunction(function():void
            {
               scrollToBottom();
            },0.3);
         }
         else
         {
            _chatOutput.textField.verticalScrollBar.scrollValue = oldScrollPosition;
            _btnScrollDown.visible = true;
         }
      }
      
      private function replaceMessage(param1:String, param2:String) : void
      {
         if(StringUtil.isEmpty(param1))
         {
            return;
         }
         if(StringUtil.isEmpty(param2))
         {
            return;
         }
         if(param1 == param2)
         {
            return;
         }
         _chatOutput.replaceText(param1,param2);
      }
      
      private function killRefreshTimer() : void
      {
         if(_logRefreshTimer)
         {
            _logRefreshTimer.dispose();
            _logRefreshTimer = null;
         }
      }
      
      private function syncGuild() : void
      {
         if(_guildSyncing)
         {
            return;
         }
         Environment.application.sendActionRequest("syncGuild",SyncStates.syncGuildData.rawData,handleRequests);
      }
      
      public function checkForGuildBattles() : void
      {
         checkForFinishedGuildBattles();
         checkForPendingGuildBattles();
      }
      
      private function checkForFinishedGuildBattles() : void
      {
         if(DialogGuildBattleView.isShowing)
         {
            return;
         }
         var _loc1_:Character = User.current.character;
         if(_loc1_.finishedGuildBattleAttackId != 0 && (_loc1_.finishedAttackGuildBattle == null || _loc1_.finishedAttackGuildBattle.id != _loc1_.finishedGuildBattleAttackId) || _loc1_.finishedGuildBattleDefenseId != 0 && (_loc1_.finishedDefenseGuildBattle == null || _loc1_.finishedDefenseGuildBattle.id != _loc1_.finishedGuildBattleDefenseId))
         {
            syncGuild();
         }
         else
         {
            if(ViewManager.instance.activePanel != "guild")
            {
               return;
            }
            if(_loc1_.hasFinishedAttackGuildBattle && _loc1_.hasFinishedDefenseGuildBattle)
            {
               if(_loc1_.finishedAttackGuildBattle.id < _loc1_.finishedDefenseGuildBattle.id)
               {
                  Environment.panelManager.showDialog(new DialogGuildBattleView(_loc1_.finishedAttackGuildBattle));
               }
               else
               {
                  Environment.panelManager.showDialog(new DialogGuildBattleView(_loc1_.finishedDefenseGuildBattle));
               }
            }
            else if(_loc1_.hasFinishedAttackGuildBattle)
            {
               Environment.panelManager.showDialog(new DialogGuildBattleView(_loc1_.finishedAttackGuildBattle));
            }
            else if(_loc1_.hasFinishedDefenseGuildBattle)
            {
               Environment.panelManager.showDialog(new DialogGuildBattleView(_loc1_.finishedDefenseGuildBattle));
            }
         }
      }
      
      private function checkForPendingGuildBattles() : Boolean
      {
         if(DialogGuildBattleView.isShowing)
         {
            return true;
         }
         if(DialogGuildBattlePending.isShowing)
         {
            return true;
         }
         var _loc1_:Guild = User.current.character.guild;
         if(_loc1_.pendingGuildBattleAttackId != 0 && (_loc1_.pendingAttackGuildBattle == null || _loc1_.pendingAttackGuildBattle.id != _loc1_.pendingGuildBattleAttackId) || _loc1_.pendingGuildBattleDefenseId != 0 && (_loc1_.pendingDefenseGuildBattle == null || _loc1_.pendingDefenseGuildBattle.id != _loc1_.pendingGuildBattleDefenseId))
         {
            syncGuild();
         }
         else
         {
            if(_loc1_.isAttacking && !_loc1_.pendingAttackGuildBattle.hasJoinedMember(User.current.character.id) && !DialogGuildBattlePending.wasShown(_loc1_.pendingAttackGuildBattle.id))
            {
               if(ViewManager.instance.activePanel != "guild")
               {
                  return false;
               }
               Environment.panelManager.showDialog(new DialogGuildBattlePending(_loc1_.pendingAttackGuildBattle));
               return true;
            }
            if(_loc1_.isDefending && !_loc1_.pendingDefenseGuildBattle.hasJoinedMember(User.current.character.id) && !DialogGuildBattlePending.wasShown(_loc1_.pendingDefenseGuildBattle.id))
            {
               if(ViewManager.instance.activePanel != "guild")
               {
                  return false;
               }
               Environment.panelManager.showDialog(new DialogGuildBattlePending(_loc1_.pendingDefenseGuildBattle));
               return true;
            }
         }
         return false;
      }
      
      public function addNewChatMessage(param1:GuildLogMessage) : void
      {
         if(_processedLogIds.exists(param1.logId))
         {
            return;
         }
         if(param1.message == "")
         {
            return;
         }
         _processedLogIds.setData(param1.logId,true);
         var _loc2_:String = "";
         if(param1.isEmote)
         {
            _loc2_ = _loc2_ + getMessage("#F2964D",param1.message);
         }
         else if(param1.isPrivateMessage)
         {
            _loc2_ = _loc2_ + getMessage("#7FCBFD",param1.message);
         }
         else if(param1.isOfficerMessage)
         {
            _loc2_ = _loc2_ + getMessage("#7f7ffd",param1.message);
         }
         else
         {
            _loc2_ = _loc2_ + getMessage("#FFFFFF",param1.message);
         }
         if(_loc2_ != "")
         {
            ViewManager.instance.baseUserPanel.highlightGuildButton();
            if(!param1.selfTriggered)
            {
               Environment.audio.playFX("guild_notification.mp3");
            }
         }
         appendMessage(_loc2_);
      }
      
      private function handleRequests(param1:ActionRequestResponse) : void
      {
         response = param1;
         var _loc3_:* = response.action;
         switch(_loc3_)
         {
            case "sendGuildChatMessage":
               var name:String = null;
               if(response.error == "")
               {
                  Environment.application.updateData(response.data);
                  if(response.appResponse.guild_log.length == 1)
                  {
                     var serverMessage:GuildLogMessage = new GuildLogMessage(response.appResponse.guild_log.getData([response.appResponse.guild_log.keys[0]].toString()));
                     var clientMessage:String = response.request.getString("message");
                     if(clientMessage.toLowerCase().indexOf(CHAT_COMMAND_EMOTE + " ") == 0)
                     {
                        clientMessage = User.current.character.name + clientMessage.substr(CHAT_COMMAND_EMOTE.length);
                        replaceMessage(getMessage("#F2964D",LocText.current.text("guild/chat_message_emote_format",AppDateTime.timestampToLocalString(TimeUtil.now,AppDateTime.timeFormatHM,true),clientMessage)),getMessage("#F2964D",serverMessage.message));
                     }
                     else if(response.request.getBoolean("officer_message"))
                     {
                        replaceMessage(getMessage("#7f7ffd",LocText.current.text("guild/chat_message_officer_format",AppDateTime.timestampToLocalString(TimeUtil.now,AppDateTime.timeFormatHM,true),User.current.character.name,clientMessage)),getMessage("#7f7ffd",serverMessage.message));
                     }
                     else if(response.request.getString("character_to_name") != "")
                     {
                        replaceMessage(getMessage("#7FCBFD",LocText.current.text("guild/chat_message_private_format",AppDateTime.timestampToLocalString(TimeUtil.now,AppDateTime.timeFormatHM,true),User.current.character.name,response.request.getString("character_to_name"),clientMessage)),getMessage("#7FCBFD",serverMessage.message));
                     }
                     else
                     {
                        replaceMessage(getMessage("#FFFFFF",LocText.current.text("guild/chat_message_format",AppDateTime.timestampToLocalString(TimeUtil.now,AppDateTime.timeFormatHM,true),User.current.character.name,clientMessage)),getMessage("#FFFFFF",serverMessage.message));
                     }
                  }
               }
               else if(response.error.indexOf("errSendGuildChatMessageInvalidCharacter") != -1)
               {
                  name = response.error.substr("errSendGuildChatMessageInvalidCharacter_".length);
                  appendMessage(getMessage("#FF4B4B",LocText.current.text("guild/chat/error_no_such_name",name)));
               }
               else if(response.error.indexOf("errSendGuildChatMessageCharacterOffline") != -1)
               {
                  name = response.error.substr("errSendGuildChatMessageCharacterOffline_".length);
                  appendMessage(getMessage("#FF4B4B",LocText.current.text("guild/chat/error_character_offline",name)));
               }
               else if(response.error == "errCharacterNoGuild")
               {
                  killRefreshTimer();
               }
               else if(response.error == "errAddRecordNoPermission")
               {
                  syncGuild();
               }
               else if(response.error == "errorIO" || response.error == "errorIO 2032" || response.error == "errorIO 0")
               {
                  var completeCallback:Function = function():void
                  {
                     Environment.application.sendActionRequest("sendGuildChatMessage",{
                        "message":response.request.getData("message"),
                        "character_to_name":response.request.getData("character_to_name"),
                        "officer_message":response.request.getData("officer_message")
                     },handleRequests,false);
                  };
                  Runtime.delayFunction(completeCallback,1);
               }
               else
               {
                  killRefreshTimer();
                  Environment.reportError(response.error,response.request);
               }
               break;
            case "getGuildLog":
               _getGuildLogPending = false;
               if(response.error == "")
               {
                  SyncStates.pendingGetGuildLog = false;
                  if(!User.current)
                  {
                     return;
                  }
                  if(response.appResponse.hasData("sync_states",true))
                  {
                     SyncStates.refresh(response.appResponse.sync_states);
                  }
                  if(!response.appResponse.hasData("user") && !response.appResponse.hasData("character") && !response.appResponse.hasData("guild_log") && !response.appResponse.hasData("guild"))
                  {
                     return;
                  }
                  Environment.application.updateData(response.data);
                  updateGuildChat(response.request.getData("init_request"));
               }
               else if(response.error == "errorIO" || response.error == "errorIO 0" || response.error == "errorIO 2032")
               {
                  Environment.reportError("syncGameErrorIO",response.request,false,true);
               }
               else if(response.error == "errCharacterNoGuild")
               {
                  killRefreshTimer();
               }
               else if(response.error == "errUserNotAuthorized")
               {
                  killRefreshTimer();
               }
               else
               {
                  killRefreshTimer();
                  Environment.reportError(response.error,response.request);
               }
               break;
            case "syncGuild":
               if(response.error == "")
               {
                  _guildSyncing = true;
                  Environment.application.updateData(response.data);
                  UiGuildMemberInfoTab.instance.refresh(User.current.character.guild);
                  checkForGuildBattles();
                  if(_delayedOutput)
                  {
                     appendMessage(_delayedOutput);
                     _delayedOutput = null;
                  }
                  _guildSyncing = false;
               }
               else if(response.error != "errSyncGuildNoGuild")
               {
                  Environment.reportError(response.error,response.request);
               }
               break;
            default:
               throw new Error("Unsupported request action \'" + response.action + "\'!");
         }
      }
      
      private function updateGuildChat(param1:Boolean) : void
      {
         _guildLogRefreshing = true;
         var _loc2_:String = "";
         var _loc3_:int = -1;
         if(_lastLogMessage != null)
         {
            _loc3_ = _guild.logMessages.indexOf(_lastLogMessage);
         }
         var _loc6_:int = 0;
         var _loc4_:Boolean = false;
         var _loc7_:Boolean = false;
         var _loc5_:Boolean = false;
         var _loc9_:Boolean = false;
         _delayedOutput = null;
         var _loc11_:int = 0;
         var _loc10_:* = _guild.logMessages;
         for each(var _loc8_ in _guild.logMessages)
         {
            if(_loc6_ <= _loc3_)
            {
               _loc6_++;
            }
            else if(!_processedLogIds.exists(_loc8_.logId))
            {
               _processedLogIds.setData(_loc8_.logId,true);
               if(_loc8_.needGuildSync)
               {
                  _loc7_ = true;
               }
               if(_loc8_.needMemberListSync(param1))
               {
                  _loc5_ = true;
               }
               _loc8_.process(param1);
               if(_loc8_.needOutputDelay)
               {
                  _loc9_ = true;
               }
               if(!_loc8_.selfTriggered)
               {
                  _loc4_ = true;
               }
               if(_loc8_.isEvent)
               {
                  if(User.current.showGuildEvents)
                  {
                     _loc2_ = _loc2_ + getMessage("#F0CC04",_loc8_.message);
                  }
               }
               else if(_loc8_.isEmote)
               {
                  _loc2_ = _loc2_ + getMessage("#F2964D",_loc8_.message);
               }
               else if(_loc8_.isPrivateMessage)
               {
                  _loc2_ = _loc2_ + getMessage("#7FCBFD",_loc8_.message);
               }
               else if(_loc8_.isOfficerMessage)
               {
                  _loc2_ = _loc2_ + getMessage("#7f7ffd",_loc8_.message);
               }
               else
               {
                  _loc2_ = _loc2_ + getMessage("#FFFFFF",_loc8_.message);
               }
               _loc6_++;
               _lastLogMessage = _loc8_;
            }
         }
         if(_loc2_ != "")
         {
            ViewManager.instance.baseUserPanel.highlightGuildButton();
            if(param1 === false && _loc4_)
            {
               Environment.audio.playFX("guild_notification.mp3");
            }
         }
         if(param1 === false && _loc5_)
         {
            UiGuildMemberInfoTab.instance.refresh(User.current.character.guild);
         }
         if(_loc7_ && _loc9_ && ViewManager.instance.activePanel == "guild")
         {
            _delayedOutput = _loc2_;
         }
         else
         {
            appendMessage(_loc2_);
         }
         if(_loc7_)
         {
            syncGuild();
         }
         _guildLogRefreshing = false;
      }
      
      public function set visible(param1:Boolean) : void
      {
         _content.visible = param1;
      }
      
      public function get visible() : Boolean
      {
         return _content.visible;
      }
   }
}
