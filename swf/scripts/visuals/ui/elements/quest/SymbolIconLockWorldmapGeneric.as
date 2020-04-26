package visuals.ui.elements.quest
{
   import com.playata.framework.display.Sprite;
   import com.playata.framework.display.lib.flash.FlashDisplayObjectContainer;
   import com.playata.framework.display.lib.flash.FlashSprite;
   import flash.display.MovieClip;
   import visuals.ui.elements.icons.SymbolIconLockGeneric;
   
   public class SymbolIconLockWorldmapGeneric extends Sprite
   {
       
      
      private var _nativeObject:SymbolIconLockWorldmap = null;
      
      public var symbolIconLock:SymbolIconLockGeneric = null;
      
      public function SymbolIconLockWorldmapGeneric(param1:MovieClip = null)
      {
         if(param1)
         {
            _nativeObject = param1 as SymbolIconLockWorldmap;
         }
         else
         {
            _nativeObject = new SymbolIconLockWorldmap();
         }
         super(null,FlashSprite.fromNative(_nativeObject));
         var _loc2_:FlashDisplayObjectContainer = _sprite as FlashDisplayObjectContainer;
         symbolIconLock = new SymbolIconLockGeneric(_nativeObject.symbolIconLock);
      }
      
      public function setNativeInstance(param1:SymbolIconLockWorldmap) : void
      {
         FlashSprite.setNativeInstance(_sprite,param1);
         _nativeObject = param1;
         syncInstances();
      }
      
      public function syncInstances() : void
      {
         if(_nativeObject.symbolIconLock)
         {
            symbolIconLock.setNativeInstance(_nativeObject.symbolIconLock);
         }
      }
   }
}
