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
   import visuals.ui.base.SymbolUiButtonDefaultGeneric;
   import visuals.ui.base.SymbolUiCheckboxGeneric;
   import visuals.ui.elements.backgrounds.SymbolSlice9BackgroundDialogGeneric;
   import visuals.ui.elements.buttons.SymbolButtonCloseGeneric;
   import visuals.ui.elements.buttons.SymbolButtonPremiumGeneric;
   import visuals.ui.elements.icons.SymbolIconPremiumCurrencyGeneric;
   
   public class SymbolDialogCharacterAppearanceUnsavedChangesGeneric extends Sprite
   {
       
      
      private var _nativeObject:SymbolDialogCharacterAppearanceUnsavedChanges = null;
      
      public var dialogBackground:SymbolSlice9BackgroundDialogGeneric = null;
      
      public var txtUnderwear:ILabelArea = null;
      
      public var checkUnderwear:SymbolUiCheckboxGeneric = null;
      
      public var iconPremiumCurrencyUnderwear:SymbolIconPremiumCurrencyGeneric = null;
      
      public var txtPremiumCurrencyUnderwear:ILabelArea = null;
      
      public var checkSurgeon:SymbolUiCheckboxGeneric = null;
      
      public var txtSurgeon:ILabelArea = null;
      
      public var iconPremiumCurrencySurgeon:SymbolIconPremiumCurrencyGeneric = null;
      
      public var txtPremiumCurrencySurgeon:ILabelArea = null;
      
      public var txtBarber:ILabelArea = null;
      
      public var checkBarber:SymbolUiCheckboxGeneric = null;
      
      public var iconPremiumCurrencyBarber:SymbolIconPremiumCurrencyGeneric = null;
      
      public var txtPremiumCurrencyBarber:ILabelArea = null;
      
      public var checkTattoo:SymbolUiCheckboxGeneric = null;
      
      public var txtTattoo:ILabelArea = null;
      
      public var iconPremiumCurrencyTattoo:SymbolIconPremiumCurrencyGeneric = null;
      
      public var txtPremiumCurrencyTattoo:ILabelArea = null;
      
      public var iconPremiumCurrencySum:SymbolIconPremiumCurrencyGeneric = null;
      
      public var txtPremiumCurrencySum:ILabelArea = null;
      
      public var btnSave:SymbolButtonPremiumGeneric = null;
      
      public var btnNosave:SymbolUiButtonDefaultGeneric = null;
      
      public var txtInfo:ILabelArea = null;
      
      public var txtDialogTitle:ILabel = null;
      
      public var btnClose:SymbolButtonCloseGeneric = null;
      
      public function SymbolDialogCharacterAppearanceUnsavedChangesGeneric(param1:MovieClip = null)
      {
         if(param1)
         {
            _nativeObject = param1 as SymbolDialogCharacterAppearanceUnsavedChanges;
         }
         else
         {
            _nativeObject = new SymbolDialogCharacterAppearanceUnsavedChanges();
         }
         super(null,FlashSprite.fromNative(_nativeObject));
         var _loc2_:FlashDisplayObjectContainer = _sprite as FlashDisplayObjectContainer;
         dialogBackground = new SymbolSlice9BackgroundDialogGeneric(_nativeObject.dialogBackground);
         txtUnderwear = FlashLabelArea.fromNative(_nativeObject.txtUnderwear);
         checkUnderwear = new SymbolUiCheckboxGeneric(_nativeObject.checkUnderwear);
         iconPremiumCurrencyUnderwear = new SymbolIconPremiumCurrencyGeneric(_nativeObject.iconPremiumCurrencyUnderwear);
         txtPremiumCurrencyUnderwear = FlashLabelArea.fromNative(_nativeObject.txtPremiumCurrencyUnderwear);
         checkSurgeon = new SymbolUiCheckboxGeneric(_nativeObject.checkSurgeon);
         txtSurgeon = FlashLabelArea.fromNative(_nativeObject.txtSurgeon);
         iconPremiumCurrencySurgeon = new SymbolIconPremiumCurrencyGeneric(_nativeObject.iconPremiumCurrencySurgeon);
         txtPremiumCurrencySurgeon = FlashLabelArea.fromNative(_nativeObject.txtPremiumCurrencySurgeon);
         txtBarber = FlashLabelArea.fromNative(_nativeObject.txtBarber);
         checkBarber = new SymbolUiCheckboxGeneric(_nativeObject.checkBarber);
         iconPremiumCurrencyBarber = new SymbolIconPremiumCurrencyGeneric(_nativeObject.iconPremiumCurrencyBarber);
         txtPremiumCurrencyBarber = FlashLabelArea.fromNative(_nativeObject.txtPremiumCurrencyBarber);
         checkTattoo = new SymbolUiCheckboxGeneric(_nativeObject.checkTattoo);
         txtTattoo = FlashLabelArea.fromNative(_nativeObject.txtTattoo);
         iconPremiumCurrencyTattoo = new SymbolIconPremiumCurrencyGeneric(_nativeObject.iconPremiumCurrencyTattoo);
         txtPremiumCurrencyTattoo = FlashLabelArea.fromNative(_nativeObject.txtPremiumCurrencyTattoo);
         iconPremiumCurrencySum = new SymbolIconPremiumCurrencyGeneric(_nativeObject.iconPremiumCurrencySum);
         txtPremiumCurrencySum = FlashLabelArea.fromNative(_nativeObject.txtPremiumCurrencySum);
         btnSave = new SymbolButtonPremiumGeneric(_nativeObject.btnSave);
         btnNosave = new SymbolUiButtonDefaultGeneric(_nativeObject.btnNosave);
         txtInfo = FlashLabelArea.fromNative(_nativeObject.txtInfo);
         txtDialogTitle = FlashLabel.fromNative(_nativeObject.txtDialogTitle);
         btnClose = new SymbolButtonCloseGeneric(_nativeObject.btnClose);
      }
      
      public function setNativeInstance(param1:SymbolDialogCharacterAppearanceUnsavedChanges) : void
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
         FlashLabelArea.setNativeInstance(txtUnderwear,_nativeObject.txtUnderwear);
         if(_nativeObject.checkUnderwear)
         {
            checkUnderwear.setNativeInstance(_nativeObject.checkUnderwear);
         }
         if(_nativeObject.iconPremiumCurrencyUnderwear)
         {
            iconPremiumCurrencyUnderwear.setNativeInstance(_nativeObject.iconPremiumCurrencyUnderwear);
         }
         FlashLabelArea.setNativeInstance(txtPremiumCurrencyUnderwear,_nativeObject.txtPremiumCurrencyUnderwear);
         if(_nativeObject.checkSurgeon)
         {
            checkSurgeon.setNativeInstance(_nativeObject.checkSurgeon);
         }
         FlashLabelArea.setNativeInstance(txtSurgeon,_nativeObject.txtSurgeon);
         if(_nativeObject.iconPremiumCurrencySurgeon)
         {
            iconPremiumCurrencySurgeon.setNativeInstance(_nativeObject.iconPremiumCurrencySurgeon);
         }
         FlashLabelArea.setNativeInstance(txtPremiumCurrencySurgeon,_nativeObject.txtPremiumCurrencySurgeon);
         FlashLabelArea.setNativeInstance(txtBarber,_nativeObject.txtBarber);
         if(_nativeObject.checkBarber)
         {
            checkBarber.setNativeInstance(_nativeObject.checkBarber);
         }
         if(_nativeObject.iconPremiumCurrencyBarber)
         {
            iconPremiumCurrencyBarber.setNativeInstance(_nativeObject.iconPremiumCurrencyBarber);
         }
         FlashLabelArea.setNativeInstance(txtPremiumCurrencyBarber,_nativeObject.txtPremiumCurrencyBarber);
         if(_nativeObject.checkTattoo)
         {
            checkTattoo.setNativeInstance(_nativeObject.checkTattoo);
         }
         FlashLabelArea.setNativeInstance(txtTattoo,_nativeObject.txtTattoo);
         if(_nativeObject.iconPremiumCurrencyTattoo)
         {
            iconPremiumCurrencyTattoo.setNativeInstance(_nativeObject.iconPremiumCurrencyTattoo);
         }
         FlashLabelArea.setNativeInstance(txtPremiumCurrencyTattoo,_nativeObject.txtPremiumCurrencyTattoo);
         if(_nativeObject.iconPremiumCurrencySum)
         {
            iconPremiumCurrencySum.setNativeInstance(_nativeObject.iconPremiumCurrencySum);
         }
         FlashLabelArea.setNativeInstance(txtPremiumCurrencySum,_nativeObject.txtPremiumCurrencySum);
         if(_nativeObject.btnSave)
         {
            btnSave.setNativeInstance(_nativeObject.btnSave);
         }
         if(_nativeObject.btnNosave)
         {
            btnNosave.setNativeInstance(_nativeObject.btnNosave);
         }
         FlashLabelArea.setNativeInstance(txtInfo,_nativeObject.txtInfo);
         FlashLabel.setNativeInstance(txtDialogTitle,_nativeObject.txtDialogTitle);
         if(_nativeObject.btnClose)
         {
            btnClose.setNativeInstance(_nativeObject.btnClose);
         }
      }
   }
}
