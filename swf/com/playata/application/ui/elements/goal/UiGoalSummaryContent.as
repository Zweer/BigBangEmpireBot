package com.playata.application.ui.elements.goal
{
   import com.playata.application.data.character.Character;
   import com.playata.application.data.goal.GoalValue;
   import com.playata.framework.localization.LocText;
   import visuals.ui.elements.goal.SymbolGoalSummaryContentGeneric;
   
   public class UiGoalSummaryContent
   {
       
      
      private var _content:SymbolGoalSummaryContentGeneric = null;
      
      private var _line1:UiGoalLine = null;
      
      private var _line2:UiGoalLine = null;
      
      private var _progressMain:UiGoalProgressSummaryMainCategory = null;
      
      private var _progressCategory1:UiGoalProgressSummaryCategory = null;
      
      private var _progressCategory2:UiGoalProgressSummaryCategory = null;
      
      private var _progressCategory3:UiGoalProgressSummaryCategory = null;
      
      private var _progressCategory4:UiGoalProgressSummaryCategory = null;
      
      private var _progressCategory5:UiGoalProgressSummaryCategory = null;
      
      private var _onClickSwitchToInfo:Function = null;
      
      public function UiGoalSummaryContent(param1:SymbolGoalSummaryContentGeneric, param2:Character, param3:Function, param4:Function)
      {
         super();
         _content = param1;
         _onClickSwitchToInfo = param4;
         _content.txtRecentGoalsCaption.text = LocText.current.text("dialog/goals/summary/recent_caption");
         _content.txtNoGoals.text = LocText.current.text("dialog/goals/summary/no_completed_goals");
         _line1 = new UiGoalLine(_content.line1,null,doubleClickLine,null);
         _line2 = new UiGoalLine(_content.line2,null,doubleClickLine,null);
         _progressMain = new UiGoalProgressSummaryMainCategory(_content.progressMain,param2,param3);
         _progressCategory1 = new UiGoalProgressSummaryCategory(_content.progressCategory1,param2,LocText.current.text("dialog/goals/category/character"),1,param3);
         _progressCategory2 = new UiGoalProgressSummaryCategory(_content.progressCategory3,param2,LocText.current.text("dialog/goals/category/shop"),2,param3);
         _progressCategory3 = new UiGoalProgressSummaryCategory(_content.progressCategory2,param2,LocText.current.text("dialog/goals/category/quest"),3,param3);
         _progressCategory4 = new UiGoalProgressSummaryCategory(_content.progressCategory4,param2,LocText.current.text("dialog/goals/category/duels"),4,param3);
         _progressCategory5 = new UiGoalProgressSummaryCategory(_content.progressCategory5,param2,LocText.current.text("dialog/goals/category/guild"),5,param3);
      }
      
      public function dispose() : void
      {
         _line1.dispose();
         _line1 = null;
         _line2.dispose();
         _line2 = null;
      }
      
      private function doubleClickLine(param1:UiGoalLine) : void
      {
      }
      
      public function get content() : SymbolGoalSummaryContentGeneric
      {
         return _content;
      }
      
      public function refresh(param1:Character) : void
      {
         var _loc2_:Vector.<GoalValue> = param1.recentGoalValues(0,2);
         _line1.refresh(param1,_loc2_.length > 0?_loc2_[0]:null);
         _line2.refresh(param1,_loc2_.length > 1?_loc2_[1]:null);
         _content.txtNoGoals.visible = _loc2_.length <= 0;
         _progressMain.refresh(param1);
         _progressCategory1.refresh();
         _progressCategory2.refresh();
         _progressCategory3.refresh();
         _progressCategory4.refresh();
         _progressCategory5.refresh();
      }
   }
}
