package visuals.ui.elements.citymap
{
   import com.playata.framework.display.Sprite;
   import com.playata.framework.display.lib.flash.FlashDisplayObjectContainer;
   import com.playata.framework.display.lib.flash.FlashSprite;
   import flash.display.MovieClip;
   import visuals.ui.elements.conventions.SymbolConventionGraphicGeneric;
   
   public class SymbolCitymapIconConventionGeneric extends Sprite
   {
       
      
      private var _nativeObject:SymbolCitymapIconConvention = null;
      
      public var graphic:SymbolConventionGraphicGeneric = null;
      
      public function SymbolCitymapIconConventionGeneric(param1:MovieClip = null)
      {
         if(param1)
         {
            _nativeObject = param1 as SymbolCitymapIconConvention;
         }
         else
         {
            _nativeObject = new SymbolCitymapIconConvention();
         }
         super(null,FlashSprite.fromNative(_nativeObject));
         var _loc2_:FlashDisplayObjectContainer = _sprite as FlashDisplayObjectContainer;
         graphic = new SymbolConventionGraphicGeneric(_nativeObject.graphic);
      }
      
      public function setNativeInstance(param1:SymbolCitymapIconConvention) : void
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
