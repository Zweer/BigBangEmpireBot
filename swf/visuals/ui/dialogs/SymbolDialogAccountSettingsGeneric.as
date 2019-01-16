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
   import visuals.ui.base.SymbolUiButtonWideGeneric;
   import visuals.ui.base.SymbolUiCheckboxGeneric;
   import visuals.ui.elements.backgrounds.SymbolSlice9BackgroundDialogGeneric;
   import visuals.ui.elements.buttons.SymbolButtonCloseGeneric;
   
   public class SymbolDialogAccountSettingsGeneric extends Sprite
   {
       
      
      private var _nativeObject:SymbolDialogAccountSettings = null;
      
      public var dialogBackground:SymbolSlice9BackgroundDialogGeneric = null;
      
      public var txtDialogTitle:ILabel = null;
      
      public var txtNameCaption:ILabel = null;
      
      public var txtName:ILabelArea = null;
      
      public var txtEmailCaption:ILabel = null;
      
      public var txtEmail:ILabelArea = null;
      
      public var btnDeleteAccount:SymbolUiButtonWideGeneric = null;
      
      public var btnResendConfirmation:SymbolUiButtonWideGeneric = null;
      
      public var btnChangeEmail:SymbolUiButtonWideGeneric = null;
      
      public var btnChangePassword:SymbolUiButtonWideGeneric = null;
      
      public var btnUnbindFromNetwork:SymbolUiButtonWideGeneric = null;
      
      public var btnChangeLocale:SymbolUiButtonWideGeneric = null;
      
      public var btnRevokeConsent:SymbolUiButtonWideGeneric = null;
      
      public var checkAutoLogoff:SymbolUiCheckboxGeneric = null;
      
      public var txtAutoLogoff:ILabelArea = null;
      
      public var btnClose:SymbolButtonCloseGeneric = null;
      
      public function SymbolDialogAccountSettingsGeneric(param1:MovieClip = null)
      {
         if(param1)
         {
            _nativeObject = param1 as SymbolDialogAccountSettings;
         }
         else
         {
            _nativeObject = new SymbolDialogAccountSettings();
         }
         super(null,FlashSprite.fromNative(_nativeObject));
         var _loc2_:FlashDisplayObjectContainer = _sprite as FlashDisplayObjectContainer;
         dialogBackground = new SymbolSlice9BackgroundDialogGeneric(_nativeObject.dialogBackground);
         txtDialogTitle = FlashLabel.fromNative(_nativeObject.txtDialogTitle);
         txtNameCaption = FlashLabel.fromNative(_nativeObject.txtNameCaption);
         txtName = FlashLabelArea.fromNative(_nativeObject.txtName);
         txtEmailCaption = FlashLabel.fromNative(_nativeObject.txtEmailCaption);
         txtEmail = FlashLabelArea.fromNative(_nativeObject.txtEmail);
         btnDeleteAccount = new SymbolUiButtonWideGeneric(_nativeObject.btnDeleteAccount);
         btnResendConfirmation = new SymbolUiButtonWideGeneric(_nativeObject.btnResendConfirmation);
         btnChangeEmail = new SymbolUiButtonWideGeneric(_nativeObject.btnChangeEmail);
         btnChangePassword = new SymbolUiButtonWideGeneric(_nativeObject.btnChangePassword);
         btnUnbindFromNetwork = new SymbolUiButtonWideGeneric(_nativeObject.btnUnbindFromNetwork);
         btnChangeLocale = new SymbolUiButtonWideGeneric(_nativeObject.btnChangeLocale);
         btnRevokeConsent = new SymbolUiButtonWideGeneric(_nativeObject.btnRevokeConsent);
         checkAutoLogoff = new SymbolUiCheckboxGeneric(_nativeObject.checkAutoLogoff);
         txtAutoLogoff = FlashLabelArea.fromNative(_nativeObject.txtAutoLogoff);
         btnClose = new SymbolButtonCloseGeneric(_nativeObject.btnClose);
      }
      
      public function setNativeInstance(param1:SymbolDialogAccountSettings) : void
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
         FlashLabel.setNativeInstance(txtDialogTitle,_nativeObject.txtDialogTitle);
         FlashLabel.setNativeInstance(txtNameCaption,_nativeObject.txtNameCaption);
         FlashLabelArea.setNativeInstance(txtName,_nativeObject.txtName);
         FlashLabel.setNativeInstance(txtEmailCaption,_nativeObject.txtEmailCaption);
         FlashLabelArea.setNativeInstance(txtEmail,_nativeObject.txtEmail);
         if(_nativeObject.btnDeleteAccount)
         {
            btnDeleteAccount.setNativeInstance(_nativeObject.btnDeleteAccount);
         }
         if(_nativeObject.btnResendConfirmation)
         {
            btnResendConfirmation.setNativeInstance(_nativeObject.btnResendConfirmation);
         }
         if(_nativeObject.btnChangeEmail)
         {
            btnChangeEmail.setNativeInstance(_nativeObject.btnChangeEmail);
         }
         if(_nativeObject.btnChangePassword)
         {
            btnChangePassword.setNativeInstance(_nativeObject.btnChangePassword);
         }
         if(_nativeObject.btnUnbindFromNetwork)
         {
            btnUnbindFromNetwork.setNativeInstance(_nativeObject.btnUnbindFromNetwork);
         }
         if(_nativeObject.btnChangeLocale)
         {
            btnChangeLocale.setNativeInstance(_nativeObject.btnChangeLocale);
         }
         if(_nativeObject.btnRevokeConsent)
         {
            btnRevokeConsent.setNativeInstance(_nativeObject.btnRevokeConsent);
         }
         if(_nativeObject.checkAutoLogoff)
         {
            checkAutoLogoff.setNativeInstance(_nativeObject.checkAutoLogoff);
         }
         FlashLabelArea.setNativeInstance(txtAutoLogoff,_nativeObject.txtAutoLogoff);
         if(_nativeObject.btnClose)
         {
            btnClose.setNativeInstance(_nativeObject.btnClose);
         }
      }
   }
}
