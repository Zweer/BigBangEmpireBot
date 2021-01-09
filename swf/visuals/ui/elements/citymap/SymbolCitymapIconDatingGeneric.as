package visuals.ui.elements.citymap
{
   import com.playata.framework.display.Sprite;
   import com.playata.framework.display.lib.flash.FlashDisplayObjectContainer;
   import com.playata.framework.display.lib.flash.FlashSprite;
   import flash.display.MovieClip;
   import visuals.ui.elements.dating.SymbolDatingGraphicGeneric;
   
   public class SymbolCitymapIconDatingGeneric extends Sprite
   {
       
      
      private var _nativeObject:SymbolCitymapIconDating = null;
      
      public var graphic:SymbolDatingGraphicGeneric = null;
      
      public function SymbolCitymapIconDatingGeneric(param1:MovieClip = null)
      {
         if(param1)
         {
            _nativeObject = param1 as SymbolCitymapIconDating;
         }
         else
         {
            _nativeObject = new SymbolCitymapIconDating();
         }
         super(null,FlashSprite.fromNative(_nativeObject));
         var _loc2_:FlashDisplayObjectContainer = _sprite as FlashDisplayObjectContainer;
         graphic = new SymbolDatingGraphicGeneric(_nativeObject.graphic);
      }
      
      public function setNativeInstance(param1:SymbolCitymapIconDating) : void
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
