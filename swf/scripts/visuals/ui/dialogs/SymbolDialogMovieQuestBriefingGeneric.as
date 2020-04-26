package visuals.ui.dialogs
{
   import com.playata.framework.display.Sprite;
   import com.playata.framework.display.lib.flash.FlashDisplayObjectContainer;
   import com.playata.framework.display.lib.flash.FlashLabel;
   import com.playata.framework.display.lib.flash.FlashSprite;
   import com.playata.framework.display.ui.controls.ILabel;
   import flash.display.MovieClip;
   import visuals.ui.base.SymbolUiButtonDefaultGeneric;
   import visuals.ui.elements.backgrounds.SymbolSlice9BackgroundDialogGeneric;
   import visuals.ui.elements.buttons.SymbolButtonArrowLeftGeneric;
   import visuals.ui.elements.buttons.SymbolButtonArrowRightGeneric;
   import visuals.ui.elements.buttons.SymbolButtonCloseGeneric;
   import visuals.ui.elements.quest.SymbolMovieQuestBriefingContentGeneric;
   
   public class SymbolDialogMovieQuestBriefingGeneric extends Sprite
   {
       
      
      private var _nativeObject:SymbolDialogMovieQuestBriefing = null;
      
      public var dialogBackground:SymbolSlice9BackgroundDialogGeneric = null;
      
      public var btnClose:SymbolButtonCloseGeneric = null;
      
      public var questContent:SymbolMovieQuestBriefingContentGeneric = null;
      
      public var txtType:ILabel = null;
      
      public var btnStartQuest:SymbolUiButtonDefaultGeneric = null;
      
      public var btnPreviousQuest:SymbolButtonArrowLeftGeneric = null;
      
      public var btnNextQuest:SymbolButtonArrowRightGeneric = null;
      
      public function SymbolDialogMovieQuestBriefingGeneric(param1:MovieClip = null)
      {
         if(param1)
         {
            _nativeObject = param1 as SymbolDialogMovieQuestBriefing;
         }
         else
         {
            _nativeObject = new SymbolDialogMovieQuestBriefing();
         }
         super(null,FlashSprite.fromNative(_nativeObject));
         var _loc2_:FlashDisplayObjectContainer = _sprite as FlashDisplayObjectContainer;
         dialogBackground = new SymbolSlice9BackgroundDialogGeneric(_nativeObject.dialogBackground);
         btnClose = new SymbolButtonCloseGeneric(_nativeObject.btnClose);
         questContent = new SymbolMovieQuestBriefingContentGeneric(_nativeObject.questContent);
         txtType = FlashLabel.fromNative(_nativeObject.txtType);
         btnStartQuest = new SymbolUiButtonDefaultGeneric(_nativeObject.btnStartQuest);
         btnPreviousQuest = new SymbolButtonArrowLeftGeneric(_nativeObject.btnPreviousQuest);
         btnNextQuest = new SymbolButtonArrowRightGeneric(_nativeObject.btnNextQuest);
      }
      
      public function setNativeInstance(param1:SymbolDialogMovieQuestBriefing) : void
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
         if(_nativeObject.btnClose)
         {
            btnClose.setNativeInstance(_nativeObject.btnClose);
         }
         if(_nativeObject.questContent)
         {
            questContent.setNativeInstance(_nativeObject.questContent);
         }
         FlashLabel.setNativeInstance(txtType,_nativeObject.txtType);
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
      }
   }
}
