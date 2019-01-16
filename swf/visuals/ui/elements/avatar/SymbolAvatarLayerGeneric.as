package visuals.ui.elements.avatar
{
   import com.playata.framework.display.Sprite;
   import com.playata.framework.display.lib.flash.FlashDisplayObjectContainer;
   import com.playata.framework.display.lib.flash.FlashSprite;
   import flash.display.MovieClip;
   import visuals.ui.base.SymbolPlaceholderGeneric;
   
   public class SymbolAvatarLayerGeneric extends Sprite
   {
       
      
      private var _nativeObject:SymbolAvatarLayer = null;
      
      public var symbolPlaceholder:SymbolPlaceholderGeneric = null;
      
      public function SymbolAvatarLayerGeneric(param1:MovieClip = null)
      {
         if(param1)
         {
            _nativeObject = param1 as SymbolAvatarLayer;
         }
         else
         {
            _nativeObject = new SymbolAvatarLayer();
         }
         super(null,FlashSprite.fromNative(_nativeObject));
         var _loc2_:FlashDisplayObjectContainer = _sprite as FlashDisplayObjectContainer;
         symbolPlaceholder = new SymbolPlaceholderGeneric(_nativeObject.symbolPlaceholder);
      }
      
      public function setNativeInstance(param1:SymbolAvatarLayer) : void
      {
         FlashSprite.setNativeInstance(_sprite,param1);
         _nativeObject = param1;
         syncInstances();
      }
      
      public function syncInstances() : void
      {
         if(_nativeObject.symbolPlaceholder)
         {
            symbolPlaceholder.setNativeInstance(_nativeObject.symbolPlaceholder);
         }
      }
   }
}
