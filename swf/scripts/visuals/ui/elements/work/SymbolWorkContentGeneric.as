package visuals.ui.elements.work
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
   import visuals.ui.base.SymbolUiButtonWideGeneric;
   import visuals.ui.elements.backgrounds.SymbolBackgroundScalableGeneric;
   import visuals.ui.elements.backgrounds.SymbolSlice9BackgroundDialogGeneric;
   import visuals.ui.elements.generic.SymbolTimeBarGeneric;
   import visuals.ui.elements.icons.SymbolIconGameCurrencyGeneric;
   
   public class SymbolWorkContentGeneric extends Sprite
   {
       
      
      private var _nativeObject:SymbolWorkContent = null;
      
      public var dialogBackground:SymbolSlice9BackgroundDialogGeneric = null;
      
      public var symbolBackgroundScalable:SymbolBackgroundScalableGeneric = null;
      
      public var txtWorkDescription:ILabelArea = null;
      
      public var txtCoinsPerHour:ILabelArea = null;
      
      public var txtWorkTitle:ILabelArea = null;
      
      public var txtCountdown:ILabel = null;
      
      public var txtTimeRemaining:ILabel = null;
      
      public var btnCollectWork:SymbolUiButtonWideGeneric = null;
      
      public var timeBar:SymbolTimeBarGeneric = null;
      
      public var txtCurrentReward:ILabelArea = null;
      
      public var iconCoins:SymbolIconGameCurrencyGeneric = null;
      
      public var symbolIconGameCurrency:SymbolIconGameCurrencyGeneric = null;
      
      public var textContainer:SymbolDummyGeneric = null;
      
      public function SymbolWorkContentGeneric(param1:MovieClip = null)
      {
         if(param1)
         {
            _nativeObject = param1 as SymbolWorkContent;
         }
         else
         {
            _nativeObject = new SymbolWorkContent();
         }
         super(null,FlashSprite.fromNative(_nativeObject));
         var _loc2_:FlashDisplayObjectContainer = _sprite as FlashDisplayObjectContainer;
         dialogBackground = new SymbolSlice9BackgroundDialogGeneric(_nativeObject.dialogBackground);
         symbolBackgroundScalable = new SymbolBackgroundScalableGeneric(_nativeObject.symbolBackgroundScalable);
         txtWorkDescription = FlashLabelArea.fromNative(_nativeObject.txtWorkDescription);
         txtCoinsPerHour = FlashLabelArea.fromNative(_nativeObject.txtCoinsPerHour);
         txtWorkTitle = FlashLabelArea.fromNative(_nativeObject.txtWorkTitle);
         txtCountdown = FlashLabel.fromNative(_nativeObject.txtCountdown);
         txtTimeRemaining = FlashLabel.fromNative(_nativeObject.txtTimeRemaining);
         btnCollectWork = new SymbolUiButtonWideGeneric(_nativeObject.btnCollectWork);
         timeBar = new SymbolTimeBarGeneric(_nativeObject.timeBar);
         txtCurrentReward = FlashLabelArea.fromNative(_nativeObject.txtCurrentReward);
         iconCoins = new SymbolIconGameCurrencyGeneric(_nativeObject.iconCoins);
         symbolIconGameCurrency = new SymbolIconGameCurrencyGeneric(_nativeObject.symbolIconGameCurrency);
         textContainer = new SymbolDummyGeneric(_nativeObject.textContainer);
      }
      
      public function setNativeInstance(param1:SymbolWorkContent) : void
      {
         FlashSprite.setNativeInstance(_sprite,param1);
         _nativeObject = param1;
         syncInstances();
      }
      
      public function syncInstances() : void
      {
         if(_nativeObject.dialogBackground)
         {
            dialogBackground.setNativeInstance(_nativeObject.dialogBackground);
         }
         if(_nativeObject.symbolBackgroundScalable)
         {
            symbolBackgroundScalable.setNativeInstance(_nativeObject.symbolBackgroundScalable);
         }
         FlashLabelArea.setNativeInstance(txtWorkDescription,_nativeObject.txtWorkDescription);
         FlashLabelArea.setNativeInstance(txtCoinsPerHour,_nativeObject.txtCoinsPerHour);
         FlashLabelArea.setNativeInstance(txtWorkTitle,_nativeObject.txtWorkTitle);
         FlashLabel.setNativeInstance(txtCountdown,_nativeObject.txtCountdown);
         FlashLabel.setNativeInstance(txtTimeRemaining,_nativeObject.txtTimeRemaining);
         if(_nativeObject.btnCollectWork)
         {
            btnCollectWork.setNativeInstance(_nativeObject.btnCollectWork);
         }
         if(_nativeObject.timeBar)
         {
            timeBar.setNativeInstance(_nativeObject.timeBar);
         }
         FlashLabelArea.setNativeInstance(txtCurrentReward,_nativeObject.txtCurrentReward);
         if(_nativeObject.iconCoins)
         {
            iconCoins.setNativeInstance(_nativeObject.iconCoins);
         }
         if(_nativeObject.symbolIconGameCurrency)
         {
            symbolIconGameCurrency.setNativeInstance(_nativeObject.symbolIconGameCurrency);
         }
         if(_nativeObject.textContainer)
         {
            textContainer.setNativeInstance(_nativeObject.textContainer);
         }
      }
   }
}
