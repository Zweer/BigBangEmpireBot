package visuals.ui.elements.streaming
{
   import com.playata.framework.display.Sprite;
   import com.playata.framework.display.lib.flash.FlashDisplayObjectContainer;
   import com.playata.framework.display.lib.flash.FlashSprite;
   import flash.display.MovieClip;
   import visuals.ui.base.SymbolPlaceholderGeneric;
   import visuals.ui.elements.generic.SymbolStreamingIconHighlightGeneric;
   import visuals.ui.elements.icons.SymbolIconExclamationMarkGeneric;
   import visuals.ui.elements.icons.SymbolIconLockGeneric;
   
   public class SymbolStreamingActorLineGeneric extends Sprite
   {
       
      
      private var _nativeObject:SymbolStreamingActorLine = null;
      
      public var backgroundHighlight:SymbolStreamingIconHighlightGeneric = null;
      
      public var image:SymbolPlaceholderGeneric = null;
      
      public var lock:SymbolIconLockGeneric = null;
      
      public var iconExclamationMark:SymbolIconExclamationMarkGeneric = null;
      
      public function SymbolStreamingActorLineGeneric(param1:MovieClip = null)
      {
         if(param1)
         {
            _nativeObject = param1 as SymbolStreamingActorLine;
         }
         else
         {
            _nativeObject = new SymbolStreamingActorLine();
         }
         super(null,FlashSprite.fromNative(_nativeObject));
         var _loc2_:FlashDisplayObjectContainer = _sprite as FlashDisplayObjectContainer;
         backgroundHighlight = new SymbolStreamingIconHighlightGeneric(_nativeObject.backgroundHighlight);
         image = new SymbolPlaceholderGeneric(_nativeObject.image);
         lock = new SymbolIconLockGeneric(_nativeObject.lock);
         iconExclamationMark = new SymbolIconExclamationMarkGeneric(_nativeObject.iconExclamationMark);
      }
      
      public function setNativeInstance(param1:SymbolStreamingActorLine) : void
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
         if(_nativeObject.image)
         {
            image.setNativeInstance(_nativeObject.image);
         }
         if(_nativeObject.lock)
         {
            lock.setNativeInstance(_nativeObject.lock);
         }
         if(_nativeObject.iconExclamationMark)
         {
            iconExclamationMark.setNativeInstance(_nativeObject.iconExclamationMark);
         }
      }
   }
}
