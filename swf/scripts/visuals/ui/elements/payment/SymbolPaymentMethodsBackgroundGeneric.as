package visuals.ui.elements.payment
{
   import com.playata.framework.display.Sprite;
   import com.playata.framework.display.lib.flash.FlashDisplayObjectContainer;
   import com.playata.framework.display.lib.flash.FlashSprite;
   import flash.display.MovieClip;
   import visuals.ui.elements.backgrounds.SymbolBackgroundScalableGeneric;
   
   public class SymbolPaymentMethodsBackgroundGeneric extends Sprite
   {
       
      
      private var _nativeObject:SymbolPaymentMethodsBackground = null;
      
      public var background:SymbolBackgroundScalableGeneric = null;
      
      public function SymbolPaymentMethodsBackgroundGeneric(param1:MovieClip = null)
      {
         if(param1)
         {
            _nativeObject = param1 as SymbolPaymentMethodsBackground;
         }
         else
         {
            _nativeObject = new SymbolPaymentMethodsBackground();
         }
         super(null,FlashSprite.fromNative(_nativeObject));
         var _loc2_:FlashDisplayObjectContainer = _sprite as FlashDisplayObjectContainer;
         background = new SymbolBackgroundScalableGeneric(_nativeObject.background);
      }
      
      public function setNativeInstance(param1:SymbolPaymentMethodsBackground) : void
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
