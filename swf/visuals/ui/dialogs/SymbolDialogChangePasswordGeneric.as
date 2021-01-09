package visuals.ui.dialogs
{
   import com.playata.framework.display.Sprite;
   import com.playata.framework.display.lib.flash.FlashDisplayObjectContainer;
   import com.playata.framework.display.lib.flash.FlashLabel;
   import com.playata.framework.display.lib.flash.FlashSprite;
   import com.playata.framework.display.lib.flash.FlashTextInput;
   import com.playata.framework.display.ui.controls.ILabel;
   import com.playata.framework.display.ui.controls.ITextInput;
   import flash.display.MovieClip;
   import visuals.ui.base.SymbolUiButtonDefaultGeneric;
   import visuals.ui.elements.backgrounds.SymbolSlice9BackgroundDialogGeneric;
   import visuals.ui.elements.buttons.SymbolButtonCloseGeneric;
   
   public class SymbolDialogChangePasswordGeneric extends Sprite
   {
       
      
      private var _nativeObject:SymbolDialogChangePassword = null;
      
      public var dialogBackground:SymbolSlice9BackgroundDialogGeneric = null;
      
      public var txtDialogTitle:ILabel = null;
      
      public var txtNewPasswordCaption:ILabel = null;
      
      public var txtNewPasswordRepeatCaption:ILabel = null;
      
      public var btnClose:SymbolButtonCloseGeneric = null;
      
      public var inputNewPasswordRepeat:ITextInput = null;
      
      public var inputNewPassword:ITextInput = null;
      
      public var inputOldPassword:ITextInput = null;
      
      public var txtOldPasswordCaption:ILabel = null;
      
      public var btnChange:SymbolUiButtonDefaultGeneric = null;
      
      public function SymbolDialogChangePasswordGeneric(param1:MovieClip = null)
      {
         if(param1)
         {
            _nativeObject = param1 as SymbolDialogChangePassword;
         }
         else
         {
            _nativeObject = new SymbolDialogChangePassword();
         }
         super(null,FlashSprite.fromNative(_nativeObject));
         var _loc2_:FlashDisplayObjectContainer = _sprite as FlashDisplayObjectContainer;
         dialogBackground = new SymbolSlice9BackgroundDialogGeneric(_nativeObject.dialogBackground);
         txtDialogTitle = FlashLabel.fromNative(_nativeObject.txtDialogTitle);
         txtNewPasswordCaption = FlashLabel.fromNative(_nativeObject.txtNewPasswordCaption);
         txtNewPasswordRepeatCaption = FlashLabel.fromNative(_nativeObject.txtNewPasswordRepeatCaption);
         btnClose = new SymbolButtonCloseGeneric(_nativeObject.btnClose);
         inputNewPasswordRepeat = FlashTextInput.fromNative(_nativeObject.inputNewPasswordRepeat);
         inputNewPassword = FlashTextInput.fromNative(_nativeObject.inputNewPassword);
         inputOldPassword = FlashTextInput.fromNative(_nativeObject.inputOldPassword);
         txtOldPasswordCaption = FlashLabel.fromNative(_nativeObject.txtOldPasswordCaption);
         btnChange = new SymbolUiButtonDefaultGeneric(_nativeObject.btnChange);
      }
      
      public function setNativeInstance(param1:SymbolDialogChangePassword) : void
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
         FlashLabel.setNativeInstance(txtNewPasswordCaption,_nativeObject.txtNewPasswordCaption);
         FlashLabel.setNativeInstance(txtNewPasswordRepeatCaption,_nativeObject.txtNewPasswordRepeatCaption);
         if(_nativeObject.btnClose)
         {
            btnClose.setNativeInstance(_nativeObject.btnClose);
         }
         FlashTextInput.setNativeInstance(inputNewPasswordRepeat,_nativeObject.inputNewPasswordRepeat);
         FlashTextInput.setNativeInstance(inputNewPassword,_nativeObject.inputNewPassword);
         FlashTextInput.setNativeInstance(inputOldPassword,_nativeObject.inputOldPassword);
         FlashLabel.setNativeInstance(txtOldPasswordCaption,_nativeObject.txtOldPasswordCaption);
         if(_nativeObject.btnChange)
         {
            btnChange.setNativeInstance(_nativeObject.btnChange);
         }
      }
   }
}
