package visuals.ui.elements.optical_changes
{
   import com.playata.framework.display.Sprite;
   import com.playata.framework.display.lib.flash.FlashDisplayObjectContainer;
   import com.playata.framework.display.lib.flash.FlashSprite;
   import flash.display.MovieClip;
   import visuals.ui.elements.buttons.SymbolButtonOpticalChangeGeneric;
   import visuals.ui.elements.buttons.SymbolButtonPremiumGeneric;
   import visuals.ui.elements.movie.SymbolBackgroundMovieRewardTooltipGeneric;
   
   public class SymbolOpticalChangeShopOfferGeneric extends Sprite
   {
       
      
      private var _nativeObject:SymbolOpticalChangeShopOffer = null;
      
      public var bg:SymbolBackgroundMovieRewardTooltipGeneric = null;
      
      public var icon2:SymbolOpticalChangeShopChest2Generic = null;
      
      public var icon1:SymbolOpticalChangeShopChest1Generic = null;
      
      public var btnBuyPremium:SymbolButtonPremiumGeneric = null;
      
      public var btnBuyResource:SymbolButtonOpticalChangeGeneric = null;
      
      public function SymbolOpticalChangeShopOfferGeneric(param1:MovieClip = null)
      {
         if(param1)
         {
            _nativeObject = param1 as SymbolOpticalChangeShopOffer;
         }
         else
         {
            _nativeObject = new SymbolOpticalChangeShopOffer();
         }
         super(null,FlashSprite.fromNative(_nativeObject));
         var _loc2_:FlashDisplayObjectContainer = _sprite as FlashDisplayObjectContainer;
         bg = new SymbolBackgroundMovieRewardTooltipGeneric(_nativeObject.bg);
         icon2 = new SymbolOpticalChangeShopChest2Generic(_nativeObject.icon2);
         icon1 = new SymbolOpticalChangeShopChest1Generic(_nativeObject.icon1);
         btnBuyPremium = new SymbolButtonPremiumGeneric(_nativeObject.btnBuyPremium);
         btnBuyResource = new SymbolButtonOpticalChangeGeneric(_nativeObject.btnBuyResource);
      }
      
      public function setNativeInstance(param1:SymbolOpticalChangeShopOffer) : void
      {
         FlashSprite.setNativeInstance(_sprite,param1);
         _nativeObject = param1;
         syncInstances();
      }
      
      public function syncInstances() : void
      {
         if(_nativeObject.bg)
         {
            bg.setNativeInstance(_nativeObject.bg);
         }
         if(_nativeObject.icon2)
         {
            icon2.setNativeInstance(_nativeObject.icon2);
         }
         if(_nativeObject.icon1)
         {
            icon1.setNativeInstance(_nativeObject.icon1);
         }
         if(_nativeObject.btnBuyPremium)
         {
            btnBuyPremium.setNativeInstance(_nativeObject.btnBuyPremium);
         }
         if(_nativeObject.btnBuyResource)
         {
            btnBuyResource.setNativeInstance(_nativeObject.btnBuyResource);
         }
      }
   }
}
