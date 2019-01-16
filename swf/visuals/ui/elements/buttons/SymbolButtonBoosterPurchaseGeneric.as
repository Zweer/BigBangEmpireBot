package visuals.ui.elements.buttons
{
   import com.playata.framework.display.Sprite;
   import com.playata.framework.display.lib.flash.FlashDisplayObjectContainer;
   import com.playata.framework.display.lib.flash.FlashLabel;
   import com.playata.framework.display.lib.flash.FlashSprite;
   import com.playata.framework.display.ui.controls.ILabel;
   import flash.display.MovieClip;
   import visuals.ui.base.SymbolDummyGeneric;
   import visuals.ui.elements.backgrounds.SymbolBackgroundScalableGeneric;
   import visuals.ui.elements.booster.SymbolBoosterGeneric;
   import visuals.ui.elements.icons.SymbolIconCheckmarkGeneric;
   
   public class SymbolButtonBoosterPurchaseGeneric extends Sprite
   {
       
      
      private var _nativeObject:SymbolButtonBoosterPurchase = null;
      
      public var boosterHighlightWork:SymbolBackgroundScalableGeneric = null;
      
      public var boosterHighlightStats:SymbolBackgroundScalableGeneric = null;
      
      public var boosterHighlightQuest:SymbolBackgroundScalableGeneric = null;
      
      public var btnBuyForPremiumCurrency:SymbolButtonPremiumGeneric = null;
      
      public var btnBuyForGameCurrency:SymbolButtonGameCurrencyGeneric = null;
      
      public var txtDuration:ILabel = null;
      
      public var txtEffectAmount:ILabel = null;
      
      public var booster:SymbolBoosterGeneric = null;
      
      public var checkmark:SymbolIconCheckmarkGeneric = null;
      
      public var tooltipLayer:SymbolDummyGeneric = null;
      
      public function SymbolButtonBoosterPurchaseGeneric(param1:MovieClip = null)
      {
         if(param1)
         {
            _nativeObject = param1 as SymbolButtonBoosterPurchase;
         }
         else
         {
            _nativeObject = new SymbolButtonBoosterPurchase();
         }
         super(null,FlashSprite.fromNative(_nativeObject));
         var _loc2_:FlashDisplayObjectContainer = _sprite as FlashDisplayObjectContainer;
         boosterHighlightWork = new SymbolBackgroundScalableGeneric(_nativeObject.boosterHighlightWork);
         boosterHighlightStats = new SymbolBackgroundScalableGeneric(_nativeObject.boosterHighlightStats);
         boosterHighlightQuest = new SymbolBackgroundScalableGeneric(_nativeObject.boosterHighlightQuest);
         btnBuyForPremiumCurrency = new SymbolButtonPremiumGeneric(_nativeObject.btnBuyForPremiumCurrency);
         btnBuyForGameCurrency = new SymbolButtonGameCurrencyGeneric(_nativeObject.btnBuyForGameCurrency);
         txtDuration = FlashLabel.fromNative(_nativeObject.txtDuration);
         txtEffectAmount = FlashLabel.fromNative(_nativeObject.txtEffectAmount);
         booster = new SymbolBoosterGeneric(_nativeObject.booster);
         checkmark = new SymbolIconCheckmarkGeneric(_nativeObject.checkmark);
         tooltipLayer = new SymbolDummyGeneric(_nativeObject.tooltipLayer);
      }
      
      public function setNativeInstance(param1:SymbolButtonBoosterPurchase) : void
      {
         FlashSprite.setNativeInstance(_sprite,param1);
         _nativeObject = param1;
         syncInstances();
      }
      
      public function syncInstances() : void
      {
         if(_nativeObject.boosterHighlightWork)
         {
            boosterHighlightWork.setNativeInstance(_nativeObject.boosterHighlightWork);
         }
         if(_nativeObject.boosterHighlightStats)
         {
            boosterHighlightStats.setNativeInstance(_nativeObject.boosterHighlightStats);
         }
         if(_nativeObject.boosterHighlightQuest)
         {
            boosterHighlightQuest.setNativeInstance(_nativeObject.boosterHighlightQuest);
         }
         if(_nativeObject.btnBuyForPremiumCurrency)
         {
            btnBuyForPremiumCurrency.setNativeInstance(_nativeObject.btnBuyForPremiumCurrency);
         }
         if(_nativeObject.btnBuyForGameCurrency)
         {
            btnBuyForGameCurrency.setNativeInstance(_nativeObject.btnBuyForGameCurrency);
         }
         FlashLabel.setNativeInstance(txtDuration,_nativeObject.txtDuration);
         FlashLabel.setNativeInstance(txtEffectAmount,_nativeObject.txtEffectAmount);
         if(_nativeObject.booster)
         {
            booster.setNativeInstance(_nativeObject.booster);
         }
         if(_nativeObject.checkmark)
         {
            checkmark.setNativeInstance(_nativeObject.checkmark);
         }
         if(_nativeObject.tooltipLayer)
         {
            tooltipLayer.setNativeInstance(_nativeObject.tooltipLayer);
         }
      }
   }
}
