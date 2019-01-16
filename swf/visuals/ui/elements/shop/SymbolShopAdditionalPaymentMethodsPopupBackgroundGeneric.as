package visuals.ui.elements.shop
{
   import com.playata.framework.display.Sprite;
   import com.playata.framework.display.lib.flash.FlashDisplayObjectContainer;
   import com.playata.framework.display.lib.flash.FlashSprite;
   import flash.display.MovieClip;
   import visuals.ui.elements.backgrounds.SymbolBackgroundScalableGeneric;
   
   public class SymbolShopAdditionalPaymentMethodsPopupBackgroundGeneric extends Sprite
   {
       
      
      private var _nativeObject:SymbolShopAdditionalPaymentMethodsPopupBackground = null;
      
      public var background:SymbolBackgroundScalableGeneric = null;
      
      public function SymbolShopAdditionalPaymentMethodsPopupBackgroundGeneric(param1:MovieClip = null)
      {
         if(param1)
         {
            _nativeObject = param1 as SymbolShopAdditionalPaymentMethodsPopupBackground;
         }
         else
         {
            _nativeObject = new SymbolShopAdditionalPaymentMethodsPopupBackground();
         }
         super(null,FlashSprite.fromNative(_nativeObject));
         var _loc2_:FlashDisplayObjectContainer = _sprite as FlashDisplayObjectContainer;
         background = new SymbolBackgroundScalableGeneric(_nativeObject.background);
      }
      
      public function setNativeInstance(param1:SymbolShopAdditionalPaymentMethodsPopupBackground) : void
      {
         FlashSprite.setNativeInstance(_sprite,param1);
         _nativeObject = param1;
         syncInstances();
      }
      
      public function syncInstances() : void
      {
         if(_nativeObject.background)
         {
            background.setNativeInstance(_nativeObject.background);
         }
      }
   }
}
