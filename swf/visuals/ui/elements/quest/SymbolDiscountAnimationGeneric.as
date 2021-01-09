package visuals.ui.elements.quest
{
   import com.playata.framework.display.Sprite;
   import com.playata.framework.display.lib.flash.FlashDisplayObjectContainer;
   import com.playata.framework.display.lib.flash.FlashSprite;
   import flash.display.MovieClip;
   
   public class SymbolDiscountAnimationGeneric extends Sprite
   {
       
      
      private var _nativeObject:SymbolDiscountAnimation = null;
      
      public var glow:SymbolGlowSmallAnimationGeneric = null;
      
      public var priceCaption:SymbolDiscountPriceGeneric = null;
      
      public var xAnimation:SymbolDiscountAnimationCrossedGeneric = null;
      
      public function SymbolDiscountAnimationGeneric(param1:MovieClip = null)
      {
         if(param1)
         {
            _nativeObject = param1 as SymbolDiscountAnimation;
         }
         else
         {
            _nativeObject = new SymbolDiscountAnimation();
         }
         super(null,FlashSprite.fromNative(_nativeObject));
         var _loc2_:FlashDisplayObjectContainer = _sprite as FlashDisplayObjectContainer;
         glow = new SymbolGlowSmallAnimationGeneric(_nativeObject.glow);
         priceCaption = new SymbolDiscountPriceGeneric(_nativeObject.priceCaption);
         xAnimation = new SymbolDiscountAnimationCrossedGeneric(_nativeObject.xAnimation);
      }
      
      public function setNativeInstance(param1:SymbolDiscountAnimation) : void
      {
         FlashSprite.setNativeInstance(_sprite,param1);
         _nativeObject = param1;
         syncInstances();
      }
      
      public function syncInstances() : void
      {
         if(_nativeObject.glow)
         {
            glow.setNativeInstance(_nativeObject.glow);
         }
         if(_nativeObject.priceCaption)
         {
            priceCaption.setNativeInstance(_nativeObject.priceCaption);
         }
         if(_nativeObject.xAnimation)
         {
            xAnimation.setNativeInstance(_nativeObject.xAnimation);
         }
      }
   }
}
