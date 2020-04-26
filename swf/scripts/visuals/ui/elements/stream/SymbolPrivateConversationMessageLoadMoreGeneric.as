package visuals.ui.elements.stream
{
   import com.playata.framework.display.Sprite;
   import com.playata.framework.display.lib.flash.FlashDisplayObjectContainer;
   import com.playata.framework.display.lib.flash.FlashSprite;
   import flash.display.MovieClip;
   import visuals.ui.base.SymbolBlockerAnimationGeneric;
   import visuals.ui.elements.buttons.SymbolButtonArrowDownGeneric;
   import visuals.ui.elements.buttons.SymbolButtonArrowUpGeneric;
   
   public class SymbolPrivateConversationMessageLoadMoreGeneric extends Sprite
   {
       
      
      private var _nativeObject:SymbolPrivateConversationMessageLoadMore = null;
      
      public var btnLoadMoreNext:SymbolButtonArrowDownGeneric = null;
      
      public var btnLoadMorePrevious:SymbolButtonArrowUpGeneric = null;
      
      public var iconLoading:SymbolBlockerAnimationGeneric = null;
      
      public function SymbolPrivateConversationMessageLoadMoreGeneric(param1:MovieClip = null)
      {
         if(param1)
         {
            _nativeObject = param1 as SymbolPrivateConversationMessageLoadMore;
         }
         else
         {
            _nativeObject = new SymbolPrivateConversationMessageLoadMore();
         }
         super(null,FlashSprite.fromNative(_nativeObject));
         var _loc2_:FlashDisplayObjectContainer = _sprite as FlashDisplayObjectContainer;
         btnLoadMoreNext = new SymbolButtonArrowDownGeneric(_nativeObject.btnLoadMoreNext);
         btnLoadMorePrevious = new SymbolButtonArrowUpGeneric(_nativeObject.btnLoadMorePrevious);
         iconLoading = new SymbolBlockerAnimationGeneric(_nativeObject.iconLoading);
      }
      
      public function setNativeInstance(param1:SymbolPrivateConversationMessageLoadMore) : void
      {
         FlashSprite.setNativeInstance(_sprite,param1);
         _nativeObject = param1;
         syncInstances();
      }
      
      public function syncInstances() : void
      {
         if(_nativeObject.btnLoadMoreNext)
         {
            btnLoadMoreNext.setNativeInstance(_nativeObject.btnLoadMoreNext);
         }
         if(_nativeObject.btnLoadMorePrevious)
         {
            btnLoadMorePrevious.setNativeInstance(_nativeObject.btnLoadMorePrevious);
         }
         if(_nativeObject.iconLoading)
         {
            iconLoading.setNativeInstance(_nativeObject.iconLoading);
         }
      }
   }
}
