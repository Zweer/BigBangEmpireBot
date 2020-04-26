package visuals.ui.elements.dating
{
   import com.playata.framework.display.Sprite;
   import com.playata.framework.display.lib.flash.FlashDisplayObjectContainer;
   import com.playata.framework.display.lib.flash.FlashSprite;
   import flash.display.MovieClip;
   import visuals.ui.elements.generic.SymbolCounterGeneric;
   
   public class SymbolButtonDatingPicturesGeneric extends Sprite
   {
       
      
      private var _nativeObject:SymbolButtonDatingPictures = null;
      
      public var icon:SymbolIconDatingPicturesGeneric = null;
      
      public var info:SymbolCounterGeneric = null;
      
      public function SymbolButtonDatingPicturesGeneric(param1:MovieClip = null)
      {
         if(param1)
         {
            _nativeObject = param1 as SymbolButtonDatingPictures;
         }
         else
         {
            _nativeObject = new SymbolButtonDatingPictures();
         }
         super(null,FlashSprite.fromNative(_nativeObject));
         var _loc2_:FlashDisplayObjectContainer = _sprite as FlashDisplayObjectContainer;
         icon = new SymbolIconDatingPicturesGeneric(_nativeObject.icon);
         info = new SymbolCounterGeneric(_nativeObject.info);
      }
      
      public function setNativeInstance(param1:SymbolButtonDatingPictures) : void
      {
         FlashSprite.setNativeInstance(_sprite,param1);
         _nativeObject = param1;
         syncInstances();
      }
      
      public function syncInstances() : void
      {
         if(_nativeObject.icon)
         {
            icon.setNativeInstance(_nativeObject.icon);
         }
         if(_nativeObject.info)
         {
            info.setNativeInstance(_nativeObject.info);
         }
      }
   }
}
