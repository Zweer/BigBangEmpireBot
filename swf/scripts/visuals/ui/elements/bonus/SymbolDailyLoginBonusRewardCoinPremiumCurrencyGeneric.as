package visuals.ui.elements.bonus
{
   import com.playata.framework.display.Sprite;
   import com.playata.framework.display.lib.flash.FlashDisplayObjectContainer;
   import com.playata.framework.display.lib.flash.FlashSprite;
   import flash.display.MovieClip;
   import visuals.ui.elements.icons.SymbolIconGameCurrencyGeneric;
   import visuals.ui.elements.icons.SymbolIconPremiumCurrencyGeneric;
   
   public class SymbolDailyLoginBonusRewardCoinPremiumCurrencyGeneric extends Sprite
   {
       
      
      private var _nativeObject:SymbolDailyLoginBonusRewardCoinPremiumCurrency = null;
      
      public var symbolIconGameCurrency:SymbolIconGameCurrencyGeneric = null;
      
      public var symbolIconGameCurrency2:SymbolIconGameCurrencyGeneric = null;
      
      public var iconPremiumCurrency:SymbolIconPremiumCurrencyGeneric = null;
      
      public function SymbolDailyLoginBonusRewardCoinPremiumCurrencyGeneric(param1:MovieClip = null)
      {
         if(param1)
         {
            _nativeObject = param1 as SymbolDailyLoginBonusRewardCoinPremiumCurrency;
         }
         else
         {
            _nativeObject = new SymbolDailyLoginBonusRewardCoinPremiumCurrency();
         }
         super(null,FlashSprite.fromNative(_nativeObject));
         var _loc2_:FlashDisplayObjectContainer = _sprite as FlashDisplayObjectContainer;
         symbolIconGameCurrency = new SymbolIconGameCurrencyGeneric(_nativeObject.symbolIconGameCurrency);
         symbolIconGameCurrency2 = new SymbolIconGameCurrencyGeneric(_nativeObject.symbolIconGameCurrency2);
         iconPremiumCurrency = new SymbolIconPremiumCurrencyGeneric(_nativeObject.iconPremiumCurrency);
      }
      
      public function setNativeInstance(param1:SymbolDailyLoginBonusRewardCoinPremiumCurrency) : void
      {
         FlashSprite.setNativeInstance(_sprite,param1);
         _nativeObject = param1;
         syncInstances();
      }
      
      public function syncInstances() : void
      {
         if(_nativeObject.symbolIconGameCurrency)
         {
            symbolIconGameCurrency.setNativeInstance(_nativeObject.symbolIconGameCurrency);
         }
         if(_nativeObject.symbolIconGameCurrency2)
         {
            symbolIconGameCurrency2.setNativeInstance(_nativeObject.symbolIconGameCurrency2);
         }
         if(_nativeObject.iconPremiumCurrency)
         {
            iconPremiumCurrency.setNativeInstance(_nativeObject.iconPremiumCurrency);
         }
      }
   }
}
