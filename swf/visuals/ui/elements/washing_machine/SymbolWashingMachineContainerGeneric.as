package visuals.ui.elements.washing_machine
{
   import com.playata.framework.display.Sprite;
   import com.playata.framework.display.lib.flash.FlashDisplayObjectContainer;
   import com.playata.framework.display.lib.flash.FlashSprite;
   import flash.display.MovieClip;
   
   public class SymbolWashingMachineContainerGeneric extends Sprite
   {
       
      
      private var _nativeObject:SymbolWashingMachineContainer = null;
      
      public var washingMachine:SymbolWashingMachineGeneric = null;
      
      public function SymbolWashingMachineContainerGeneric(param1:MovieClip = null)
      {
         if(param1)
         {
            _nativeObject = param1 as SymbolWashingMachineContainer;
         }
         else
         {
            _nativeObject = new SymbolWashingMachineContainer();
         }
         super(null,FlashSprite.fromNative(_nativeObject));
         var _loc2_:FlashDisplayObjectContainer = _sprite as FlashDisplayObjectContainer;
         washingMachine = new SymbolWashingMachineGeneric(_nativeObject.washingMachine);
      }
      
      public function setNativeInstance(param1:SymbolWashingMachineContainer) : void
      {
         FlashSprite.setNativeInstance(_sprite,param1);
         _nativeObject = param1;
         syncInstances();
      }
      
      public function syncInstances() : void
      {
         if(_nativeObject.washingMachine)
         {
            washingMachine.setNativeInstance(_nativeObject.washingMachine);
         }
      }
   }
}
