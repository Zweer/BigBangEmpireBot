package visuals.ui.elements.bonus
{
   import com.playata.framework.display.Sprite;
   import com.playata.framework.display.lib.flash.FlashDisplayObjectContainer;
   import com.playata.framework.display.lib.flash.FlashSprite;
   import flash.display.MovieClip;
   import visuals.ui.elements.icons.SymbolIconGameCurrencyGeneric;
   import visuals.ui.elements.icons.SymbolIconXpGeneric;
   
   public class SymbolDailyLoginBonusRewardCoinXpGeneric extends Sprite
   {
       
      
      private var _nativeObject:SymbolDailyLoginBonusRewardCoinXp = null;
      
      public var symbolIconGameCurrency:SymbolIconGameCurrencyGeneric = null;
      
      public var symbolIconGameCurrency2:SymbolIconGameCurrencyGeneric = null;
      
      public var symbolIconXp:SymbolIconXpGeneric = null;
      
      public function SymbolDailyLoginBonusRewardCoinXpGeneric(param1:MovieClip = null)
      {
         if(param1)
         {
            _nativeObject = param1 as SymbolDailyLoginBonusRewardCoinXp;
         }
         else
         {
            _nativeObject = new SymbolDailyLoginBonusRewardCoinXp();
         }
         super(null,FlashSprite.fromNative(_nativeObject));
         var _loc2_:FlashDisplayObjectContainer = _sprite as FlashDisplayObjectContainer;
         symbolIconGameCurrency = new SymbolIconGameCurrencyGeneric(_nativeObject.symbolIconGameCurrency);
         symbolIconGameCurrency2 = new SymbolIconGameCurrencyGeneric(_nativeObject.symbolIconGameCurrency2);
         symbolIconXp = new SymbolIconXpGeneric(_nativeObject.symbolIconXp);
      }
      
      public function setNativeInstance(param1:SymbolDailyLoginBonusRewardCoinXp) : void
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
         if(_nativeObject.symbolIconXp)
         {
            symbolIconXp.setNativeInstance(_nativeObject.symbolIconXp);
         }
      }
   }
}
