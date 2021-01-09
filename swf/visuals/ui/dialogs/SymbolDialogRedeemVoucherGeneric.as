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
   import visuals.ui.elements.generic.SymbolTextfieldBackgroundWideGeneric;
   
   public class SymbolDialogRedeemVoucherGeneric extends Sprite
   {
       
      
      private var _nativeObject:SymbolDialogRedeemVoucher = null;
      
      public var dialogBackground:SymbolSlice9BackgroundDialogGeneric = null;
      
      public var textfieldBackground:SymbolTextfieldBackgroundWideGeneric = null;
      
      public var txtDialogTitle:ILabel = null;
      
      public var btnClose:SymbolButtonCloseGeneric = null;
      
      public var inputCode:ITextInput = null;
      
      public var txtVoucherCode:ILabel = null;
      
      public var txtInfo:ILabelArea = null;
      
      public var btnRedeem:SymbolUiButtonDefaultGeneric = null;
      
      public function SymbolDialogRedeemVoucherGeneric(param1:MovieClip = null)
      {
         if(param1)
         {
            _nativeObject = param1 as SymbolDialogRedeemVoucher;
         }
         else
         {
            _nativeObject = new SymbolDialogRedeemVoucher();
         }
         super(null,FlashSprite.fromNative(_nativeObject));
         var _loc2_:FlashDisplayObjectContainer = _sprite as FlashDisplayObjectContainer;
         dialogBackground = new SymbolSlice9BackgroundDialogGeneric(_nativeObject.dialogBackground);
         textfieldBackground = new SymbolTextfieldBackgroundWideGeneric(_nativeObject.textfieldBackground);
         txtDialogTitle = FlashLabel.fromNative(_nativeObject.txtDialogTitle);
         btnClose = new SymbolButtonCloseGeneric(_nativeObject.btnClose);
         inputCode = FlashTextInput.fromNative(_nativeObject.inputCode);
         txtVoucherCode = FlashLabel.fromNative(_nativeObject.txtVoucherCode);
         txtInfo = FlashLabelArea.fromNative(_nativeObject.txtInfo);
         btnRedeem = new SymbolUiButtonDefaultGeneric(_nativeObject.btnRedeem);
      }
      
      public function setNativeInstance(param1:SymbolDialogRedeemVoucher) : void
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
         FlashTextInput.setNativeInstance(inputCode,_nativeObject.inputCode);
         FlashLabel.setNativeInstance(txtVoucherCode,_nativeObject.txtVoucherCode);
         FlashLabelArea.setNativeInstance(txtInfo,_nativeObject.txtInfo);
         if(_nativeObject.btnRedeem)
         {
            btnRedeem.setNativeInstance(_nativeObject.btnRedeem);
         }
      }
   }
}
