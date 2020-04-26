package visuals.ui.elements.generic
{
   import com.playata.framework.display.Sprite;
   import com.playata.framework.display.lib.flash.FlashDisplayObjectContainer;
   import com.playata.framework.display.lib.flash.FlashSprite;
   import flash.display.MovieClip;
   import visuals.ui.base.SymbolDummyGeneric;
   import visuals.ui.base.SymbolPlaceholderGeneric;
   import visuals.ui.elements.backgrounds.SymbolBackgroundScalableGeneric;
   
   public class SymbolLocalePickerGeneric extends Sprite
   {
       
      
      private var _nativeObject:SymbolLocalePicker = null;
      
      public var selectionPopupBackground:SymbolBackgroundScalableGeneric = null;
      
      public var tooltipLayer:SymbolDummyGeneric = null;
      
      public var locales:SymbolPlaceholderGeneric = null;
      
      public var iconSelectedLocale:SymbolLocalePickOptionGeneric = null;
      
      public function SymbolLocalePickerGeneric(param1:MovieClip = null)
      {
         if(param1)
         {
            _nativeObject = param1 as SymbolLocalePicker;
         }
         else
         {
            _nativeObject = new SymbolLocalePicker();
         }
         super(null,FlashSprite.fromNative(_nativeObject));
         var _loc2_:FlashDisplayObjectContainer = _sprite as FlashDisplayObjectContainer;
         selectionPopupBackground = new SymbolBackgroundScalableGeneric(_nativeObject.selectionPopupBackground);
         tooltipLayer = new SymbolDummyGeneric(_nativeObject.tooltipLayer);
         locales = new SymbolPlaceholderGeneric(_nativeObject.locales);
         iconSelectedLocale = new SymbolLocalePickOptionGeneric(_nativeObject.iconSelectedLocale);
      }
      
      public function setNativeInstance(param1:SymbolLocalePicker) : void
      {
         FlashSprite.setNativeInstance(_sprite,param1);
         _nativeObject = param1;
         syncInstances();
      }
      
      public function syncInstances() : void
      {
         if(_nativeObject.selectionPopupBackground)
         {
            selectionPopupBackground.setNativeInstance(_nativeObject.selectionPopupBackground);
         }
         if(_nativeObject.tooltipLayer)
         {
            tooltipLayer.setNativeInstance(_nativeObject.tooltipLayer);
         }
         if(_nativeObject.locales)
         {
            locales.setNativeInstance(_nativeObject.locales);
         }
         if(_nativeObject.iconSelectedLocale)
         {
            iconSelectedLocale.setNativeInstance(_nativeObject.iconSelectedLocale);
         }
      }
   }
}
