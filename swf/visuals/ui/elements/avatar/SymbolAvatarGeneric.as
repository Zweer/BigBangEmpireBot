package visuals.ui.elements.avatar
{
   import com.playata.framework.display.Sprite;
   import com.playata.framework.display.lib.flash.FlashDisplayObjectContainer;
   import com.playata.framework.display.lib.flash.FlashSprite;
   import flash.display.MovieClip;
   
   public class SymbolAvatarGeneric extends Sprite
   {
       
      
      private var _nativeObject:SymbolAvatar = null;
      
      public var placeholder:SymbolAvatarPlaceholderGeneric = null;
      
      public var itemLayers:SymbolAvatarItemLayersGeneric = null;
      
      public function SymbolAvatarGeneric(param1:MovieClip = null)
      {
         if(param1)
         {
            _nativeObject = param1 as SymbolAvatar;
         }
         else
         {
            _nativeObject = new SymbolAvatar();
         }
         super(null,FlashSprite.fromNative(_nativeObject));
         var _loc2_:FlashDisplayObjectContainer = _sprite as FlashDisplayObjectContainer;
         placeholder = new SymbolAvatarPlaceholderGeneric(_nativeObject.placeholder);
         itemLayers = new SymbolAvatarItemLayersGeneric(_nativeObject.itemLayers);
      }
      
      public function setNativeInstance(param1:SymbolAvatar) : void
      {
         FlashSprite.setNativeInstance(_sprite,param1);
         _nativeObject = param1;
         syncInstances();
      }
      
      public function syncInstances() : void
      {
         if(_nativeObject.placeholder)
         {
            placeholder.setNativeInstance(_nativeObject.placeholder);
         }
         if(_nativeObject.itemLayers)
         {
            itemLayers.setNativeInstance(_nativeObject.itemLayers);
         }
      }
   }
}
