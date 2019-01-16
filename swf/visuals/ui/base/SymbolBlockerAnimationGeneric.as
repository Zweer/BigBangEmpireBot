package visuals.ui.base
{
   import com.playata.framework.display.Sprite;
   import com.playata.framework.display.lib.flash.FlashDisplayObjectContainer;
   import com.playata.framework.display.lib.flash.FlashSprite;
   import flash.display.MovieClip;
   
   public class SymbolBlockerAnimationGeneric extends Sprite
   {
       
      
      private var _nativeObject:SymbolBlockerAnimation = null;
      
      public var symbolBlockerAnimationCircle:SymbolBlockerAnimationCircleGeneric = null;
      
      public function SymbolBlockerAnimationGeneric(param1:MovieClip = null)
      {
         if(param1)
         {
            _nativeObject = param1 as SymbolBlockerAnimation;
         }
         else
         {
            _nativeObject = new SymbolBlockerAnimation();
         }
         super(null,FlashSprite.fromNative(_nativeObject));
         var _loc2_:FlashDisplayObjectContainer = _sprite as FlashDisplayObjectContainer;
         symbolBlockerAnimationCircle = new SymbolBlockerAnimationCircleGeneric(_nativeObject.symbolBlockerAnimationCircle);
      }
      
      public function setNativeInstance(param1:SymbolBlockerAnimation) : void
      {
         FlashSprite.setNativeInstance(_sprite,param1);
         _nativeObject = param1;
         syncInstances();
      }
      
      public function syncInstances() : void
      {
         if(_nativeObject.symbolBlockerAnimationCircle)
         {
            symbolBlockerAnimationCircle.setNativeInstance(_nativeObject.symbolBlockerAnimationCircle);
         }
      }
   }
}
