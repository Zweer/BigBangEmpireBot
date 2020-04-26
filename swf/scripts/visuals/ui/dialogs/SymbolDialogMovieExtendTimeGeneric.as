package visuals.ui.dialogs
{
   import com.playata.framework.display.Sprite;
   import com.playata.framework.display.lib.flash.FlashDisplayObjectContainer;
   import com.playata.framework.display.lib.flash.FlashLabelArea;
   import com.playata.framework.display.lib.flash.FlashSprite;
   import com.playata.framework.display.ui.controls.ILabelArea;
   import flash.display.MovieClip;
   import visuals.ui.elements.backgrounds.SymbolSlice9BackgroundDialogGeneric;
   import visuals.ui.elements.buttons.SymbolButtonCloseGeneric;
   import visuals.ui.elements.buttons.SymbolButtonGameCurrencyGeneric;
   import visuals.ui.elements.buttons.SymbolButtonPremiumGeneric;
   import visuals.ui.elements.duel.SymbolDiscountHintGeneric;
   
   public class SymbolDialogMovieExtendTimeGeneric extends Sprite
   {
       
      
      private var _nativeObject:SymbolDialogMovieExtendTime = null;
      
      public var dialogBackground:SymbolSlice9BackgroundDialogGeneric = null;
      
      public var txtDialogTitle:ILabelArea = null;
      
      public var btnClose:SymbolButtonCloseGeneric = null;
      
      public var btnBuyForPremiumCurrency:SymbolButtonPremiumGeneric = null;
      
      public var txtInfo:ILabelArea = null;
      
      public var btnBuyForCoins:SymbolButtonGameCurrencyGeneric = null;
      
      public var discountHint:SymbolDiscountHintGeneric = null;
      
      public function SymbolDialogMovieExtendTimeGeneric(param1:MovieClip = null)
      {
         if(param1)
         {
            _nativeObject = param1 as SymbolDialogMovieExtendTime;
         }
         else
         {
            _nativeObject = new SymbolDialogMovieExtendTime();
         }
         super(null,FlashSprite.fromNative(_nativeObject));
         var _loc2_:FlashDisplayObjectContainer = _sprite as FlashDisplayObjectContainer;
         dialogBackground = new SymbolSlice9BackgroundDialogGeneric(_nativeObject.dialogBackground);
         txtDialogTitle = FlashLabelArea.fromNative(_nativeObject.txtDialogTitle);
         btnClose = new SymbolButtonCloseGeneric(_nativeObject.btnClose);
         btnBuyForPremiumCurrency = new SymbolButtonPremiumGeneric(_nativeObject.btnBuyForPremiumCurrency);
         txtInfo = FlashLabelArea.fromNative(_nativeObject.txtInfo);
         btnBuyForCoins = new SymbolButtonGameCurrencyGeneric(_nativeObject.btnBuyForCoins);
         discountHint = new SymbolDiscountHintGeneric(_nativeObject.discountHint);
      }
      
      public function setNativeInstance(param1:SymbolDialogMovieExtendTime) : void
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
         FlashLabelArea.setNativeInstance(txtDialogTitle,_nativeObject.txtDialogTitle);
         if(_nativeObject.btnClose)
         {
            btnClose.setNativeInstance(_nativeObject.btnClose);
         }
         if(_nativeObject.btnBuyForPremiumCurrency)
         {
            btnBuyForPremiumCurrency.setNativeInstance(_nativeObject.btnBuyForPremiumCurrency);
         }
         FlashLabelArea.setNativeInstance(txtInfo,_nativeObject.txtInfo);
         if(_nativeObject.btnBuyForCoins)
         {
            btnBuyForCoins.setNativeInstance(_nativeObject.btnBuyForCoins);
         }
         if(_nativeObject.discountHint)
         {
            discountHint.setNativeInstance(_nativeObject.discountHint);
         }
      }
   }
}
