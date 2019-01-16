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
   import visuals.ui.elements.guild.SymbolGuildDonationInfoGeneric;
   import visuals.ui.elements.icons.SymbolIconGameCurrencyGeneric;
   import visuals.ui.elements.icons.SymbolIconPremiumCurrencyGeneric;
   
   public class SymbolDialogGuildDonationGeneric extends Sprite
   {
       
      
      private var _nativeObject:SymbolDialogGuildDonation = null;
      
      public var dialogBackground:SymbolSlice9BackgroundDialogGeneric = null;
      
      public var txtDialogTitle:ILabel = null;
      
      public var txtInfo:ILabelArea = null;
      
      public var info:SymbolGuildDonationInfoGeneric = null;
      
      public var iconCoin:SymbolIconGameCurrencyGeneric = null;
      
      public var txtCoins:ILabel = null;
      
      public var txtPremiumCurrency:ILabel = null;
      
      public var iconPremiumCurrency:SymbolIconPremiumCurrencyGeneric = null;
      
      public var inputCoins:ITextInput = null;
      
      public var btnCoinDecrease:SymbolButtonDecreaseGeneric = null;
      
      public var btnCoinIncrease:SymbolButtonIncreaseGeneric = null;
      
      public var btnPremiumCurrencyDecrease:SymbolButtonDecreaseGeneric = null;
      
      public var btnPremiumCurrencyIncrease:SymbolButtonIncreaseGeneric = null;
      
      public var inputPremiumCurrency:ITextInput = null;
      
      public var btnDonate:SymbolUiButtonDefaultGeneric = null;
      
      public var btnClose:SymbolButtonCloseGeneric = null;
      
      public function SymbolDialogGuildDonationGeneric(param1:MovieClip = null)
      {
         if(param1)
         {
            _nativeObject = param1 as SymbolDialogGuildDonation;
         }
         else
         {
            _nativeObject = new SymbolDialogGuildDonation();
         }
         super(null,FlashSprite.fromNative(_nativeObject));
         var _loc2_:FlashDisplayObjectContainer = _sprite as FlashDisplayObjectContainer;
         dialogBackground = new SymbolSlice9BackgroundDialogGeneric(_nativeObject.dialogBackground);
         txtDialogTitle = FlashLabel.fromNative(_nativeObject.txtDialogTitle);
         txtInfo = FlashLabelArea.fromNative(_nativeObject.txtInfo);
         info = new SymbolGuildDonationInfoGeneric(_nativeObject.info);
         iconCoin = new SymbolIconGameCurrencyGeneric(_nativeObject.iconCoin);
         txtCoins = FlashLabel.fromNative(_nativeObject.txtCoins);
         txtPremiumCurrency = FlashLabel.fromNative(_nativeObject.txtPremiumCurrency);
         iconPremiumCurrency = new SymbolIconPremiumCurrencyGeneric(_nativeObject.iconPremiumCurrency);
         inputCoins = FlashTextInput.fromNative(_nativeObject.inputCoins);
         btnCoinDecrease = new SymbolButtonDecreaseGeneric(_nativeObject.btnCoinDecrease);
         btnCoinIncrease = new SymbolButtonIncreaseGeneric(_nativeObject.btnCoinIncrease);
         btnPremiumCurrencyDecrease = new SymbolButtonDecreaseGeneric(_nativeObject.btnPremiumCurrencyDecrease);
         btnPremiumCurrencyIncrease = new SymbolButtonIncreaseGeneric(_nativeObject.btnPremiumCurrencyIncrease);
         inputPremiumCurrency = FlashTextInput.fromNative(_nativeObject.inputPremiumCurrency);
         btnDonate = new SymbolUiButtonDefaultGeneric(_nativeObject.btnDonate);
         btnClose = new SymbolButtonCloseGeneric(_nativeObject.btnClose);
      }
      
      public function setNativeInstance(param1:SymbolDialogGuildDonation) : void
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
         if(_nativeObject.info)
         {
            info.setNativeInstance(_nativeObject.info);
         }
         if(_nativeObject.iconCoin)
         {
            iconCoin.setNativeInstance(_nativeObject.iconCoin);
         }
         FlashLabel.setNativeInstance(txtCoins,_nativeObject.txtCoins);
         FlashLabel.setNativeInstance(txtPremiumCurrency,_nativeObject.txtPremiumCurrency);
         if(_nativeObject.iconPremiumCurrency)
         {
            iconPremiumCurrency.setNativeInstance(_nativeObject.iconPremiumCurrency);
         }
         FlashTextInput.setNativeInstance(inputCoins,_nativeObject.inputCoins);
         if(_nativeObject.btnCoinDecrease)
         {
            btnCoinDecrease.setNativeInstance(_nativeObject.btnCoinDecrease);
         }
         if(_nativeObject.btnCoinIncrease)
         {
            btnCoinIncrease.setNativeInstance(_nativeObject.btnCoinIncrease);
         }
         if(_nativeObject.btnPremiumCurrencyDecrease)
         {
            btnPremiumCurrencyDecrease.setNativeInstance(_nativeObject.btnPremiumCurrencyDecrease);
         }
         if(_nativeObject.btnPremiumCurrencyIncrease)
         {
            btnPremiumCurrencyIncrease.setNativeInstance(_nativeObject.btnPremiumCurrencyIncrease);
         }
         FlashTextInput.setNativeInstance(inputPremiumCurrency,_nativeObject.inputPremiumCurrency);
         if(_nativeObject.btnDonate)
         {
            btnDonate.setNativeInstance(_nativeObject.btnDonate);
         }
         if(_nativeObject.btnClose)
         {
            btnClose.setNativeInstance(_nativeObject.btnClose);
         }
      }
   }
}
