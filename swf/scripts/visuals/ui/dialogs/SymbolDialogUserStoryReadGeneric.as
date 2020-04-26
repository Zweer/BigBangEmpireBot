package visuals.ui.dialogs
{
   import com.playata.framework.display.Sprite;
   import com.playata.framework.display.lib.flash.FlashDisplayObjectContainer;
   import com.playata.framework.display.lib.flash.FlashLabel;
   import com.playata.framework.display.lib.flash.FlashLabelArea;
   import com.playata.framework.display.lib.flash.FlashSprite;
   import com.playata.framework.display.ui.controls.ILabel;
   import com.playata.framework.display.ui.controls.ILabelArea;
   import flash.display.MovieClip;
   import visuals.ui.elements.backgrounds.SymbolSlice9BackgroundDialogGeneric;
   import visuals.ui.elements.buttons.SymbolButtonArrowLeftGeneric;
   import visuals.ui.elements.buttons.SymbolButtonArrowRightGeneric;
   import visuals.ui.elements.buttons.SymbolButtonCloseGeneric;
   import visuals.ui.elements.buttons.SymbolButtonTabGeneric;
   import visuals.ui.elements.icons.SymbolIconFlagGeneric;
   import visuals.ui.elements.icons.SymbolIconGenderFemaleGeneric;
   import visuals.ui.elements.icons.SymbolIconGenderMaleGeneric;
   import visuals.ui.elements.user_story.SymbolUiButtonIconReportGeneric;
   import visuals.ui.elements.user_story.SymbolUserStoryTagIconGeneric;
   
   public class SymbolDialogUserStoryReadGeneric extends Sprite
   {
       
      
      private var _nativeObject:SymbolDialogUserStoryRead = null;
      
      public var background:SymbolSlice9BackgroundDialogGeneric = null;
      
      public var btnTabBriefing:SymbolButtonTabGeneric = null;
      
      public var btnTabOutro:SymbolButtonTabGeneric = null;
      
      public var txtTitle:ILabel = null;
      
      public var iconLocale:SymbolIconFlagGeneric = null;
      
      public var iconTag:SymbolUserStoryTagIconGeneric = null;
      
      public var txtDate:ILabel = null;
      
      public var txtAuthor:ILabel = null;
      
      public var txtStage:ILabel = null;
      
      public var txtCaptionDate:ILabel = null;
      
      public var txtServerId:ILabel = null;
      
      public var iconServer:SymbolIconFlagGeneric = null;
      
      public var iconGenderFemale:SymbolIconGenderFemaleGeneric = null;
      
      public var iconGenderMale:SymbolIconGenderMaleGeneric = null;
      
      public var txtBriefingOutro:ILabelArea = null;
      
      public var btnClose:SymbolButtonCloseGeneric = null;
      
      public var btnPreviousUserStory:SymbolButtonArrowLeftGeneric = null;
      
      public var btnNextUserStory:SymbolButtonArrowRightGeneric = null;
      
      public var btnReport:SymbolUiButtonIconReportGeneric = null;
      
      public function SymbolDialogUserStoryReadGeneric(param1:MovieClip = null)
      {
         if(param1)
         {
            _nativeObject = param1 as SymbolDialogUserStoryRead;
         }
         else
         {
            _nativeObject = new SymbolDialogUserStoryRead();
         }
         super(null,FlashSprite.fromNative(_nativeObject));
         var _loc2_:FlashDisplayObjectContainer = _sprite as FlashDisplayObjectContainer;
         background = new SymbolSlice9BackgroundDialogGeneric(_nativeObject.background);
         btnTabBriefing = new SymbolButtonTabGeneric(_nativeObject.btnTabBriefing);
         btnTabOutro = new SymbolButtonTabGeneric(_nativeObject.btnTabOutro);
         txtTitle = FlashLabel.fromNative(_nativeObject.txtTitle);
         iconLocale = new SymbolIconFlagGeneric(_nativeObject.iconLocale);
         iconTag = new SymbolUserStoryTagIconGeneric(_nativeObject.iconTag);
         txtDate = FlashLabel.fromNative(_nativeObject.txtDate);
         txtAuthor = FlashLabel.fromNative(_nativeObject.txtAuthor);
         txtStage = FlashLabel.fromNative(_nativeObject.txtStage);
         txtCaptionDate = FlashLabel.fromNative(_nativeObject.txtCaptionDate);
         txtServerId = FlashLabel.fromNative(_nativeObject.txtServerId);
         iconServer = new SymbolIconFlagGeneric(_nativeObject.iconServer);
         iconGenderFemale = new SymbolIconGenderFemaleGeneric(_nativeObject.iconGenderFemale);
         iconGenderMale = new SymbolIconGenderMaleGeneric(_nativeObject.iconGenderMale);
         txtBriefingOutro = FlashLabelArea.fromNative(_nativeObject.txtBriefingOutro);
         btnClose = new SymbolButtonCloseGeneric(_nativeObject.btnClose);
         btnPreviousUserStory = new SymbolButtonArrowLeftGeneric(_nativeObject.btnPreviousUserStory);
         btnNextUserStory = new SymbolButtonArrowRightGeneric(_nativeObject.btnNextUserStory);
         btnReport = new SymbolUiButtonIconReportGeneric(_nativeObject.btnReport);
      }
      
      public function setNativeInstance(param1:SymbolDialogUserStoryRead) : void
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
         if(_nativeObject.btnTabBriefing)
         {
            btnTabBriefing.setNativeInstance(_nativeObject.btnTabBriefing);
         }
         if(_nativeObject.btnTabOutro)
         {
            btnTabOutro.setNativeInstance(_nativeObject.btnTabOutro);
         }
         FlashLabel.setNativeInstance(txtTitle,_nativeObject.txtTitle);
         if(_nativeObject.iconLocale)
         {
            iconLocale.setNativeInstance(_nativeObject.iconLocale);
         }
         if(_nativeObject.iconTag)
         {
            iconTag.setNativeInstance(_nativeObject.iconTag);
         }
         FlashLabel.setNativeInstance(txtDate,_nativeObject.txtDate);
         FlashLabel.setNativeInstance(txtAuthor,_nativeObject.txtAuthor);
         FlashLabel.setNativeInstance(txtStage,_nativeObject.txtStage);
         FlashLabel.setNativeInstance(txtCaptionDate,_nativeObject.txtCaptionDate);
         FlashLabel.setNativeInstance(txtServerId,_nativeObject.txtServerId);
         if(_nativeObject.iconServer)
         {
            iconServer.setNativeInstance(_nativeObject.iconServer);
         }
         if(_nativeObject.iconGenderFemale)
         {
            iconGenderFemale.setNativeInstance(_nativeObject.iconGenderFemale);
         }
         if(_nativeObject.iconGenderMale)
         {
            iconGenderMale.setNativeInstance(_nativeObject.iconGenderMale);
         }
         FlashLabelArea.setNativeInstance(txtBriefingOutro,_nativeObject.txtBriefingOutro);
         if(_nativeObject.btnClose)
         {
            btnClose.setNativeInstance(_nativeObject.btnClose);
         }
         if(_nativeObject.btnPreviousUserStory)
         {
            btnPreviousUserStory.setNativeInstance(_nativeObject.btnPreviousUserStory);
         }
         if(_nativeObject.btnNextUserStory)
         {
            btnNextUserStory.setNativeInstance(_nativeObject.btnNextUserStory);
         }
         if(_nativeObject.btnReport)
         {
            btnReport.setNativeInstance(_nativeObject.btnReport);
         }
      }
   }
}
