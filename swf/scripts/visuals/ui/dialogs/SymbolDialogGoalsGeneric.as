package visuals.ui.dialogs
{
   import com.playata.framework.display.Sprite;
   import com.playata.framework.display.lib.flash.FlashDisplayObjectContainer;
   import com.playata.framework.display.lib.flash.FlashLabelArea;
   import com.playata.framework.display.lib.flash.FlashSprite;
   import com.playata.framework.display.ui.controls.ILabelArea;
   import flash.display.MovieClip;
   import visuals.ui.base.SymbolPlaceholderGeneric;
   import visuals.ui.elements.backgrounds.SymbolSlice9BackgroundDialogGeneric;
   import visuals.ui.elements.buttons.SymbolButtonCloseGeneric;
   import visuals.ui.elements.buttons.SymbolButtonGoalFilterGeneric;
   import visuals.ui.elements.buttons.SymbolButtonHelpGeneric;
   import visuals.ui.elements.buttons.SymbolButtonTabGeneric;
   import visuals.ui.elements.goal.SymbolGoalFilterGeneric;
   import visuals.ui.elements.goal.SymbolGoalInfoGeneric;
   import visuals.ui.elements.goal.SymbolGoalListGeneric;
   import visuals.ui.elements.goal.SymbolGoalSheetGeneric;
   import visuals.ui.elements.goal.SymbolGoalSummaryGeneric;
   
   public class SymbolDialogGoalsGeneric extends Sprite
   {
       
      
      private var _nativeObject:SymbolDialogGoals = null;
      
      public var background:SymbolSlice9BackgroundDialogGeneric = null;
      
      public var txtTitle:ILabelArea = null;
      
      public var sheetLayer:SymbolPlaceholderGeneric = null;
      
      public var btnTabFinished:SymbolButtonTabGeneric = null;
      
      public var btnTabOpen:SymbolButtonTabGeneric = null;
      
      public var goalList:SymbolGoalListGeneric = null;
      
      public var goalInfo:SymbolGoalInfoGeneric = null;
      
      public var btnFilter:SymbolButtonGoalFilterGeneric = null;
      
      public var goalFilter:SymbolGoalFilterGeneric = null;
      
      public var goalSummary:SymbolGoalSummaryGeneric = null;
      
      public var sheet1:SymbolGoalSheetGeneric = null;
      
      public var sheet2:SymbolGoalSheetGeneric = null;
      
      public var sheet3:SymbolGoalSheetGeneric = null;
      
      public var sheet4:SymbolGoalSheetGeneric = null;
      
      public var sheet5:SymbolGoalSheetGeneric = null;
      
      public var sheet6:SymbolGoalSheetGeneric = null;
      
      public var sheetSummary:SymbolGoalSheetGeneric = null;
      
      public var btnHelp:SymbolButtonHelpGeneric = null;
      
      public var btnClose:SymbolButtonCloseGeneric = null;
      
      public function SymbolDialogGoalsGeneric(param1:MovieClip = null)
      {
         if(param1)
         {
            _nativeObject = param1 as SymbolDialogGoals;
         }
         else
         {
            _nativeObject = new SymbolDialogGoals();
         }
         super(null,FlashSprite.fromNative(_nativeObject));
         var _loc2_:FlashDisplayObjectContainer = _sprite as FlashDisplayObjectContainer;
         background = new SymbolSlice9BackgroundDialogGeneric(_nativeObject.background);
         txtTitle = FlashLabelArea.fromNative(_nativeObject.txtTitle);
         sheetLayer = new SymbolPlaceholderGeneric(_nativeObject.sheetLayer);
         btnTabFinished = new SymbolButtonTabGeneric(_nativeObject.btnTabFinished);
         btnTabOpen = new SymbolButtonTabGeneric(_nativeObject.btnTabOpen);
         goalList = new SymbolGoalListGeneric(_nativeObject.goalList);
         goalInfo = new SymbolGoalInfoGeneric(_nativeObject.goalInfo);
         btnFilter = new SymbolButtonGoalFilterGeneric(_nativeObject.btnFilter);
         goalFilter = new SymbolGoalFilterGeneric(_nativeObject.goalFilter);
         goalSummary = new SymbolGoalSummaryGeneric(_nativeObject.goalSummary);
         sheet1 = new SymbolGoalSheetGeneric(_nativeObject.sheet1);
         sheet2 = new SymbolGoalSheetGeneric(_nativeObject.sheet2);
         sheet3 = new SymbolGoalSheetGeneric(_nativeObject.sheet3);
         sheet4 = new SymbolGoalSheetGeneric(_nativeObject.sheet4);
         sheet5 = new SymbolGoalSheetGeneric(_nativeObject.sheet5);
         sheet6 = new SymbolGoalSheetGeneric(_nativeObject.sheet6);
         sheetSummary = new SymbolGoalSheetGeneric(_nativeObject.sheetSummary);
         btnHelp = new SymbolButtonHelpGeneric(_nativeObject.btnHelp);
         btnClose = new SymbolButtonCloseGeneric(_nativeObject.btnClose);
      }
      
      public function setNativeInstance(param1:SymbolDialogGoals) : void
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
         FlashLabelArea.setNativeInstance(txtTitle,_nativeObject.txtTitle);
         if(_nativeObject.sheetLayer)
         {
            sheetLayer.setNativeInstance(_nativeObject.sheetLayer);
         }
         if(_nativeObject.btnTabFinished)
         {
            btnTabFinished.setNativeInstance(_nativeObject.btnTabFinished);
         }
         if(_nativeObject.btnTabOpen)
         {
            btnTabOpen.setNativeInstance(_nativeObject.btnTabOpen);
         }
         if(_nativeObject.goalList)
         {
            goalList.setNativeInstance(_nativeObject.goalList);
         }
         if(_nativeObject.goalInfo)
         {
            goalInfo.setNativeInstance(_nativeObject.goalInfo);
         }
         if(_nativeObject.btnFilter)
         {
            btnFilter.setNativeInstance(_nativeObject.btnFilter);
         }
         if(_nativeObject.goalFilter)
         {
            goalFilter.setNativeInstance(_nativeObject.goalFilter);
         }
         if(_nativeObject.goalSummary)
         {
            goalSummary.setNativeInstance(_nativeObject.goalSummary);
         }
         if(_nativeObject.sheet1)
         {
            sheet1.setNativeInstance(_nativeObject.sheet1);
         }
         if(_nativeObject.sheet2)
         {
            sheet2.setNativeInstance(_nativeObject.sheet2);
         }
         if(_nativeObject.sheet3)
         {
            sheet3.setNativeInstance(_nativeObject.sheet3);
         }
         if(_nativeObject.sheet4)
         {
            sheet4.setNativeInstance(_nativeObject.sheet4);
         }
         if(_nativeObject.sheet5)
         {
            sheet5.setNativeInstance(_nativeObject.sheet5);
         }
         if(_nativeObject.sheet6)
         {
            sheet6.setNativeInstance(_nativeObject.sheet6);
         }
         if(_nativeObject.sheetSummary)
         {
            sheetSummary.setNativeInstance(_nativeObject.sheetSummary);
         }
         if(_nativeObject.btnHelp)
         {
            btnHelp.setNativeInstance(_nativeObject.btnHelp);
         }
         if(_nativeObject.btnClose)
         {
            btnClose.setNativeInstance(_nativeObject.btnClose);
         }
      }
   }
}
