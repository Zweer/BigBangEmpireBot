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
   import visuals.ui.base.SymbolPlaceholderGeneric;
   import visuals.ui.elements.backgrounds.SymbolSlice9BackgroundDialogGeneric;
   import visuals.ui.elements.buttons.SymbolButtonArrowDownGeneric;
   import visuals.ui.elements.buttons.SymbolButtonArrowUpGeneric;
   import visuals.ui.elements.buttons.SymbolButtonCloseGeneric;
   import visuals.ui.elements.event.SymbolEventQuestObjectiveCompleteGeneric;
   import visuals.ui.elements.event.SymbolEventQuestObjectiveInfoGeneric;
   import visuals.ui.elements.event.SymbolEventQuestObjectiveLineGeneric;
   import visuals.ui.elements.generic.SymbolProgressBarBigGeneric;
   
   public class SymbolDialogEventQuestProgressGeneric extends Sprite
   {
       
      
      private var _nativeObject:SymbolDialogEventQuestProgress = null;
      
      public var dialogBackground:SymbolSlice9BackgroundDialogGeneric = null;
      
      public var header:SymbolPlaceholderGeneric = null;
      
      public var btnDown:SymbolButtonArrowDownGeneric = null;
      
      public var btnUp:SymbolButtonArrowUpGeneric = null;
      
      public var txtTimeLeft:ILabel = null;
      
      public var progressBar:SymbolProgressBarBigGeneric = null;
      
      public var txtCompleted:ILabel = null;
      
      public var line1:SymbolEventQuestObjectiveLineGeneric = null;
      
      public var line2:SymbolEventQuestObjectiveLineGeneric = null;
      
      public var line3:SymbolEventQuestObjectiveLineGeneric = null;
      
      public var objectiveInfo:SymbolEventQuestObjectiveInfoGeneric = null;
      
      public var objectiveComplete:SymbolEventQuestObjectiveCompleteGeneric = null;
      
      public var txtDialogTitle:ILabelArea = null;
      
      public var btnClose:SymbolButtonCloseGeneric = null;
      
      public function SymbolDialogEventQuestProgressGeneric(param1:MovieClip = null)
      {
         if(param1)
         {
            _nativeObject = param1 as SymbolDialogEventQuestProgress;
         }
         else
         {
            _nativeObject = new SymbolDialogEventQuestProgress();
         }
         super(null,FlashSprite.fromNative(_nativeObject));
         var _loc2_:FlashDisplayObjectContainer = _sprite as FlashDisplayObjectContainer;
         dialogBackground = new SymbolSlice9BackgroundDialogGeneric(_nativeObject.dialogBackground);
         header = new SymbolPlaceholderGeneric(_nativeObject.header);
         btnDown = new SymbolButtonArrowDownGeneric(_nativeObject.btnDown);
         btnUp = new SymbolButtonArrowUpGeneric(_nativeObject.btnUp);
         txtTimeLeft = FlashLabel.fromNative(_nativeObject.txtTimeLeft);
         progressBar = new SymbolProgressBarBigGeneric(_nativeObject.progressBar);
         txtCompleted = FlashLabel.fromNative(_nativeObject.txtCompleted);
         line1 = new SymbolEventQuestObjectiveLineGeneric(_nativeObject.line1);
         line2 = new SymbolEventQuestObjectiveLineGeneric(_nativeObject.line2);
         line3 = new SymbolEventQuestObjectiveLineGeneric(_nativeObject.line3);
         objectiveInfo = new SymbolEventQuestObjectiveInfoGeneric(_nativeObject.objectiveInfo);
         objectiveComplete = new SymbolEventQuestObjectiveCompleteGeneric(_nativeObject.objectiveComplete);
         txtDialogTitle = FlashLabelArea.fromNative(_nativeObject.txtDialogTitle);
         btnClose = new SymbolButtonCloseGeneric(_nativeObject.btnClose);
      }
      
      public function setNativeInstance(param1:SymbolDialogEventQuestProgress) : void
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
         if(_nativeObject.header)
         {
            header.setNativeInstance(_nativeObject.header);
         }
         if(_nativeObject.btnDown)
         {
            btnDown.setNativeInstance(_nativeObject.btnDown);
         }
         if(_nativeObject.btnUp)
         {
            btnUp.setNativeInstance(_nativeObject.btnUp);
         }
         FlashLabel.setNativeInstance(txtTimeLeft,_nativeObject.txtTimeLeft);
         if(_nativeObject.progressBar)
         {
            progressBar.setNativeInstance(_nativeObject.progressBar);
         }
         FlashLabel.setNativeInstance(txtCompleted,_nativeObject.txtCompleted);
         if(_nativeObject.line1)
         {
            line1.setNativeInstance(_nativeObject.line1);
         }
         if(_nativeObject.line2)
         {
            line2.setNativeInstance(_nativeObject.line2);
         }
         if(_nativeObject.line3)
         {
            line3.setNativeInstance(_nativeObject.line3);
         }
         if(_nativeObject.objectiveInfo)
         {
            objectiveInfo.setNativeInstance(_nativeObject.objectiveInfo);
         }
         if(_nativeObject.objectiveComplete)
         {
            objectiveComplete.setNativeInstance(_nativeObject.objectiveComplete);
         }
         FlashLabelArea.setNativeInstance(txtDialogTitle,_nativeObject.txtDialogTitle);
         if(_nativeObject.btnClose)
         {
            btnClose.setNativeInstance(_nativeObject.btnClose);
         }
      }
   }
}
