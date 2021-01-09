package visuals.ui.elements.bonus
{
   import com.playata.framework.display.Sprite;
   import com.playata.framework.display.lib.flash.FlashDisplayObjectContainer;
   import com.playata.framework.display.lib.flash.FlashSprite;
   import flash.display.MovieClip;
   import visuals.ui.elements.slotmachine.SymbolSlotMachineReelAllGeneric;
   
   public class SymbolSlotMachineGeneric extends Sprite
   {
       
      
      private var _nativeObject:SymbolSlotMachine = null;
      
      public var reel3:SymbolSlotMachineReelAllGeneric = null;
      
      public var reel2:SymbolSlotMachineReelAllGeneric = null;
      
      public var reel1:SymbolSlotMachineReelAllGeneric = null;
      
      public function SymbolSlotMachineGeneric(param1:MovieClip = null)
      {
         if(param1)
         {
            _nativeObject = param1 as SymbolSlotMachine;
         }
         else
         {
            _nativeObject = new SymbolSlotMachine();
         }
         super(null,FlashSprite.fromNative(_nativeObject));
         var _loc2_:FlashDisplayObjectContainer = _sprite as FlashDisplayObjectContainer;
         reel3 = new SymbolSlotMachineReelAllGeneric(_nativeObject.reel3);
         reel2 = new SymbolSlotMachineReelAllGeneric(_nativeObject.reel2);
         reel1 = new SymbolSlotMachineReelAllGeneric(_nativeObject.reel1);
      }
      
      public function setNativeInstance(param1:SymbolSlotMachine) : void
      {
         FlashSprite.setNativeInstance(_sprite,param1);
         _nativeObject = param1;
         syncInstances();
      }
      
      public function syncInstances() : void
      {
         if(_nativeObject.reel3)
         {
            reel3.setNativeInstance(_nativeObject.reel3);
         }
         if(_nativeObject.reel2)
         {
            reel2.setNativeInstance(_nativeObject.reel2);
         }
         if(_nativeObject.reel1)
         {
            reel1.setNativeInstance(_nativeObject.reel1);
         }
      }
   }
}
