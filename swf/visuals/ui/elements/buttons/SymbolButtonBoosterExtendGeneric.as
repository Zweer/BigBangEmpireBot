package visuals.ui.elements.buttons
{
   import com.playata.framework.display.Sprite;
   import com.playata.framework.display.lib.flash.FlashDisplayObjectContainer;
   import com.playata.framework.display.lib.flash.FlashLabel;
   import com.playata.framework.display.lib.flash.FlashLabelArea;
   import com.playata.framework.display.lib.flash.FlashSprite;
   import com.playata.framework.display.ui.controls.ILabel;
   import com.playata.framework.display.ui.controls.ILabelArea;
   import flash.display.MovieClip;
   import visuals.ui.base.SymbolDummyGeneric;
   import visuals.ui.elements.backgrounds.SymbolBackgroundScalableGeneric;
   import visuals.ui.elements.booster.SymbolBoosterGeneric;
   import visuals.ui.elements.icons.SymbolBoosterMultitaskingGeneric;
   import visuals.ui.elements.icons.SymbolBoosterSenseGeneric;
   import visuals.ui.elements.icons.SymbolIconCheckmarkGeneric;
   
   public class SymbolButtonBoosterExtendGeneric extends Sprite
   {
       
      
      private var _nativeObject:SymbolButtonBoosterExtend = null;
      
      public var backgroundQuest:SymbolBackgroundScalableGeneric = null;
      
      public var backgroundStats:SymbolBackgroundScalableGeneric = null;
      
      public var backgroundWork:SymbolBackgroundScalableGeneric = null;
      
      public var btnBuyForPremiumCurrency:SymbolButtonPremiumGeneric = null;
      
      public var btnBuyForGameCurrency:SymbolButtonGameCurrencyGeneric = null;
      
      public var booster:SymbolBoosterGeneric = null;
      
      public var boosterSense:SymbolBoosterSenseGeneric = null;
      
      public var boosterMultitasking:SymbolBoosterMultitaskingGeneric = null;
      
      public var checkmark:SymbolIconCheckmarkGeneric = null;
      
      public var txtDuration:ILabel = null;
      
      public var txtBoosterType:ILabelArea = null;
      
      public var txtEffectAmount:ILabel = null;
      
      public var tooltipLayer:SymbolDummyGeneric = null;
      
      public function SymbolButtonBoosterExtendGeneric(param1:MovieClip = null)
      {
         if(param1)
         {
            _nativeObject = param1 as SymbolButtonBoosterExtend;
         }
         else
         {
            _nativeObject = new SymbolButtonBoosterExtend();
         }
         super(null,FlashSprite.fromNative(_nativeObject));
         var _loc2_:FlashDisplayObjectContainer = _sprite as FlashDisplayObjectContainer;
         backgroundQuest = new SymbolBackgroundScalableGeneric(_nativeObject.backgroundQuest);
         backgroundStats = new SymbolBackgroundScalableGeneric(_nativeObject.backgroundStats);
         backgroundWork = new SymbolBackgroundScalableGeneric(_nativeObject.backgroundWork);
         btnBuyForPremiumCurrency = new SymbolButtonPremiumGeneric(_nativeObject.btnBuyForPremiumCurrency);
         btnBuyForGameCurrency = new SymbolButtonGameCurrencyGeneric(_nativeObject.btnBuyForGameCurrency);
         booster = new SymbolBoosterGeneric(_nativeObject.booster);
         boosterSense = new SymbolBoosterSenseGeneric(_nativeObject.boosterSense);
         boosterMultitasking = new SymbolBoosterMultitaskingGeneric(_nativeObject.boosterMultitasking);
         checkmark = new SymbolIconCheckmarkGeneric(_nativeObject.checkmark);
         txtDuration = FlashLabel.fromNative(_nativeObject.txtDuration);
         txtBoosterType = FlashLabelArea.fromNative(_nativeObject.txtBoosterType);
         txtEffectAmount = FlashLabel.fromNative(_nativeObject.txtEffectAmount);
         tooltipLayer = new SymbolDummyGeneric(_nativeObject.tooltipLayer);
      }
      
      public function setNativeInstance(param1:SymbolButtonBoosterExtend) : void
      {
         FlashSprite.setNativeInstance(_sprite,param1);
         _nativeObject = param1;
         syncInstances();
      }
      
      public function syncInstances() : void
      {
         if(_nativeObject.backgroundQuest)
         {
            backgroundQuest.setNativeInstance(_nativeObject.backgroundQuest);
         }
         if(_nativeObject.backgroundStats)
         {
            backgroundStats.setNativeInstance(_nativeObject.backgroundStats);
         }
         if(_nativeObject.backgroundWork)
         {
            backgroundWork.setNativeInstance(_nativeObject.backgroundWork);
         }
         if(_nativeObject.btnBuyForPremiumCurrency)
         {
            btnBuyForPremiumCurrency.setNativeInstance(_nativeObject.btnBuyForPremiumCurrency);
         }
         if(_nativeObject.btnBuyForGameCurrency)
         {
            btnBuyForGameCurrency.setNativeInstance(_nativeObject.btnBuyForGameCurrency);
         }
         if(_nativeObject.booster)
         {
            booster.setNativeInstance(_nativeObject.booster);
         }
         if(_nativeObject.boosterSense)
         {
            boosterSense.setNativeInstance(_nativeObject.boosterSense);
         }
         if(_nativeObject.boosterMultitasking)
         {
            boosterMultitasking.setNativeInstance(_nativeObject.boosterMultitasking);
         }
         if(_nativeObject.checkmark)
         {
            checkmark.setNativeInstance(_nativeObject.checkmark);
         }
         FlashLabel.setNativeInstance(txtDuration,_nativeObject.txtDuration);
         FlashLabelArea.setNativeInstance(txtBoosterType,_nativeObject.txtBoosterType);
         FlashLabel.setNativeInstance(txtEffectAmount,_nativeObject.txtEffectAmount);
         if(_nativeObject.tooltipLayer)
         {
            tooltipLayer.setNativeInstance(_nativeObject.tooltipLayer);
         }
      }
   }
}
