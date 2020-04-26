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
   import visuals.ui.base.SymbolUiButtonDefaultGeneric;
   import visuals.ui.elements.backgrounds.SymbolSlice9BackgroundDialogGeneric;
   import visuals.ui.elements.booster.SymbolBoosterType1Strength2Generic;
   import visuals.ui.elements.dating.SymbolIconDatingPictureGeneric;
   import visuals.ui.elements.icons.SymbolIconPremiumCurrencyGeneric;
   import visuals.ui.elements.tutorial.SymbolLadySideGeneric;
   
   public class SymbolDialogTutorialCompleteGeneric extends Sprite
   {
       
      
      private var _nativeObject:SymbolDialogTutorialComplete = null;
      
      public var dialogBackground:SymbolSlice9BackgroundDialogGeneric = null;
      
      public var btnClose:SymbolUiButtonDefaultGeneric = null;
      
      public var txtDialogTitle:ILabel = null;
      
      public var txtRewardPremiumCurrency:ILabelArea = null;
      
      public var txtRewardBooster:ILabelArea = null;
      
      public var txtRewardDating:ILabelArea = null;
      
      public var txtMessage:ILabelArea = null;
      
      public var iconRewardPremiumCurrency:SymbolIconPremiumCurrencyGeneric = null;
      
      public var iconRewardBooster:SymbolBoosterType1Strength2Generic = null;
      
      public var iconRewardDating:SymbolIconDatingPictureGeneric = null;
      
      public var lady:SymbolLadySideGeneric = null;
      
      public function SymbolDialogTutorialCompleteGeneric(param1:MovieClip = null)
      {
         if(param1)
         {
            _nativeObject = param1 as SymbolDialogTutorialComplete;
         }
         else
         {
            _nativeObject = new SymbolDialogTutorialComplete();
         }
         super(null,FlashSprite.fromNative(_nativeObject));
         var _loc2_:FlashDisplayObjectContainer = _sprite as FlashDisplayObjectContainer;
         dialogBackground = new SymbolSlice9BackgroundDialogGeneric(_nativeObject.dialogBackground);
         btnClose = new SymbolUiButtonDefaultGeneric(_nativeObject.btnClose);
         txtDialogTitle = FlashLabel.fromNative(_nativeObject.txtDialogTitle);
         txtRewardPremiumCurrency = FlashLabelArea.fromNative(_nativeObject.txtRewardPremiumCurrency);
         txtRewardBooster = FlashLabelArea.fromNative(_nativeObject.txtRewardBooster);
         txtRewardDating = FlashLabelArea.fromNative(_nativeObject.txtRewardDating);
         txtMessage = FlashLabelArea.fromNative(_nativeObject.txtMessage);
         iconRewardPremiumCurrency = new SymbolIconPremiumCurrencyGeneric(_nativeObject.iconRewardPremiumCurrency);
         iconRewardBooster = new SymbolBoosterType1Strength2Generic(_nativeObject.iconRewardBooster);
         iconRewardDating = new SymbolIconDatingPictureGeneric(_nativeObject.iconRewardDating);
         lady = new SymbolLadySideGeneric(_nativeObject.lady);
      }
      
      public function setNativeInstance(param1:SymbolDialogTutorialComplete) : void
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
         if(_nativeObject.btnClose)
         {
            btnClose.setNativeInstance(_nativeObject.btnClose);
         }
         FlashLabel.setNativeInstance(txtDialogTitle,_nativeObject.txtDialogTitle);
         FlashLabelArea.setNativeInstance(txtRewardPremiumCurrency,_nativeObject.txtRewardPremiumCurrency);
         FlashLabelArea.setNativeInstance(txtRewardBooster,_nativeObject.txtRewardBooster);
         FlashLabelArea.setNativeInstance(txtRewardDating,_nativeObject.txtRewardDating);
         FlashLabelArea.setNativeInstance(txtMessage,_nativeObject.txtMessage);
         if(_nativeObject.iconRewardPremiumCurrency)
         {
            iconRewardPremiumCurrency.setNativeInstance(_nativeObject.iconRewardPremiumCurrency);
         }
         if(_nativeObject.iconRewardBooster)
         {
            iconRewardBooster.setNativeInstance(_nativeObject.iconRewardBooster);
         }
         if(_nativeObject.iconRewardDating)
         {
            iconRewardDating.setNativeInstance(_nativeObject.iconRewardDating);
         }
         if(_nativeObject.lady)
         {
            lady.setNativeInstance(_nativeObject.lady);
         }
      }
   }
}
