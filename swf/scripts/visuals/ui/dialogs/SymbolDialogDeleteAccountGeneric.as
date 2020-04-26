package visuals.ui.dialogs
{
   import com.playata.framework.display.Sprite;
   import com.playata.framework.display.lib.flash.FlashDisplayObjectContainer;
   import com.playata.framework.display.lib.flash.FlashLabel;
   import com.playata.framework.display.lib.flash.FlashLabelArea;
   import com.playata.framework.display.lib.flash.FlashSprite;
   import com.playata.framework.display.lib.flash.FlashTextInput;
   import com.playata.framework.display.ui.controls.ILabel;
   import com.playata.framework.display.ui.controls.ILabelArea;
   import com.playata.framework.display.ui.controls.ITextInput;
   import flash.display.MovieClip;
   import visuals.ui.base.SymbolUiButtonDefaultGeneric;
   import visuals.ui.base.SymbolUiCheckboxGeneric;
   import visuals.ui.elements.backgrounds.SymbolSlice9BackgroundDialogGeneric;
   import visuals.ui.elements.buttons.SymbolButtonCloseGeneric;
   import visuals.ui.elements.generic.SymbolTextfieldBackgroundWideGeneric;
   
   public class SymbolDialogDeleteAccountGeneric extends Sprite
   {
       
      
      private var _nativeObject:SymbolDialogDeleteAccount = null;
      
      public var dialogBackground:SymbolSlice9BackgroundDialogGeneric = null;
      
      public var textfieldBackground:SymbolTextfieldBackgroundWideGeneric = null;
      
      public var txtDialogTitle:ILabel = null;
      
      public var btnClose:SymbolButtonCloseGeneric = null;
      
      public var inputPassword:ITextInput = null;
      
      public var txtPasswordCaption:ILabel = null;
      
      public var txtInfo:ILabelArea = null;
      
      public var txtReactivationInfo:ILabelArea = null;
      
      public var ckbReactivationCode:SymbolUiCheckboxGeneric = null;
      
      public var btnDelete:SymbolUiButtonDefaultGeneric = null;
      
      public function SymbolDialogDeleteAccountGeneric(param1:MovieClip = null)
      {
         if(param1)
         {
            _nativeObject = param1 as SymbolDialogDeleteAccount;
         }
         else
         {
            _nativeObject = new SymbolDialogDeleteAccount();
         }
         super(null,FlashSprite.fromNative(_nativeObject));
         var _loc2_:FlashDisplayObjectContainer = _sprite as FlashDisplayObjectContainer;
         dialogBackground = new SymbolSlice9BackgroundDialogGeneric(_nativeObject.dialogBackground);
         textfieldBackground = new SymbolTextfieldBackgroundWideGeneric(_nativeObject.textfieldBackground);
         txtDialogTitle = FlashLabel.fromNative(_nativeObject.txtDialogTitle);
         btnClose = new SymbolButtonCloseGeneric(_nativeObject.btnClose);
         inputPassword = FlashTextInput.fromNative(_nativeObject.inputPassword);
         txtPasswordCaption = FlashLabel.fromNative(_nativeObject.txtPasswordCaption);
         txtInfo = FlashLabelArea.fromNative(_nativeObject.txtInfo);
         txtReactivationInfo = FlashLabelArea.fromNative(_nativeObject.txtReactivationInfo);
         ckbReactivationCode = new SymbolUiCheckboxGeneric(_nativeObject.ckbReactivationCode);
         btnDelete = new SymbolUiButtonDefaultGeneric(_nativeObject.btnDelete);
      }
      
      public function setNativeInstance(param1:SymbolDialogDeleteAccount) : void
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
         if(_nativeObject.textfieldBackground)
         {
            textfieldBackground.setNativeInstance(_nativeObject.textfieldBackground);
         }
         FlashLabel.setNativeInstance(txtDialogTitle,_nativeObject.txtDialogTitle);
         if(_nativeObject.btnClose)
         {
            btnClose.setNativeInstance(_nativeObject.btnClose);
         }
         FlashTextInput.setNativeInstance(inputPassword,_nativeObject.inputPassword);
         FlashLabel.setNativeInstance(txtPasswordCaption,_nativeObject.txtPasswordCaption);
         FlashLabelArea.setNativeInstance(txtInfo,_nativeObject.txtInfo);
         FlashLabelArea.setNativeInstance(txtReactivationInfo,_nativeObject.txtReactivationInfo);
         if(_nativeObject.ckbReactivationCode)
         {
            ckbReactivationCode.setNativeInstance(_nativeObject.ckbReactivationCode);
         }
         if(_nativeObject.btnDelete)
         {
            btnDelete.setNativeInstance(_nativeObject.btnDelete);
         }
      }
   }
}
