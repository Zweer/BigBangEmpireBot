package visuals.ui.dialogs
{
   import com.playata.framework.display.Sprite;
   import com.playata.framework.display.lib.flash.FlashDisplayObjectContainer;
   import com.playata.framework.display.lib.flash.FlashLabel;
   import com.playata.framework.display.lib.flash.FlashLabelArea;
   import com.playata.framework.display.lib.flash.FlashSprite;
   import com.playata.framework.display.lib.flash.FlashTextInput;
   import com.playata.framework.display.ui.controls.ILabel;
   import com.playata.framework.display.ui.controls.ILabelArea;
   import com.playata.framework.display.ui.controls.ITextInput;
   import flash.display.MovieClip;
   import visuals.ui.base.SymbolUiButtonDefaultGeneric;
   import visuals.ui.elements.backgrounds.SymbolSlice9BackgroundDialogGeneric;
   import visuals.ui.elements.buttons.SymbolButtonCloseGeneric;
   import visuals.ui.elements.buttons.SymbolButtonDecreaseGeneric;
   import visuals.ui.elements.buttons.SymbolButtonIncreaseGeneric;
   import visuals.ui.elements.icons.SymbolIconGuildMissileBigGeneric;
   import visuals.ui.elements.icons.SymbolIconPremiumCurrencyGeneric;
   
   public class SymbolDialogGuildRechargeMissilesGeneric extends Sprite
   {
       
      
      private var _nativeObject:SymbolDialogGuildRechargeMissiles = null;
      
      public var dialogBackground:SymbolSlice9BackgroundDialogGeneric = null;
      
      public var txtDialogTitle:ILabel = null;
      
      public var txtInfo:ILabelArea = null;
      
      public var txtPremiumCurrency:ILabel = null;
      
      public var iconPremiumCurrency:SymbolIconPremiumCurrencyGeneric = null;
      
      public var btnDecrease:SymbolButtonDecreaseGeneric = null;
      
      public var btnIncrease:SymbolButtonIncreaseGeneric = null;
      
      public var inputAmount:ITextInput = null;
      
      public var txtMissiles:ILabel = null;
      
      public var iconMissiles:SymbolIconGuildMissileBigGeneric = null;
      
      public var txtCostCaption:ILabel = null;
      
      public var btnRecharge:SymbolUiButtonDefaultGeneric = null;
      
      public var btnClose:SymbolButtonCloseGeneric = null;
      
      public function SymbolDialogGuildRechargeMissilesGeneric(param1:MovieClip = null)
      {
         if(param1)
         {
            _nativeObject = param1 as SymbolDialogGuildRechargeMissiles;
         }
         else
         {
            _nativeObject = new SymbolDialogGuildRechargeMissiles();
         }
         super(null,FlashSprite.fromNative(_nativeObject));
         var _loc2_:FlashDisplayObjectContainer = _sprite as FlashDisplayObjectContainer;
         dialogBackground = new SymbolSlice9BackgroundDialogGeneric(_nativeObject.dialogBackground);
         txtDialogTitle = FlashLabel.fromNative(_nativeObject.txtDialogTitle);
         txtInfo = FlashLabelArea.fromNative(_nativeObject.txtInfo);
         txtPremiumCurrency = FlashLabel.fromNative(_nativeObject.txtPremiumCurrency);
         iconPremiumCurrency = new SymbolIconPremiumCurrencyGeneric(_nativeObject.iconPremiumCurrency);
         btnDecrease = new SymbolButtonDecreaseGeneric(_nativeObject.btnDecrease);
         btnIncrease = new SymbolButtonIncreaseGeneric(_nativeObject.btnIncrease);
         inputAmount = FlashTextInput.fromNative(_nativeObject.inputAmount);
         txtMissiles = FlashLabel.fromNative(_nativeObject.txtMissiles);
         iconMissiles = new SymbolIconGuildMissileBigGeneric(_nativeObject.iconMissiles);
         txtCostCaption = FlashLabel.fromNative(_nativeObject.txtCostCaption);
         btnRecharge = new SymbolUiButtonDefaultGeneric(_nativeObject.btnRecharge);
         btnClose = new SymbolButtonCloseGeneric(_nativeObject.btnClose);
      }
      
      public function setNativeInstance(param1:SymbolDialogGuildRechargeMissiles) : void
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
         FlashLabel.setNativeInstance(txtDialogTitle,_nativeObject.txtDialogTitle);
         FlashLabelArea.setNativeInstance(txtInfo,_nativeObject.txtInfo);
         FlashLabel.setNativeInstance(txtPremiumCurrency,_nativeObject.txtPremiumCurrency);
         if(_nativeObject.iconPremiumCurrency)
         {
            iconPremiumCurrency.setNativeInstance(_nativeObject.iconPremiumCurrency);
         }
         if(_nativeObject.btnDecrease)
         {
            btnDecrease.setNativeInstance(_nativeObject.btnDecrease);
         }
         if(_nativeObject.btnIncrease)
         {
            btnIncrease.setNativeInstance(_nativeObject.btnIncrease);
         }
         FlashTextInput.setNativeInstance(inputAmount,_nativeObject.inputAmount);
         FlashLabel.setNativeInstance(txtMissiles,_nativeObject.txtMissiles);
         if(_nativeObject.iconMissiles)
         {
            iconMissiles.setNativeInstance(_nativeObject.iconMissiles);
         }
         FlashLabel.setNativeInstance(txtCostCaption,_nativeObject.txtCostCaption);
         if(_nativeObject.btnRecharge)
         {
            btnRecharge.setNativeInstance(_nativeObject.btnRecharge);
         }
         if(_nativeObject.btnClose)
         {
            btnClose.setNativeInstance(_nativeObject.btnClose);
         }
      }
   }
}
