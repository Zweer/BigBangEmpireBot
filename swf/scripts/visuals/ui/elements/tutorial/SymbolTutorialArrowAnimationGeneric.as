package visuals.ui.elements.tutorial
{
   import com.playata.framework.display.Sprite;
   import com.playata.framework.display.lib.flash.FlashDisplayObjectContainer;
   import com.playata.framework.display.lib.flash.FlashSprite;
   import flash.display.MovieClip;
   
   public class SymbolTutorialArrowAnimationGeneric extends Sprite
   {
       
      
      private var _nativeObject:SymbolTutorialArrowAnimation = null;
      
      public var graphic:SymbolTutorialArrowGraphicGeneric = null;
      
      public function SymbolTutorialArrowAnimationGeneric(param1:MovieClip = null)
      {
         if(param1)
         {
            _nativeObject = param1 as SymbolTutorialArrowAnimation;
         }
         else
         {
            _nativeObject = new SymbolTutorialArrowAnimation();
         }
         super(null,FlashSprite.fromNative(_nativeObject));
         var _loc2_:FlashDisplayObjectContainer = _sprite as FlashDisplayObjectContainer;
         graphic = new SymbolTutorialArrowGraphicGeneric(_nativeObject.graphic);
      }
      
      public function setNativeInstance(param1:SymbolTutorialArrowAnimation) : void
      {
         FlashSprite.setNativeInstance(_sprite,param1);
         _nativeObject = param1;
         syncInstances();
      }
      
      public function syncInstances() : void
      {
         if(_nativeObject.graphic)
         {
            graphic.setNativeInstance(_nativeObject.graphic);
         }
      }
   }
}
