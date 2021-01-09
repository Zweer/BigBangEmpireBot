package visuals.ui.elements.goal
{
   import com.playata.framework.display.Sprite;
   import com.playata.framework.display.lib.flash.FlashDisplayObjectContainer;
   import com.playata.framework.display.lib.flash.FlashLabelArea;
   import com.playata.framework.display.lib.flash.FlashSprite;
   import com.playata.framework.display.ui.controls.ILabelArea;
   import flash.display.MovieClip;
   
   public class SymbolGoalSummaryContentGeneric extends Sprite
   {
       
      
      private var _nativeObject:SymbolGoalSummaryContent = null;
      
      public var symbolGoalHighlight:SymbolGoalHighlightGeneric = null;
      
      public var progressCategory1:SymbolGoalProgressSummaryCategoryGeneric = null;
      
      public var progressCategory2:SymbolGoalProgressSummaryCategoryGeneric = null;
      
      public var progressCategory3:SymbolGoalProgressSummaryCategoryGeneric = null;
      
      public var progressCategory4:SymbolGoalProgressSummaryCategoryGeneric = null;
      
      public var progressCategory5:SymbolGoalProgressSummaryCategoryGeneric = null;
      
      public var line1:SymbolGoalLineGeneric = null;
      
      public var line2:SymbolGoalLineGeneric = null;
      
      public var txtRecentGoalsCaption:ILabelArea = null;
      
      public var txtNoGoals:ILabelArea = null;
      
      public var progressMain:SymbolGoalProgressSummaryMainBarGeneric = null;
      
      public function SymbolGoalSummaryContentGeneric(param1:MovieClip = null)
      {
         if(param1)
         {
            _nativeObject = param1 as SymbolGoalSummaryContent;
         }
         else
         {
            _nativeObject = new SymbolGoalSummaryContent();
         }
         super(null,FlashSprite.fromNative(_nativeObject));
         var _loc2_:FlashDisplayObjectContainer = _sprite as FlashDisplayObjectContainer;
         symbolGoalHighlight = new SymbolGoalHighlightGeneric(_nativeObject.symbolGoalHighlight);
         progressCategory1 = new SymbolGoalProgressSummaryCategoryGeneric(_nativeObject.progressCategory1);
         progressCategory2 = new SymbolGoalProgressSummaryCategoryGeneric(_nativeObject.progressCategory2);
         progressCategory3 = new SymbolGoalProgressSummaryCategoryGeneric(_nativeObject.progressCategory3);
         progressCategory4 = new SymbolGoalProgressSummaryCategoryGeneric(_nativeObject.progressCategory4);
         progressCategory5 = new SymbolGoalProgressSummaryCategoryGeneric(_nativeObject.progressCategory5);
         line1 = new SymbolGoalLineGeneric(_nativeObject.line1);
         line2 = new SymbolGoalLineGeneric(_nativeObject.line2);
         txtRecentGoalsCaption = FlashLabelArea.fromNative(_nativeObject.txtRecentGoalsCaption);
         txtNoGoals = FlashLabelArea.fromNative(_nativeObject.txtNoGoals);
         progressMain = new SymbolGoalProgressSummaryMainBarGeneric(_nativeObject.progressMain);
      }
      
      public function setNativeInstance(param1:SymbolGoalSummaryContent) : void
      {
         FlashSprite.setNativeInstance(_sprite,param1);
         _nativeObject = param1;
         syncInstances();
      }
      
      public function syncInstances() : void
      {
         if(_nativeObject.symbolGoalHighlight)
         {
            symbolGoalHighlight.setNativeInstance(_nativeObject.symbolGoalHighlight);
         }
         if(_nativeObject.progressCategory1)
         {
            progressCategory1.setNativeInstance(_nativeObject.progressCategory1);
         }
         if(_nativeObject.progressCategory2)
         {
            progressCategory2.setNativeInstance(_nativeObject.progressCategory2);
         }
         if(_nativeObject.progressCategory3)
         {
            progressCategory3.setNativeInstance(_nativeObject.progressCategory3);
         }
         if(_nativeObject.progressCategory4)
         {
            progressCategory4.setNativeInstance(_nativeObject.progressCategory4);
         }
         if(_nativeObject.progressCategory5)
         {
            progressCategory5.setNativeInstance(_nativeObject.progressCategory5);
         }
         if(_nativeObject.line1)
         {
            line1.setNativeInstance(_nativeObject.line1);
         }
         if(_nativeObject.line2)
         {
            line2.setNativeInstance(_nativeObject.line2);
         }
         FlashLabelArea.setNativeInstance(txtRecentGoalsCaption,_nativeObject.txtRecentGoalsCaption);
         FlashLabelArea.setNativeInstance(txtNoGoals,_nativeObject.txtNoGoals);
         if(_nativeObject.progressMain)
         {
            progressMain.setNativeInstance(_nativeObject.progressMain);
         }
      }
   }
}
