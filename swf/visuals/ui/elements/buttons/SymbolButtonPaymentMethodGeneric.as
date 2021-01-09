package visuals.ui.elements.buttons
{
   import com.playata.framework.display.Sprite;
   import com.playata.framework.display.lib.flash.FlashDisplayObjectContainer;
   import com.playata.framework.display.lib.flash.FlashSprite;
   import flash.display.MovieClip;
   import visuals.ui.base.SymbolPlaceholderGeneric;
   import visuals.ui.elements.payment.SymbolPaymentMethodButtonBackgroundGeneric;
   import visuals.ui.elements.payment.SymbolPaymentMethodSelectedGeneric;
   
   public class SymbolButtonPaymentMethodGeneric extends Sprite
   {
       
      
      private var _nativeObject:SymbolButtonPaymentMethod = null;
      
      public var background:SymbolPaymentMethodButtonBackgroundGeneric = null;
      
      public var method:SymbolPlaceholderGeneric = null;
      
      public var selected:SymbolPaymentMethodSelectedGeneric = null;
      
      public function SymbolButtonPaymentMethodGeneric(param1:MovieClip = null)
      {
         if(param1)
         {
            _nativeObject = param1 as SymbolButtonPaymentMethod;
         }
         else
         {
            _nativeObject = new SymbolButtonPaymentMethod();
         }
         super(null,FlashSprite.fromNative(_nativeObject));
         var _loc2_:FlashDisplayObjectContainer = _sprite as FlashDisplayObjectContainer;
         background = new SymbolPaymentMethodButtonBackgroundGeneric(_nativeObject.background);
         method = new SymbolPlaceholderGeneric(_nativeObject.method);
         selected = new SymbolPaymentMethodSelectedGeneric(_nativeObject.selected);
      }
      
      public function setNativeInstance(param1:SymbolButtonPaymentMethod) : void
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
         if(_nativeObject.method)
         {
            method.setNativeInstance(_nativeObject.method);
         }
         if(_nativeObject.selected)
         {
            selected.setNativeInstance(_nativeObject.selected);
         }
      }
   }
}
