package visuals.ui.elements.goal
{
   import com.playata.framework.display.Sprite;
   import com.playata.framework.display.lib.flash.FlashDisplayObjectContainer;
   import com.playata.framework.display.lib.flash.FlashSprite;
   import flash.display.MovieClip;
   import visuals.ui.elements.buttons.SymbolButtonTabGeneric;
   
   public class SymbolGoalSummaryGeneric extends Sprite
   {
       
      
      private var _nativeObject:SymbolGoalSummary = null;
      
      public var summary:SymbolGoalSummaryContentGeneric = null;
      
      public var statistics:SymbolGoalStatisticsContentGeneric = null;
      
      public var goalInfo:SymbolGoalInfoGeneric = null;
      
      public var btnTabSummery:SymbolButtonTabGeneric = null;
      
      public var btnTabStatistics:SymbolButtonTabGeneric = null;
      
      public function SymbolGoalSummaryGeneric(param1:MovieClip = null)
      {
         if(param1)
         {
            _nativeObject = param1 as SymbolGoalSummary;
         }
         else
         {
            _nativeObject = new SymbolGoalSummary();
         }
         super(null,FlashSprite.fromNative(_nativeObject));
         var _loc2_:FlashDisplayObjectContainer = _sprite as FlashDisplayObjectContainer;
         summary = new SymbolGoalSummaryContentGeneric(_nativeObject.summary);
         statistics = new SymbolGoalStatisticsContentGeneric(_nativeObject.statistics);
         goalInfo = new SymbolGoalInfoGeneric(_nativeObject.goalInfo);
         btnTabSummery = new SymbolButtonTabGeneric(_nativeObject.btnTabSummery);
         btnTabStatistics = new SymbolButtonTabGeneric(_nativeObject.btnTabStatistics);
      }
      
      public function setNativeInstance(param1:SymbolGoalSummary) : void
      {
         FlashSprite.setNativeInstance(_sprite,param1);
         _nativeObject = param1;
         syncInstances();
      }
      
      public function syncInstances() : void
      {
         if(_nativeObject.summary)
         {
            summary.setNativeInstance(_nativeObject.summary);
         }
         if(_nativeObject.statistics)
         {
            statistics.setNativeInstance(_nativeObject.statistics);
         }
         if(_nativeObject.goalInfo)
         {
            goalInfo.setNativeInstance(_nativeObject.goalInfo);
         }
         if(_nativeObject.btnTabSummery)
         {
            btnTabSummery.setNativeInstance(_nativeObject.btnTabSummery);
         }
         if(_nativeObject.btnTabStatistics)
         {
            btnTabStatistics.setNativeInstance(_nativeObject.btnTabStatistics);
         }
      }
   }
}
