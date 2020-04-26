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
   
   public class SymbolDialogGuildDescriptionNoteGeneric extends Sprite
   {
       
      
      private var _nativeObject:SymbolDialogGuildDescriptionNote = null;
      
      public var dialogBackground:SymbolSlice9BackgroundDialogGeneric = null;
      
      public var txtText:ILabelArea = null;
      
      public var inputText:ITextInputArea = null;
      
      public var txtDialogTitle:ILabel = null;
      
      public var btnClose:SymbolButtonCloseGeneric = null;
      
      public var btnSave:SymbolUiButtonDefaultGeneric = null;
      
      public var scrollLine:SymbolScrollLineGeneric = null;
      
      public var scrollKnob:SymbolScrollKnobGeneric = null;
      
      public var txtGuildPageLink:ILabel = null;
      
      public var backgroundGuildPage:SymbolTextfieldVeryWideGeneric = null;
      
      public var inputGuildPageLink:ITextInput = null;
      
      public function SymbolDialogGuildDescriptionNoteGeneric(param1:MovieClip = null)
      {
         if(param1)
         {
            _nativeObject = param1 as SymbolDialogGuildDescriptionNote;
         }
         else
         {
            _nativeObject = new SymbolDialogGuildDescriptionNote();
         }
         super(null,FlashSprite.fromNative(_nativeObject));
         var _loc2_:FlashDisplayObjectContainer = _sprite as FlashDisplayObjectContainer;
         dialogBackground = new SymbolSlice9BackgroundDialogGeneric(_nativeObject.dialogBackground);
         txtText = FlashLabelArea.fromNative(_nativeObject.txtText);
         inputText = FlashTextInputArea.fromNative(_nativeObject.inputText);
         txtDialogTitle = FlashLabel.fromNative(_nativeObject.txtDialogTitle);
         btnClose = new SymbolButtonCloseGeneric(_nativeObject.btnClose);
         btnSave = new SymbolUiButtonDefaultGeneric(_nativeObject.btnSave);
         scrollLine = new SymbolScrollLineGeneric(_nativeObject.scrollLine);
         scrollKnob = new SymbolScrollKnobGeneric(_nativeObject.scrollKnob);
         txtGuildPageLink = FlashLabel.fromNative(_nativeObject.txtGuildPageLink);
         backgroundGuildPage = new SymbolTextfieldVeryWideGeneric(_nativeObject.backgroundGuildPage);
         inputGuildPageLink = FlashTextInput.fromNative(_nativeObject.inputGuildPageLink);
      }
      
      public function setNativeInstance(param1:SymbolDialogGuildDescriptionNote) : void
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
         FlashLabelArea.setNativeInstance(txtText,_nativeObject.txtText);
         FlashTextInputArea.setNativeInstance(inputText,_nativeObject.inputText);
         FlashLabel.setNativeInstance(txtDialogTitle,_nativeObject.txtDialogTitle);
         if(_nativeObject.btnClose)
         {
            btnClose.setNativeInstance(_nativeObject.btnClose);
         }
         if(_nativeObject.btnSave)
         {
            btnSave.setNativeInstance(_nativeObject.btnSave);
         }
         if(_nativeObject.scrollLine)
         {
            scrollLine.setNativeInstance(_nativeObject.scrollLine);
         }
         if(_nativeObject.scrollKnob)
         {
            scrollKnob.setNativeInstance(_nativeObject.scrollKnob);
         }
         FlashLabel.setNativeInstance(txtGuildPageLink,_nativeObject.txtGuildPageLink);
         if(_nativeObject.backgroundGuildPage)
         {
            backgroundGuildPage.setNativeInstance(_nativeObject.backgroundGuildPage);
         }
         FlashTextInput.setNativeInstance(inputGuildPageLink,_nativeObject.inputGuildPageLink);
      }
   }
}
