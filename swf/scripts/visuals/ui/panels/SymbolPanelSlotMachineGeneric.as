package visuals.ui.panels
{
   import com.playata.framework.display.Sprite;
   import com.playata.framework.display.lib.flash.FlashDisplayObjectContainer;
   import com.playata.framework.display.lib.flash.FlashSprite;
   import flash.display.MovieClip;
   import visuals.ui.elements.buttons.SymbolButtonHelpGeneric;
   import visuals.ui.elements.slotmachine.SymbolSlotmachineContentGeneric;
   
   public class SymbolPanelSlotMachineGeneric extends Sprite
   {
       
      
      private var _nativeObject:SymbolPanelSlotMachine = null;
      
      public var slotmachine:SymbolSlotmachineContentGeneric = null;
      
      public var btnHelp:SymbolButtonHelpGeneric = null;
      
      public function SymbolPanelSlotMachineGeneric(param1:MovieClip = null)
      {
         if(param1)
         {
            _nativeObject = param1 as SymbolPanelSlotMachine;
         }
         else
         {
            _nativeObject = new SymbolPanelSlotMachine();
         }
         super(null,FlashSprite.fromNative(_nativeObject));
         var _loc2_:FlashDisplayObjectContainer = _sprite as FlashDisplayObjectContainer;
         slotmachine = new SymbolSlotmachineContentGeneric(_nativeObject.slotmachine);
         btnHelp = new SymbolButtonHelpGeneric(_nativeObject.btnHelp);
      }
      
      public function setNativeInstance(param1:SymbolPanelSlotMachine) : void
      {
         FlashSprite.setNativeInstance(_sprite,param1);
         _nativeObject = param1;
         syncInstances();
      }
      
      public function syncInstances() : void
      {
         if(_nativeObject.slotmachine)
         {
            slotmachine.setNativeInstance(_nativeObject.slotmachine);
         }
         if(_nativeObject.btnHelp)
         {
            btnHelp.setNativeInstance(_nativeObject.btnHelp);
         }
      }
   }
}
