package visuals.ui.elements.payment
{
   import com.playata.framework.display.Sprite;
   import com.playata.framework.display.lib.flash.FlashDisplayObjectContainer;
   import com.playata.framework.display.lib.flash.FlashSprite;
   import flash.display.MovieClip;
   import visuals.ui.elements.animations.SymbolSwishEffectGeneric;
   
   public class SymbolPaymentOptionSwishGeneric extends Sprite
   {
       
      
      private var _nativeObject:SymbolPaymentOptionSwish = null;
      
      public var swish:SymbolSwishEffectGeneric = null;
      
      public function SymbolPaymentOptionSwishGeneric(param1:MovieClip = null)
      {
         if(param1)
         {
            _nativeObject = param1 as SymbolPaymentOptionSwish;
         }
         else
         {
            _nativeObject = new SymbolPaymentOptionSwish();
         }
         super(null,FlashSprite.fromNative(_nativeObject));
         var _loc2_:FlashDisplayObjectContainer = _sprite as FlashDisplayObjectContainer;
         swish = new SymbolSwishEffectGeneric(_nativeObject.swish);
      }
      
      public function setNativeInstance(param1:SymbolPaymentOptionSwish) : void
      {
         FlashSprite.setNativeInstance(_sprite,param1);
         _nativeObject = param1;
         syncInstances();
      }
      
      public function syncInstances() : void
      {
         if(_nativeObject.swish)
         {
            swish.setNativeInstance(_nativeObject.swish);
         }
      }
   }
}
