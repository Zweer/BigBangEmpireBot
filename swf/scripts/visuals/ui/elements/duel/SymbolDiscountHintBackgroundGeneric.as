package visuals.ui.elements.duel
{
   import com.playata.framework.display.Sprite;
   import com.playata.framework.display.lib.flash.FlashDisplayObjectContainer;
   import com.playata.framework.display.lib.flash.FlashSprite;
   import flash.display.MovieClip;
   import visuals.ui.elements.backgrounds.SymbolBackgroundScalableGeneric;
   
   public class SymbolDiscountHintBackgroundGeneric extends Sprite
   {
       
      
      private var _nativeObject:SymbolDiscountHintBackground = null;
      
      public var shadow:SymbolBackgroundScalableGeneric = null;
      
      public var background:SymbolBackgroundScalableGeneric = null;
      
      public function SymbolDiscountHintBackgroundGeneric(param1:MovieClip = null)
      {
         if(param1)
         {
            _nativeObject = param1 as SymbolDiscountHintBackground;
         }
         else
         {
            _nativeObject = new SymbolDiscountHintBackground();
         }
         super(null,FlashSprite.fromNative(_nativeObject));
         var _loc2_:FlashDisplayObjectContainer = _sprite as FlashDisplayObjectContainer;
         shadow = new SymbolBackgroundScalableGeneric(_nativeObject.shadow);
         background = new SymbolBackgroundScalableGeneric(_nativeObject.background);
      }
      
      public function setNativeInstance(param1:SymbolDiscountHintBackground) : void
      {
         FlashSprite.setNativeInstance(_sprite,param1);
         _nativeObject = param1;
         syncInstances();
      }
      
      public function syncInstances() : void
      {
         if(_nativeObject.shadow)
         {
            shadow.setNativeInstance(_nativeObject.shadow);
         }
         if(_nativeObject.background)
         {
            background.setNativeInstance(_nativeObject.background);
         }
      }
   }
}
