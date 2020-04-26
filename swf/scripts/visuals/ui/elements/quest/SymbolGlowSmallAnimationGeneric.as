package visuals.ui.elements.quest
{
   import com.playata.framework.display.Sprite;
   import com.playata.framework.display.lib.flash.FlashDisplayObjectContainer;
   import com.playata.framework.display.lib.flash.FlashSprite;
   import flash.display.MovieClip;
   
   public class SymbolGlowSmallAnimationGeneric extends Sprite
   {
       
      
      private var _nativeObject:SymbolGlowSmallAnimation = null;
      
      public var symbolGlowSmall:SymbolGlowSmallGeneric = null;
      
      public function SymbolGlowSmallAnimationGeneric(param1:MovieClip = null)
      {
         if(param1)
         {
            _nativeObject = param1 as SymbolGlowSmallAnimation;
         }
         else
         {
            _nativeObject = new SymbolGlowSmallAnimation();
         }
         super(null,FlashSprite.fromNative(_nativeObject));
         var _loc2_:FlashDisplayObjectContainer = _sprite as FlashDisplayObjectContainer;
         symbolGlowSmall = new SymbolGlowSmallGeneric(_nativeObject.symbolGlowSmall);
      }
      
      public function setNativeInstance(param1:SymbolGlowSmallAnimation) : void
      {
         FlashSprite.setNativeInstance(_sprite,param1);
         _nativeObject = param1;
         syncInstances();
      }
      
      public function syncInstances() : void
      {
         if(_nativeObject.symbolGlowSmall)
         {
            symbolGlowSmall.setNativeInstance(_nativeObject.symbolGlowSmall);
         }
      }
   }
}
