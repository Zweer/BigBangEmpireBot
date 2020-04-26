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
   import visuals.ui.base.SymbolDummyGeneric;
   import visuals.ui.base.SymbolTextfieldVeryWideGeneric;
   import visuals.ui.base.SymbolUiButtonDefaultGeneric;
   import visuals.ui.elements.backgrounds.SymbolSlice9BackgroundDialogGeneric;
   import visuals.ui.elements.buttons.SymbolButtonArrowLeftGeneric;
   import visuals.ui.elements.buttons.SymbolButtonArrowRightGeneric;
   import visuals.ui.elements.buttons.SymbolButtonCloseGeneric;
   import visuals.ui.elements.buttons.SymbolButtonPremiumGeneric;
   import visuals.ui.elements.buttons.SymbolButtonTabGeneric;
   import visuals.ui.elements.generic.SymbolScrollKnobGeneric;
   import visuals.ui.elements.generic.SymbolScrollLineGeneric;
   import visuals.ui.elements.goal.SymbolGoalExclamationMarkGeneric;
   import visuals.ui.elements.icons.SymbolIconFlagGeneric;
   import visuals.ui.elements.user_story.SymbolUserStoryTagIconGeneric;
   
   public class SymbolDialogUserStoryWriteGeneric extends Sprite
   {
       
      
      private var _nativeObject:SymbolDialogUserStoryWrite = null;
      
      public var background:SymbolSlice9BackgroundDialogGeneric = null;
      
      public var inputTitleBackground:SymbolTextfieldVeryWideGeneric = null;
      
      public var txtTitleCharCountInfo:ILabel = null;
      
      public var txtInputTitle:ITextInput = null;
      
      public var txtCaptionTitle:ILabel = null;
      
      public var iconLocale:SymbolIconFlagGeneric = null;
      
      public var btnSelectLocaleLeft:SymbolButtonArrowLeftGeneric = null;
      
      public var btnSelectLocaleRight:SymbolButtonArrowRightGeneric = null;
      
      public var txtStageName:ILabelArea = null;
      
      public var btnSelectStageLeft:SymbolButtonArrowLeftGeneric = null;
      
      public var btnSelectStageRight:SymbolButtonArrowRightGeneric = null;
      
      public var iconTag:SymbolUserStoryTagIconGeneric = null;
      
      public var btnSelectTagLeft:SymbolButtonArrowLeftGeneric = null;
      
      public var btnSelectTagRight:SymbolButtonArrowRightGeneric = null;
      
      public var tagTooltipLayer:SymbolDummyGeneric = null;
      
      public var txtMessageCharCountInfo:ILabel = null;
      
      public var txtInputBriefing:ITextInputArea = null;
      
      public var txtInputOutro:ITextInputArea = null;
      
      public var btnTabBriefing:SymbolButtonTabGeneric = null;
      
      public var btnTabOutro:SymbolButtonTabGeneric = null;
      
      public var iconExclamationMarkBriefing:SymbolGoalExclamationMarkGeneric = null;
      
      public var iconExclamationMarkOutro:SymbolGoalExclamationMarkGeneric = null;
      
      public var scrollBarLineBriefing:SymbolScrollLineGeneric = null;
      
      public var scrollBarKnobBriefing:SymbolScrollKnobGeneric = null;
      
      public var scrollBarLineOutro:SymbolScrollLineGeneric = null;
      
      public var scrollBarKnobOutro:SymbolScrollKnobGeneric = null;
      
      public var txtDialogTitle:ILabel = null;
      
      public var btnClose:SymbolButtonCloseGeneric = null;
      
      public var btnSave:SymbolButtonPremiumGeneric = null;
      
      public var btnPreview:SymbolUiButtonDefaultGeneric = null;
      
      public function SymbolDialogUserStoryWriteGeneric(param1:MovieClip = null)
      {
         if(param1)
         {
            _nativeObject = param1 as SymbolDialogUserStoryWrite;
         }
         else
         {
            _nativeObject = new SymbolDialogUserStoryWrite();
         }
         super(null,FlashSprite.fromNative(_nativeObject));
         var _loc2_:FlashDisplayObjectContainer = _sprite as FlashDisplayObjectContainer;
         background = new SymbolSlice9BackgroundDialogGeneric(_nativeObject.background);
         inputTitleBackground = new SymbolTextfieldVeryWideGeneric(_nativeObject.inputTitleBackground);
         txtTitleCharCountInfo = FlashLabel.fromNative(_nativeObject.txtTitleCharCountInfo);
         txtInputTitle = FlashTextInput.fromNative(_nativeObject.txtInputTitle);
         txtCaptionTitle = FlashLabel.fromNative(_nativeObject.txtCaptionTitle);
         iconLocale = new SymbolIconFlagGeneric(_nativeObject.iconLocale);
         btnSelectLocaleLeft = new SymbolButtonArrowLeftGeneric(_nativeObject.btnSelectLocaleLeft);
         btnSelectLocaleRight = new SymbolButtonArrowRightGeneric(_nativeObject.btnSelectLocaleRight);
         txtStageName = FlashLabelArea.fromNative(_nativeObject.txtStageName);
         btnSelectStageLeft = new SymbolButtonArrowLeftGeneric(_nativeObject.btnSelectStageLeft);
         btnSelectStageRight = new SymbolButtonArrowRightGeneric(_nativeObject.btnSelectStageRight);
         iconTag = new SymbolUserStoryTagIconGeneric(_nativeObject.iconTag);
         btnSelectTagLeft = new SymbolButtonArrowLeftGeneric(_nativeObject.btnSelectTagLeft);
         btnSelectTagRight = new SymbolButtonArrowRightGeneric(_nativeObject.btnSelectTagRight);
         tagTooltipLayer = new SymbolDummyGeneric(_nativeObject.tagTooltipLayer);
         txtMessageCharCountInfo = FlashLabel.fromNative(_nativeObject.txtMessageCharCountInfo);
         txtInputBriefing = FlashTextInputArea.fromNative(_nativeObject.txtInputBriefing);
         txtInputOutro = FlashTextInputArea.fromNative(_nativeObject.txtInputOutro);
         btnTabBriefing = new SymbolButtonTabGeneric(_nativeObject.btnTabBriefing);
         btnTabOutro = new SymbolButtonTabGeneric(_nativeObject.btnTabOutro);
         iconExclamationMarkBriefing = new SymbolGoalExclamationMarkGeneric(_nativeObject.iconExclamationMarkBriefing);
         iconExclamationMarkOutro = new SymbolGoalExclamationMarkGeneric(_nativeObject.iconExclamationMarkOutro);
         scrollBarLineBriefing = new SymbolScrollLineGeneric(_nativeObject.scrollBarLineBriefing);
         scrollBarKnobBriefing = new SymbolScrollKnobGeneric(_nativeObject.scrollBarKnobBriefing);
         scrollBarLineOutro = new SymbolScrollLineGeneric(_nativeObject.scrollBarLineOutro);
         scrollBarKnobOutro = new SymbolScrollKnobGeneric(_nativeObject.scrollBarKnobOutro);
         txtDialogTitle = FlashLabel.fromNative(_nativeObject.txtDialogTitle);
         btnClose = new SymbolButtonCloseGeneric(_nativeObject.btnClose);
         btnSave = new SymbolButtonPremiumGeneric(_nativeObject.btnSave);
         btnPreview = new SymbolUiButtonDefaultGeneric(_nativeObject.btnPreview);
      }
      
      public function setNativeInstance(param1:SymbolDialogUserStoryWrite) : void
      {
         FlashSprite.setNativeInstance(_sprite,param1);
         _nativeObject = param1;
         syncInstances();
      }
      
      public function syncInstances() : void
      {
         if(_nativeObject.background)
         {
            background.setNativeInstance(_nativeObject.background);
         }
         if(_nativeObject.inputTitleBackground)
         {
            inputTitleBackground.setNativeInstance(_nativeObject.inputTitleBackground);
         }
         FlashLabel.setNativeInstance(txtTitleCharCountInfo,_nativeObject.txtTitleCharCountInfo);
         FlashTextInput.setNativeInstance(txtInputTitle,_nativeObject.txtInputTitle);
         FlashLabel.setNativeInstance(txtCaptionTitle,_nativeObject.txtCaptionTitle);
         if(_nativeObject.iconLocale)
         {
            iconLocale.setNativeInstance(_nativeObject.iconLocale);
         }
         if(_nativeObject.btnSelectLocaleLeft)
         {
            btnSelectLocaleLeft.setNativeInstance(_nativeObject.btnSelectLocaleLeft);
         }
         if(_nativeObject.btnSelectLocaleRight)
         {
            btnSelectLocaleRight.setNativeInstance(_nativeObject.btnSelectLocaleRight);
         }
         FlashLabelArea.setNativeInstance(txtStageName,_nativeObject.txtStageName);
         if(_nativeObject.btnSelectStageLeft)
         {
            btnSelectStageLeft.setNativeInstance(_nativeObject.btnSelectStageLeft);
         }
         if(_nativeObject.btnSelectStageRight)
         {
            btnSelectStageRight.setNativeInstance(_nativeObject.btnSelectStageRight);
         }
         if(_nativeObject.iconTag)
         {
            iconTag.setNativeInstance(_nativeObject.iconTag);
         }
         if(_nativeObject.btnSelectTagLeft)
         {
            btnSelectTagLeft.setNativeInstance(_nativeObject.btnSelectTagLeft);
         }
         if(_nativeObject.btnSelectTagRight)
         {
            btnSelectTagRight.setNativeInstance(_nativeObject.btnSelectTagRight);
         }
         if(_nativeObject.tagTooltipLayer)
         {
            tagTooltipLayer.setNativeInstance(_nativeObject.tagTooltipLayer);
         }
         FlashLabel.setNativeInstance(txtMessageCharCountInfo,_nativeObject.txtMessageCharCountInfo);
         FlashTextInputArea.setNativeInstance(txtInputBriefing,_nativeObject.txtInputBriefing);
         FlashTextInputArea.setNativeInstance(txtInputOutro,_nativeObject.txtInputOutro);
         if(_nativeObject.btnTabBriefing)
         {
            btnTabBriefing.setNativeInstance(_nativeObject.btnTabBriefing);
         }
         if(_nativeObject.btnTabOutro)
         {
            btnTabOutro.setNativeInstance(_nativeObject.btnTabOutro);
         }
         if(_nativeObject.iconExclamationMarkBriefing)
         {
            iconExclamationMarkBriefing.setNativeInstance(_nativeObject.iconExclamationMarkBriefing);
         }
         if(_nativeObject.iconExclamationMarkOutro)
         {
            iconExclamationMarkOutro.setNativeInstance(_nativeObject.iconExclamationMarkOutro);
         }
         if(_nativeObject.scrollBarLineBriefing)
         {
            scrollBarLineBriefing.setNativeInstance(_nativeObject.scrollBarLineBriefing);
         }
         if(_nativeObject.scrollBarKnobBriefing)
         {
            scrollBarKnobBriefing.setNativeInstance(_nativeObject.scrollBarKnobBriefing);
         }
         if(_nativeObject.scrollBarLineOutro)
         {
            scrollBarLineOutro.setNativeInstance(_nativeObject.scrollBarLineOutro);
         }
         if(_nativeObject.scrollBarKnobOutro)
         {
            scrollBarKnobOutro.setNativeInstance(_nativeObject.scrollBarKnobOutro);
         }
         FlashLabel.setNativeInstance(txtDialogTitle,_nativeObject.txtDialogTitle);
         if(_nativeObject.btnClose)
         {
            btnClose.setNativeInstance(_nativeObject.btnClose);
         }
         if(_nativeObject.btnSave)
         {
            btnSave.setNativeInstance(_nativeObject.btnSave);
         }
         if(_nativeObject.btnPreview)
         {
            btnPreview.setNativeInstance(_nativeObject.btnPreview);
         }
      }
   }
}
