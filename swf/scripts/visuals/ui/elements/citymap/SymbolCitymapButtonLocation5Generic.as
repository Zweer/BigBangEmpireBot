package visuals.ui.elements.citymap
{
   import com.playata.framework.display.Sprite;
   import com.playata.framework.display.lib.flash.FlashDisplayObjectContainer;
   import com.playata.framework.display.lib.flash.FlashSprite;
   import flash.display.MovieClip;
   
   public class SymbolCitymapButtonLocation5Generic extends Sprite
   {
       
      
      private var _nativeObject:SymbolCitymapButtonLocation5 = null;
      
      public var shadow:SymbolCitymapShadow5Generic = null;
      
      public var locationGraphic:SymbolCitymapLocation5Generic = null;
      
      public var clickArea:SymbolLocation5ClickAreaGeneric = null;
      
      public function SymbolCitymapButtonLocation5Generic(param1:MovieClip = null)
      {
         if(param1)
         {
            _nativeObject = param1 as SymbolCitymapButtonLocation5;
         }
         else
         {
            _nativeObject = new SymbolCitymapButtonLocation5();
         }
         super(null,FlashSprite.fromNative(_nativeObject));
         var _loc2_:FlashDisplayObjectContainer = _sprite as FlashDisplayObjectContainer;
         shadow = new SymbolCitymapShadow5Generic(_nativeObject.shadow);
         locationGraphic = new SymbolCitymapLocation5Generic(_nativeObject.locationGraphic);
         clickArea = new SymbolLocation5ClickAreaGeneric(_nativeObject.clickArea);
      }
      
      public function setNativeInstance(param1:SymbolCitymapButtonLocation5) : void
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
