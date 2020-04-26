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
   import visuals.ui.elements.backgrounds.SymbolSlice9BackgroundDialogGeneric;
   import visuals.ui.elements.buttons.SymbolButtonCloseGeneric;
   
   public class SymbolDialogUnbindFromNetworkGeneric extends Sprite
   {
       
      
      private var _nativeObject:SymbolDialogUnbindFromNetwork = null;
      
      public var dialogBackground:SymbolSlice9BackgroundDialogGeneric = null;
      
      public var txtDialogTitle:ILabel = null;
      
      public var txtEmailCaption:ILabel = null;
      
      public var txtInfo:ILabelArea = null;
      
      public var btnClose:SymbolButtonCloseGeneric = null;
      
      public var inputEmail:ITextInput = null;
      
      public var inputPassword:ITextInput = null;
      
      public var txtPasswordCaption:ILabel = null;
      
      public var btnUnbind:SymbolUiButtonDefaultGeneric = null;
      
      public function SymbolDialogUnbindFromNetworkGeneric(param1:MovieClip = null)
      {
         if(param1)
         {
            _nativeObject = param1 as SymbolDialogUnbindFromNetwork;
         }
         else
         {
            _nativeObject = new SymbolDialogUnbindFromNetwork();
         }
         super(null,FlashSprite.fromNative(_nativeObject));
         var _loc2_:FlashDisplayObjectContainer = _sprite as FlashDisplayObjectContainer;
         dialogBackground = new SymbolSlice9BackgroundDialogGeneric(_nativeObject.dialogBackground);
         txtDialogTitle = FlashLabel.fromNative(_nativeObject.txtDialogTitle);
         txtEmailCaption = FlashLabel.fromNative(_nativeObject.txtEmailCaption);
         txtInfo = FlashLabelArea.fromNative(_nativeObject.txtInfo);
         btnClose = new SymbolButtonCloseGeneric(_nativeObject.btnClose);
         inputEmail = FlashTextInput.fromNative(_nativeObject.inputEmail);
         inputPassword = FlashTextInput.fromNative(_nativeObject.inputPassword);
         txtPasswordCaption = FlashLabel.fromNative(_nativeObject.txtPasswordCaption);
         btnUnbind = new SymbolUiButtonDefaultGeneric(_nativeObject.btnUnbind);
      }
      
      public function setNativeInstance(param1:SymbolDialogUnbindFromNetwork) : void
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
         FlashLabel.setNativeInstance(txtEmailCaption,_nativeObject.txtEmailCaption);
         FlashLabelArea.setNativeInstance(txtInfo,_nativeObject.txtInfo);
         if(_nativeObject.btnClose)
         {
            btnClose.setNativeInstance(_nativeObject.btnClose);
         }
         FlashTextInput.setNativeInstance(inputEmail,_nativeObject.inputEmail);
         FlashTextInput.setNativeInstance(inputPassword,_nativeObject.inputPassword);
         FlashLabel.setNativeInstance(txtPasswordCaption,_nativeObject.txtPasswordCaption);
         if(_nativeObject.btnUnbind)
         {
            btnUnbind.setNativeInstance(_nativeObject.btnUnbind);
         }
      }
   }
}
