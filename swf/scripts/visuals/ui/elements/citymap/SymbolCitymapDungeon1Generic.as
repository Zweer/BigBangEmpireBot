package visuals.ui.elements.citymap
{
   import com.playata.framework.display.Sprite;
   import com.playata.framework.display.lib.flash.FlashDisplayObjectContainer;
   import com.playata.framework.display.lib.flash.FlashSprite;
   import flash.display.MovieClip;
   
   public class SymbolCitymapDungeon1Generic extends Sprite
   {
       
      
      private var _nativeObject:SymbolCitymapDungeon1 = null;
      
      public function SymbolCitymapDungeon1Generic(param1:MovieClip = null)
      {
         if(param1)
         {
            _nativeObject = param1 as SymbolCitymapDungeon1;
         }
         else
         {
            _nativeObject = new SymbolCitymapDungeon1();
         }
         super(null,FlashSprite.fromNative(_nativeObject));
         var _loc2_:FlashDisplayObjectContainer = _sprite as FlashDisplayObjectContainer;
      }
      
      public function setNativeInstance(param1:SymbolCitymapDungeon1) : void
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
