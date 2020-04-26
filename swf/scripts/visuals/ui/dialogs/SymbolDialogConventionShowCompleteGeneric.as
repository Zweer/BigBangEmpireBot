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
   import visuals.ui.base.SymbolPlaceholderGeneric;
   import visuals.ui.base.SymbolUiButtonDefaultGeneric;
   import visuals.ui.elements.backgrounds.SymbolSlice9BackgroundDialogGeneric;
   import visuals.ui.elements.conventions.SymbolConventionFansBarGeneric;
   import visuals.ui.elements.icons.SymbolIconGameCurrencyGeneric;
   import visuals.ui.elements.icons.SymbolIconVisitorsGeneric;
   import visuals.ui.elements.icons.SymbolIconXpGeneric;
   
   public class SymbolDialogConventionShowCompleteGeneric extends Sprite
   {
       
      
      private var _nativeObject:SymbolDialogConventionShowComplete = null;
      
      public var conventionBannerRight:SymbolPlaceholderGeneric = null;
      
      public var conventionBannerLeft:SymbolPlaceholderGeneric = null;
      
      public var dialogBackground:SymbolSlice9BackgroundDialogGeneric = null;
      
      public var txtShowCountTotal:ILabel = null;
      
      public var txtShowCountOwn:ILabel = null;
      
      public var btnClose:SymbolUiButtonDefaultGeneric = null;
      
      public var txtFansTotal:ILabel = null;
      
      public var progress:SymbolConventionFansBarGeneric = null;
      
      public var symbolIconVisitors:SymbolIconVisitorsGeneric = null;
      
      public var txtFans:ILabel = null;
      
      public var txtInfo:ILabelArea = null;
      
      public var iconGameCurrency:SymbolIconGameCurrencyGeneric = null;
      
      public var txtCoins:ILabel = null;
      
      public var txtRewardsCaption:ILabel = null;
      
      public var txtXp:ILabel = null;
      
      public var iconXp:SymbolIconXpGeneric = null;
      
      public var txtDialogTitle:ILabelArea = null;
      
      public function SymbolDialogConventionShowCompleteGeneric(param1:MovieClip = null)
      {
         if(param1)
         {
            _nativeObject = param1 as SymbolDialogConventionShowComplete;
         }
         else
         {
            _nativeObject = new SymbolDialogConventionShowComplete();
         }
         super(null,FlashSprite.fromNative(_nativeObject));
         var _loc2_:FlashDisplayObjectContainer = _sprite as FlashDisplayObjectContainer;
         conventionBannerRight = new SymbolPlaceholderGeneric(_nativeObject.conventionBannerRight);
         conventionBannerLeft = new SymbolPlaceholderGeneric(_nativeObject.conventionBannerLeft);
         dialogBackground = new SymbolSlice9BackgroundDialogGeneric(_nativeObject.dialogBackground);
         txtShowCountTotal = FlashLabel.fromNative(_nativeObject.txtShowCountTotal);
         txtShowCountOwn = FlashLabel.fromNative(_nativeObject.txtShowCountOwn);
         btnClose = new SymbolUiButtonDefaultGeneric(_nativeObject.btnClose);
         txtFansTotal = FlashLabel.fromNative(_nativeObject.txtFansTotal);
         progress = new SymbolConventionFansBarGeneric(_nativeObject.progress);
         symbolIconVisitors = new SymbolIconVisitorsGeneric(_nativeObject.symbolIconVisitors);
         txtFans = FlashLabel.fromNative(_nativeObject.txtFans);
         txtInfo = FlashLabelArea.fromNative(_nativeObject.txtInfo);
         iconGameCurrency = new SymbolIconGameCurrencyGeneric(_nativeObject.iconGameCurrency);
         txtCoins = FlashLabel.fromNative(_nativeObject.txtCoins);
         txtRewardsCaption = FlashLabel.fromNative(_nativeObject.txtRewardsCaption);
         txtXp = FlashLabel.fromNative(_nativeObject.txtXp);
         iconXp = new SymbolIconXpGeneric(_nativeObject.iconXp);
         txtDialogTitle = FlashLabelArea.fromNative(_nativeObject.txtDialogTitle);
      }
      
      public function setNativeInstance(param1:SymbolDialogConventionShowComplete) : void
      {
         FlashSprite.setNativeInstance(_sprite,param1);
         _nativeObject = param1;
         syncInstances();
      }
      
      public function syncInstances() : void
      {
         if(_nativeObject.conventionBannerRight)
         {
            conventionBannerRight.setNativeInstance(_nativeObject.conventionBannerRight);
         }
         if(_nativeObject.conventionBannerLeft)
         {
            conventionBannerLeft.setNativeInstance(_nativeObject.conventionBannerLeft);
         }
         if(_nativeObject.dialogBackground)
         {
            dialogBackground.setNativeInstance(_nativeObject.dialogBackground);
         }
         FlashLabel.setNativeInstance(txtShowCountTotal,_nativeObject.txtShowCountTotal);
         FlashLabel.setNativeInstance(txtShowCountOwn,_nativeObject.txtShowCountOwn);
         if(_nativeObject.btnClose)
         {
            btnClose.setNativeInstance(_nativeObject.btnClose);
         }
         FlashLabel.setNativeInstance(txtFansTotal,_nativeObject.txtFansTotal);
         if(_nativeObject.progress)
         {
            progress.setNativeInstance(_nativeObject.progress);
         }
         if(_nativeObject.symbolIconVisitors)
         {
            symbolIconVisitors.setNativeInstance(_nativeObject.symbolIconVisitors);
         }
         FlashLabel.setNativeInstance(txtFans,_nativeObject.txtFans);
         FlashLabelArea.setNativeInstance(txtInfo,_nativeObject.txtInfo);
         if(_nativeObject.iconGameCurrency)
         {
            iconGameCurrency.setNativeInstance(_nativeObject.iconGameCurrency);
         }
         FlashLabel.setNativeInstance(txtCoins,_nativeObject.txtCoins);
         FlashLabel.setNativeInstance(txtRewardsCaption,_nativeObject.txtRewardsCaption);
         FlashLabel.setNativeInstance(txtXp,_nativeObject.txtXp);
         if(_nativeObject.iconXp)
         {
            iconXp.setNativeInstance(_nativeObject.iconXp);
         }
         FlashLabelArea.setNativeInstance(txtDialogTitle,_nativeObject.txtDialogTitle);
      }
   }
}
