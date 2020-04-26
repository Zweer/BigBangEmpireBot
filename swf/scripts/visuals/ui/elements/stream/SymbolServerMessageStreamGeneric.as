package visuals.ui.elements.stream
{
   import com.playata.framework.display.Sprite;
   import com.playata.framework.display.lib.flash.FlashDisplayObjectContainer;
   import com.playata.framework.display.lib.flash.FlashSprite;
   import flash.display.MovieClip;
   import visuals.ui.base.SymbolPlaceholderGeneric;
   import visuals.ui.elements.buttons.SymbolButtonArrowRightGeneric;
   import visuals.ui.elements.generic.SymbolCounterGeneric;
   
   public class SymbolServerMessageStreamGeneric extends Sprite
   {
       
      
      private var _nativeObject:SymbolServerMessageStream = null;
      
      public var teaser:SymbolPlaceholderGeneric = null;
      
      public var btnOpen:SymbolButtonArrowRightGeneric = null;
      
      public var unreadCounter:SymbolCounterGeneric = null;
      
      public function SymbolServerMessageStreamGeneric(param1:MovieClip = null)
      {
         if(param1)
         {
            _nativeObject = param1 as SymbolServerMessageStream;
         }
         else
         {
            _nativeObject = new SymbolServerMessageStream();
         }
         super(null,FlashSprite.fromNative(_nativeObject));
         var _loc2_:FlashDisplayObjectContainer = _sprite as FlashDisplayObjectContainer;
         teaser = new SymbolPlaceholderGeneric(_nativeObject.teaser);
         btnOpen = new SymbolButtonArrowRightGeneric(_nativeObject.btnOpen);
         unreadCounter = new SymbolCounterGeneric(_nativeObject.unreadCounter);
      }
      
      public function setNativeInstance(param1:SymbolServerMessageStream) : void
      {
         FlashSprite.setNativeInstance(_sprite,param1);
         _nativeObject = param1;
         syncInstances();
      }
      
      public function syncInstances() : void
      {
         if(_nativeObject.teaser)
         {
            teaser.setNativeInstance(_nativeObject.teaser);
         }
         if(_nativeObject.btnOpen)
         {
            btnOpen.setNativeInstance(_nativeObject.btnOpen);
         }
         if(_nativeObject.unreadCounter)
         {
            unreadCounter.setNativeInstance(_nativeObject.unreadCounter);
         }
      }
   }
}
