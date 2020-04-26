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
   import visuals.ui.elements.bonus.SymbolDailyLoginBonusGeneric;
   import visuals.ui.elements.icons.SymbolIconGameCurrencyGeneric;
   import visuals.ui.elements.icons.SymbolIconPremiumCurrencyGeneric;
   import visuals.ui.elements.icons.SymbolIconXpGeneric;
   
   public class SymbolDialogDailyLoginBonusGeneric extends Sprite
   {
       
      
      private var _nativeObject:SymbolDialogDailyLoginBonus = null;
      
      public var dialogBackground:SymbolSlice9BackgroundDialogGeneric = null;
      
      public var txtDialogTitle:ILabel = null;
      
      public var txtInfo:ILabelArea = null;
      
      public var btnOk:SymbolUiButtonDefaultGeneric = null;
      
      public var txtRewardCaption:ILabel = null;
      
      public var iconCoins:SymbolIconGameCurrencyGeneric = null;
      
      public var txtCoins:ILabel = null;
      
      public var iconXp:SymbolIconXpGeneric = null;
      
      public var txtXp:ILabel = null;
      
      public var iconPremiumCurrency:SymbolIconPremiumCurrencyGeneric = null;
      
      public var txtPremiumCurrency:ILabel = null;
      
      public var position5:SymbolDailyLoginBonusGeneric = null;
      
      public var position4:SymbolDailyLoginBonusGeneric = null;
      
      public var position3:SymbolDailyLoginBonusGeneric = null;
      
      public var position2:SymbolDailyLoginBonusGeneric = null;
      
      public var position1:SymbolDailyLoginBonusGeneric = null;
      
      public function SymbolDialogDailyLoginBonusGeneric(param1:MovieClip = null)
      {
         if(param1)
         {
            _nativeObject = param1 as SymbolDialogDailyLoginBonus;
         }
         else
         {
            _nativeObject = new SymbolDialogDailyLoginBonus();
         }
         super(null,FlashSprite.fromNative(_nativeObject));
         var _loc2_:FlashDisplayObjectContainer = _sprite as FlashDisplayObjectContainer;
         dialogBackground = new SymbolSlice9BackgroundDialogGeneric(_nativeObject.dialogBackground);
         txtDialogTitle = FlashLabel.fromNative(_nativeObject.txtDialogTitle);
         txtInfo = FlashLabelArea.fromNative(_nativeObject.txtInfo);
         btnOk = new SymbolUiButtonDefaultGeneric(_nativeObject.btnOk);
         txtRewardCaption = FlashLabel.fromNative(_nativeObject.txtRewardCaption);
         iconCoins = new SymbolIconGameCurrencyGeneric(_nativeObject.iconCoins);
         txtCoins = FlashLabel.fromNative(_nativeObject.txtCoins);
         iconXp = new SymbolIconXpGeneric(_nativeObject.iconXp);
         txtXp = FlashLabel.fromNative(_nativeObject.txtXp);
         iconPremiumCurrency = new SymbolIconPremiumCurrencyGeneric(_nativeObject.iconPremiumCurrency);
         txtPremiumCurrency = FlashLabel.fromNative(_nativeObject.txtPremiumCurrency);
         position5 = new SymbolDailyLoginBonusGeneric(_nativeObject.position5);
         position4 = new SymbolDailyLoginBonusGeneric(_nativeObject.position4);
         position3 = new SymbolDailyLoginBonusGeneric(_nativeObject.position3);
         position2 = new SymbolDailyLoginBonusGeneric(_nativeObject.position2);
         position1 = new SymbolDailyLoginBonusGeneric(_nativeObject.position1);
      }
      
      public function setNativeInstance(param1:SymbolDialogDailyLoginBonus) : void
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
         if(_nativeObject.btnOk)
         {
            btnOk.setNativeInstance(_nativeObject.btnOk);
         }
         FlashLabel.setNativeInstance(txtRewardCaption,_nativeObject.txtRewardCaption);
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
         if(_nativeObject.iconPremiumCurrency)
         {
            iconPremiumCurrency.setNativeInstance(_nativeObject.iconPremiumCurrency);
         }
         FlashLabel.setNativeInstance(txtPremiumCurrency,_nativeObject.txtPremiumCurrency);
         if(_nativeObject.position5)
         {
            position5.setNativeInstance(_nativeObject.position5);
         }
         if(_nativeObject.position4)
         {
            position4.setNativeInstance(_nativeObject.position4);
         }
         if(_nativeObject.position3)
         {
            position3.setNativeInstance(_nativeObject.position3);
         }
         if(_nativeObject.position2)
         {
            position2.setNativeInstance(_nativeObject.position2);
         }
         if(_nativeObject.position1)
         {
            position1.setNativeInstance(_nativeObject.position1);
         }
      }
   }
}
