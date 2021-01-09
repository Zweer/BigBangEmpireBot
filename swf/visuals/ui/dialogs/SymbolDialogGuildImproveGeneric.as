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
   import visuals.ui.elements.buttons.SymbolButtonCloseGeneric;
   import visuals.ui.elements.icons.SymbolIconGameCurrencyGeneric;
   import visuals.ui.elements.icons.SymbolIconGuildStatEquipmentBigGeneric;
   import visuals.ui.elements.icons.SymbolIconGuildStatMotivationBigGeneric;
   import visuals.ui.elements.icons.SymbolIconGuildStatPopularityBigGeneric;
   import visuals.ui.elements.icons.SymbolIconGuildStatQuarterBigGeneric;
   import visuals.ui.elements.icons.SymbolIconPaintBrushGeneric;
   import visuals.ui.elements.icons.SymbolIconPremiumCurrencyGeneric;
   
   public class SymbolDialogGuildImproveGeneric extends Sprite
   {
       
      
      private var _nativeObject:SymbolDialogGuildImprove = null;
      
      public var dialogBackground:SymbolSlice9BackgroundDialogGeneric = null;
      
      public var txtDialogTitle:ILabel = null;
      
      public var iconCoin:SymbolIconGameCurrencyGeneric = null;
      
      public var txtCoins:ILabel = null;
      
      public var txtPremiumCurrency:ILabel = null;
      
      public var iconPremiumCurrency:SymbolIconPremiumCurrencyGeneric = null;
      
      public var txtCostCaption:ILabel = null;
      
      public var txtCoinsCenter:ILabel = null;
      
      public var btnClose:SymbolButtonCloseGeneric = null;
      
      public var btnImprove:SymbolUiButtonDefaultGeneric = null;
      
      public var txtOpticalHint:ILabel = null;
      
      public var iconOpticalHint:SymbolIconPaintBrushGeneric = null;
      
      public var txtBonus:ILabelArea = null;
      
      public var txtCurrentValueCaption:ILabel = null;
      
      public var txtNextValueCaption:ILabel = null;
      
      public var iconGuildCapacity:SymbolIconGuildStatQuarterBigGeneric = null;
      
      public var iconGuildCapacity2:SymbolIconGuildStatQuarterBigGeneric = null;
      
      public var iconCharacterBaseStatsBoost:SymbolIconGuildStatEquipmentBigGeneric = null;
      
      public var iconCharacterBaseStatsBoost2:SymbolIconGuildStatEquipmentBigGeneric = null;
      
      public var iconQuestXpRewardBoost:SymbolIconGuildStatPopularityBigGeneric = null;
      
      public var iconQuestXpRewardBoost2:SymbolIconGuildStatPopularityBigGeneric = null;
      
      public var iconQuestWorkGameCurrencyRewardBoost:SymbolIconGuildStatMotivationBigGeneric = null;
      
      public var iconQuestWorkGameCurrencyRewardBoost2:SymbolIconGuildStatMotivationBigGeneric = null;
      
      public function SymbolDialogGuildImproveGeneric(param1:MovieClip = null)
      {
         if(param1)
         {
            _nativeObject = param1 as SymbolDialogGuildImprove;
         }
         else
         {
            _nativeObject = new SymbolDialogGuildImprove();
         }
         super(null,FlashSprite.fromNative(_nativeObject));
         var _loc2_:FlashDisplayObjectContainer = _sprite as FlashDisplayObjectContainer;
         dialogBackground = new SymbolSlice9BackgroundDialogGeneric(_nativeObject.dialogBackground);
         txtDialogTitle = FlashLabel.fromNative(_nativeObject.txtDialogTitle);
         iconCoin = new SymbolIconGameCurrencyGeneric(_nativeObject.iconCoin);
         txtCoins = FlashLabel.fromNative(_nativeObject.txtCoins);
         txtPremiumCurrency = FlashLabel.fromNative(_nativeObject.txtPremiumCurrency);
         iconPremiumCurrency = new SymbolIconPremiumCurrencyGeneric(_nativeObject.iconPremiumCurrency);
         txtCostCaption = FlashLabel.fromNative(_nativeObject.txtCostCaption);
         txtCoinsCenter = FlashLabel.fromNative(_nativeObject.txtCoinsCenter);
         btnClose = new SymbolButtonCloseGeneric(_nativeObject.btnClose);
         btnImprove = new SymbolUiButtonDefaultGeneric(_nativeObject.btnImprove);
         txtOpticalHint = FlashLabel.fromNative(_nativeObject.txtOpticalHint);
         iconOpticalHint = new SymbolIconPaintBrushGeneric(_nativeObject.iconOpticalHint);
         txtBonus = FlashLabelArea.fromNative(_nativeObject.txtBonus);
         txtCurrentValueCaption = FlashLabel.fromNative(_nativeObject.txtCurrentValueCaption);
         txtNextValueCaption = FlashLabel.fromNative(_nativeObject.txtNextValueCaption);
         iconGuildCapacity = new SymbolIconGuildStatQuarterBigGeneric(_nativeObject.iconGuildCapacity);
         iconGuildCapacity2 = new SymbolIconGuildStatQuarterBigGeneric(_nativeObject.iconGuildCapacity2);
         iconCharacterBaseStatsBoost = new SymbolIconGuildStatEquipmentBigGeneric(_nativeObject.iconCharacterBaseStatsBoost);
         iconCharacterBaseStatsBoost2 = new SymbolIconGuildStatEquipmentBigGeneric(_nativeObject.iconCharacterBaseStatsBoost2);
         iconQuestXpRewardBoost = new SymbolIconGuildStatPopularityBigGeneric(_nativeObject.iconQuestXpRewardBoost);
         iconQuestXpRewardBoost2 = new SymbolIconGuildStatPopularityBigGeneric(_nativeObject.iconQuestXpRewardBoost2);
         iconQuestWorkGameCurrencyRewardBoost = new SymbolIconGuildStatMotivationBigGeneric(_nativeObject.iconQuestWorkGameCurrencyRewardBoost);
         iconQuestWorkGameCurrencyRewardBoost2 = new SymbolIconGuildStatMotivationBigGeneric(_nativeObject.iconQuestWorkGameCurrencyRewardBoost2);
      }
      
      public function setNativeInstance(param1:SymbolDialogGuildImprove) : void
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
         FlashLabel.setNativeInstance(txtCostCaption,_nativeObject.txtCostCaption);
         FlashLabel.setNativeInstance(txtCoinsCenter,_nativeObject.txtCoinsCenter);
         if(_nativeObject.btnClose)
         {
            btnClose.setNativeInstance(_nativeObject.btnClose);
         }
         if(_nativeObject.btnImprove)
         {
            btnImprove.setNativeInstance(_nativeObject.btnImprove);
         }
         FlashLabel.setNativeInstance(txtOpticalHint,_nativeObject.txtOpticalHint);
         if(_nativeObject.iconOpticalHint)
         {
            iconOpticalHint.setNativeInstance(_nativeObject.iconOpticalHint);
         }
         FlashLabelArea.setNativeInstance(txtBonus,_nativeObject.txtBonus);
         FlashLabel.setNativeInstance(txtCurrentValueCaption,_nativeObject.txtCurrentValueCaption);
         FlashLabel.setNativeInstance(txtNextValueCaption,_nativeObject.txtNextValueCaption);
         if(_nativeObject.iconGuildCapacity)
         {
            iconGuildCapacity.setNativeInstance(_nativeObject.iconGuildCapacity);
         }
         if(_nativeObject.iconGuildCapacity2)
         {
            iconGuildCapacity2.setNativeInstance(_nativeObject.iconGuildCapacity2);
         }
         if(_nativeObject.iconCharacterBaseStatsBoost)
         {
            iconCharacterBaseStatsBoost.setNativeInstance(_nativeObject.iconCharacterBaseStatsBoost);
         }
         if(_nativeObject.iconCharacterBaseStatsBoost2)
         {
            iconCharacterBaseStatsBoost2.setNativeInstance(_nativeObject.iconCharacterBaseStatsBoost2);
         }
         if(_nativeObject.iconQuestXpRewardBoost)
         {
            iconQuestXpRewardBoost.setNativeInstance(_nativeObject.iconQuestXpRewardBoost);
         }
         if(_nativeObject.iconQuestXpRewardBoost2)
         {
            iconQuestXpRewardBoost2.setNativeInstance(_nativeObject.iconQuestXpRewardBoost2);
         }
         if(_nativeObject.iconQuestWorkGameCurrencyRewardBoost)
         {
            iconQuestWorkGameCurrencyRewardBoost.setNativeInstance(_nativeObject.iconQuestWorkGameCurrencyRewardBoost);
         }
         if(_nativeObject.iconQuestWorkGameCurrencyRewardBoost2)
         {
            iconQuestWorkGameCurrencyRewardBoost2.setNativeInstance(_nativeObject.iconQuestWorkGameCurrencyRewardBoost2);
         }
      }
   }
}
