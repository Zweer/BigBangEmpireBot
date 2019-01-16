package visuals.ui.dialogs
{
   import com.playata.framework.display.Sprite;
   import com.playata.framework.display.lib.flash.FlashDisplayObjectContainer;
   import com.playata.framework.display.lib.flash.FlashLabel;
   import com.playata.framework.display.lib.flash.FlashLabelArea;
   import com.playata.framework.display.lib.flash.FlashSprite;
   import com.playata.framework.display.ui.controls.ILabel;
   import com.playata.framework.display.ui.controls.ILabelArea;
   import flash.display.MovieClip;
   import visuals.ui.elements.backgrounds.SymbolSlice9BackgroundDialogGeneric;
   import visuals.ui.elements.buttons.SymbolButtonCloseGeneric;
   import visuals.ui.elements.buttons.SymbolButtonGameCurrencyGeneric;
   import visuals.ui.elements.buttons.SymbolButtonPremiumGeneric;
   import visuals.ui.elements.duel.SymbolDiscountHintGeneric;
   import visuals.ui.elements.quest.SymbolEnergyLadyGeneric;
   
   public class SymbolDialogOutOfEnergyGeneric extends Sprite
   {
       
      
      private var _nativeObject:SymbolDialogOutOfEnergy = null;
      
      public var dialogBackground:SymbolSlice9BackgroundDialogGeneric = null;
      
      public var lady:SymbolEnergyLadyGeneric = null;
      
      public var txtDialogTitle:ILabelArea = null;
      
      public var btnClose:SymbolButtonCloseGeneric = null;
      
      public var btnBuyEnergyForPremiumCurrency:SymbolButtonPremiumGeneric = null;
      
      public var txtInstructionsCaption:ILabel = null;
      
      public var txtEnergyNotice:ILabelArea = null;
      
      public var txtInstructionsBuy:ILabel = null;
      
      public var btnBuyEnergyForCoins:SymbolButtonGameCurrencyGeneric = null;
      
      public var discountHint:SymbolDiscountHintGeneric = null;
      
      public function SymbolDialogOutOfEnergyGeneric(param1:MovieClip = null)
      {
         if(param1)
         {
            _nativeObject = param1 as SymbolDialogOutOfEnergy;
         }
         else
         {
            _nativeObject = new SymbolDialogOutOfEnergy();
         }
         super(null,FlashSprite.fromNative(_nativeObject));
         var _loc2_:FlashDisplayObjectContainer = _sprite as FlashDisplayObjectContainer;
         dialogBackground = new SymbolSlice9BackgroundDialogGeneric(_nativeObject.dialogBackground);
         lady = new SymbolEnergyLadyGeneric(_nativeObject.lady);
         txtDialogTitle = FlashLabelArea.fromNative(_nativeObject.txtDialogTitle);
         btnClose = new SymbolButtonCloseGeneric(_nativeObject.btnClose);
         btnBuyEnergyForPremiumCurrency = new SymbolButtonPremiumGeneric(_nativeObject.btnBuyEnergyForPremiumCurrency);
         txtInstructionsCaption = FlashLabel.fromNative(_nativeObject.txtInstructionsCaption);
         txtEnergyNotice = FlashLabelArea.fromNative(_nativeObject.txtEnergyNotice);
         txtInstructionsBuy = FlashLabel.fromNative(_nativeObject.txtInstructionsBuy);
         btnBuyEnergyForCoins = new SymbolButtonGameCurrencyGeneric(_nativeObject.btnBuyEnergyForCoins);
         discountHint = new SymbolDiscountHintGeneric(_nativeObject.discountHint);
      }
      
      public function setNativeInstance(param1:SymbolDialogOutOfEnergy) : void
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
         if(_nativeObject.lady)
         {
            lady.setNativeInstance(_nativeObject.lady);
         }
         FlashLabelArea.setNativeInstance(txtDialogTitle,_nativeObject.txtDialogTitle);
         if(_nativeObject.btnClose)
         {
            btnClose.setNativeInstance(_nativeObject.btnClose);
         }
         if(_nativeObject.btnBuyEnergyForPremiumCurrency)
         {
            btnBuyEnergyForPremiumCurrency.setNativeInstance(_nativeObject.btnBuyEnergyForPremiumCurrency);
         }
         FlashLabel.setNativeInstance(txtInstructionsCaption,_nativeObject.txtInstructionsCaption);
         FlashLabelArea.setNativeInstance(txtEnergyNotice,_nativeObject.txtEnergyNotice);
         FlashLabel.setNativeInstance(txtInstructionsBuy,_nativeObject.txtInstructionsBuy);
         if(_nativeObject.btnBuyEnergyForCoins)
         {
            btnBuyEnergyForCoins.setNativeInstance(_nativeObject.btnBuyEnergyForCoins);
         }
         if(_nativeObject.discountHint)
         {
            discountHint.setNativeInstance(_nativeObject.discountHint);
         }
      }
   }
}
