package visuals.ui.elements.shop
{
   import com.playata.framework.display.Sprite;
   import com.playata.framework.display.lib.flash.FlashDisplayObjectContainer;
   import com.playata.framework.display.lib.flash.FlashSprite;
   import flash.display.MovieClip;
   import visuals.ui.base.SymbolDummyGeneric;
   
   public class SymbolItemOfferShopBackgroundGeneric extends Sprite
   {
       
      
      private var _nativeObject:SymbolItemOfferShopBackground = null;
      
      public var backgroundImage:SymbolDummyGeneric = null;
      
      public function SymbolItemOfferShopBackgroundGeneric(param1:MovieClip = null)
      {
         if(param1)
         {
            _nativeObject = param1 as SymbolItemOfferShopBackground;
         }
         else
         {
            _nativeObject = new SymbolItemOfferShopBackground();
         }
         super(null,FlashSprite.fromNative(_nativeObject));
         var _loc2_:FlashDisplayObjectContainer = _sprite as FlashDisplayObjectContainer;
         backgroundImage = new SymbolDummyGeneric(_nativeObject.backgroundImage);
      }
      
      public function setNativeInstance(param1:SymbolItemOfferShopBackground) : void
      {
         FlashSprite.setNativeInstance(_sprite,param1);
         _nativeObject = param1;
         syncInstances();
      }
      
      public function syncInstances() : void
      {
         if(_nativeObject.backgroundImage)
         {
            backgroundImage.setNativeInstance(_nativeObject.backgroundImage);
         }
      }
   }
}
