package visuals.ui.elements.shop
{
   import com.playata.framework.display.Sprite;
   import com.playata.framework.display.lib.flash.FlashDisplayObjectContainer;
   import com.playata.framework.display.lib.flash.FlashSprite;
   import flash.display.MovieClip;
   import visuals.ui.elements.buttons.SymbolButtonPaymentMethodGeneric;
   
   public class SymbolShopAdditionalPaymentMethodsPopupGeneric extends Sprite
   {
       
      
      private var _nativeObject:SymbolShopAdditionalPaymentMethodsPopup = null;
      
      public var background:SymbolShopAdditionalPaymentMethodsPopupBackgroundGeneric = null;
      
      public var btnMethod1:SymbolButtonPaymentMethodGeneric = null;
      
      public var btnMethod2:SymbolButtonPaymentMethodGeneric = null;
      
      public var btnMethod3:SymbolButtonPaymentMethodGeneric = null;
      
      public var btnMethod4:SymbolButtonPaymentMethodGeneric = null;
      
      public var btnMethod5:SymbolButtonPaymentMethodGeneric = null;
      
      public var btnMethod6:SymbolButtonPaymentMethodGeneric = null;
      
      public var btnMethod7:SymbolButtonPaymentMethodGeneric = null;
      
      public var btnMethod8:SymbolButtonPaymentMethodGeneric = null;
      
      public function SymbolShopAdditionalPaymentMethodsPopupGeneric(param1:MovieClip = null)
      {
         if(param1)
         {
            _nativeObject = param1 as SymbolShopAdditionalPaymentMethodsPopup;
         }
         else
         {
            _nativeObject = new SymbolShopAdditionalPaymentMethodsPopup();
         }
         super(null,FlashSprite.fromNative(_nativeObject));
         var _loc2_:FlashDisplayObjectContainer = _sprite as FlashDisplayObjectContainer;
         background = new SymbolShopAdditionalPaymentMethodsPopupBackgroundGeneric(_nativeObject.background);
         btnMethod1 = new SymbolButtonPaymentMethodGeneric(_nativeObject.btnMethod1);
         btnMethod2 = new SymbolButtonPaymentMethodGeneric(_nativeObject.btnMethod2);
         btnMethod3 = new SymbolButtonPaymentMethodGeneric(_nativeObject.btnMethod3);
         btnMethod4 = new SymbolButtonPaymentMethodGeneric(_nativeObject.btnMethod4);
         btnMethod5 = new SymbolButtonPaymentMethodGeneric(_nativeObject.btnMethod5);
         btnMethod6 = new SymbolButtonPaymentMethodGeneric(_nativeObject.btnMethod6);
         btnMethod7 = new SymbolButtonPaymentMethodGeneric(_nativeObject.btnMethod7);
         btnMethod8 = new SymbolButtonPaymentMethodGeneric(_nativeObject.btnMethod8);
      }
      
      public function setNativeInstance(param1:SymbolShopAdditionalPaymentMethodsPopup) : void
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
         if(_nativeObject.btnMethod1)
         {
            btnMethod1.setNativeInstance(_nativeObject.btnMethod1);
         }
         if(_nativeObject.btnMethod2)
         {
            btnMethod2.setNativeInstance(_nativeObject.btnMethod2);
         }
         if(_nativeObject.btnMethod3)
         {
            btnMethod3.setNativeInstance(_nativeObject.btnMethod3);
         }
         if(_nativeObject.btnMethod4)
         {
            btnMethod4.setNativeInstance(_nativeObject.btnMethod4);
         }
         if(_nativeObject.btnMethod5)
         {
            btnMethod5.setNativeInstance(_nativeObject.btnMethod5);
         }
         if(_nativeObject.btnMethod6)
         {
            btnMethod6.setNativeInstance(_nativeObject.btnMethod6);
         }
         if(_nativeObject.btnMethod7)
         {
            btnMethod7.setNativeInstance(_nativeObject.btnMethod7);
         }
         if(_nativeObject.btnMethod8)
         {
            btnMethod8.setNativeInstance(_nativeObject.btnMethod8);
         }
      }
   }
}
