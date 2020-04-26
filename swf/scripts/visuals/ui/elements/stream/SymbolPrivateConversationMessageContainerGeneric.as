package visuals.ui.elements.stream
{
   import com.playata.framework.display.Sprite;
   import com.playata.framework.display.lib.flash.FlashDisplayObjectContainer;
   import com.playata.framework.display.lib.flash.FlashSprite;
   import flash.display.MovieClip;
   import visuals.ui.base.SymbolDummyGeneric;
   import visuals.ui.elements.generic.SymbolScrollKnobSmallGeneric;
   import visuals.ui.elements.generic.SymbolScrollLineSmallGeneric;
   
   public class SymbolPrivateConversationMessageContainerGeneric extends Sprite
   {
       
      
      private var _nativeObject:SymbolPrivateConversationMessageContainer = null;
      
      public var background:SymbolPanelStreamElementBackgroundGeneric = null;
      
      public var listContainer:SymbolDummyGeneric = null;
      
      public var scrollBarLine:SymbolScrollLineSmallGeneric = null;
      
      public var scrollBarKnob:SymbolScrollKnobSmallGeneric = null;
      
      public var footer:SymbolPrivateConversationFooterGeneric = null;
      
      public var header:SymbolPrivateConversationHeaderGeneric = null;
      
      public function SymbolPrivateConversationMessageContainerGeneric(param1:MovieClip = null)
      {
         if(param1)
         {
            _nativeObject = param1 as SymbolPrivateConversationMessageContainer;
         }
         else
         {
            _nativeObject = new SymbolPrivateConversationMessageContainer();
         }
         super(null,FlashSprite.fromNative(_nativeObject));
         var _loc2_:FlashDisplayObjectContainer = _sprite as FlashDisplayObjectContainer;
         background = new SymbolPanelStreamElementBackgroundGeneric(_nativeObject.background);
         listContainer = new SymbolDummyGeneric(_nativeObject.listContainer);
         scrollBarLine = new SymbolScrollLineSmallGeneric(_nativeObject.scrollBarLine);
         scrollBarKnob = new SymbolScrollKnobSmallGeneric(_nativeObject.scrollBarKnob);
         footer = new SymbolPrivateConversationFooterGeneric(_nativeObject.footer);
         header = new SymbolPrivateConversationHeaderGeneric(_nativeObject.header);
      }
      
      public function setNativeInstance(param1:SymbolPrivateConversationMessageContainer) : void
      {
         FlashSprite.setNativeInstance(_sprite,param1);
         _nativeObject = param1;
         syncInstances();
      }
      
      public function syncInstances() : void
      {
         if(_nativeObject.background)
         {
            background.setNativeInstance(_nativeObject.background);
         }
         if(_nativeObject.listContainer)
         {
            listContainer.setNativeInstance(_nativeObject.listContainer);
         }
         if(_nativeObject.scrollBarLine)
         {
            scrollBarLine.setNativeInstance(_nativeObject.scrollBarLine);
         }
         if(_nativeObject.scrollBarKnob)
         {
            scrollBarKnob.setNativeInstance(_nativeObject.scrollBarKnob);
         }
         if(_nativeObject.footer)
         {
            footer.setNativeInstance(_nativeObject.footer);
         }
         if(_nativeObject.header)
         {
            header.setNativeInstance(_nativeObject.header);
         }
      }
   }
}
