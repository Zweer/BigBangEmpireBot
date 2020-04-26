package visuals.ui.elements.stream
{
   import com.playata.framework.display.Sprite;
   import com.playata.framework.display.lib.flash.FlashDisplayObjectContainer;
   import com.playata.framework.display.lib.flash.FlashSprite;
   import flash.display.MovieClip;
   import visuals.ui.elements.buttons.SymbolButtonCloseGeneric;
   
   public class SymbolPanelStreamsGeneric extends Sprite
   {
       
      
      private var _nativeObject:SymbolPanelStreams = null;
      
      public var darkener:SymbolPanelStreamDividerGeneric = null;
      
      public var tabSystem:SymbolTabStreamGeneric = null;
      
      public var tabPrivateConversations:SymbolTabStreamGeneric = null;
      
      public var tabUserVouchers:SymbolTabStreamGeneric = null;
      
      public var tabResourceRequests:SymbolTabStreamGeneric = null;
      
      public var tabIgnoredCharacter:SymbolTabStreamGeneric = null;
      
      public var background:SymbolPanelStreamBackgroundGeneric = null;
      
      public var userVoucherContainer:SymbolUserVoucherContainerGeneric = null;
      
      public var resourceRequestContainer:SymbolResourceRequestContainerGeneric = null;
      
      public var ignoredCharacterContainer:SymbolIgnoredCharacterContainerGeneric = null;
      
      public var messageContainer:SymbolStreamMessageContainerGeneric = null;
      
      public var streamContainer:SymbolStreamContainerGeneric = null;
      
      public var divider:SymbolPanelStreamDividerGeneric = null;
      
      public var btnClose:SymbolButtonCloseGeneric = null;
      
      public function SymbolPanelStreamsGeneric(param1:MovieClip = null)
      {
         if(param1)
         {
            _nativeObject = param1 as SymbolPanelStreams;
         }
         else
         {
            _nativeObject = new SymbolPanelStreams();
         }
         super(null,FlashSprite.fromNative(_nativeObject));
         var _loc2_:FlashDisplayObjectContainer = _sprite as FlashDisplayObjectContainer;
         darkener = new SymbolPanelStreamDividerGeneric(_nativeObject.darkener);
         tabSystem = new SymbolTabStreamGeneric(_nativeObject.tabSystem);
         tabPrivateConversations = new SymbolTabStreamGeneric(_nativeObject.tabPrivateConversations);
         tabUserVouchers = new SymbolTabStreamGeneric(_nativeObject.tabUserVouchers);
         tabResourceRequests = new SymbolTabStreamGeneric(_nativeObject.tabResourceRequests);
         tabIgnoredCharacter = new SymbolTabStreamGeneric(_nativeObject.tabIgnoredCharacter);
         background = new SymbolPanelStreamBackgroundGeneric(_nativeObject.background);
         userVoucherContainer = new SymbolUserVoucherContainerGeneric(_nativeObject.userVoucherContainer);
         resourceRequestContainer = new SymbolResourceRequestContainerGeneric(_nativeObject.resourceRequestContainer);
         ignoredCharacterContainer = new SymbolIgnoredCharacterContainerGeneric(_nativeObject.ignoredCharacterContainer);
         messageContainer = new SymbolStreamMessageContainerGeneric(_nativeObject.messageContainer);
         streamContainer = new SymbolStreamContainerGeneric(_nativeObject.streamContainer);
         divider = new SymbolPanelStreamDividerGeneric(_nativeObject.divider);
         btnClose = new SymbolButtonCloseGeneric(_nativeObject.btnClose);
      }
      
      public function setNativeInstance(param1:SymbolPanelStreams) : void
      {
         FlashSprite.setNativeInstance(_sprite,param1);
         _nativeObject = param1;
         syncInstances();
      }
      
      public function syncInstances() : void
      {
         if(_nativeObject.darkener)
         {
            darkener.setNativeInstance(_nativeObject.darkener);
         }
         if(_nativeObject.tabSystem)
         {
            tabSystem.setNativeInstance(_nativeObject.tabSystem);
         }
         if(_nativeObject.tabPrivateConversations)
         {
            tabPrivateConversations.setNativeInstance(_nativeObject.tabPrivateConversations);
         }
         if(_nativeObject.tabUserVouchers)
         {
            tabUserVouchers.setNativeInstance(_nativeObject.tabUserVouchers);
         }
         if(_nativeObject.tabResourceRequests)
         {
            tabResourceRequests.setNativeInstance(_nativeObject.tabResourceRequests);
         }
         if(_nativeObject.tabIgnoredCharacter)
         {
            tabIgnoredCharacter.setNativeInstance(_nativeObject.tabIgnoredCharacter);
         }
         if(_nativeObject.background)
         {
            background.setNativeInstance(_nativeObject.background);
         }
         if(_nativeObject.userVoucherContainer)
         {
            userVoucherContainer.setNativeInstance(_nativeObject.userVoucherContainer);
         }
         if(_nativeObject.resourceRequestContainer)
         {
            resourceRequestContainer.setNativeInstance(_nativeObject.resourceRequestContainer);
         }
         if(_nativeObject.ignoredCharacterContainer)
         {
            ignoredCharacterContainer.setNativeInstance(_nativeObject.ignoredCharacterContainer);
         }
         if(_nativeObject.messageContainer)
         {
            messageContainer.setNativeInstance(_nativeObject.messageContainer);
         }
         if(_nativeObject.streamContainer)
         {
            streamContainer.setNativeInstance(_nativeObject.streamContainer);
         }
         if(_nativeObject.divider)
         {
            divider.setNativeInstance(_nativeObject.divider);
         }
         if(_nativeObject.btnClose)
         {
            btnClose.setNativeInstance(_nativeObject.btnClose);
         }
      }
   }
}
