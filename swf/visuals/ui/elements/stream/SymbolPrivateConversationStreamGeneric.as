package visuals.ui.elements.stream
{
   import com.playata.framework.display.Sprite;
   import com.playata.framework.display.lib.flash.FlashDisplayObjectContainer;
   import com.playata.framework.display.lib.flash.FlashLabel;
   import com.playata.framework.display.lib.flash.FlashSprite;
   import com.playata.framework.display.ui.controls.ILabel;
   import flash.display.MovieClip;
   import visuals.ui.base.SymbolBlockerAnimationGeneric;
   import visuals.ui.base.SymbolPlaceholderGeneric;
   import visuals.ui.elements.buttons.SymbolButtonArrowDownGeneric;
   import visuals.ui.elements.generic.SymbolCounterGeneric;
   import visuals.ui.elements.stats.SymbolStatsBattleSkillBackgroundGeneric;
   
   public class SymbolPrivateConversationStreamGeneric extends Sprite
   {
       
      
      private var _nativeObject:SymbolPrivateConversationStream = null;
      
      public var backgroundHighlight:SymbolStreamListLineHighlightGeneric = null;
      
      public var backgroundEven:SymbolStreamListLineEvenGeneric = null;
      
      public var backgroundOdd:SymbolStreamListLineOddGeneric = null;
      
      public var backgroundIcon:SymbolStatsBattleSkillBackgroundGeneric = null;
      
      public var iconGroupChat:SymbolIconGroupConversationGeneric = null;
      
      public var iconAvatar:SymbolPlaceholderGeneric = null;
      
      public var txtLastAction:ILabel = null;
      
      public var txtSubject:ILabel = null;
      
      public var txtMembers:ILabel = null;
      
      public var unreadCounter:SymbolCounterGeneric = null;
      
      public var btnLoadMore:SymbolButtonArrowDownGeneric = null;
      
      public var iconLoading:SymbolBlockerAnimationGeneric = null;
      
      public function SymbolPrivateConversationStreamGeneric(param1:MovieClip = null)
      {
         if(param1)
         {
            _nativeObject = param1 as SymbolPrivateConversationStream;
         }
         else
         {
            _nativeObject = new SymbolPrivateConversationStream();
         }
         super(null,FlashSprite.fromNative(_nativeObject));
         var _loc2_:FlashDisplayObjectContainer = _sprite as FlashDisplayObjectContainer;
         backgroundHighlight = new SymbolStreamListLineHighlightGeneric(_nativeObject.backgroundHighlight);
         backgroundEven = new SymbolStreamListLineEvenGeneric(_nativeObject.backgroundEven);
         backgroundOdd = new SymbolStreamListLineOddGeneric(_nativeObject.backgroundOdd);
         backgroundIcon = new SymbolStatsBattleSkillBackgroundGeneric(_nativeObject.backgroundIcon);
         iconGroupChat = new SymbolIconGroupConversationGeneric(_nativeObject.iconGroupChat);
         iconAvatar = new SymbolPlaceholderGeneric(_nativeObject.iconAvatar);
         txtLastAction = FlashLabel.fromNative(_nativeObject.txtLastAction);
         txtSubject = FlashLabel.fromNative(_nativeObject.txtSubject);
         txtMembers = FlashLabel.fromNative(_nativeObject.txtMembers);
         unreadCounter = new SymbolCounterGeneric(_nativeObject.unreadCounter);
         btnLoadMore = new SymbolButtonArrowDownGeneric(_nativeObject.btnLoadMore);
         iconLoading = new SymbolBlockerAnimationGeneric(_nativeObject.iconLoading);
      }
      
      public function setNativeInstance(param1:SymbolPrivateConversationStream) : void
      {
         FlashSprite.setNativeInstance(_sprite,param1);
         _nativeObject = param1;
         syncInstances();
      }
      
      public function syncInstances() : void
      {
         if(_nativeObject.backgroundHighlight)
         {
            backgroundHighlight.setNativeInstance(_nativeObject.backgroundHighlight);
         }
         if(_nativeObject.backgroundEven)
         {
            backgroundEven.setNativeInstance(_nativeObject.backgroundEven);
         }
         if(_nativeObject.backgroundOdd)
         {
            backgroundOdd.setNativeInstance(_nativeObject.backgroundOdd);
         }
         if(_nativeObject.backgroundIcon)
         {
            backgroundIcon.setNativeInstance(_nativeObject.backgroundIcon);
         }
         if(_nativeObject.iconGroupChat)
         {
            iconGroupChat.setNativeInstance(_nativeObject.iconGroupChat);
         }
         if(_nativeObject.iconAvatar)
         {
            iconAvatar.setNativeInstance(_nativeObject.iconAvatar);
         }
         FlashLabel.setNativeInstance(txtLastAction,_nativeObject.txtLastAction);
         FlashLabel.setNativeInstance(txtSubject,_nativeObject.txtSubject);
         FlashLabel.setNativeInstance(txtMembers,_nativeObject.txtMembers);
         if(_nativeObject.unreadCounter)
         {
            unreadCounter.setNativeInstance(_nativeObject.unreadCounter);
         }
         if(_nativeObject.btnLoadMore)
         {
            btnLoadMore.setNativeInstance(_nativeObject.btnLoadMore);
         }
         if(_nativeObject.iconLoading)
         {
            iconLoading.setNativeInstance(_nativeObject.iconLoading);
         }
      }
   }
}
