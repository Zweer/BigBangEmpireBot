package visuals.ui.elements.background
{
   import com.playata.framework.display.Sprite;
   import com.playata.framework.display.lib.flash.FlashDisplayObjectContainer;
   import com.playata.framework.display.lib.flash.FlashSprite;
   import flash.display.MovieClip;
   
   public class SymbolBackgroundFaderPlaneGeneric extends Sprite
   {
       
      
      private var _nativeObject:SymbolBackgroundFaderPlane = null;
      
      public function SymbolBackgroundFaderPlaneGeneric(param1:MovieClip = null)
      {
         if(param1)
         {
            _nativeObject = param1 as SymbolBackgroundFaderPlane;
         }
         else
         {
            _nativeObject = new SymbolBackgroundFaderPlane();
         }
         super(null,FlashSprite.fromNative(_nativeObject));
         var _loc2_:FlashDisplayObjectContainer = _sprite as FlashDisplayObjectContainer;
      }
      
      public function setNativeInstance(param1:SymbolBackgroundFaderPlane) : void
      {
         FlashSprite.setNativeInstance(_sprite,param1);
         _nativeObject = param1;
         syncInstances();
      }
      
      public function syncInstances() : void
      {
      }
   }
}
