package visuals.ui.elements.bonus
{
   import com.playata.framework.display.Sprite;
   import com.playata.framework.display.lib.flash.FlashDisplayObjectContainer;
   import com.playata.framework.display.lib.flash.FlashLabel;
   import com.playata.framework.display.lib.flash.FlashSprite;
   import com.playata.framework.display.ui.controls.ILabel;
   import flash.display.MovieClip;
   import visuals.ui.base.SymbolDummyGeneric;
   import visuals.ui.elements.icons.SymbolIconCheckmarkGeneric;
   import visuals.ui.elements.icons.SymbolIconGameCurrencyGeneric;
   import visuals.ui.elements.icons.SymbolIconGiftGeneric;
   import visuals.ui.elements.icons.SymbolIconPremiumCurrencyGeneric;
   import visuals.ui.elements.icons.SymbolIconXpGeneric;
   
   public class SymbolDailyLoginBonusGeneric extends Sprite
   {
       
      
      private var _nativeObject:SymbolDailyLoginBonus = null;
      
      public var backgroundRewarded:SymbolDailyLoginBonusBackgroundRewardedGeneric = null;
      
      public var backgroundPending:SymbolDailyLoginBonusBackgroundPendingGeneric = null;
      
      public var txtDay:ILabel = null;
      
      public var checkmark:SymbolIconCheckmarkGeneric = null;
      
      public var iconPremiumCurrency:SymbolIconPremiumCurrencyGeneric = null;
      
      public var iconXp:SymbolIconXpGeneric = null;
      
      public var iconCoins:SymbolIconGameCurrencyGeneric = null;
      
      public var iconCoinXp:SymbolDailyLoginBonusRewardCoinXpGeneric = null;
      
      public var iconXpCoin:SymbolDailyLoginBonusRewardXpCoinGeneric = null;
      
      public var iconCoinPremiumCurrency:SymbolDailyLoginBonusRewardCoinPremiumCurrencyGeneric = null;
      
      public var iconXpPremiumCurrency:SymbolDailyLoginBonusRewardXpPremiumCurrencyGeneric = null;
      
      public var iconGift:SymbolIconGiftGeneric = null;
      
      public var tooltipLayer:SymbolDummyGeneric = null;
      
      public function SymbolDailyLoginBonusGeneric(param1:MovieClip = null)
      {
         if(param1)
         {
            _nativeObject = param1 as SymbolDailyLoginBonus;
         }
         else
         {
            _nativeObject = new SymbolDailyLoginBonus();
         }
         super(null,FlashSprite.fromNative(_nativeObject));
         var _loc2_:FlashDisplayObjectContainer = _sprite as FlashDisplayObjectContainer;
         backgroundRewarded = new SymbolDailyLoginBonusBackgroundRewardedGeneric(_nativeObject.backgroundRewarded);
         backgroundPending = new SymbolDailyLoginBonusBackgroundPendingGeneric(_nativeObject.backgroundPending);
         txtDay = FlashLabel.fromNative(_nativeObject.txtDay);
         checkmark = new SymbolIconCheckmarkGeneric(_nativeObject.checkmark);
         iconPremiumCurrency = new SymbolIconPremiumCurrencyGeneric(_nativeObject.iconPremiumCurrency);
         iconXp = new SymbolIconXpGeneric(_nativeObject.iconXp);
         iconCoins = new SymbolIconGameCurrencyGeneric(_nativeObject.iconCoins);
         iconCoinXp = new SymbolDailyLoginBonusRewardCoinXpGeneric(_nativeObject.iconCoinXp);
         iconXpCoin = new SymbolDailyLoginBonusRewardXpCoinGeneric(_nativeObject.iconXpCoin);
         iconCoinPremiumCurrency = new SymbolDailyLoginBonusRewardCoinPremiumCurrencyGeneric(_nativeObject.iconCoinPremiumCurrency);
         iconXpPremiumCurrency = new SymbolDailyLoginBonusRewardXpPremiumCurrencyGeneric(_nativeObject.iconXpPremiumCurrency);
         iconGift = new SymbolIconGiftGeneric(_nativeObject.iconGift);
         tooltipLayer = new SymbolDummyGeneric(_nativeObject.tooltipLayer);
      }
      
      public function setNativeInstance(param1:SymbolDailyLoginBonus) : void
      {
         FlashSprite.setNativeInstance(_sprite,param1);
         _nativeObject = param1;
         syncInstances();
      }
      
      public function syncInstances() : void
      {
         if(_nativeObject.backgroundRewarded)
         {
            backgroundRewarded.setNativeInstance(_nativeObject.backgroundRewarded);
         }
         if(_nativeObject.backgroundPending)
         {
            backgroundPending.setNativeInstance(_nativeObject.backgroundPending);
         }
         FlashLabel.setNativeInstance(txtDay,_nativeObject.txtDay);
         if(_nativeObject.checkmark)
         {
            checkmark.setNativeInstance(_nativeObject.checkmark);
         }
         if(_nativeObject.iconPremiumCurrency)
         {
            iconPremiumCurrency.setNativeInstance(_nativeObject.iconPremiumCurrency);
         }
         if(_nativeObject.iconXp)
         {
            iconXp.setNativeInstance(_nativeObject.iconXp);
         }
         if(_nativeObject.iconCoins)
         {
            iconCoins.setNativeInstance(_nativeObject.iconCoins);
         }
         if(_nativeObject.iconCoinXp)
         {
            iconCoinXp.setNativeInstance(_nativeObject.iconCoinXp);
         }
         if(_nativeObject.iconXpCoin)
         {
            iconXpCoin.setNativeInstance(_nativeObject.iconXpCoin);
         }
         if(_nativeObject.iconCoinPremiumCurrency)
         {
            iconCoinPremiumCurrency.setNativeInstance(_nativeObject.iconCoinPremiumCurrency);
         }
         if(_nativeObject.iconXpPremiumCurrency)
         {
            iconXpPremiumCurrency.setNativeInstance(_nativeObject.iconXpPremiumCurrency);
         }
         if(_nativeObject.iconGift)
         {
            iconGift.setNativeInstance(_nativeObject.iconGift);
         }
         if(_nativeObject.tooltipLayer)
         {
            tooltipLayer.setNativeInstance(_nativeObject.tooltipLayer);
         }
      }
   }
}
