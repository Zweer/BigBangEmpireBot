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
   import visuals.ui.base.SymbolUiButtonMultilineGeneric;
   import visuals.ui.elements.backgrounds.SymbolSlice9BackgroundDialogGeneric;
   import visuals.ui.elements.buttons.SymbolButtonCloseGeneric;
   import visuals.ui.elements.generic.SymbolTextfieldBackgroundWideGeneric;
   
   public class SymbolDialogRegisterUserNewGeneric extends Sprite
   {
       
      
      private var _nativeObject:SymbolDialogRegisterUserNew = null;
      
      public var dialogBackground:SymbolSlice9BackgroundDialogGeneric = null;
      
      public var txtDialogTitle:ILabel = null;
      
      public var bgInputPassword:SymbolTextfieldBackgroundWideGeneric = null;
      
      public var bgInputEmail:SymbolTextfieldBackgroundWideGeneric = null;
      
      public var txtEmailCaption:ILabel = null;
      
      public var txtPasswordCaption:ILabel = null;
      
      public var inputPassword:ITextInput = null;
      
      public var inputEmail:ITextInput = null;
      
      public var txtNameCaption:ILabel = null;
      
      public var bgInputName:SymbolTextfieldBackgroundWideGeneric = null;
      
      public var inputCharacterName:ITextInput = null;
      
      public var btnClose:SymbolButtonCloseGeneric = null;
      
      public var txtTerms:ILabelArea = null;
      
      public var txtAge:ILabelArea = null;
      
      public var btnSave:SymbolUiButtonMultilineGeneric = null;
      
      public function SymbolDialogRegisterUserNewGeneric(param1:MovieClip = null)
      {
         if(param1)
         {
            _nativeObject = param1 as SymbolDialogRegisterUserNew;
         }
         else
         {
            _nativeObject = new SymbolDialogRegisterUserNew();
         }
         super(null,FlashSprite.fromNative(_nativeObject));
         var _loc2_:FlashDisplayObjectContainer = _sprite as FlashDisplayObjectContainer;
         dialogBackground = new SymbolSlice9BackgroundDialogGeneric(_nativeObject.dialogBackground);
         txtDialogTitle = FlashLabel.fromNative(_nativeObject.txtDialogTitle);
         bgInputPassword = new SymbolTextfieldBackgroundWideGeneric(_nativeObject.bgInputPassword);
         bgInputEmail = new SymbolTextfieldBackgroundWideGeneric(_nativeObject.bgInputEmail);
         txtEmailCaption = FlashLabel.fromNative(_nativeObject.txtEmailCaption);
         txtPasswordCaption = FlashLabel.fromNative(_nativeObject.txtPasswordCaption);
         inputPassword = FlashTextInput.fromNative(_nativeObject.inputPassword);
         inputEmail = FlashTextInput.fromNative(_nativeObject.inputEmail);
         txtNameCaption = FlashLabel.fromNative(_nativeObject.txtNameCaption);
         bgInputName = new SymbolTextfieldBackgroundWideGeneric(_nativeObject.bgInputName);
         inputCharacterName = FlashTextInput.fromNative(_nativeObject.inputCharacterName);
         btnClose = new SymbolButtonCloseGeneric(_nativeObject.btnClose);
         txtTerms = FlashLabelArea.fromNative(_nativeObject.txtTerms);
         txtAge = FlashLabelArea.fromNative(_nativeObject.txtAge);
         btnSave = new SymbolUiButtonMultilineGeneric(_nativeObject.btnSave);
      }
      
      public function setNativeInstance(param1:SymbolDialogRegisterUserNew) : void
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
         if(_nativeObject.bgInputPassword)
         {
            bgInputPassword.setNativeInstance(_nativeObject.bgInputPassword);
         }
         if(_nativeObject.bgInputEmail)
         {
            bgInputEmail.setNativeInstance(_nativeObject.bgInputEmail);
         }
         FlashLabel.setNativeInstance(txtEmailCaption,_nativeObject.txtEmailCaption);
         FlashLabel.setNativeInstance(txtPasswordCaption,_nativeObject.txtPasswordCaption);
         FlashTextInput.setNativeInstance(inputPassword,_nativeObject.inputPassword);
         FlashTextInput.setNativeInstance(inputEmail,_nativeObject.inputEmail);
         FlashLabel.setNativeInstance(txtNameCaption,_nativeObject.txtNameCaption);
         if(_nativeObject.bgInputName)
         {
            bgInputName.setNativeInstance(_nativeObject.bgInputName);
         }
         FlashTextInput.setNativeInstance(inputCharacterName,_nativeObject.inputCharacterName);
         if(_nativeObject.btnClose)
         {
            btnClose.setNativeInstance(_nativeObject.btnClose);
         }
         FlashLabelArea.setNativeInstance(txtTerms,_nativeObject.txtTerms);
         FlashLabelArea.setNativeInstance(txtAge,_nativeObject.txtAge);
         if(_nativeObject.btnSave)
         {
            btnSave.setNativeInstance(_nativeObject.btnSave);
         }
      }
   }
}
