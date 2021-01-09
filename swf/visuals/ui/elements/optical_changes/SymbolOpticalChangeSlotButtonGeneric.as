package visuals.ui.elements.optical_changes
{
   import com.playata.framework.display.Sprite;
   import com.playata.framework.display.lib.flash.FlashDisplayObjectContainer;
   import com.playata.framework.display.lib.flash.FlashSprite;
   import flash.display.MovieClip;
   import visuals.ui.base.SymbolDummyGeneric;
   import visuals.ui.elements.icons.SymbolIconCheckmarkGeneric;
   import visuals.ui.elements.icons.SymbolIconLockGeneric;
   
   public class SymbolOpticalChangeSlotButtonGeneric extends Sprite
   {
       
      
      private var _nativeObject:SymbolOpticalChangeSlotButton = null;
      
      public var slot:SymbolOpticalChangeSlotGeneric = null;
      
      public var checkmark:SymbolIconCheckmarkGeneric = null;
      
      public var iconLock:SymbolIconLockGeneric = null;
      
      public var tooltipLayer:SymbolDummyGeneric = null;
      
      public function SymbolOpticalChangeSlotButtonGeneric(param1:MovieClip = null)
      {
         if(param1)
         {
            _nativeObject = param1 as SymbolOpticalChangeSlotButton;
         }
         else
         {
            _nativeObject = new SymbolOpticalChangeSlotButton();
         }
         super(null,FlashSprite.fromNative(_nativeObject));
         var _loc2_:FlashDisplayObjectContainer = _sprite as FlashDisplayObjectContainer;
         slot = new SymbolOpticalChangeSlotGeneric(_nativeObject.slot);
         checkmark = new SymbolIconCheckmarkGeneric(_nativeObject.checkmark);
         iconLock = new SymbolIconLockGeneric(_nativeObject.iconLock);
         tooltipLayer = new SymbolDummyGeneric(_nativeObject.tooltipLayer);
      }
      
      public function setNativeInstance(param1:SymbolOpticalChangeSlotButton) : void
      {
         FlashSprite.setNativeInstance(_sprite,param1);
         _nativeObject = param1;
         syncInstances();
      }
      
      public function syncInstances() : void
      {
         if(_nativeObject.slot)
         {
            slot.setNativeInstance(_nativeObject.slot);
         }
         if(_nativeObject.checkmark)
         {
            checkmark.setNativeInstance(_nativeObject.checkmark);
         }
         if(_nativeObject.iconLock)
         {
            iconLock.setNativeInstance(_nativeObject.iconLock);
         }
         if(_nativeObject.tooltipLayer)
         {
            tooltipLayer.setNativeInstance(_nativeObject.tooltipLayer);
         }
      }
   }
}
