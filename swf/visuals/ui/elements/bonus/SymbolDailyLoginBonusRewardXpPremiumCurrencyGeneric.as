package visuals.ui.elements.bonus
{
   import com.playata.framework.display.Sprite;
   import com.playata.framework.display.lib.flash.FlashDisplayObjectContainer;
   import com.playata.framework.display.lib.flash.FlashSprite;
   import flash.display.MovieClip;
   import visuals.ui.elements.icons.SymbolIconPremiumCurrencyGeneric;
   import visuals.ui.elements.icons.SymbolIconXpGeneric;
   
   public class SymbolDailyLoginBonusRewardXpPremiumCurrencyGeneric extends Sprite
   {
       
      
      private var _nativeObject:SymbolDailyLoginBonusRewardXpPremiumCurrency = null;
      
      public var symbolIconXp:SymbolIconXpGeneric = null;
      
      public var symbolIconXp2:SymbolIconXpGeneric = null;
      
      public var iconPremiumCurrency:SymbolIconPremiumCurrencyGeneric = null;
      
      public function SymbolDailyLoginBonusRewardXpPremiumCurrencyGeneric(param1:MovieClip = null)
      {
         if(param1)
         {
            _nativeObject = param1 as SymbolDailyLoginBonusRewardXpPremiumCurrency;
         }
         else
         {
            _nativeObject = new SymbolDailyLoginBonusRewardXpPremiumCurrency();
         }
         super(null,FlashSprite.fromNative(_nativeObject));
         var _loc2_:FlashDisplayObjectContainer = _sprite as FlashDisplayObjectContainer;
         symbolIconXp = new SymbolIconXpGeneric(_nativeObject.symbolIconXp);
         symbolIconXp2 = new SymbolIconXpGeneric(_nativeObject.symbolIconXp2);
         iconPremiumCurrency = new SymbolIconPremiumCurrencyGeneric(_nativeObject.iconPremiumCurrency);
      }
      
      public function setNativeInstance(param1:SymbolDailyLoginBonusRewardXpPremiumCurrency) : void
      {
         FlashSprite.setNativeInstance(_sprite,param1);
         _nativeObject = param1;
         syncInstances();
      }
      
      public function syncInstances() : void
      {
         if(_nativeObject.symbolIconXp)
         {
            symbolIconXp.setNativeInstance(_nativeObject.symbolIconXp);
         }
         if(_nativeObject.symbolIconXp2)
         {
            symbolIconXp2.setNativeInstance(_nativeObject.symbolIconXp2);
         }
         if(_nativeObject.iconPremiumCurrency)
         {
            iconPremiumCurrency.setNativeInstance(_nativeObject.iconPremiumCurrency);
         }
      }
   }
}
