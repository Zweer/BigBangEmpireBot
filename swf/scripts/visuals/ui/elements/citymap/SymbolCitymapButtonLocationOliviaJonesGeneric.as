package visuals.ui.elements.citymap
{
   import com.playata.framework.display.Sprite;
   import com.playata.framework.display.lib.flash.FlashDisplayObjectContainer;
   import com.playata.framework.display.lib.flash.FlashSprite;
   import flash.display.MovieClip;
   
   public class SymbolCitymapButtonLocationOliviaJonesGeneric extends Sprite
   {
       
      
      private var _nativeObject:SymbolCitymapButtonLocationOliviaJones = null;
      
      public var shadow:SymbolCitymapShadowOliviaJonesGeneric = null;
      
      public var locationGraphic:SymbolCitymapLocationOliviaJonesGeneric = null;
      
      public var clickArea:SymbolLocationOliviaJonesClickAreaGeneric = null;
      
      public function SymbolCitymapButtonLocationOliviaJonesGeneric(param1:MovieClip = null)
      {
         if(param1)
         {
            _nativeObject = param1 as SymbolCitymapButtonLocationOliviaJones;
         }
         else
         {
            _nativeObject = new SymbolCitymapButtonLocationOliviaJones();
         }
         super(null,FlashSprite.fromNative(_nativeObject));
         var _loc2_:FlashDisplayObjectContainer = _sprite as FlashDisplayObjectContainer;
         shadow = new SymbolCitymapShadowOliviaJonesGeneric(_nativeObject.shadow);
         locationGraphic = new SymbolCitymapLocationOliviaJonesGeneric(_nativeObject.locationGraphic);
         clickArea = new SymbolLocationOliviaJonesClickAreaGeneric(_nativeObject.clickArea);
      }
      
      public function setNativeInstance(param1:SymbolCitymapButtonLocationOliviaJones) : void
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
         if(_nativeObject.locationGraphic)
         {
            locationGraphic.setNativeInstance(_nativeObject.locationGraphic);
         }
         if(_nativeObject.clickArea)
         {
            clickArea.setNativeInstance(_nativeObject.clickArea);
         }
      }
   }
}
