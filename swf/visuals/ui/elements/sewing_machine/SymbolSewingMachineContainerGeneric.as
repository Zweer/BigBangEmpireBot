package visuals.ui.elements.sewing_machine
{
   import com.playata.framework.display.Sprite;
   import com.playata.framework.display.lib.flash.FlashDisplayObjectContainer;
   import com.playata.framework.display.lib.flash.FlashSprite;
   import flash.display.MovieClip;
   
   public class SymbolSewingMachineContainerGeneric extends Sprite
   {
       
      
      private var _nativeObject:SymbolSewingMachineContainer = null;
      
      public var sewingMachine:SymbolSewingMachineGeneric = null;
      
      public var needle:SymbolSewingMachineNeedleGeneric = null;
      
      public var strings:SymbolSewingMachineStringGeneric = null;
      
      public function SymbolSewingMachineContainerGeneric(param1:MovieClip = null)
      {
         if(param1)
         {
            _nativeObject = param1 as SymbolSewingMachineContainer;
         }
         else
         {
            _nativeObject = new SymbolSewingMachineContainer();
         }
         super(null,FlashSprite.fromNative(_nativeObject));
         var _loc2_:FlashDisplayObjectContainer = _sprite as FlashDisplayObjectContainer;
         sewingMachine = new SymbolSewingMachineGeneric(_nativeObject.sewingMachine);
         needle = new SymbolSewingMachineNeedleGeneric(_nativeObject.needle);
         strings = new SymbolSewingMachineStringGeneric(_nativeObject.strings);
      }
      
      public function setNativeInstance(param1:SymbolSewingMachineContainer) : void
      {
         FlashSprite.setNativeInstance(_sprite,param1);
         _nativeObject = param1;
         syncInstances();
      }
      
      public function syncInstances() : void
      {
         if(_nativeObject.sewingMachine)
         {
            sewingMachine.setNativeInstance(_nativeObject.sewingMachine);
         }
         if(_nativeObject.needle)
         {
            needle.setNativeInstance(_nativeObject.needle);
         }
         if(_nativeObject.strings)
         {
            strings.setNativeInstance(_nativeObject.strings);
         }
      }
   }
}
