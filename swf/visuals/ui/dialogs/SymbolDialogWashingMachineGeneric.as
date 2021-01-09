package visuals.ui.dialogs
{
   import com.playata.framework.display.Sprite;
   import com.playata.framework.display.lib.flash.FlashDisplayObjectContainer;
   import com.playata.framework.display.lib.flash.FlashLabel;
   import com.playata.framework.display.lib.flash.FlashLabelArea;
   import com.playata.framework.display.lib.flash.FlashSprite;
   import com.playata.framework.display.ui.controls.ILabel;
   import com.playata.framework.display.ui.controls.ILabelArea;
   import flash.display.MovieClip;
   import visuals.ui.base.SymbolPlaceholderGeneric;
   import visuals.ui.elements.backgrounds.SymbolSlice9BackgroundDialogGeneric;
   import visuals.ui.elements.buttons.SymbolButtonCloseGeneric;
   import visuals.ui.elements.buttons.SymbolButtonPremiumGeneric;
   import visuals.ui.elements.item.SymbolItemSlotGeneric;
   import visuals.ui.elements.washing_machine.SymbolWashingMachineContainerGeneric;
   import visuals.ui.elements.washing_machine.SymbolWashingMachineShadowGeneric;
   
   public class SymbolDialogWashingMachineGeneric extends Sprite
   {
       
      
      private var _nativeObject:SymbolDialogWashingMachine = null;
      
      public var dialogBackground:SymbolSlice9BackgroundDialogGeneric = null;
      
      public var symbolWashingMachineShadow:SymbolWashingMachineShadowGeneric = null;
      
      public var washingMachine:SymbolWashingMachineContainerGeneric = null;
      
      public var txtDialogTitle:ILabel = null;
      
      public var btnClose:SymbolButtonCloseGeneric = null;
      
      public var btnChange:SymbolButtonPremiumGeneric = null;
      
      public var txtInfo:ILabelArea = null;
      
      public var itemSlot:SymbolItemSlotGeneric = null;
      
      public var rotateItem:SymbolPlaceholderGeneric = null;
      
      public function SymbolDialogWashingMachineGeneric(param1:MovieClip = null)
      {
         if(param1)
         {
            _nativeObject = param1 as SymbolDialogWashingMachine;
         }
         else
         {
            _nativeObject = new SymbolDialogWashingMachine();
         }
         super(null,FlashSprite.fromNative(_nativeObject));
         var _loc2_:FlashDisplayObjectContainer = _sprite as FlashDisplayObjectContainer;
         dialogBackground = new SymbolSlice9BackgroundDialogGeneric(_nativeObject.dialogBackground);
         symbolWashingMachineShadow = new SymbolWashingMachineShadowGeneric(_nativeObject.symbolWashingMachineShadow);
         washingMachine = new SymbolWashingMachineContainerGeneric(_nativeObject.washingMachine);
         txtDialogTitle = FlashLabel.fromNative(_nativeObject.txtDialogTitle);
         btnClose = new SymbolButtonCloseGeneric(_nativeObject.btnClose);
         btnChange = new SymbolButtonPremiumGeneric(_nativeObject.btnChange);
         txtInfo = FlashLabelArea.fromNative(_nativeObject.txtInfo);
         itemSlot = new SymbolItemSlotGeneric(_nativeObject.itemSlot);
         rotateItem = new SymbolPlaceholderGeneric(_nativeObject.rotateItem);
      }
      
      public function setNativeInstance(param1:SymbolDialogWashingMachine) : void
      {
         FlashSprite.setNativeInstance(_sprite,param1);
         _nativeObject = param1;
         syncInstances();
      }
      
      public function syncInstances() : void
      {
         if(_nativeObject.dialogBackground)
         {
            dialogBackground.setNativeInstance(_nativeObject.dialogBackground);
         }
         if(_nativeObject.symbolWashingMachineShadow)
         {
            symbolWashingMachineShadow.setNativeInstance(_nativeObject.symbolWashingMachineShadow);
         }
         if(_nativeObject.washingMachine)
         {
            washingMachine.setNativeInstance(_nativeObject.washingMachine);
         }
         FlashLabel.setNativeInstance(txtDialogTitle,_nativeObject.txtDialogTitle);
         if(_nativeObject.btnClose)
         {
            btnClose.setNativeInstance(_nativeObject.btnClose);
         }
         if(_nativeObject.btnChange)
         {
            btnChange.setNativeInstance(_nativeObject.btnChange);
         }
         FlashLabelArea.setNativeInstance(txtInfo,_nativeObject.txtInfo);
         if(_nativeObject.itemSlot)
         {
            itemSlot.setNativeInstance(_nativeObject.itemSlot);
         }
         if(_nativeObject.rotateItem)
         {
            rotateItem.setNativeInstance(_nativeObject.rotateItem);
         }
      }
   }
}
