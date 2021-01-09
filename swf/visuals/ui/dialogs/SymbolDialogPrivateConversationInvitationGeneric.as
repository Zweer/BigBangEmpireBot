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
   
   public class SymbolDialogPrivateConversationInvitationGeneric extends Sprite
   {
       
      
      private var _nativeObject:SymbolDialogPrivateConversationInvitation = null;
      
      public var dialogBackground:SymbolSlice9BackgroundDialogGeneric = null;
      
      public var txtMessageCaption:ILabel = null;
      
      public var inputMessage:ITextInputArea = null;
      
      public var scrollLine:SymbolScrollLineGeneric = null;
      
      public var scrollKnob:SymbolScrollKnobGeneric = null;
      
      public var txtNameCaption:ILabel = null;
      
      public var bgReceiver:SymbolTextfieldVeryWideGeneric = null;
      
      public var inputName:ITextInput = null;
      
      public var btnInvite:SymbolUiButtonDefaultGeneric = null;
      
      public var txtInfo:ILabelArea = null;
      
      public var txtDialogTitle:ILabel = null;
      
      public var btnClose:SymbolButtonCloseGeneric = null;
      
      public function SymbolDialogPrivateConversationInvitationGeneric(param1:MovieClip = null)
      {
         if(param1)
         {
            _nativeObject = param1 as SymbolDialogPrivateConversationInvitation;
         }
         else
         {
            _nativeObject = new SymbolDialogPrivateConversationInvitation();
         }
         super(null,FlashSprite.fromNative(_nativeObject));
         var _loc2_:FlashDisplayObjectContainer = _sprite as FlashDisplayObjectContainer;
         dialogBackground = new SymbolSlice9BackgroundDialogGeneric(_nativeObject.dialogBackground);
         txtMessageCaption = FlashLabel.fromNative(_nativeObject.txtMessageCaption);
         inputMessage = FlashTextInputArea.fromNative(_nativeObject.inputMessage);
         scrollLine = new SymbolScrollLineGeneric(_nativeObject.scrollLine);
         scrollKnob = new SymbolScrollKnobGeneric(_nativeObject.scrollKnob);
         txtNameCaption = FlashLabel.fromNative(_nativeObject.txtNameCaption);
         bgReceiver = new SymbolTextfieldVeryWideGeneric(_nativeObject.bgReceiver);
         inputName = FlashTextInput.fromNative(_nativeObject.inputName);
         btnInvite = new SymbolUiButtonDefaultGeneric(_nativeObject.btnInvite);
         txtInfo = FlashLabelArea.fromNative(_nativeObject.txtInfo);
         txtDialogTitle = FlashLabel.fromNative(_nativeObject.txtDialogTitle);
         btnClose = new SymbolButtonCloseGeneric(_nativeObject.btnClose);
      }
      
      public function setNativeInstance(param1:SymbolDialogPrivateConversationInvitation) : void
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
         FlashLabel.setNativeInstance(txtMessageCaption,_nativeObject.txtMessageCaption);
         FlashTextInputArea.setNativeInstance(inputMessage,_nativeObject.inputMessage);
         if(_nativeObject.scrollLine)
         {
            scrollLine.setNativeInstance(_nativeObject.scrollLine);
         }
         if(_nativeObject.scrollKnob)
         {
            scrollKnob.setNativeInstance(_nativeObject.scrollKnob);
         }
         FlashLabel.setNativeInstance(txtNameCaption,_nativeObject.txtNameCaption);
         if(_nativeObject.bgReceiver)
         {
            bgReceiver.setNativeInstance(_nativeObject.bgReceiver);
         }
         FlashTextInput.setNativeInstance(inputName,_nativeObject.inputName);
         if(_nativeObject.btnInvite)
         {
            btnInvite.setNativeInstance(_nativeObject.btnInvite);
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
