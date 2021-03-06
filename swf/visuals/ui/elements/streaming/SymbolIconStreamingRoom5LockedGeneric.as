package visuals.ui.elements.streaming
{
   import com.playata.framework.display.Sprite;
   import com.playata.framework.display.lib.flash.FlashDisplayObjectContainer;
   import com.playata.framework.display.lib.flash.FlashSprite;
   import flash.display.MovieClip;
   
   public class SymbolIconStreamingRoom5LockedGeneric extends Sprite
   {
       
      
      private var _nativeObject:SymbolIconStreamingRoom5Locked = null;
      
      public function SymbolIconStreamingRoom5LockedGeneric(param1:MovieClip = null)
      {
         if(param1)
         {
            _nativeObject = param1 as SymbolIconStreamingRoom5Locked;
         }
         else
         {
            _nativeObject = new SymbolIconStreamingRoom5Locked();
         }
         super(null,FlashSprite.fromNative(_nativeObject));
         var _loc2_:FlashDisplayObjectContainer = _sprite as FlashDisplayObjectContainer;
      }
      
      public function setNativeInstance(param1:SymbolIconStreamingRoom5Locked) : void
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
