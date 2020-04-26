package visuals.ui.elements.stream
{
   import com.playata.framework.display.Sprite;
   import com.playata.framework.display.lib.flash.FlashDisplayObjectContainer;
   import com.playata.framework.display.lib.flash.FlashSprite;
   import flash.display.MovieClip;
   import visuals.ui.elements.generic.SymbolCounterGeneric;
   
   public class SymbolTabStreamGeneric extends Sprite
   {
       
      
      private var _nativeObject:SymbolTabStream = null;
      
      public var backgroundInactive:SymbolStreamTabClearBackgroundGeneric = null;
      
      public var backgroundActive:SymbolStreamTabTabbedBackgroundGeneric = null;
      
      public var iconSystem:SymbolIconSystemStreamGeneric = null;
      
      public var iconPrivateConversations:SymbolIconPrivateConversationGeneric = null;
      
      public var iconResourceRequests:SymbolIconResourceStreamGeneric = null;
      
      public var iconIgnoredCharacters:SymbolIconIgnoreCharacterStreamGeneric = null;
      
      public var iconUserVouchers:SymbolIconUserVoucherStreamGeneric = null;
      
      public var unreadCounter:SymbolCounterGeneric = null;
      
      public function SymbolTabStreamGeneric(param1:MovieClip = null)
      {
         if(param1)
         {
            _nativeObject = param1 as SymbolTabStream;
         }
         else
         {
            _nativeObject = new SymbolTabStream();
         }
         super(null,FlashSprite.fromNative(_nativeObject));
         var _loc2_:FlashDisplayObjectContainer = _sprite as FlashDisplayObjectContainer;
         backgroundInactive = new SymbolStreamTabClearBackgroundGeneric(_nativeObject.backgroundInactive);
         backgroundActive = new SymbolStreamTabTabbedBackgroundGeneric(_nativeObject.backgroundActive);
         iconSystem = new SymbolIconSystemStreamGeneric(_nativeObject.iconSystem);
         iconPrivateConversations = new SymbolIconPrivateConversationGeneric(_nativeObject.iconPrivateConversations);
         iconResourceRequests = new SymbolIconResourceStreamGeneric(_nativeObject.iconResourceRequests);
         iconIgnoredCharacters = new SymbolIconIgnoreCharacterStreamGeneric(_nativeObject.iconIgnoredCharacters);
         iconUserVouchers = new SymbolIconUserVoucherStreamGeneric(_nativeObject.iconUserVouchers);
         unreadCounter = new SymbolCounterGeneric(_nativeObject.unreadCounter);
      }
      
      public function setNativeInstance(param1:SymbolTabStream) : void
      {
         FlashSprite.setNativeInstance(_sprite,param1);
         _nativeObject = param1;
         syncInstances();
      }
      
      public function syncInstances() : void
      {
         if(_nativeObject.backgroundInactive)
         {
            backgroundInactive.setNativeInstance(_nativeObject.backgroundInactive);
         }
         if(_nativeObject.backgroundActive)
         {
            backgroundActive.setNativeInstance(_nativeObject.backgroundActive);
         }
         if(_nativeObject.iconSystem)
         {
            iconSystem.setNativeInstance(_nativeObject.iconSystem);
         }
         if(_nativeObject.iconPrivateConversations)
         {
            iconPrivateConversations.setNativeInstance(_nativeObject.iconPrivateConversations);
         }
         if(_nativeObject.iconResourceRequests)
         {
            iconResourceRequests.setNativeInstance(_nativeObject.iconResourceRequests);
         }
         if(_nativeObject.iconIgnoredCharacters)
         {
            iconIgnoredCharacters.setNativeInstance(_nativeObject.iconIgnoredCharacters);
         }
         if(_nativeObject.iconUserVouchers)
         {
            iconUserVouchers.setNativeInstance(_nativeObject.iconUserVouchers);
         }
         if(_nativeObject.unreadCounter)
         {
            unreadCounter.setNativeInstance(_nativeObject.unreadCounter);
         }
      }
   }
}
