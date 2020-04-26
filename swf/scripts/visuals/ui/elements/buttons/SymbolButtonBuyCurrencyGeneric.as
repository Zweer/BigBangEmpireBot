package visuals.ui.elements.buttons
{
   import com.playata.framework.display.Sprite;
   import com.playata.framework.display.lib.flash.FlashDisplayObjectContainer;
   import com.playata.framework.display.lib.flash.FlashSprite;
   import flash.display.MovieClip;
   import visuals.ui.base.SymbolDummyGeneric;
   import visuals.ui.base.SymbolPlaceholderGeneric;
   
   public class SymbolButtonBuyCurrencyGeneric extends Sprite
   {
       
      
      private var _nativeObject:SymbolButtonBuyCurrency = null;
      
      public var buyButtonHint:SymbolPlaceholderGeneric = null;
      
      public var sensitiveArea:SymbolDummyGeneric = null;
      
      public function SymbolButtonBuyCurrencyGeneric(param1:MovieClip = null)
      {
         if(param1)
         {
            _nativeObject = param1 as SymbolButtonBuyCurrency;
         }
         else
         {
            _nativeObject = new SymbolButtonBuyCurrency();
         }
         super(null,FlashSprite.fromNative(_nativeObject));
         var _loc2_:FlashDisplayObjectContainer = _sprite as FlashDisplayObjectContainer;
         buyButtonHint = new SymbolPlaceholderGeneric(_nativeObject.buyButtonHint);
         sensitiveArea = new SymbolDummyGeneric(_nativeObject.sensitiveArea);
      }
      
      public function setNativeInstance(param1:SymbolButtonBuyCurrency) : void
      {
         FlashSprite.setNativeInstance(_sprite,param1);
         _nativeObject = param1;
         syncInstances();
      }
      
      public function syncInstances() : void
      {
         if(_nativeObject.buyButtonHint)
         {
            buyButtonHint.setNativeInstance(_nativeObject.buyButtonHint);
         }
         if(_nativeObject.sensitiveArea)
         {
            sensitiveArea.setNativeInstance(_nativeObject.sensitiveArea);
         }
      }
   }
}
