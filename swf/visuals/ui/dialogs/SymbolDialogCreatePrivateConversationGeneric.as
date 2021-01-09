package visuals.ui.dialogs
{
   import com.playata.framework.display.Sprite;
   import com.playata.framework.display.lib.flash.FlashDisplayObjectContainer;
   import com.playata.framework.display.lib.flash.FlashLabel;
   import com.playata.framework.display.lib.flash.FlashSprite;
   import com.playata.framework.display.lib.flash.FlashTextInput;
   import com.playata.framework.display.lib.flash.FlashTextInputArea;
   import com.playata.framework.display.ui.controls.ILabel;
   import com.playata.framework.display.ui.controls.ITextInput;
   import com.playata.framework.display.ui.controls.ITextInputArea;
   import flash.display.MovieClip;
   import visuals.ui.base.SymbolTextboxFrameLargeGeneric;
   import visuals.ui.base.SymbolTextfieldVeryWideGeneric;
   import visuals.ui.base.SymbolUiButtonDefaultGeneric;
   import visuals.ui.elements.backgrounds.SymbolSlice9BackgroundDialogGeneric;
   import visuals.ui.elements.buttons.SymbolButtonCloseGeneric;
   import visuals.ui.elements.generic.SymbolScrollKnobGeneric;
   import visuals.ui.elements.generic.SymbolScrollLineGeneric;
   
   public class SymbolDialogCreatePrivateConversationGeneric extends Sprite
   {
       
      
      private var _nativeObject:SymbolDialogCreatePrivateConversation = null;
      
      public var dialogBackground:SymbolSlice9BackgroundDialogGeneric = null;
      
      public var inputBackgroundMessage:SymbolTextboxFrameLargeGeneric = null;
      
      public var btnClose:SymbolButtonCloseGeneric = null;
      
      public var txtDialogTitle:ILabel = null;
      
      public var bgReceiver:SymbolTextfieldVeryWideGeneric = null;
      
      public var inputBackgroundSubject:SymbolTextfieldVeryWideGeneric = null;
      
      public var txtReceiverCaption:ILabel = null;
      
      public var txtSubjectCaption:ILabel = null;
      
      public var inputReceiver:ITextInput = null;
      
      public var inputSubject:ITextInput = null;
      
      public var txtMessageCaption:ILabel = null;
      
      public var inputMessage:ITextInputArea = null;
      
      public var btnSend:SymbolUiButtonDefaultGeneric = null;
      
      public var scrollLine:SymbolScrollLineGeneric = null;
      
      public var scrollKnob:SymbolScrollKnobGeneric = null;
      
      public function SymbolDialogCreatePrivateConversationGeneric(param1:MovieClip = null)
      {
         if(param1)
         {
            _nativeObject = param1 as SymbolDialogCreatePrivateConversation;
         }
         else
         {
            _nativeObject = new SymbolDialogCreatePrivateConversation();
         }
         super(null,FlashSprite.fromNative(_nativeObject));
         var _loc2_:FlashDisplayObjectContainer = _sprite as FlashDisplayObjectContainer;
         dialogBackground = new SymbolSlice9BackgroundDialogGeneric(_nativeObject.dialogBackground);
         inputBackgroundMessage = new SymbolTextboxFrameLargeGeneric(_nativeObject.inputBackgroundMessage);
         btnClose = new SymbolButtonCloseGeneric(_nativeObject.btnClose);
         txtDialogTitle = FlashLabel.fromNative(_nativeObject.txtDialogTitle);
         bgReceiver = new SymbolTextfieldVeryWideGeneric(_nativeObject.bgReceiver);
         inputBackgroundSubject = new SymbolTextfieldVeryWideGeneric(_nativeObject.inputBackgroundSubject);
         txtReceiverCaption = FlashLabel.fromNative(_nativeObject.txtReceiverCaption);
         txtSubjectCaption = FlashLabel.fromNative(_nativeObject.txtSubjectCaption);
         inputReceiver = FlashTextInput.fromNative(_nativeObject.inputReceiver);
         inputSubject = FlashTextInput.fromNative(_nativeObject.inputSubject);
         txtMessageCaption = FlashLabel.fromNative(_nativeObject.txtMessageCaption);
         inputMessage = FlashTextInputArea.fromNative(_nativeObject.inputMessage);
         btnSend = new SymbolUiButtonDefaultGeneric(_nativeObject.btnSend);
         scrollLine = new SymbolScrollLineGeneric(_nativeObject.scrollLine);
         scrollKnob = new SymbolScrollKnobGeneric(_nativeObject.scrollKnob);
      }
      
      public function setNativeInstance(param1:SymbolDialogCreatePrivateConversation) : void
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
         if(_nativeObject.inputBackgroundMessage)
         {
            inputBackgroundMessage.setNativeInstance(_nativeObject.inputBackgroundMessage);
         }
         if(_nativeObject.btnClose)
         {
            btnClose.setNativeInstance(_nativeObject.btnClose);
         }
         FlashLabel.setNativeInstance(txtDialogTitle,_nativeObject.txtDialogTitle);
         if(_nativeObject.bgReceiver)
         {
            bgReceiver.setNativeInstance(_nativeObject.bgReceiver);
         }
         if(_nativeObject.inputBackgroundSubject)
         {
            inputBackgroundSubject.setNativeInstance(_nativeObject.inputBackgroundSubject);
         }
         FlashLabel.setNativeInstance(txtReceiverCaption,_nativeObject.txtReceiverCaption);
         FlashLabel.setNativeInstance(txtSubjectCaption,_nativeObject.txtSubjectCaption);
         FlashTextInput.setNativeInstance(inputReceiver,_nativeObject.inputReceiver);
         FlashTextInput.setNativeInstance(inputSubject,_nativeObject.inputSubject);
         FlashLabel.setNativeInstance(txtMessageCaption,_nativeObject.txtMessageCaption);
         FlashTextInputArea.setNativeInstance(inputMessage,_nativeObject.inputMessage);
         if(_nativeObject.btnSend)
         {
            btnSend.setNativeInstance(_nativeObject.btnSend);
         }
         if(_nativeObject.scrollLine)
         {
            scrollLine.setNativeInstance(_nativeObject.scrollLine);
         }
         if(_nativeObject.scrollKnob)
         {
            scrollKnob.setNativeInstance(_nativeObject.scrollKnob);
         }
      }
   }
}
