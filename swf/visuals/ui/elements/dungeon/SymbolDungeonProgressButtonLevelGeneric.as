package visuals.ui.elements.dungeon
{
   import com.playata.framework.display.Sprite;
   import com.playata.framework.display.lib.flash.FlashDisplayObjectContainer;
   import com.playata.framework.display.lib.flash.FlashSprite;
   import flash.display.MovieClip;
   import visuals.ui.elements.icons.SymbolIconLockGeneric;
   
   public class SymbolDungeonProgressButtonLevelGeneric extends Sprite
   {
       
      
      private var _nativeObject:SymbolDungeonProgressButtonLevel = null;
      
      public var lock:SymbolIconLockGeneric = null;
      
      public function SymbolDungeonProgressButtonLevelGeneric(param1:MovieClip = null)
      {
         if(param1)
         {
            _nativeObject = param1 as SymbolDungeonProgressButtonLevel;
         }
         else
         {
            _nativeObject = new SymbolDungeonProgressButtonLevel();
         }
         super(null,FlashSprite.fromNative(_nativeObject));
         var _loc2_:FlashDisplayObjectContainer = _sprite as FlashDisplayObjectContainer;
         lock = new SymbolIconLockGeneric(_nativeObject.lock);
      }
      
      public function setNativeInstance(param1:SymbolDungeonProgressButtonLevel) : void
      {
         FlashSprite.setNativeInstance(_sprite,param1);
         _nativeObject = param1;
         syncInstances();
      }
      
      public function syncInstances() : void
      {
         if(_nativeObject.lock)
         {
            lock.setNativeInstance(_nativeObject.lock);
         }
      }
   }
}
