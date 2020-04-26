package visuals.ui.elements.buttons
{
   import com.playata.framework.display.Sprite;
   import com.playata.framework.display.lib.flash.FlashDisplayObjectContainer;
   import com.playata.framework.display.lib.flash.FlashSprite;
   import flash.display.MovieClip;
   import visuals.ui.base.SymbolUiButtonDefaultShapeSmallGeneric;
   import visuals.ui.elements.icons.SymbolIconGameCurrencyGeneric;
   
   public class SymbolButtonIncreaseGameCurrencyGeneric extends Sprite
   {
       
      
      private var _nativeObject:SymbolButtonIncreaseGameCurrency = null;
      
      public var bg:SymbolUiButtonDefaultShapeSmallGeneric = null;
      
      public var iconGameCurrency:SymbolIconGameCurrencyGeneric = null;
      
      public function SymbolButtonIncreaseGameCurrencyGeneric(param1:MovieClip = null)
      {
         if(param1)
         {
            _nativeObject = param1 as SymbolButtonIncreaseGameCurrency;
         }
         else
         {
            _nativeObject = new SymbolButtonIncreaseGameCurrency();
         }
         super(null,FlashSprite.fromNative(_nativeObject));
         var _loc2_:FlashDisplayObjectContainer = _sprite as FlashDisplayObjectContainer;
         bg = new SymbolUiButtonDefaultShapeSmallGeneric(_nativeObject.bg);
         iconGameCurrency = new SymbolIconGameCurrencyGeneric(_nativeObject.iconGameCurrency);
      }
      
      public function setNativeInstance(param1:SymbolButtonIncreaseGameCurrency) : void
      {
         FlashSprite.setNativeInstance(_sprite,param1);
         _nativeObject = param1;
         syncInstances();
      }
      
      public function syncInstances() : void
      {
         if(_nativeObject.bg)
         {
            bg.setNativeInstance(_nativeObject.bg);
         }
         if(_nativeObject.iconGameCurrency)
         {
            iconGameCurrency.setNativeInstance(_nativeObject.iconGameCurrency);
         }
      }
   }
}
