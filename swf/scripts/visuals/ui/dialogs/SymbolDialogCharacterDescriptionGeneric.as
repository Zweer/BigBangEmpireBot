package visuals.ui.dialogs
{
   import com.playata.framework.display.Sprite;
   import com.playata.framework.display.lib.flash.FlashDisplayObjectContainer;
   import com.playata.framework.display.lib.flash.FlashLabel;
   import com.playata.framework.display.lib.flash.FlashLabelArea;
   import com.playata.framework.display.lib.flash.FlashSprite;
   import com.playata.framework.display.lib.flash.FlashTextInputArea;
   import com.playata.framework.display.ui.controls.ILabel;
   import com.playata.framework.display.ui.controls.ILabelArea;
   import com.playata.framework.display.ui.controls.ITextInputArea;
   import flash.display.MovieClip;
   import visuals.ui.base.SymbolUiButtonDefaultGeneric;
   import visuals.ui.elements.backgrounds.SymbolSlice9BackgroundDialogGeneric;
   import visuals.ui.elements.buttons.SymbolButtonCloseGeneric;
   import visuals.ui.elements.buttons.SymbolButtonTabGeneric;
   import visuals.ui.elements.generic.SymbolCharacterDescriptionTextfieldGeneric;
   import visuals.ui.elements.generic.SymbolScrollKnobGeneric;
   import visuals.ui.elements.generic.SymbolScrollLineGeneric;
   
   public class SymbolDialogCharacterDescriptionGeneric extends Sprite
   {
       
      
      private var _nativeObject:SymbolDialogCharacterDescription = null;
      
      public var dialogBackground:SymbolSlice9BackgroundDialogGeneric = null;
      
      public var textBackground:SymbolCharacterDescriptionTextfieldGeneric = null;
      
      public var txtText:ILabelArea = null;
      
      public var inputText:ITextInputArea = null;
      
      public var txtDialogTitle:ILabel = null;
      
      public var btnTabDescription:SymbolButtonTabGeneric = null;
      
      public var btnTabNote:SymbolButtonTabGeneric = null;
      
      public var scrollLine:SymbolScrollLineGeneric = null;
      
      public var scrollKnob:SymbolScrollKnobGeneric = null;
      
      public var btnClose:SymbolButtonCloseGeneric = null;
      
      public var btnSave:SymbolUiButtonDefaultGeneric = null;
      
      public function SymbolDialogCharacterDescriptionGeneric(param1:MovieClip = null)
      {
         if(param1)
         {
            _nativeObject = param1 as SymbolDialogCharacterDescription;
         }
         else
         {
            _nativeObject = new SymbolDialogCharacterDescription();
         }
         super(null,FlashSprite.fromNative(_nativeObject));
         var _loc2_:FlashDisplayObjectContainer = _sprite as FlashDisplayObjectContainer;
         dialogBackground = new SymbolSlice9BackgroundDialogGeneric(_nativeObject.dialogBackground);
         textBackground = new SymbolCharacterDescriptionTextfieldGeneric(_nativeObject.textBackground);
         txtText = FlashLabelArea.fromNative(_nativeObject.txtText);
         inputText = FlashTextInputArea.fromNative(_nativeObject.inputText);
         txtDialogTitle = FlashLabel.fromNative(_nativeObject.txtDialogTitle);
         btnTabDescription = new SymbolButtonTabGeneric(_nativeObject.btnTabDescription);
         btnTabNote = new SymbolButtonTabGeneric(_nativeObject.btnTabNote);
         scrollLine = new SymbolScrollLineGeneric(_nativeObject.scrollLine);
         scrollKnob = new SymbolScrollKnobGeneric(_nativeObject.scrollKnob);
         btnClose = new SymbolButtonCloseGeneric(_nativeObject.btnClose);
         btnSave = new SymbolUiButtonDefaultGeneric(_nativeObject.btnSave);
      }
      
      public function setNativeInstance(param1:SymbolDialogCharacterDescription) : void
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
         if(_nativeObject.textBackground)
         {
            textBackground.setNativeInstance(_nativeObject.textBackground);
         }
         FlashLabelArea.setNativeInstance(txtText,_nativeObject.txtText);
         FlashTextInputArea.setNativeInstance(inputText,_nativeObject.inputText);
         FlashLabel.setNativeInstance(txtDialogTitle,_nativeObject.txtDialogTitle);
         if(_nativeObject.btnTabDescription)
         {
            btnTabDescription.setNativeInstance(_nativeObject.btnTabDescription);
         }
         if(_nativeObject.btnTabNote)
         {
            btnTabNote.setNativeInstance(_nativeObject.btnTabNote);
         }
         if(_nativeObject.scrollLine)
         {
            scrollLine.setNativeInstance(_nativeObject.scrollLine);
         }
         if(_nativeObject.scrollKnob)
         {
            scrollKnob.setNativeInstance(_nativeObject.scrollKnob);
         }
         if(_nativeObject.btnClose)
         {
            btnClose.setNativeInstance(_nativeObject.btnClose);
         }
         if(_nativeObject.btnSave)
         {
            btnSave.setNativeInstance(_nativeObject.btnSave);
         }
      }
   }
}
