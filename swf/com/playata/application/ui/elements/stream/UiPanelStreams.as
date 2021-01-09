package com.playata.application.ui.elements.stream
{
   import com.playata.application.data.stream.PrivateConversation;
   import com.playata.application.data.stream.PrivateSystemMessage;
   import com.playata.application.data.stream.Streams;
   import com.playata.application.data.user.User;
   import com.playata.application.ui.ViewManager;
   import com.playata.application.ui.dialogs.DialogCreatePrivateConversation;
   import com.playata.application.ui.elements.generic.button.UiButton;
   import com.playata.framework.application.Environment;
   import com.playata.framework.core.TypedObject;
   import com.playata.framework.display.AnchorContainer;
   import com.playata.framework.display.AnchorPoint;
   import com.playata.framework.display.ui.controls.TabGroup;
   import com.playata.framework.input.InteractionEvent;
   import com.playata.framework.localization.LocText;
   import flash.geom.Rectangle;
   import visuals.ui.elements.stream.SymbolPanelStreamsGeneric;
   
   public class UiPanelStreams
   {
       
      
      private var _content:SymbolPanelStreamsGeneric = null;
      
      private var _btnClose:UiButton = null;
      
      private var _tabGroup:TabGroup = null;
      
      private var _tabSystem:UiStreamTabButton = null;
      
      private var _tabPrivateConversations:UiStreamTabButton = null;
      
      private var _tabResourceRequests:UiStreamTabButton = null;
      
      private var _tabIgnoredCharacter:UiStreamTabButton = null;
      
      private var _tabUserVouchers:UiStreamTabButton = null;
      
      private var _systemMessageStreamContainer:UiSystemMessageStreamContainer = null;
      
      private var _serverSystemMessageContainer:UiServerSystemMessageContainer = null;
      
      private var _privateSystemMessage:UiPrivateSystemMessage = null;
      
      private var _privateConversationStreamContainer:UiPrivateConversationStreamContainer = null;
      
      private var _privateConversationMessageContainer:UiPrivateConversationMessageContainer = null;
      
      private var _resourceRequestContainer:UiResourceRequestContainer = null;
      
      private var _ignoredCharacterContainer:UiIgnoredCharacterContainer = null;
      
      private var _userVoucherContainer:UiUserVoucherContainer = null;
      
      private var _activeSystemMessageContainer:int = 0;
      
      private var _initialized:Boolean = false;
      
      private var _anchorContainer:AnchorContainer;
      
      public function UiPanelStreams(param1:SymbolPanelStreamsGeneric)
      {
         super();
         _content = param1;
         _content.darkener.applySettings(new TypedObject({"interactionEnabled":true}));
         _content.background.applySettings(new TypedObject({"interactionEnabled":true}));
         _btnClose = new UiButton(_content.btnClose,null,onClickClose);
         _tabSystem = new UiStreamTabButton(_content.tabSystem,LocText.current.text("panel_streams/tab_system_tooltip"),"system");
         _tabPrivateConversations = new UiStreamTabButton(_content.tabPrivateConversations,LocText.current.text("panel_streams/tab_private_conversation_tooltip"),"privateConversation");
         _tabResourceRequests = new UiStreamTabButton(_content.tabResourceRequests,LocText.current.text("panel_streams/tab_resource_request_tooltip"),"resourceRequest");
         _tabIgnoredCharacter = new UiStreamTabButton(_content.tabIgnoredCharacter,LocText.current.text("panel_streams/tab_ignored_character_tooltip"),"ignoredCharacter");
         _tabUserVouchers = new UiStreamTabButton(_content.tabUserVouchers,LocText.current.text("panel_streams/tab_user_voucher_tooltip"),"userVoucher");
         _tabGroup = new TabGroup();
         _tabGroup.addTab(_tabSystem.name,_tabSystem);
         _tabGroup.addTab(_tabPrivateConversations.name,_tabPrivateConversations);
         _tabGroup.addTab(_tabResourceRequests.name,_tabResourceRequests);
         _tabGroup.addTab(_tabIgnoredCharacter.name,_tabIgnoredCharacter);
         _tabGroup.addTab(_tabUserVouchers.name,_tabUserVouchers);
         _tabGroup.onTabSelected.add(onTabSelected);
         _systemMessageStreamContainer = new UiSystemMessageStreamContainer(_content.streamContainer.systemMessageStreamContainer);
         _serverSystemMessageContainer = new UiServerSystemMessageContainer(_content.messageContainer.serverSystemMessageContainer);
         _privateSystemMessage = new UiPrivateSystemMessage(_content.messageContainer.privateSystemMessage);
         _privateConversationStreamContainer = new UiPrivateConversationStreamContainer(_content.streamContainer.privateConversationStreamContainer);
         _privateConversationMessageContainer = new UiPrivateConversationMessageContainer(_content.messageContainer.privateConversationMessageContainer);
         _resourceRequestContainer = new UiResourceRequestContainer(_content.resourceRequestContainer);
         _ignoredCharacterContainer = new UiIgnoredCharacterContainer(_content.ignoredCharacterContainer);
         _userVoucherContainer = new UiUserVoucherContainer(_content.userVoucherContainer);
         _content.visible = false;
         _anchorContainer = new AnchorContainer(new Rectangle(0,0,Environment.layout.appDefaultWidth,Environment.layout.appDefaultHeight));
         _anchorContainer.add(_content.darkener,AnchorPoint.LEFT_RIGHT);
         _anchorContainer.add(_content.darkener,AnchorPoint.TOP_BOTTOM);
         _anchorContainer.add(_content.btnClose,AnchorPoint.TOP_RIGHT);
         _anchorContainer.add(_content.background,AnchorPoint.TOP_BOTTOM);
         _anchorContainer.add(_content.divider,AnchorPoint.TOP_BOTTOM);
         _anchorContainer.add(_systemMessageStreamContainer.list,AnchorPoint.TOP_BOTTOM);
         _anchorContainer.add(_privateConversationStreamContainer.list,AnchorPoint.TOP_BOTTOM);
         _anchorContainer.add(_content.streamContainer.systemMessageStreamContainer.list.scrollBarLine,AnchorPoint.TOP_BOTTOM);
         _anchorContainer.add(_content.streamContainer.privateConversationStreamContainer.list.scrollBarLine,AnchorPoint.TOP_BOTTOM);
         _anchorContainer.add(_content.streamContainer.privateConversationStreamContainer.btnNew,AnchorPoint.BOTTOM_FIXED);
         _anchorContainer.add(_content.streamContainer.privateConversationStreamContainer.buttonBackground,AnchorPoint.BOTTOM_FIXED);
         _anchorContainer.add(_content.messageContainer.divider,AnchorPoint.TOP_BOTTOM);
         _anchorContainer.add(_serverSystemMessageContainer,AnchorPoint.TOP_BOTTOM);
         _anchorContainer.add(_content.messageContainer.serverSystemMessageContainer.scrollBarLine,AnchorPoint.TOP_BOTTOM);
         _anchorContainer.add(_content.messageContainer.serverSystemMessageContainer.txtNoMessages,AnchorPoint.BOTTOM_FIXED,0.5);
         _anchorContainer.add(_content.messageContainer.privateSystemMessage.scrollLine,AnchorPoint.TOP_BOTTOM);
         _anchorContainer.add(_content.messageContainer.privateSystemMessage.messageBackground,AnchorPoint.TOP_BOTTOM);
         _anchorContainer.add(_content.messageContainer.privateSystemMessage.btnAcceptItem,AnchorPoint.BOTTOM_FIXED);
         _anchorContainer.add(_content.messageContainer.privateSystemMessage.btnGeneric,AnchorPoint.BOTTOM_FIXED);
         _anchorContainer.add(_content.messageContainer.privateSystemMessage.btnGuildAccept,AnchorPoint.BOTTOM_FIXED);
         _anchorContainer.add(_content.messageContainer.privateSystemMessage.btnGuildDecline,AnchorPoint.BOTTOM_FIXED);
         _anchorContainer.add(_content.messageContainer.privateSystemMessage.btnCharacterView,AnchorPoint.BOTTOM_FIXED);
         _anchorContainer.add(_content.messageContainer.privateSystemMessage.btnGuildInviteNo,AnchorPoint.BOTTOM_FIXED);
         _anchorContainer.add(_content.messageContainer.privateSystemMessage.btnSendMessage,AnchorPoint.BOTTOM_FIXED);
         _anchorContainer.add(_content.messageContainer.privateSystemMessage.btnGuildInviteYes,AnchorPoint.BOTTOM_FIXED);
         _anchorContainer.add(_content.messageContainer.privateSystemMessage.btnGuildView,AnchorPoint.BOTTOM_FIXED);
         _anchorContainer.add(_content.messageContainer.privateSystemMessage.btnPartnerAdParticipate,AnchorPoint.BOTTOM_FIXED);
         _anchorContainer.add(_content.messageContainer.privateSystemMessage.item1,AnchorPoint.BOTTOM_FIXED);
         _anchorContainer.add(_content.messageContainer.privateSystemMessage.item2,AnchorPoint.BOTTOM_FIXED);
         _anchorContainer.add(_content.messageContainer.privateSystemMessage.item3,AnchorPoint.BOTTOM_FIXED);
         _anchorContainer.add(_content.messageContainer.privateSystemMessage.item4,AnchorPoint.BOTTOM_FIXED);
         _anchorContainer.add(_content.messageContainer.privateSystemMessage.item5,AnchorPoint.BOTTOM_FIXED);
         _anchorContainer.add(_content.messageContainer.privateSystemMessage.txtInfo,AnchorPoint.BOTTOM_FIXED);
         _anchorContainer.add(_privateConversationMessageContainer,AnchorPoint.TOP_BOTTOM);
         _anchorContainer.add(_content.messageContainer.privateConversationMessageContainer.background,AnchorPoint.TOP_BOTTOM);
         _anchorContainer.add(_content.messageContainer.privateConversationMessageContainer.scrollBarLine,AnchorPoint.TOP_BOTTOM);
         _anchorContainer.add(_content.messageContainer.privateConversationMessageContainer.footer,AnchorPoint.BOTTOM_FIXED);
         _anchorContainer.add(_content.resourceRequestContainer.btnAcceptAll,AnchorPoint.BOTTOM_FIXED);
         _anchorContainer.add(_content.ignoredCharacterContainer.btnShow,AnchorPoint.BOTTOM_FIXED);
         _anchorContainer.add(_content.ignoredCharacterContainer.btnUnignore,AnchorPoint.BOTTOM_FIXED);
         reset();
      }
      
      public function dispose() : void
      {
      }
      
      public function refreshLocalization() : void
      {
         _tabSystem.tooltip = LocText.current.text("panel_streams/tab_system_tooltip");
         _tabPrivateConversations.tooltip = LocText.current.text("panel_streams/tab_private_conversation_tooltip");
         _tabResourceRequests.tooltip = LocText.current.text("panel_streams/tab_resource_request_tooltip");
         _tabIgnoredCharacter.tooltip = LocText.current.text("panel_streams/tab_ignored_character_tooltip");
         _tabUserVouchers.tooltip = LocText.current.text("panel_streams/tab_user_voucher_tooltip");
         _systemMessageStreamContainer.refreshLocalization();
         _serverSystemMessageContainer.refreshLocalization();
         _privateSystemMessage.refreshLocalization();
         _privateConversationStreamContainer.refreshLocalization();
         _privateConversationMessageContainer.refreshLocalization();
         _resourceRequestContainer.refreshLocalization();
         _ignoredCharacterContainer.refreshLocalization();
         _userVoucherContainer.refreshLocalization();
         refresh();
      }
      
      public function get content() : SymbolPanelStreamsGeneric
      {
         return _content;
      }
      
      public function get privateSystemMessageStreamList() : UiPrivateSystemMessageStreamList
      {
         return _systemMessageStreamContainer.list;
      }
      
      public function get privateConversationStreamList() : UiPrivateConversationStreamList
      {
         return _privateConversationStreamContainer.list;
      }
      
      public function get privateConversationMessageContainer() : UiPrivateConversationMessageContainer
      {
         return _privateConversationMessageContainer;
      }
      
      public function bringToTop() : void
      {
         _content.bringToTop();
      }
      
      public function reset() : void
      {
         _initialized = false;
         _activeSystemMessageContainer = 0;
         _systemMessageStreamContainer.reset();
         _serverSystemMessageContainer.reset();
         _privateSystemMessage.reset();
         _privateConversationStreamContainer.reset();
         _privateConversationMessageContainer.reset();
         _resourceRequestContainer.reset();
         _ignoredCharacterContainer.reset();
         _userVoucherContainer.reset();
      }
      
      public function get isOpen() : Boolean
      {
         return _content.visible;
      }
      
      public function createPrivateConversation(param1:String = null) : void
      {
         if(!isOpen)
         {
            UiPrivateConversationStreamList.pendingCreatePrivateConversationCharacter = param1;
            open();
            _tabGroup.activateTab(_tabPrivateConversations.name);
         }
         else
         {
            Environment.panelManager.showDialog(new DialogCreatePrivateConversation(param1));
         }
      }
      
      public function open(param1:Boolean = false) : void
      {
         ViewManager.instance.tutorialArrow.hide(true);
         bringToTop();
         if(!_initialized)
         {
            _systemMessageStreamContainer.init();
            _serverSystemMessageContainer.init();
            _privateSystemMessage.init();
            _privateConversationStreamContainer.init();
            _privateConversationMessageContainer.init();
            _resourceRequestContainer.init();
            _ignoredCharacterContainer.init();
            _userVoucherContainer.init();
            _initialized = true;
            _content.visible = true;
            _tabGroup.activateTab(_tabSystem.name);
            _tabSystem.refresh();
            _tabPrivateConversations.refresh();
            _tabResourceRequests.refresh();
            _tabIgnoredCharacter.refresh();
            _tabUserVouchers.refresh();
         }
         else
         {
            _content.visible = true;
            refresh();
         }
      }
      
      public function close() : void
      {
         _content.visible = false;
      }
      
      public function refresh() : void
      {
         if(!_content.visible)
         {
            return;
         }
         refreshUnreadCount();
         _systemMessageStreamContainer.refresh();
         _serverSystemMessageContainer.refresh();
         _privateSystemMessage.refresh();
         _privateConversationStreamContainer.refresh();
         _privateConversationMessageContainer.refresh();
         _resourceRequestContainer.refresh();
         _ignoredCharacterContainer.refresh();
         _userVoucherContainer.refresh();
      }
      
      public function refreshUnreadCount() : void
      {
         if(!ViewManager.instance)
         {
            return;
         }
         if(!User.current)
         {
            return;
         }
         if(!User.current.character)
         {
            return;
         }
         if(!User.current)
         {
            return;
         }
         var _loc1_:Streams = User.current.character.streams;
         _tabSystem.unreadCount = _loc1_.serverSystemMessages.unreadCount + _loc1_.privateSystemMessages.unreadCount;
         _tabPrivateConversations.unreadCount = _loc1_.privateConversations.unreadCount;
         _tabResourceRequests.unreadCount = _loc1_.resourceRequests.unreadCount;
         _tabIgnoredCharacter.unreadCount = 0;
         _tabUserVouchers.unreadCount = _loc1_.userVouchers.unreadCount;
      }
      
      public function refreshAppSize() : void
      {
         _anchorContainer.setSize(new Rectangle(0,0,Environment.layout.appWidth,Environment.layout.appHeight));
      }
      
      public function get isServerSystemMessagesOpen() : Boolean
      {
         if(!_tabSystem.selected)
         {
            return false;
         }
         return _serverSystemMessageContainer.content.visible;
      }
      
      public function openServerSystemMessages() : void
      {
         if(!_tabSystem.selected)
         {
            return;
         }
         _systemMessageStreamContainer.list.clearSelection();
         _serverSystemMessageContainer.sync();
         _serverSystemMessageContainer.content.visible = true;
         _privateSystemMessage.content.visible = false;
         _activeSystemMessageContainer = 1;
      }
      
      public function openPrivateSystemMessage(param1:PrivateSystemMessage) : void
      {
         if(!_tabSystem.selected)
         {
            return;
         }
         _serverSystemMessageContainer.content.visible = false;
         _privateSystemMessage.content.visible = true;
         _privateSystemMessage.open(param1);
         _activeSystemMessageContainer = 2;
      }
      
      public function loadMorePrivateSystemMessages() : void
      {
         if(!_tabSystem.selected)
         {
            return;
         }
         _systemMessageStreamContainer.loadMorePrivateSystemMessages();
      }
      
      public function loadMorePrivateConversationStreams() : void
      {
         if(!_tabPrivateConversations.selected)
         {
            return;
         }
         _privateConversationStreamContainer.loadMorePrivateConversations();
      }
      
      public function openPrivateConversation(param1:PrivateConversation, param2:Function = null) : void
      {
         privateConversation = param1;
         onLoaded = param2;
         if(!_tabPrivateConversations.selected)
         {
            return;
         }
         if(_privateConversationMessageContainer.privateConversation && _privateConversationMessageContainer.privateConversation.id == privateConversation.id && !privateConversation.hasNewMessages)
         {
            return;
         }
         privateConversation.load(function():void
         {
            _privateConversationStreamContainer.list.selectedItem = privateConversation;
            _privateConversationMessageContainer.open(privateConversation);
            if(onLoaded != null)
            {
               onLoaded();
            }
         });
      }
      
      public function openPrivateConversations() : void
      {
         if(_tabPrivateConversations.selected)
         {
            return;
         }
         _tabGroup.activateTab(_tabPrivateConversations.name);
      }
      
      private function onTabSelected(param1:String) : void
      {
         _content.messageContainer.visible = _tabSystem.selected || _tabPrivateConversations.selected;
         _systemMessageStreamContainer.content.visible = _tabSystem.selected;
         _serverSystemMessageContainer.content.visible = _tabSystem.selected && _activeSystemMessageContainer == 1;
         _privateSystemMessage.content.visible = _tabSystem.selected && _activeSystemMessageContainer == 2;
         _privateConversationStreamContainer.content.visible = _tabPrivateConversations.selected;
         _privateConversationMessageContainer.content.visible = _tabPrivateConversations.selected && _privateConversationMessageContainer.privateConversation != null;
         _resourceRequestContainer.content.visible = _tabResourceRequests.selected;
         _ignoredCharacterContainer.content.visible = _tabIgnoredCharacter.selected;
         _userVoucherContainer.content.visible = _tabUserVouchers.selected;
         refresh();
      }
      
      private function onClickClose(param1:InteractionEvent) : void
      {
         close();
      }
   }
}
