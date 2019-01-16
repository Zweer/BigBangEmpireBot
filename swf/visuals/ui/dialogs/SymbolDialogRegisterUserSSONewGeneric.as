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
   import visuals.ui.elements.application.SymbolRegisterUserAlternativeAccountsContentGeneric;
   import visuals.ui.elements.backgrounds.SymbolSlice9BackgroundDialogGeneric;
   import visuals.ui.elements.buttons.SymbolButtonCloseGeneric;
   
   public class SymbolDialogRegisterUserSSONewGeneric extends Sprite
   {
       
      
      private var _nativeObject:SymbolDialogRegisterUserSSONew = null;
      
      public var dialogBackground:SymbolSlice9BackgroundDialogGeneric = null;
      
      public var txtDialogTitle:ILabel = null;
      
      public var txtNameCaption:ILabel = null;
      
      public var inputCharacterName:ITextInput = null;
      
      public var btnClose:SymbolButtonCloseGeneric = null;
      
      public var txtTerms:ILabelArea = null;
      
      public var txtAge:ILabelArea = null;
      
      public var alternativeAccounts:SymbolRegisterUserAlternativeAccountsContentGeneric = null;
      
      public var btnSave:SymbolUiButtonMultilineGeneric = null;
      
      public function SymbolDialogRegisterUserSSONewGeneric(param1:MovieClip = null)
      {
         if(param1)
         {
            _nativeObject = param1 as SymbolDialogRegisterUserSSONew;
         }
         else
         {
            _nativeObject = new SymbolDialogRegisterUserSSONew();
         }
         super(null,FlashSprite.fromNative(_nativeObject));
         var _loc2_:FlashDisplayObjectContainer = _sprite as FlashDisplayObjectContainer;
         dialogBackground = new SymbolSlice9BackgroundDialogGeneric(_nativeObject.dialogBackground);
         txtDialogTitle = FlashLabel.fromNative(_nativeObject.txtDialogTitle);
         txtNameCaption = FlashLabel.fromNative(_nativeObject.txtNameCaption);
         inputCharacterName = FlashTextInput.fromNative(_nativeObject.inputCharacterName);
         btnClose = new SymbolButtonCloseGeneric(_nativeObject.btnClose);
         txtTerms = FlashLabelArea.fromNative(_nativeObject.txtTerms);
         txtAge = FlashLabelArea.fromNative(_nativeObject.txtAge);
         alternativeAccounts = new SymbolRegisterUserAlternativeAccountsContentGeneric(_nativeObject.alternativeAccounts);
         btnSave = new SymbolUiButtonMultilineGeneric(_nativeObject.btnSave);
      }
      
      public function setNativeInstance(param1:SymbolDialogRegisterUserSSONew) : void
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
         FlashTextInput.setNativeInstance(inputCharacterName,_nativeObject.inputCharacterName);
         if(_nativeObject.btnClose)
         {
            btnClose.setNativeInstance(_nativeObject.btnClose);
         }
         FlashLabelArea.setNativeInstance(txtTerms,_nativeObject.txtTerms);
         FlashLabelArea.setNativeInstance(txtAge,_nativeObject.txtAge);
         if(_nativeObject.alternativeAccounts)
         {
            alternativeAccounts.setNativeInstance(_nativeObject.alternativeAccounts);
         }
         if(_nativeObject.btnSave)
         {
            btnSave.setNativeInstance(_nativeObject.btnSave);
         }
      }
   }
}
