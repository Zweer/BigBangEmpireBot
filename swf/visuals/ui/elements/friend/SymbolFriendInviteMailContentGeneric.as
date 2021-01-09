package visuals.ui.elements.friend
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
   import visuals.ui.elements.buttons.SymbolButtonPlusStaticGeneric;
   import visuals.ui.elements.generic.SymbolScrollKnobGeneric;
   import visuals.ui.elements.generic.SymbolScrollLineGeneric;
   
   public class SymbolFriendInviteMailContentGeneric extends Sprite
   {
       
      
      private var _nativeObject:SymbolFriendInviteMailContent = null;
      
      public var txtMessageCaption:ILabel = null;
      
      public var inputMessage:ITextInputArea = null;
      
      public var scrollLine:SymbolScrollLineGeneric = null;
      
      public var scrollKnob:SymbolScrollKnobGeneric = null;
      
      public var txtReceiverCaption:ILabel = null;
      
      public var bgReceiver:SymbolTextfieldVeryWideGeneric = null;
      
      public var inputReceiver:ITextInput = null;
      
      public var btnSend:SymbolUiButtonDefaultGeneric = null;
      
      public var btnAddRecipient:SymbolButtonPlusStaticGeneric = null;
      
      public var txtInfo:ILabelArea = null;
      
      public function SymbolFriendInviteMailContentGeneric(param1:MovieClip = null)
      {
         if(param1)
         {
            _nativeObject = param1 as SymbolFriendInviteMailContent;
         }
         else
         {
            _nativeObject = new SymbolFriendInviteMailContent();
         }
         super(null,FlashSprite.fromNative(_nativeObject));
         var _loc2_:FlashDisplayObjectContainer = _sprite as FlashDisplayObjectContainer;
         txtMessageCaption = FlashLabel.fromNative(_nativeObject.txtMessageCaption);
         inputMessage = FlashTextInputArea.fromNative(_nativeObject.inputMessage);
         scrollLine = new SymbolScrollLineGeneric(_nativeObject.scrollLine);
         scrollKnob = new SymbolScrollKnobGeneric(_nativeObject.scrollKnob);
         txtReceiverCaption = FlashLabel.fromNative(_nativeObject.txtReceiverCaption);
         bgReceiver = new SymbolTextfieldVeryWideGeneric(_nativeObject.bgReceiver);
         inputReceiver = FlashTextInput.fromNative(_nativeObject.inputReceiver);
         btnSend = new SymbolUiButtonDefaultGeneric(_nativeObject.btnSend);
         btnAddRecipient = new SymbolButtonPlusStaticGeneric(_nativeObject.btnAddRecipient);
         txtInfo = FlashLabelArea.fromNative(_nativeObject.txtInfo);
      }
      
      public function setNativeInstance(param1:SymbolFriendInviteMailContent) : void
      {
         FlashSprite.setNativeInstance(_sprite,param1);
         _nativeObject = param1;
         syncInstances();
      }
      
      public function syncInstances() : void
      {
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
         FlashLabel.setNativeInstance(txtReceiverCaption,_nativeObject.txtReceiverCaption);
         if(_nativeObject.bgReceiver)
         {
            bgReceiver.setNativeInstance(_nativeObject.bgReceiver);
         }
         FlashTextInput.setNativeInstance(inputReceiver,_nativeObject.inputReceiver);
         if(_nativeObject.btnSend)
         {
            btnSend.setNativeInstance(_nativeObject.btnSend);
         }
         if(_nativeObject.btnAddRecipient)
         {
            btnAddRecipient.setNativeInstance(_nativeObject.btnAddRecipient);
         }
         FlashLabelArea.setNativeInstance(txtInfo,_nativeObject.txtInfo);
      }
   }
}
