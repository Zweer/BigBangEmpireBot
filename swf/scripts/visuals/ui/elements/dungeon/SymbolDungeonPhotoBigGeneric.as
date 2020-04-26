package visuals.ui.elements.dungeon
{
   import com.playata.framework.display.Sprite;
   import com.playata.framework.display.lib.flash.FlashDisplayObjectContainer;
   import com.playata.framework.display.lib.flash.FlashSprite;
   import flash.display.MovieClip;
   import visuals.ui.base.SymbolPlaceholderGeneric;
   import visuals.ui.elements.friend.SymbolPhotoBackgroundGeneric;
   
   public class SymbolDungeonPhotoBigGeneric extends Sprite
   {
       
      
      private var _nativeObject:SymbolDungeonPhotoBig = null;
      
      public var symbolPhotoBackground:SymbolPhotoBackgroundGeneric = null;
      
      public var photo:SymbolPlaceholderGeneric = null;
      
      public function SymbolDungeonPhotoBigGeneric(param1:MovieClip = null)
      {
         if(param1)
         {
            _nativeObject = param1 as SymbolDungeonPhotoBig;
         }
         else
         {
            _nativeObject = new SymbolDungeonPhotoBig();
         }
         super(null,FlashSprite.fromNative(_nativeObject));
         var _loc2_:FlashDisplayObjectContainer = _sprite as FlashDisplayObjectContainer;
         symbolPhotoBackground = new SymbolPhotoBackgroundGeneric(_nativeObject.symbolPhotoBackground);
         photo = new SymbolPlaceholderGeneric(_nativeObject.photo);
      }
      
      public function setNativeInstance(param1:SymbolDungeonPhotoBig) : void
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
      }
   }
}
