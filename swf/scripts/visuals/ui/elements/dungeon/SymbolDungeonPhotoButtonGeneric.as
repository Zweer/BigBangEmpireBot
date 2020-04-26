package visuals.ui.elements.dungeon
{
   import com.playata.framework.display.Sprite;
   import com.playata.framework.display.lib.flash.FlashDisplayObjectContainer;
   import com.playata.framework.display.lib.flash.FlashSprite;
   import flash.display.MovieClip;
   import visuals.ui.base.SymbolPlaceholderGeneric;
   import visuals.ui.elements.friend.SymbolPhotoBackgroundGeneric;
   import visuals.ui.elements.icons.SymbolIconLockBigGeneric;
   
   public class SymbolDungeonPhotoButtonGeneric extends Sprite
   {
       
      
      private var _nativeObject:SymbolDungeonPhotoButton = null;
      
      public var symbolPhotoBackground:SymbolPhotoBackgroundGeneric = null;
      
      public var photo:SymbolPlaceholderGeneric = null;
      
      public var lock:SymbolIconLockBigGeneric = null;
      
      public function SymbolDungeonPhotoButtonGeneric(param1:MovieClip = null)
      {
         if(param1)
         {
            _nativeObject = param1 as SymbolDungeonPhotoButton;
         }
         else
         {
            _nativeObject = new SymbolDungeonPhotoButton();
         }
         super(null,FlashSprite.fromNative(_nativeObject));
         var _loc2_:FlashDisplayObjectContainer = _sprite as FlashDisplayObjectContainer;
         symbolPhotoBackground = new SymbolPhotoBackgroundGeneric(_nativeObject.symbolPhotoBackground);
         photo = new SymbolPlaceholderGeneric(_nativeObject.photo);
         lock = new SymbolIconLockBigGeneric(_nativeObject.lock);
      }
      
      public function setNativeInstance(param1:SymbolDungeonPhotoButton) : void
      {
         FlashSprite.setNativeInstance(_sprite,param1);
         _nativeObject = param1;
         syncInstances();
      }
      
      public function syncInstances() : void
      {
         if(_nativeObject.symbolPhotoBackground)
         {
            symbolPhotoBackground.setNativeInstance(_nativeObject.symbolPhotoBackground);
         }
         if(_nativeObject.photo)
         {
            photo.setNativeInstance(_nativeObject.photo);
         }
         if(_nativeObject.lock)
         {
            lock.setNativeInstance(_nativeObject.lock);
         }
      }
   }
}
