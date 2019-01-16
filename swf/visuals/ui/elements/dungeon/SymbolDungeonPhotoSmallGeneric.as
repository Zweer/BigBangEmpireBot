package visuals.ui.elements.dungeon
{
   import com.playata.framework.display.Sprite;
   import com.playata.framework.display.lib.flash.FlashDisplayObjectContainer;
   import com.playata.framework.display.lib.flash.FlashSprite;
   import flash.display.MovieClip;
   import visuals.ui.base.SymbolPlaceholderGeneric;
   import visuals.ui.elements.friend.SymbolPhotoBackgroundGeneric;
   import visuals.ui.elements.icons.SymbolIconCheckmarkGeneric;
   import visuals.ui.elements.icons.SymbolIconLockGeneric;
   
   public class SymbolDungeonPhotoSmallGeneric extends Sprite
   {
       
      
      private var _nativeObject:SymbolDungeonPhotoSmall = null;
      
      public var symbolPhotoBackground:SymbolPhotoBackgroundGeneric = null;
      
      public var photo:SymbolPlaceholderGeneric = null;
      
      public var locked:SymbolIconLockGeneric = null;
      
      public var completed:SymbolIconCheckmarkGeneric = null;
      
      public function SymbolDungeonPhotoSmallGeneric(param1:MovieClip = null)
      {
         if(param1)
         {
            _nativeObject = param1 as SymbolDungeonPhotoSmall;
         }
         else
         {
            _nativeObject = new SymbolDungeonPhotoSmall();
         }
         super(null,FlashSprite.fromNative(_nativeObject));
         var _loc2_:FlashDisplayObjectContainer = _sprite as FlashDisplayObjectContainer;
         symbolPhotoBackground = new SymbolPhotoBackgroundGeneric(_nativeObject.symbolPhotoBackground);
         photo = new SymbolPlaceholderGeneric(_nativeObject.photo);
         locked = new SymbolIconLockGeneric(_nativeObject.locked);
         completed = new SymbolIconCheckmarkGeneric(_nativeObject.completed);
      }
      
      public function setNativeInstance(param1:SymbolDungeonPhotoSmall) : void
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
         if(_nativeObject.locked)
         {
            locked.setNativeInstance(_nativeObject.locked);
         }
         if(_nativeObject.completed)
         {
            completed.setNativeInstance(_nativeObject.completed);
         }
      }
   }
}
