package visuals.ui.base
{
   import com.playata.framework.display.Sprite;
   import com.playata.framework.display.lib.flash.FlashDisplayObjectContainer;
   import com.playata.framework.display.lib.flash.FlashSprite;
   import flash.display.MovieClip;
   import visuals.ui.elements.backgrounds.SymbolSlice9BackgroundButtonGeneric;
   import visuals.ui.elements.icons.SymbolIconDeleteGeneric;
   
   public class SymbolIconButtonDeleteGeneric extends Sprite
   {
       
      
      private var _nativeObject:SymbolIconButtonDelete = null;
      
      public var bg:SymbolSlice9BackgroundButtonGeneric = null;
      
      public var symbolIconDelete:SymbolIconDeleteGeneric = null;
      
      public function SymbolIconButtonDeleteGeneric(param1:MovieClip = null)
      {
         if(param1)
         {
            _nativeObject = param1 as SymbolIconButtonDelete;
         }
         else
         {
            _nativeObject = new SymbolIconButtonDelete();
         }
         super(null,FlashSprite.fromNative(_nativeObject));
         var _loc2_:FlashDisplayObjectContainer = _sprite as FlashDisplayObjectContainer;
         bg = new SymbolSlice9BackgroundButtonGeneric(_nativeObject.bg);
         symbolIconDelete = new SymbolIconDeleteGeneric(_nativeObject.symbolIconDelete);
      }
      
      public function setNativeInstance(param1:SymbolIconButtonDelete) : void
      {
         FlashSprite.setNativeInstance(_sprite,param1);
         _nativeObject = param1;
         syncInstances();
      }
      
      public function syncInstances() : void
      {
         if(_nativeObject.bg)
         {
            bg.setNativeInstance(_nativeObject.bg);
         }
         if(_nativeObject.symbolIconDelete)
         {
            symbolIconDelete.setNativeInstance(_nativeObject.symbolIconDelete);
         }
      }
   }
}
