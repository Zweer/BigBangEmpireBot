package visuals.ui.dialogs
{
   import com.playata.framework.display.Sprite;
   import com.playata.framework.display.lib.flash.FlashDisplayObjectContainer;
   import com.playata.framework.display.lib.flash.FlashLabelArea;
   import com.playata.framework.display.lib.flash.FlashSprite;
   import com.playata.framework.display.ui.controls.ILabelArea;
   import flash.display.MovieClip;
   import visuals.ui.base.SymbolUiButtonDefaultGeneric;
   import visuals.ui.elements.backgrounds.SymbolSlice9BackgroundDialogGeneric;
   import visuals.ui.elements.buttons.SymbolButtonPremiumGeneric;
   import visuals.ui.elements.storage.SymbolIconEnergyStorageGeneric;
   
   public class SymbolDialogUseEnergyStorageGeneric extends Sprite
   {
       
      
      private var _nativeObject:SymbolDialogUseEnergyStorage = null;
      
      public var dialogBackground:SymbolSlice9BackgroundDialogGeneric = null;
      
      public var txtDialogTitle:ILabelArea = null;
      
      public var btnUse:SymbolButtonPremiumGeneric = null;
      
      public var txtInfo:ILabelArea = null;
      
      public var btnClose:SymbolUiButtonDefaultGeneric = null;
      
      public var icon:SymbolIconEnergyStorageGeneric = null;
      
      public function SymbolDialogUseEnergyStorageGeneric(param1:MovieClip = null)
      {
         if(param1)
         {
            _nativeObject = param1 as SymbolDialogUseEnergyStorage;
         }
         else
         {
            _nativeObject = new SymbolDialogUseEnergyStorage();
         }
         super(null,FlashSprite.fromNative(_nativeObject));
         var _loc2_:FlashDisplayObjectContainer = _sprite as FlashDisplayObjectContainer;
         dialogBackground = new SymbolSlice9BackgroundDialogGeneric(_nativeObject.dialogBackground);
         txtDialogTitle = FlashLabelArea.fromNative(_nativeObject.txtDialogTitle);
         btnUse = new SymbolButtonPremiumGeneric(_nativeObject.btnUse);
         txtInfo = FlashLabelArea.fromNative(_nativeObject.txtInfo);
         btnClose = new SymbolUiButtonDefaultGeneric(_nativeObject.btnClose);
         icon = new SymbolIconEnergyStorageGeneric(_nativeObject.icon);
      }
      
      public function setNativeInstance(param1:SymbolDialogUseEnergyStorage) : void
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
         if(_nativeObject.btnUse)
         {
            btnUse.setNativeInstance(_nativeObject.btnUse);
         }
         FlashLabelArea.setNativeInstance(txtInfo,_nativeObject.txtInfo);
         if(_nativeObject.btnClose)
         {
            btnClose.setNativeInstance(_nativeObject.btnClose);
         }
         if(_nativeObject.icon)
         {
            icon.setNativeInstance(_nativeObject.icon);
         }
      }
   }
}
