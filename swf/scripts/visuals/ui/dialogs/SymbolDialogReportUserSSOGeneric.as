package visuals.ui.dialogs
{
   import com.playata.framework.display.Sprite;
   import com.playata.framework.display.lib.flash.FlashDisplayObjectContainer;
   import com.playata.framework.display.lib.flash.FlashLabel;
   import com.playata.framework.display.lib.flash.FlashLabelArea;
   import com.playata.framework.display.lib.flash.FlashSprite;
   import com.playata.framework.display.lib.flash.FlashTextInput;
   import com.playata.framework.display.lib.flash.FlashTextInputArea;
   import com.playata.framework.display.ui.controls.ILabel;
   import com.playata.framework.display.ui.controls.ILabelArea;
   import com.playata.framework.display.ui.controls.ITextInput;
   import com.playata.framework.display.ui.controls.ITextInputArea;
   import flash.display.MovieClip;
   import visuals.ui.base.SymbolTextfieldVeryWideGeneric;
   import visuals.ui.base.SymbolUiButtonDefaultGeneric;
   import visuals.ui.elements.backgrounds.SymbolSlice9BackgroundDialogGeneric;
   import visuals.ui.elements.buttons.SymbolButtonCloseGeneric;
   import visuals.ui.elements.generic.SymbolScrollKnobGeneric;
   import visuals.ui.elements.generic.SymbolScrollLineGeneric;
   
   public class SymbolDialogReportUserSSOGeneric extends Sprite
   {
       
      
      private var _nativeObject:SymbolDialogReportUserSSO = null;
      
      public var dialogBackground:SymbolSlice9BackgroundDialogGeneric = null;
      
      public var inputText:ITextInputArea = null;
      
      public var txtInfo:ILabelArea = null;
      
      public var txtWarning:ILabelArea = null;
      
      public var txtInfoMail:ILabelArea = null;
      
      public var txtDialogTitle:ILabel = null;
      
      public var btnClose:SymbolButtonCloseGeneric = null;
      
      public var btnReport:SymbolUiButtonDefaultGeneric = null;
      
      public var scrollLine:SymbolScrollLineGeneric = null;
      
      public var scrollKnob:SymbolScrollKnobGeneric = null;
      
      public var txtMail:ILabel = null;
      
      public var backgroundGuildPage:SymbolTextfieldVeryWideGeneric = null;
      
      public var inputMail:ITextInput = null;
      
      public function SymbolDialogReportUserSSOGeneric(param1:MovieClip = null)
      {
         if(param1)
         {
            _nativeObject = param1 as SymbolDialogReportUserSSO;
         }
         else
         {
            _nativeObject = new SymbolDialogReportUserSSO();
         }
         super(null,FlashSprite.fromNative(_nativeObject));
         var _loc2_:FlashDisplayObjectContainer = _sprite as FlashDisplayObjectContainer;
         dialogBackground = new SymbolSlice9BackgroundDialogGeneric(_nativeObject.dialogBackground);
         inputText = FlashTextInputArea.fromNative(_nativeObject.inputText);
         txtInfo = FlashLabelArea.fromNative(_nativeObject.txtInfo);
         txtWarning = FlashLabelArea.fromNative(_nativeObject.txtWarning);
         txtInfoMail = FlashLabelArea.fromNative(_nativeObject.txtInfoMail);
         txtDialogTitle = FlashLabel.fromNative(_nativeObject.txtDialogTitle);
         btnClose = new SymbolButtonCloseGeneric(_nativeObject.btnClose);
         btnReport = new SymbolUiButtonDefaultGeneric(_nativeObject.btnReport);
         scrollLine = new SymbolScrollLineGeneric(_nativeObject.scrollLine);
         scrollKnob = new SymbolScrollKnobGeneric(_nativeObject.scrollKnob);
         txtMail = FlashLabel.fromNative(_nativeObject.txtMail);
         backgroundGuildPage = new SymbolTextfieldVeryWideGeneric(_nativeObject.backgroundGuildPage);
         inputMail = FlashTextInput.fromNative(_nativeObject.inputMail);
      }
      
      public function setNativeInstance(param1:SymbolDialogReportUserSSO) : void
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
         FlashTextInputArea.setNativeInstance(inputText,_nativeObject.inputText);
         FlashLabelArea.setNativeInstance(txtInfo,_nativeObject.txtInfo);
         FlashLabelArea.setNativeInstance(txtWarning,_nativeObject.txtWarning);
         FlashLabelArea.setNativeInstance(txtInfoMail,_nativeObject.txtInfoMail);
         FlashLabel.setNativeInstance(txtDialogTitle,_nativeObject.txtDialogTitle);
         if(_nativeObject.btnClose)
         {
            btnClose.setNativeInstance(_nativeObject.btnClose);
         }
         if(_nativeObject.btnReport)
         {
            btnReport.setNativeInstance(_nativeObject.btnReport);
         }
         if(_nativeObject.scrollLine)
         {
            scrollLine.setNativeInstance(_nativeObject.scrollLine);
         }
         if(_nativeObject.scrollKnob)
         {
            scrollKnob.setNativeInstance(_nativeObject.scrollKnob);
         }
         FlashLabel.setNativeInstance(txtMail,_nativeObject.txtMail);
         if(_nativeObject.backgroundGuildPage)
         {
            backgroundGuildPage.setNativeInstance(_nativeObject.backgroundGuildPage);
         }
         FlashTextInput.setNativeInstance(inputMail,_nativeObject.inputMail);
      }
   }
}
