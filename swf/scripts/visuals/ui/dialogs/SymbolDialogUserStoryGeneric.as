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
   import visuals.ui.base.SymbolIconButtonCharacterGeneric;
   import visuals.ui.base.SymbolUiButtonDefaultGeneric;
   import visuals.ui.elements.backgrounds.SymbolSlice9BackgroundDialogGeneric;
   import visuals.ui.elements.backgrounds.SymbolSlice9BackgroundDialogSeperatorGeneric;
   import visuals.ui.elements.buttons.SymbolButtonArrowDownGeneric;
   import visuals.ui.elements.buttons.SymbolButtonArrowUpGeneric;
   import visuals.ui.elements.buttons.SymbolButtonCloseGeneric;
   import visuals.ui.elements.buttons.SymbolButtonGoalFilterGeneric;
   import visuals.ui.elements.buttons.SymbolButtonHelpGeneric;
   import visuals.ui.elements.buttons.SymbolButtonOptionsGeneric;
   import visuals.ui.elements.buttons.SymbolButtonTabGeneric;
   import visuals.ui.elements.user_story.SymbolActiveUserStoryLineGeneric;
   import visuals.ui.elements.user_story.SymbolUserStoryFilterGeneric;
   import visuals.ui.elements.user_story.SymbolUserStoryHallOfFameListContentGeneric;
   import visuals.ui.elements.user_story.SymbolUserStoryVotingListContentGeneric;
   
   public class SymbolDialogUserStoryGeneric extends Sprite
   {
       
      
      private var _nativeObject:SymbolDialogUserStory = null;
      
      public var background:SymbolSlice9BackgroundDialogGeneric = null;
      
      public var backgroundSeperator:SymbolSlice9BackgroundDialogSeperatorGeneric = null;
      
      public var votingContent:SymbolUserStoryVotingListContentGeneric = null;
      
      public var hallOfFameContent:SymbolUserStoryHallOfFameListContentGeneric = null;
      
      public var btnRead:SymbolUiButtonDefaultGeneric = null;
      
      public var btnViewCharacter:SymbolIconButtonCharacterGeneric = null;
      
      public var textTitle:ILabel = null;
      
      public var txtUserStoryInfo:ILabelArea = null;
      
      public var txtWriteInfo:ILabelArea = null;
      
      public var editLine:SymbolActiveUserStoryLineGeneric = null;
      
      public var btnWrite:SymbolUiButtonDefaultGeneric = null;
      
      public var btnTabVoting:SymbolButtonTabGeneric = null;
      
      public var btnTabHallOfFame:SymbolButtonTabGeneric = null;
      
      public var btnScrollUp:SymbolButtonArrowUpGeneric = null;
      
      public var btnScrollDown:SymbolButtonArrowDownGeneric = null;
      
      public var btnSettings:SymbolButtonOptionsGeneric = null;
      
      public var btnHelp:SymbolButtonHelpGeneric = null;
      
      public var btnFilter:SymbolButtonGoalFilterGeneric = null;
      
      public var filter:SymbolUserStoryFilterGeneric = null;
      
      public var btnClose:SymbolButtonCloseGeneric = null;
      
      public function SymbolDialogUserStoryGeneric(param1:MovieClip = null)
      {
         if(param1)
         {
            _nativeObject = param1 as SymbolDialogUserStory;
         }
         else
         {
            _nativeObject = new SymbolDialogUserStory();
         }
         super(null,FlashSprite.fromNative(_nativeObject));
         var _loc2_:FlashDisplayObjectContainer = _sprite as FlashDisplayObjectContainer;
         background = new SymbolSlice9BackgroundDialogGeneric(_nativeObject.background);
         backgroundSeperator = new SymbolSlice9BackgroundDialogSeperatorGeneric(_nativeObject.backgroundSeperator);
         votingContent = new SymbolUserStoryVotingListContentGeneric(_nativeObject.votingContent);
         hallOfFameContent = new SymbolUserStoryHallOfFameListContentGeneric(_nativeObject.hallOfFameContent);
         btnRead = new SymbolUiButtonDefaultGeneric(_nativeObject.btnRead);
         btnViewCharacter = new SymbolIconButtonCharacterGeneric(_nativeObject.btnViewCharacter);
         textTitle = FlashLabel.fromNative(_nativeObject.textTitle);
         txtUserStoryInfo = FlashLabelArea.fromNative(_nativeObject.txtUserStoryInfo);
         txtWriteInfo = FlashLabelArea.fromNative(_nativeObject.txtWriteInfo);
         editLine = new SymbolActiveUserStoryLineGeneric(_nativeObject.editLine);
         btnWrite = new SymbolUiButtonDefaultGeneric(_nativeObject.btnWrite);
         btnTabVoting = new SymbolButtonTabGeneric(_nativeObject.btnTabVoting);
         btnTabHallOfFame = new SymbolButtonTabGeneric(_nativeObject.btnTabHallOfFame);
         btnScrollUp = new SymbolButtonArrowUpGeneric(_nativeObject.btnScrollUp);
         btnScrollDown = new SymbolButtonArrowDownGeneric(_nativeObject.btnScrollDown);
         btnSettings = new SymbolButtonOptionsGeneric(_nativeObject.btnSettings);
         btnHelp = new SymbolButtonHelpGeneric(_nativeObject.btnHelp);
         btnFilter = new SymbolButtonGoalFilterGeneric(_nativeObject.btnFilter);
         filter = new SymbolUserStoryFilterGeneric(_nativeObject.filter);
         btnClose = new SymbolButtonCloseGeneric(_nativeObject.btnClose);
      }
      
      public function setNativeInstance(param1:SymbolDialogUserStory) : void
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
         if(_nativeObject.backgroundSeperator)
         {
            backgroundSeperator.setNativeInstance(_nativeObject.backgroundSeperator);
         }
         if(_nativeObject.votingContent)
         {
            votingContent.setNativeInstance(_nativeObject.votingContent);
         }
         if(_nativeObject.hallOfFameContent)
         {
            hallOfFameContent.setNativeInstance(_nativeObject.hallOfFameContent);
         }
         if(_nativeObject.btnRead)
         {
            btnRead.setNativeInstance(_nativeObject.btnRead);
         }
         if(_nativeObject.btnViewCharacter)
         {
            btnViewCharacter.setNativeInstance(_nativeObject.btnViewCharacter);
         }
         FlashLabel.setNativeInstance(textTitle,_nativeObject.textTitle);
         FlashLabelArea.setNativeInstance(txtUserStoryInfo,_nativeObject.txtUserStoryInfo);
         FlashLabelArea.setNativeInstance(txtWriteInfo,_nativeObject.txtWriteInfo);
         if(_nativeObject.editLine)
         {
            editLine.setNativeInstance(_nativeObject.editLine);
         }
         if(_nativeObject.btnWrite)
         {
            btnWrite.setNativeInstance(_nativeObject.btnWrite);
         }
         if(_nativeObject.btnTabVoting)
         {
            btnTabVoting.setNativeInstance(_nativeObject.btnTabVoting);
         }
         if(_nativeObject.btnTabHallOfFame)
         {
            btnTabHallOfFame.setNativeInstance(_nativeObject.btnTabHallOfFame);
         }
         if(_nativeObject.btnScrollUp)
         {
            btnScrollUp.setNativeInstance(_nativeObject.btnScrollUp);
         }
         if(_nativeObject.btnScrollDown)
         {
            btnScrollDown.setNativeInstance(_nativeObject.btnScrollDown);
         }
         if(_nativeObject.btnSettings)
         {
            btnSettings.setNativeInstance(_nativeObject.btnSettings);
         }
         if(_nativeObject.btnHelp)
         {
            btnHelp.setNativeInstance(_nativeObject.btnHelp);
         }
         if(_nativeObject.btnFilter)
         {
            btnFilter.setNativeInstance(_nativeObject.btnFilter);
         }
         if(_nativeObject.filter)
         {
            filter.setNativeInstance(_nativeObject.filter);
         }
         if(_nativeObject.btnClose)
         {
            btnClose.setNativeInstance(_nativeObject.btnClose);
         }
      }
   }
}
