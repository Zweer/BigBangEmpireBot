package visuals.ui.elements.movie
{
   import com.playata.framework.display.Sprite;
   import com.playata.framework.display.lib.flash.FlashDisplayObjectContainer;
   import com.playata.framework.display.lib.flash.FlashSprite;
   import flash.display.MovieClip;
   import visuals.ui.elements.icons.SymbolIconFansGeneric;
   import visuals.ui.elements.icons.SymbolIconGameCurrencyGeneric;
   import visuals.ui.elements.icons.SymbolIconGiftGeneric;
   import visuals.ui.elements.icons.SymbolIconPlusGeneric;
   import visuals.ui.elements.icons.SymbolIconPremiumCurrencyGeneric;
   import visuals.ui.elements.icons.SymbolIconXpGeneric;
   
   public class SymbolMovieRewardsCombinedIconGeneric extends Sprite
   {
       
      
      private var _nativeObject:SymbolMovieRewardsCombinedIcon = null;
      
      public var symbolIconXp:SymbolIconXpGeneric = null;
      
      public var symbolIconFans:SymbolIconFansGeneric = null;
      
      public var symbolIconGameCurrency:SymbolIconGameCurrencyGeneric = null;
      
      public var symbolIconPremiumCurrency:SymbolIconPremiumCurrencyGeneric = null;
      
      public var symbolIconPlus:SymbolIconPlusGeneric = null;
      
      public var iconItem:SymbolIconGiftGeneric = null;
      
      public function SymbolMovieRewardsCombinedIconGeneric(param1:MovieClip = null)
      {
         if(param1)
         {
            _nativeObject = param1 as SymbolMovieRewardsCombinedIcon;
         }
         else
         {
            _nativeObject = new SymbolMovieRewardsCombinedIcon();
         }
         super(null,FlashSprite.fromNative(_nativeObject));
         var _loc2_:FlashDisplayObjectContainer = _sprite as FlashDisplayObjectContainer;
         symbolIconXp = new SymbolIconXpGeneric(_nativeObject.symbolIconXp);
         symbolIconFans = new SymbolIconFansGeneric(_nativeObject.symbolIconFans);
         symbolIconGameCurrency = new SymbolIconGameCurrencyGeneric(_nativeObject.symbolIconGameCurrency);
         symbolIconPremiumCurrency = new SymbolIconPremiumCurrencyGeneric(_nativeObject.symbolIconPremiumCurrency);
         symbolIconPlus = new SymbolIconPlusGeneric(_nativeObject.symbolIconPlus);
         iconItem = new SymbolIconGiftGeneric(_nativeObject.iconItem);
      }
      
      public function setNativeInstance(param1:SymbolMovieRewardsCombinedIcon) : void
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
         if(_nativeObject.symbolIconFans)
         {
            symbolIconFans.setNativeInstance(_nativeObject.symbolIconFans);
         }
         if(_nativeObject.symbolIconGameCurrency)
         {
            symbolIconGameCurrency.setNativeInstance(_nativeObject.symbolIconGameCurrency);
         }
         if(_nativeObject.symbolIconPremiumCurrency)
         {
            symbolIconPremiumCurrency.setNativeInstance(_nativeObject.symbolIconPremiumCurrency);
         }
         if(_nativeObject.symbolIconPlus)
         {
            symbolIconPlus.setNativeInstance(_nativeObject.symbolIconPlus);
         }
         if(_nativeObject.iconItem)
         {
            iconItem.setNativeInstance(_nativeObject.iconItem);
         }
      }
   }
}
