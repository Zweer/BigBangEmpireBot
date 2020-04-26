package visuals.ui.dialogs
{
   import com.playata.framework.display.Sprite;
   import com.playata.framework.display.lib.flash.FlashDisplayObjectContainer;
   import com.playata.framework.display.lib.flash.FlashLabel;
   import com.playata.framework.display.lib.flash.FlashSprite;
   import com.playata.framework.display.lib.flash.FlashTextInputArea;
   import com.playata.framework.display.ui.controls.ILabel;
   import com.playata.framework.display.ui.controls.ITextInputArea;
   import flash.display.MovieClip;
   import visuals.ui.base.SymbolTextboxFrameLargeGeneric;
   import visuals.ui.base.SymbolUiButtonDefaultGeneric;
   import visuals.ui.elements.backgrounds.SymbolSlice9BackgroundDialogGeneric;
   import visuals.ui.elements.buttons.SymbolButtonCloseGeneric;
   import visuals.ui.elements.generic.SymbolScrollKnobGeneric;
   import visuals.ui.elements.generic.SymbolScrollLineGeneric;
   
   public class SymbolDialogGuildApplicationGeneric extends Sprite
   {
       
      
      private var _nativeObject:SymbolDialogGuildApplication = null;
      
      public var dialogBackground:SymbolSlice9BackgroundDialogGeneric = null;
      
      public var inputBackgroundMessage:SymbolTextboxFrameLargeGeneric = null;
      
      public var txtDialogTitle:ILabel = null;
      
      public var txtMessageCaption:ILabel = null;
      
      public var inputMessage:ITextInputArea = null;
      
      public var btnClose:SymbolButtonCloseGeneric = null;
      
      public var btnSend:SymbolUiButtonDefaultGeneric = null;
      
      public var scrollLine:SymbolScrollLineGeneric = null;
      
      public var scrollKnob:SymbolScrollKnobGeneric = null;
      
      public function SymbolDialogGuildApplicationGeneric(param1:MovieClip = null)
      {
         if(param1)
         {
            _nativeObject = param1 as SymbolDialogGuildApplication;
         }
         else
         {
            _nativeObject = new SymbolDialogGuildApplication();
         }
         super(null,FlashSprite.fromNative(_nativeObject));
         var _loc2_:FlashDisplayObjectContainer = _sprite as FlashDisplayObjectContainer;
         dialogBackground = new SymbolSlice9BackgroundDialogGeneric(_nativeObject.dialogBackground);
         inputBackgroundMessage = new SymbolTextboxFrameLargeGeneric(_nativeObject.inputBackgroundMessage);
         txtDialogTitle = FlashLabel.fromNative(_nativeObject.txtDialogTitle);
         txtMessageCaption = FlashLabel.fromNative(_nativeObject.txtMessageCaption);
         inputMessage = FlashTextInputArea.fromNative(_nativeObject.inputMessage);
         btnClose = new SymbolButtonCloseGeneric(_nativeObject.btnClose);
         btnSend = new SymbolUiButtonDefaultGeneric(_nativeObject.btnSend);
         scrollLine = new SymbolScrollLineGeneric(_nativeObject.scrollLine);
         scrollKnob = new SymbolScrollKnobGeneric(_nativeObject.scrollKnob);
      }
      
      public function setNativeInstance(param1:SymbolDialogGuildApplication) : void
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
         FlashLabel.setNativeInstance(txtDialogTitle,_nativeObject.txtDialogTitle);
         FlashLabel.setNativeInstance(txtMessageCaption,_nativeObject.txtMessageCaption);
         FlashTextInputArea.setNativeInstance(inputMessage,_nativeObject.inputMessage);
         if(_nativeObject.btnClose)
         {
            btnClose.setNativeInstance(_nativeObject.btnClose);
         }
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
