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
   import visuals.ui.base.SymbolDummyGeneric;
   import visuals.ui.base.SymbolIconButtonReportGeneric;
   import visuals.ui.base.SymbolUiButtonDefaultGeneric;
   import visuals.ui.elements.backgrounds.SymbolSlice9BackgroundDialogGeneric;
   import visuals.ui.elements.buttons.SymbolButtonArrowLeftGeneric;
   import visuals.ui.elements.buttons.SymbolButtonArrowRightGeneric;
   import visuals.ui.elements.buttons.SymbolButtonCloseGeneric;
   import visuals.ui.elements.buttons.SymbolButtonPremiumGeneric;
   import visuals.ui.elements.conventions.SymbolConventionShowBriefingContentGeneric;
   import visuals.ui.elements.dating.SymbolDatingBriefingContentGeneric;
   import visuals.ui.elements.quest.SymbolQuestBriefingContentGeneric;
   import visuals.ui.elements.story_dungeon.SymbolStoryDungeonBriefingContentGeneric;
   import visuals.ui.elements.user_story.SymbolUserStoryTagIconGeneric;
   
   public class SymbolDialogQuestBriefingGeneric extends Sprite
   {
       
      
      private var _nativeObject:SymbolDialogQuestBriefing = null;
      
      public var conventionBannerRight:SymbolDummyGeneric = null;
      
      public var conventionBannerLeft:SymbolDummyGeneric = null;
      
      public var dialogBackground:SymbolSlice9BackgroundDialogGeneric = null;
      
      public var btnClose:SymbolButtonCloseGeneric = null;
      
      public var questContent:SymbolQuestBriefingContentGeneric = null;
      
      public var conventionShowContent:SymbolConventionShowBriefingContentGeneric = null;
      
      public var storyDungeonContent:SymbolStoryDungeonBriefingContentGeneric = null;
      
      public var datingContent:SymbolDatingBriefingContentGeneric = null;
      
      public var txtType:ILabel = null;
      
      public var iconUserStoryTag:SymbolUserStoryTagIconGeneric = null;
      
      public var btnStartQuestPremium:SymbolButtonPremiumGeneric = null;
      
      public var btnStartQuest:SymbolUiButtonDefaultGeneric = null;
      
      public var btnPreviousQuest:SymbolButtonArrowLeftGeneric = null;
      
      public var btnNextQuest:SymbolButtonArrowRightGeneric = null;
      
      public var btnReportUserStory:SymbolIconButtonReportGeneric = null;
      
      public var txtUserStoryInfo:ILabelArea = null;
      
      public function SymbolDialogQuestBriefingGeneric(param1:MovieClip = null)
      {
         if(param1)
         {
            _nativeObject = param1 as SymbolDialogQuestBriefing;
         }
         else
         {
            _nativeObject = new SymbolDialogQuestBriefing();
         }
         super(null,FlashSprite.fromNative(_nativeObject));
         var _loc2_:FlashDisplayObjectContainer = _sprite as FlashDisplayObjectContainer;
         conventionBannerRight = new SymbolDummyGeneric(_nativeObject.conventionBannerRight);
         conventionBannerLeft = new SymbolDummyGeneric(_nativeObject.conventionBannerLeft);
         dialogBackground = new SymbolSlice9BackgroundDialogGeneric(_nativeObject.dialogBackground);
         btnClose = new SymbolButtonCloseGeneric(_nativeObject.btnClose);
         questContent = new SymbolQuestBriefingContentGeneric(_nativeObject.questContent);
         conventionShowContent = new SymbolConventionShowBriefingContentGeneric(_nativeObject.conventionShowContent);
         storyDungeonContent = new SymbolStoryDungeonBriefingContentGeneric(_nativeObject.storyDungeonContent);
         datingContent = new SymbolDatingBriefingContentGeneric(_nativeObject.datingContent);
         txtType = FlashLabel.fromNative(_nativeObject.txtType);
         iconUserStoryTag = new SymbolUserStoryTagIconGeneric(_nativeObject.iconUserStoryTag);
         btnStartQuestPremium = new SymbolButtonPremiumGeneric(_nativeObject.btnStartQuestPremium);
         btnStartQuest = new SymbolUiButtonDefaultGeneric(_nativeObject.btnStartQuest);
         btnPreviousQuest = new SymbolButtonArrowLeftGeneric(_nativeObject.btnPreviousQuest);
         btnNextQuest = new SymbolButtonArrowRightGeneric(_nativeObject.btnNextQuest);
         btnReportUserStory = new SymbolIconButtonReportGeneric(_nativeObject.btnReportUserStory);
         txtUserStoryInfo = FlashLabelArea.fromNative(_nativeObject.txtUserStoryInfo);
      }
      
      public function setNativeInstance(param1:SymbolDialogQuestBriefing) : void
      {
         FlashSprite.setNativeInstance(_sprite,param1);
         _nativeObject = param1;
         syncInstances();
      }
      
      public function syncInstances() : void
      {
         if(_nativeObject.conventionBannerRight)
         {
            conventionBannerRight.setNativeInstance(_nativeObject.conventionBannerRight);
         }
         if(_nativeObject.conventionBannerLeft)
         {
            conventionBannerLeft.setNativeInstance(_nativeObject.conventionBannerLeft);
         }
         if(_nativeObject.dialogBackground)
         {
            dialogBackground.setNativeInstance(_nativeObject.dialogBackground);
         }
         if(_nativeObject.btnClose)
         {
            btnClose.setNativeInstance(_nativeObject.btnClose);
         }
         if(_nativeObject.questContent)
         {
            questContent.setNativeInstance(_nativeObject.questContent);
         }
         if(_nativeObject.conventionShowContent)
         {
            conventionShowContent.setNativeInstance(_nativeObject.conventionShowContent);
         }
         if(_nativeObject.storyDungeonContent)
         {
            storyDungeonContent.setNativeInstance(_nativeObject.storyDungeonContent);
         }
         if(_nativeObject.datingContent)
         {
            datingContent.setNativeInstance(_nativeObject.datingContent);
         }
         FlashLabel.setNativeInstance(txtType,_nativeObject.txtType);
         if(_nativeObject.iconUserStoryTag)
         {
            iconUserStoryTag.setNativeInstance(_nativeObject.iconUserStoryTag);
         }
         if(_nativeObject.btnStartQuestPremium)
         {
            btnStartQuestPremium.setNativeInstance(_nativeObject.btnStartQuestPremium);
         }
         if(_nativeObject.btnStartQuest)
         {
            btnStartQuest.setNativeInstance(_nativeObject.btnStartQuest);
         }
         if(_nativeObject.btnPreviousQuest)
         {
            btnPreviousQuest.setNativeInstance(_nativeObject.btnPreviousQuest);
         }
         if(_nativeObject.btnNextQuest)
         {
            btnNextQuest.setNativeInstance(_nativeObject.btnNextQuest);
         }
         if(_nativeObject.btnReportUserStory)
         {
            btnReportUserStory.setNativeInstance(_nativeObject.btnReportUserStory);
         }
         FlashLabelArea.setNativeInstance(txtUserStoryInfo,_nativeObject.txtUserStoryInfo);
      }
   }
}
