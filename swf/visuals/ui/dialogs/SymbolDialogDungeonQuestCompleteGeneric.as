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
   import visuals.ui.elements.icons.SymbolIconGameCurrencyGeneric;
   import visuals.ui.elements.icons.SymbolIconPlusGeneric;
   import visuals.ui.elements.icons.SymbolIconPremiumCurrencyGeneric;
   import visuals.ui.elements.icons.SymbolIconXpGeneric;
   import visuals.ui.elements.item.SymbolItemSlotGeneric;
   
   public class SymbolDialogDungeonQuestCompleteGeneric extends Sprite
   {
       
      
      private var _nativeObject:SymbolDialogDungeonQuestComplete = null;
      
      public var dialogBackground:SymbolSlice9BackgroundDialogGeneric = null;
      
      public var txtDialogTitle:ILabel = null;
      
      public var btnClose:SymbolUiButtonDefaultGeneric = null;
      
      public var iconCoins:SymbolIconGameCurrencyGeneric = null;
      
      public var txtCoins:ILabel = null;
      
      public var iconXp:SymbolIconXpGeneric = null;
      
      public var txtXp:ILabel = null;
      
      public var txtRewardsCaption:ILabel = null;
      
      public var itemReward:SymbolItemSlotGeneric = null;
      
      public var txtOutcome:ILabelArea = null;
      
      public var iconPremiumCurrency:SymbolIconPremiumCurrencyGeneric = null;
      
      public var txtPremiumCurrency:ILabel = null;
      
      public var txtStatPoints:ILabel = null;
      
      public var iconStatPoints:SymbolIconPlusGeneric = null;
      
      public var txtLostInfo:ILabelArea = null;
      
      public function SymbolDialogDungeonQuestCompleteGeneric(param1:MovieClip = null)
      {
         if(param1)
         {
            _nativeObject = param1 as SymbolDialogDungeonQuestComplete;
         }
         else
         {
            _nativeObject = new SymbolDialogDungeonQuestComplete();
         }
         super(null,FlashSprite.fromNative(_nativeObject));
         var _loc2_:FlashDisplayObjectContainer = _sprite as FlashDisplayObjectContainer;
         dialogBackground = new SymbolSlice9BackgroundDialogGeneric(_nativeObject.dialogBackground);
         txtDialogTitle = FlashLabel.fromNative(_nativeObject.txtDialogTitle);
         btnClose = new SymbolUiButtonDefaultGeneric(_nativeObject.btnClose);
         iconCoins = new SymbolIconGameCurrencyGeneric(_nativeObject.iconCoins);
         txtCoins = FlashLabel.fromNative(_nativeObject.txtCoins);
         iconXp = new SymbolIconXpGeneric(_nativeObject.iconXp);
         txtXp = FlashLabel.fromNative(_nativeObject.txtXp);
         txtRewardsCaption = FlashLabel.fromNative(_nativeObject.txtRewardsCaption);
         itemReward = new SymbolItemSlotGeneric(_nativeObject.itemReward);
         txtOutcome = FlashLabelArea.fromNative(_nativeObject.txtOutcome);
         iconPremiumCurrency = new SymbolIconPremiumCurrencyGeneric(_nativeObject.iconPremiumCurrency);
         txtPremiumCurrency = FlashLabel.fromNative(_nativeObject.txtPremiumCurrency);
         txtStatPoints = FlashLabel.fromNative(_nativeObject.txtStatPoints);
         iconStatPoints = new SymbolIconPlusGeneric(_nativeObject.iconStatPoints);
         txtLostInfo = FlashLabelArea.fromNative(_nativeObject.txtLostInfo);
      }
      
      public function setNativeInstance(param1:SymbolDialogDungeonQuestComplete) : void
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
         if(_nativeObject.btnClose)
         {
            btnClose.setNativeInstance(_nativeObject.btnClose);
         }
         if(_nativeObject.iconCoins)
         {
            iconCoins.setNativeInstance(_nativeObject.iconCoins);
         }
         FlashLabel.setNativeInstance(txtCoins,_nativeObject.txtCoins);
         if(_nativeObject.iconXp)
         {
            iconXp.setNativeInstance(_nativeObject.iconXp);
         }
         FlashLabel.setNativeInstance(txtXp,_nativeObject.txtXp);
         FlashLabel.setNativeInstance(txtRewardsCaption,_nativeObject.txtRewardsCaption);
         if(_nativeObject.itemReward)
         {
            itemReward.setNativeInstance(_nativeObject.itemReward);
         }
         FlashLabelArea.setNativeInstance(txtOutcome,_nativeObject.txtOutcome);
         if(_nativeObject.iconPremiumCurrency)
         {
            iconPremiumCurrency.setNativeInstance(_nativeObject.iconPremiumCurrency);
         }
         FlashLabel.setNativeInstance(txtPremiumCurrency,_nativeObject.txtPremiumCurrency);
         FlashLabel.setNativeInstance(txtStatPoints,_nativeObject.txtStatPoints);
         if(_nativeObject.iconStatPoints)
         {
            iconStatPoints.setNativeInstance(_nativeObject.iconStatPoints);
         }
         FlashLabelArea.setNativeInstance(txtLostInfo,_nativeObject.txtLostInfo);
      }
   }
}
