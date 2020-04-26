package visuals.ui.elements.icons
{
   import com.playata.framework.display.Sprite;
   import com.playata.framework.display.lib.flash.FlashDisplayObjectContainer;
   import com.playata.framework.display.lib.flash.FlashSprite;
   import flash.display.MovieClip;
   
   public class SymbolIconCitymapGeneric extends Sprite
   {
       
      
      private var _nativeObject:SymbolIconCitymap = null;
      
      public function SymbolIconCitymapGeneric(param1:MovieClip = null)
      {
         if(param1)
         {
            _nativeObject = param1 as SymbolIconCitymap;
         }
         else
         {
            _nativeObject = new SymbolIconCitymap();
         }
         super(null,FlashSprite.fromNative(_nativeObject));
         var _loc2_:FlashDisplayObjectContainer = _sprite as FlashDisplayObjectContainer;
      }
      
      public function setNativeInstance(param1:SymbolIconCitymap) : void
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
