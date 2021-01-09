package visuals.ui.elements.buttons
{
   import com.playata.framework.display.Sprite;
   import com.playata.framework.display.lib.flash.FlashDisplayObjectContainer;
   import com.playata.framework.display.lib.flash.FlashLabel;
   import com.playata.framework.display.lib.flash.FlashSprite;
   import com.playata.framework.display.ui.controls.ILabel;
   import flash.display.MovieClip;
   import visuals.ui.elements.backgrounds.SymbolSlice9BackgroundButtonGeneric;
   import visuals.ui.elements.icons.SymbolIconGameCurrencyGeneric;
   import visuals.ui.elements.icons.SymbolIconPremiumCurrencyGeneric;
   
   public class SymbolButtonPremiumAndGameCurrencyGeneric extends Sprite
   {
       
      
      private var _nativeObject:SymbolButtonPremiumAndGameCurrency = null;
      
      public var bg:SymbolSlice9BackgroundButtonGeneric = null;
      
      public var costGameCurrency:SymbolButtonGameCurrencyCostGeneric = null;
      
      public var iconGameCurrency:SymbolIconGameCurrencyGeneric = null;
      
      public var costPremium:SymbolButtonPremiumCostGeneric = null;
      
      public var iconPremiumCurrency:SymbolIconPremiumCurrencyGeneric = null;
      
      public var caption:ILabel = null;
      
      public function SymbolButtonPremiumAndGameCurrencyGeneric(param1:MovieClip = null)
      {
         if(param1)
         {
            _nativeObject = param1 as SymbolButtonPremiumAndGameCurrency;
         }
         else
         {
            _nativeObject = new SymbolButtonPremiumAndGameCurrency();
         }
         super(null,FlashSprite.fromNative(_nativeObject));
         var _loc2_:FlashDisplayObjectContainer = _sprite as FlashDisplayObjectContainer;
         bg = new SymbolSlice9BackgroundButtonGeneric(_nativeObject.bg);
         costGameCurrency = new SymbolButtonGameCurrencyCostGeneric(_nativeObject.costGameCurrency);
         iconGameCurrency = new SymbolIconGameCurrencyGeneric(_nativeObject.iconGameCurrency);
         costPremium = new SymbolButtonPremiumCostGeneric(_nativeObject.costPremium);
         iconPremiumCurrency = new SymbolIconPremiumCurrencyGeneric(_nativeObject.iconPremiumCurrency);
         caption = FlashLabel.fromNative(_nativeObject.caption);
      }
      
      public function setNativeInstance(param1:SymbolButtonPremiumAndGameCurrency) : void
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
         if(_nativeObject.costGameCurrency)
         {
            costGameCurrency.setNativeInstance(_nativeObject.costGameCurrency);
         }
         if(_nativeObject.iconGameCurrency)
         {
            iconGameCurrency.setNativeInstance(_nativeObject.iconGameCurrency);
         }
         if(_nativeObject.costPremium)
         {
            costPremium.setNativeInstance(_nativeObject.costPremium);
         }
         if(_nativeObject.iconPremiumCurrency)
         {
            iconPremiumCurrency.setNativeInstance(_nativeObject.iconPremiumCurrency);
         }
         FlashLabel.setNativeInstance(caption,_nativeObject.caption);
      }
   }
}
