package visuals.ui.elements.item
{
   import com.playata.framework.display.Sprite;
   import com.playata.framework.display.lib.flash.FlashDisplayObjectContainer;
   import com.playata.framework.display.lib.flash.FlashSprite;
   import flash.display.MovieClip;
   
   public class SymbolBankItemSlotGeneric extends Sprite
   {
       
      
      private var _nativeObject:SymbolBankItemSlot = null;
      
      public var itemSlot:SymbolItemSlotGeneric = null;
      
      public var lock:SymboBankInventoryItemIconLockGeneric = null;
      
      public function SymbolBankItemSlotGeneric(param1:MovieClip = null)
      {
         if(param1)
         {
            _nativeObject = param1 as SymbolBankItemSlot;
         }
         else
         {
            _nativeObject = new SymbolBankItemSlot();
         }
         super(null,FlashSprite.fromNative(_nativeObject));
         var _loc2_:FlashDisplayObjectContainer = _sprite as FlashDisplayObjectContainer;
         itemSlot = new SymbolItemSlotGeneric(_nativeObject.itemSlot);
         lock = new SymboBankInventoryItemIconLockGeneric(_nativeObject.lock);
      }
      
      public function setNativeInstance(param1:SymbolBankItemSlot) : void
      {
         FlashSprite.setNativeInstance(_sprite,param1);
         _nativeObject = param1;
         syncInstances();
      }
      
      public function syncInstances() : void
      {
         if(_nativeObject.itemSlot)
         {
            itemSlot.setNativeInstance(_nativeObject.itemSlot);
         }
         if(_nativeObject.lock)
         {
            lock.setNativeInstance(_nativeObject.lock);
         }
      }
   }
}
