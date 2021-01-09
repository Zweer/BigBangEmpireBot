package visuals.ui.elements.generic
{
   import com.playata.framework.display.Sprite;
   import com.playata.framework.display.lib.flash.FlashDisplayObjectContainer;
   import com.playata.framework.display.lib.flash.FlashLabel;
   import com.playata.framework.display.lib.flash.FlashSprite;
   import com.playata.framework.display.ui.controls.ILabel;
   import flash.display.MovieClip;
   import visuals.ui.elements.buttons.SymbolButtonPlusStaticGeneric;
   
   public class SymbolPremiumCurrencyPanelGeneric extends Sprite
   {
       
      
      private var _nativeObject:SymbolPremiumCurrencyPanel = null;
      
      public var animation:SymbolPremiumCurrencyIconAnimationGeneric = null;
      
      public var txtPremiumCurrency:ILabel = null;
      
      public var iconPremiumCurrency:ILabel = null;
      
      public var btnBuyPremiumCurrencyAB:SymbolButtonPlusStaticGeneric = null;
      
      public function SymbolPremiumCurrencyPanelGeneric(param1:MovieClip = null)
      {
         if(param1)
         {
            _nativeObject = param1 as SymbolPremiumCurrencyPanel;
         }
         else
         {
            _nativeObject = new SymbolPremiumCurrencyPanel();
         }
         super(null,FlashSprite.fromNative(_nativeObject));
         var _loc2_:FlashDisplayObjectContainer = _sprite as FlashDisplayObjectContainer;
         animation = new SymbolPremiumCurrencyIconAnimationGeneric(_nativeObject.animation);
         txtPremiumCurrency = FlashLabel.fromNative(_nativeObject.txtPremiumCurrency);
         iconPremiumCurrency = FlashLabel.fromNative(_nativeObject.iconPremiumCurrency);
         btnBuyPremiumCurrencyAB = new SymbolButtonPlusStaticGeneric(_nativeObject.btnBuyPremiumCurrencyAB);
      }
      
      public function setNativeInstance(param1:SymbolPremiumCurrencyPanel) : void
      {
         FlashSprite.setNativeInstance(_sprite,param1);
         _nativeObject = param1;
         syncInstances();
      }
      
      public function syncInstances() : void
      {
         if(_nativeObject.animation)
         {
            animation.setNativeInstance(_nativeObject.animation);
         }
         FlashLabel.setNativeInstance(txtPremiumCurrency,_nativeObject.txtPremiumCurrency);
         FlashLabel.setNativeInstance(iconPremiumCurrency,_nativeObject.iconPremiumCurrency);
         if(_nativeObject.btnBuyPremiumCurrencyAB)
         {
            btnBuyPremiumCurrencyAB.setNativeInstance(_nativeObject.btnBuyPremiumCurrencyAB);
         }
      }
   }
}
