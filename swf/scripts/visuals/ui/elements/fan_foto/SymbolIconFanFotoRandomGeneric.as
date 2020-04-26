package visuals.ui.elements.fan_foto
{
   import com.playata.framework.display.Sprite;
   import com.playata.framework.display.lib.flash.FlashDisplayObjectContainer;
   import com.playata.framework.display.lib.flash.FlashSprite;
   import flash.display.MovieClip;
   
   public class SymbolIconFanFotoRandomGeneric extends Sprite
   {
       
      
      private var _nativeObject:SymbolIconFanFotoRandom = null;
      
      public function SymbolIconFanFotoRandomGeneric(param1:MovieClip = null)
      {
         if(param1)
         {
            _nativeObject = param1 as SymbolIconFanFotoRandom;
         }
         else
         {
            _nativeObject = new SymbolIconFanFotoRandom();
         }
         super(null,FlashSprite.fromNative(_nativeObject));
         var _loc2_:FlashDisplayObjectContainer = _sprite as FlashDisplayObjectContainer;
      }
      
      public function setNativeInstance(param1:SymbolIconFanFotoRandom) : void
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
