package visuals.ui.elements.item
{
   import com.playata.framework.display.Sprite;
   import com.playata.framework.display.lib.flash.FlashDisplayObjectContainer;
   import com.playata.framework.display.lib.flash.FlashSprite;
   import flash.display.MovieClip;
   import visuals.ui.elements.icons.SymbolIconLockGeneric;
   import visuals.ui.elements.icons.SymbolIconUnlockGeneric;
   
   public class SymboBankInventoryItemIconLockGeneric extends Sprite
   {
       
      
      private var _nativeObject:SymboBankInventoryItemIconLock = null;
      
      public var locked:SymbolIconLockGeneric = null;
      
      public var unlocked:SymbolIconUnlockGeneric = null;
      
      public function SymboBankInventoryItemIconLockGeneric(param1:MovieClip = null)
      {
         if(param1)
         {
            _nativeObject = param1 as SymboBankInventoryItemIconLock;
         }
         else
         {
            _nativeObject = new SymboBankInventoryItemIconLock();
         }
         super(null,FlashSprite.fromNative(_nativeObject));
         var _loc2_:FlashDisplayObjectContainer = _sprite as FlashDisplayObjectContainer;
         locked = new SymbolIconLockGeneric(_nativeObject.locked);
         unlocked = new SymbolIconUnlockGeneric(_nativeObject.unlocked);
      }
      
      public function setNativeInstance(param1:SymboBankInventoryItemIconLock) : void
      {
         FlashSprite.setNativeInstance(_sprite,param1);
         _nativeObject = param1;
         syncInstances();
      }
      
      public function syncInstances() : void
      {
         if(_nativeObject.locked)
         {
            locked.setNativeInstance(_nativeObject.locked);
         }
         if(_nativeObject.unlocked)
         {
            unlocked.setNativeInstance(_nativeObject.unlocked);
         }
      }
   }
}
