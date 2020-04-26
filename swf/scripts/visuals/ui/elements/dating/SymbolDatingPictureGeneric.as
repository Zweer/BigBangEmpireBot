package visuals.ui.elements.dating
{
   import com.playata.framework.display.Sprite;
   import com.playata.framework.display.lib.flash.FlashDisplayObjectContainer;
   import com.playata.framework.display.lib.flash.FlashSprite;
   import flash.display.MovieClip;
   import visuals.ui.base.SymbolDummyGeneric;
   import visuals.ui.base.SymbolPlaceholderGeneric;
   
   public class SymbolDatingPictureGeneric extends Sprite
   {
       
      
      private var _nativeObject:SymbolDatingPicture = null;
      
      public var picture:SymbolPlaceholderGeneric = null;
      
      public var symbolDummy:SymbolDummyGeneric = null;
      
      public function SymbolDatingPictureGeneric(param1:MovieClip = null)
      {
         if(param1)
         {
            _nativeObject = param1 as SymbolDatingPicture;
         }
         else
         {
            _nativeObject = new SymbolDatingPicture();
         }
         super(null,FlashSprite.fromNative(_nativeObject));
         var _loc2_:FlashDisplayObjectContainer = _sprite as FlashDisplayObjectContainer;
         picture = new SymbolPlaceholderGeneric(_nativeObject.picture);
         symbolDummy = new SymbolDummyGeneric(_nativeObject.symbolDummy);
      }
      
      public function setNativeInstance(param1:SymbolDatingPicture) : void
      {
         FlashSprite.setNativeInstance(_sprite,param1);
         _nativeObject = param1;
         syncInstances();
      }
      
      public function syncInstances() : void
      {
         if(_nativeObject.picture)
         {
            picture.setNativeInstance(_nativeObject.picture);
         }
         if(_nativeObject.symbolDummy)
         {
            symbolDummy.setNativeInstance(_nativeObject.symbolDummy);
         }
      }
   }
}
