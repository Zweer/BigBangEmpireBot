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
   import visuals.ui.elements.guild.SymbolGuildEmblemGeneric;
   import visuals.ui.elements.icons.SymbolIconGameCurrencyGeneric;
   import visuals.ui.elements.icons.SymbolIconGuildHonorGeneric;
   import visuals.ui.elements.icons.SymbolIconPremiumCurrencyGeneric;
   import visuals.ui.elements.item.SymbolItemSlotGeneric;
   
   public class SymbolDialogGuildBattleResultGeneric extends Sprite
   {
       
      
      private var _nativeObject:SymbolDialogGuildBattleResult = null;
      
      public var dialogBackground:SymbolSlice9BackgroundDialogGeneric = null;
      
      public var btnClose:SymbolUiButtonDefaultGeneric = null;
      
      public var txtNoRewardText:ILabelArea = null;
      
      public var txtDialogTitle:ILabel = null;
      
      public var iconCoins:SymbolIconGameCurrencyGeneric = null;
      
      public var txtCoins:ILabel = null;
      
      public var iconHonor:SymbolIconGuildHonorGeneric = null;
      
      public var txtHonor:ILabel = null;
      
      public var txtGuildRewardCaption:ILabel = null;
      
      public var txtCharacterRewardCaption:ILabel = null;
      
      public var itemReward:SymbolItemSlotGeneric = null;
      
      public var iconPremiumCurrency:SymbolIconPremiumCurrencyGeneric = null;
      
      public var txtPremiumCurrency:ILabel = null;
      
      public var emblem:SymbolGuildEmblemGeneric = null;
      
      public var txtWinnerCaption:ILabel = null;
      
      public var txtWinnerName:ILabel = null;
      
      public function SymbolDialogGuildBattleResultGeneric(param1:MovieClip = null)
      {
         if(param1)
         {
            _nativeObject = param1 as SymbolDialogGuildBattleResult;
         }
         else
         {
            _nativeObject = new SymbolDialogGuildBattleResult();
         }
         super(null,FlashSprite.fromNative(_nativeObject));
         var _loc2_:FlashDisplayObjectContainer = _sprite as FlashDisplayObjectContainer;
         dialogBackground = new SymbolSlice9BackgroundDialogGeneric(_nativeObject.dialogBackground);
         btnClose = new SymbolUiButtonDefaultGeneric(_nativeObject.btnClose);
         txtNoRewardText = FlashLabelArea.fromNative(_nativeObject.txtNoRewardText);
         txtDialogTitle = FlashLabel.fromNative(_nativeObject.txtDialogTitle);
         iconCoins = new SymbolIconGameCurrencyGeneric(_nativeObject.iconCoins);
         txtCoins = FlashLabel.fromNative(_nativeObject.txtCoins);
         iconHonor = new SymbolIconGuildHonorGeneric(_nativeObject.iconHonor);
         txtHonor = FlashLabel.fromNative(_nativeObject.txtHonor);
         txtGuildRewardCaption = FlashLabel.fromNative(_nativeObject.txtGuildRewardCaption);
         txtCharacterRewardCaption = FlashLabel.fromNative(_nativeObject.txtCharacterRewardCaption);
         itemReward = new SymbolItemSlotGeneric(_nativeObject.itemReward);
         iconPremiumCurrency = new SymbolIconPremiumCurrencyGeneric(_nativeObject.iconPremiumCurrency);
         txtPremiumCurrency = FlashLabel.fromNative(_nativeObject.txtPremiumCurrency);
         emblem = new SymbolGuildEmblemGeneric(_nativeObject.emblem);
         txtWinnerCaption = FlashLabel.fromNative(_nativeObject.txtWinnerCaption);
         txtWinnerName = FlashLabel.fromNative(_nativeObject.txtWinnerName);
      }
      
      public function setNativeInstance(param1:SymbolDialogGuildBattleResult) : void
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
         FlashLabelArea.setNativeInstance(txtNoRewardText,_nativeObject.txtNoRewardText);
         FlashLabel.setNativeInstance(txtDialogTitle,_nativeObject.txtDialogTitle);
         if(_nativeObject.iconCoins)
         {
            iconCoins.setNativeInstance(_nativeObject.iconCoins);
         }
         FlashLabel.setNativeInstance(txtCoins,_nativeObject.txtCoins);
         if(_nativeObject.iconHonor)
         {
            iconHonor.setNativeInstance(_nativeObject.iconHonor);
         }
         FlashLabel.setNativeInstance(txtHonor,_nativeObject.txtHonor);
         FlashLabel.setNativeInstance(txtGuildRewardCaption,_nativeObject.txtGuildRewardCaption);
         FlashLabel.setNativeInstance(txtCharacterRewardCaption,_nativeObject.txtCharacterRewardCaption);
         if(_nativeObject.itemReward)
         {
            itemReward.setNativeInstance(_nativeObject.itemReward);
         }
         if(_nativeObject.iconPremiumCurrency)
         {
            iconPremiumCurrency.setNativeInstance(_nativeObject.iconPremiumCurrency);
         }
         FlashLabel.setNativeInstance(txtPremiumCurrency,_nativeObject.txtPremiumCurrency);
         if(_nativeObject.emblem)
         {
            emblem.setNativeInstance(_nativeObject.emblem);
         }
         FlashLabel.setNativeInstance(txtWinnerCaption,_nativeObject.txtWinnerCaption);
         FlashLabel.setNativeInstance(txtWinnerName,_nativeObject.txtWinnerName);
      }
   }
}
