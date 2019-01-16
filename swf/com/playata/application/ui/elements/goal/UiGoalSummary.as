package com.playata.application.ui.elements.goal
{
   import com.playata.application.data.character.Character;
   import com.playata.application.data.goal.GoalValue;
   import com.playata.application.ui.elements.generic.tab.UiTabButton;
   import com.playata.framework.input.InteractionEvent;
   import com.playata.framework.localization.LocText;
   import visuals.ui.elements.goal.SymbolGoalSummaryGeneric;
   
   public class UiGoalSummary
   {
       
      
      private var _content:SymbolGoalSummaryGeneric = null;
      
      private var _btnTabSummery:UiTabButton;
      
      private var _btnTabStatistics:UiTabButton;
      
      private var _summeryContent:UiGoalSummaryContent;
      
      private var _statisticsContent:UiGoalStatisticsContent;
      
      private var _character:Character = null;
      
      private var _goalInfo:UiGoalInfo;
      
      public function UiGoalSummary(param1:SymbolGoalSummaryGeneric, param2:Character, param3:Function)
      {
         super();
         _content = param1;
         _btnTabSummery = new UiTabButton(param1.btnTabSummery,LocText.current.text("dialog/goal_summery/button_summery"),"",onClickTabSummery);
         _btnTabStatistics = new UiTabButton(param1.btnTabStatistics,LocText.current.text("dialog/goal_summery/button_statistics"),"",onClickTabStatistics);
         _btnTabSummery.tabbed = true;
         _btnTabStatistics.tabbed = false;
         _summeryContent = new UiGoalSummaryContent(param1.summary,param2,param3);
         _summeryContent.content.visible = true;
         _statisticsContent = new UiGoalStatisticsContent(param1.statistics,onClickSwitchToInfo);
         _statisticsContent.content.visible = false;
         _goalInfo = new UiGoalInfo(param1.goalInfo,switchToList);
         param1.goalInfo.x = 1000;
      }
      
      public function dispose() : void
      {
         _btnTabSummery.dispose();
         _btnTabSummery = null;
         _btnTabStatistics.dispose();
         _btnTabStatistics = null;
         _summeryContent.dispose();
         _summeryContent = null;
         _statisticsContent.dispose();
         _statisticsContent = null;
      }
      
      public function get content() : SymbolGoalSummaryGeneric
      {
         return _content;
      }
      
      private function onClickTabSummery(param1:InteractionEvent) : void
      {
         _summeryContent.content.visible = true;
         _statisticsContent.content.visible = false;
         _btnTabSummery.tabbed = true;
         _btnTabStatistics.tabbed = false;
         _summeryContent.refresh(_character);
         switchToList();
      }
      
      private function onClickTabStatistics(param1:InteractionEvent) : void
      {
         _summeryContent.content.visible = false;
         _statisticsContent.content.visible = true;
         _btnTabSummery.tabbed = false;
         _btnTabStatistics.tabbed = true;
         _statisticsContent.refresh(_character);
         switchToList();
      }
      
      public function refresh(param1:Character) : void
      {
         _character = param1;
         if(!_character.isMe)
         {
            _btnTabStatistics.visible = false;
            _btnTabSummery.visible = false;
            _summeryContent.content.visible = true;
            _statisticsContent.content.visible = false;
         }
         if(_summeryContent.content.visible)
         {
            _summeryContent.refresh(_character);
         }
         if(_statisticsContent.content.visible)
         {
            _statisticsContent.refresh(_character);
         }
      }
      
      private function switchToList(param1:Boolean = false) : void
      {
         if(!_summeryContent)
         {
            return;
         }
         var _loc2_:* = 0.3;
         _goalInfo.content.tweenTo(_loc2_,{"x":1000});
         _statisticsContent.content.tweenTo(_loc2_,{"x":-4});
         _summeryContent.content.tweenTo(_loc2_,{"x":-4});
      }
      
      private function onClickSwitchToInfo(param1:GoalValue) : void
      {
         if(!_summeryContent)
         {
            return;
         }
         _goalInfo.refresh(_character,param1);
         switchToInfo();
      }
      
      private function switchToInfo() : void
      {
         if(!_summeryContent)
         {
            return;
         }
         var _loc1_:* = 0.3;
         _goalInfo.content.tweenTo(_loc1_,{"x":300});
         _statisticsContent.content.tweenTo(_loc1_,{"x":-1000});
         _summeryContent.content.tweenTo(_loc1_,{"x":-1000});
      }
   }
}
