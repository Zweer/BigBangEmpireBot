package visuals.ui.elements.citymap
{
   import com.playata.framework.display.Sprite;
   import com.playata.framework.display.lib.flash.FlashDisplayObjectContainer;
   import com.playata.framework.display.lib.flash.FlashSprite;
   import flash.display.MovieClip;
   
   public class SymbolCitymapShadow9Generic extends Sprite
   {
       
      
      private var _nativeObject:SymbolCitymapShadow9 = null;
      
      public function SymbolCitymapShadow9Generic(param1:MovieClip = null)
      {
         if(param1)
         {
            _nativeObject = param1 as SymbolCitymapShadow9;
         }
         else
         {
            _nativeObject = new SymbolCitymapShadow9();
         }
         super(null,FlashSprite.fromNative(_nativeObject));
         var _loc2_:FlashDisplayObjectContainer = _sprite as FlashDisplayObjectContainer;
      }
      
      public function setNativeInstance(param1:SymbolCitymapShadow9) : void
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
