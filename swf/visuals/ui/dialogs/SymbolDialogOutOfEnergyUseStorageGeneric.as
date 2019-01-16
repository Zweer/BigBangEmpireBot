package visuals.ui.dialogs
{
   import com.playata.framework.display.Sprite;
   import com.playata.framework.display.lib.flash.FlashDisplayObjectContainer;
   import com.playata.framework.display.lib.flash.FlashLabelArea;
   import com.playata.framework.display.lib.flash.FlashSprite;
   import com.playata.framework.display.ui.controls.ILabelArea;
   import flash.display.MovieClip;
   import visuals.ui.elements.backgrounds.SymbolSlice9BackgroundDialogGeneric;
   import visuals.ui.elements.buttons.SymbolButtonCloseGeneric;
   import visuals.ui.elements.buttons.SymbolButtonPremiumGeneric;
   import visuals.ui.elements.storage.SymbolIconEnergyStorageGeneric;
   
   public class SymbolDialogOutOfEnergyUseStorageGeneric extends Sprite
   {
       
      
      private var _nativeObject:SymbolDialogOutOfEnergyUseStorage = null;
      
      public var dialogBackground:SymbolSlice9BackgroundDialogGeneric = null;
      
      public var txtDialogTitle:ILabelArea = null;
      
      public var btnClose:SymbolButtonCloseGeneric = null;
      
      public var btnBuyEnergyForPremiumCurrency:SymbolButtonPremiumGeneric = null;
      
      public var txtInstructionsCaption:ILabelArea = null;
      
      public var txtEnergyNotice:ILabelArea = null;
      
      public var icon:SymbolIconEnergyStorageGeneric = null;
      
      public function SymbolDialogOutOfEnergyUseStorageGeneric(param1:MovieClip = null)
      {
         if(param1)
         {
            _nativeObject = param1 as SymbolDialogOutOfEnergyUseStorage;
         }
         else
         {
            _nativeObject = new SymbolDialogOutOfEnergyUseStorage();
         }
         super(null,FlashSprite.fromNative(_nativeObject));
         var _loc2_:FlashDisplayObjectContainer = _sprite as FlashDisplayObjectContainer;
         dialogBackground = new SymbolSlice9BackgroundDialogGeneric(_nativeObject.dialogBackground);
         txtDialogTitle = FlashLabelArea.fromNative(_nativeObject.txtDialogTitle);
         btnClose = new SymbolButtonCloseGeneric(_nativeObject.btnClose);
         btnBuyEnergyForPremiumCurrency = new SymbolButtonPremiumGeneric(_nativeObject.btnBuyEnergyForPremiumCurrency);
         txtInstructionsCaption = FlashLabelArea.fromNative(_nativeObject.txtInstructionsCaption);
         txtEnergyNotice = FlashLabelArea.fromNative(_nativeObject.txtEnergyNotice);
         icon = new SymbolIconEnergyStorageGeneric(_nativeObject.icon);
      }
      
      public function setNativeInstance(param1:SymbolDialogOutOfEnergyUseStorage) : void
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
         FlashLabelArea.setNativeInstance(txtDialogTitle,_nativeObject.txtDialogTitle);
         if(_nativeObject.btnClose)
         {
            btnClose.setNativeInstance(_nativeObject.btnClose);
         }
         if(_nativeObject.btnBuyEnergyForPremiumCurrency)
         {
            btnBuyEnergyForPremiumCurrency.setNativeInstance(_nativeObject.btnBuyEnergyForPremiumCurrency);
         }
         FlashLabelArea.setNativeInstance(txtInstructionsCaption,_nativeObject.txtInstructionsCaption);
         FlashLabelArea.setNativeInstance(txtEnergyNotice,_nativeObject.txtEnergyNotice);
         if(_nativeObject.icon)
         {
            icon.setNativeInstance(_nativeObject.icon);
         }
      }
   }
}
