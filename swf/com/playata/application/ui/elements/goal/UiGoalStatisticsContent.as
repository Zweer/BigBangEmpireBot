package com.playata.application.ui.elements.goal
{
   import com.playata.application.data.character.Character;
   import com.playata.application.data.goal.GoalValue;
   import com.playata.application.ui.elements.generic.button.UiButton;
   import com.playata.framework.application.Environment;
   import com.playata.framework.display.InteractiveDisplayObject;
   import com.playata.framework.input.InteractionEvent;
   import com.playata.framework.localization.LocText;
   import visuals.ui.elements.goal.SymbolGoalStatisticsContentGeneric;
   
   public class UiGoalStatisticsContent
   {
      
      private static const MAX_LINES:int = 5;
      
      private static const SCROLL_VALUE:int = 5;
       
      
      private var _content:SymbolGoalStatisticsContentGeneric = null;
      
      private var _line1:UiGoalStatisticsLine = null;
      
      private var _line2:UiGoalStatisticsLine = null;
      
      private var _line3:UiGoalStatisticsLine = null;
      
      private var _line4:UiGoalStatisticsLine = null;
      
      private var _line5:UiGoalStatisticsLine = null;
      
      private var _btnScrollUp:UiButton;
      
      private var _btnScrollDown:UiButton;
      
      private var _mouseLayer:InteractiveDisplayObject;
      
      private var _offset:int = 0;
      
      private var _character:Character;
      
      private var _statisticGoals:Vector.<GoalValue>;
      
      private var _onClickShowGoalValue:Function;
      
      public function UiGoalStatisticsContent(param1:SymbolGoalStatisticsContentGeneric, param2:Function)
      {
         super();
         _content = param1;
         _onClickShowGoalValue = param2;
         _btnScrollUp = new UiButton(_content.btnUp,"",onClickScrollUp);
         _btnScrollDown = new UiButton(_content.btnDown,"",onClickScrollDown);
         _line1 = new UiGoalStatisticsLine(_content.line1,null,doubleClickLine);
         _line2 = new UiGoalStatisticsLine(_content.line2,null,doubleClickLine);
         _line3 = new UiGoalStatisticsLine(_content.line3,null,doubleClickLine);
         _line4 = new UiGoalStatisticsLine(_content.line4,null,doubleClickLine);
         _line5 = new UiGoalStatisticsLine(_content.line5,null,doubleClickLine);
         _mouseLayer = new InteractiveDisplayObject(_content);
         _mouseLayer.onMouseWheel.add(handleMouseWheel);
      }
      
      public function dispose() : void
      {
         _btnScrollUp.dispose();
         _btnScrollUp = null;
         _btnScrollDown.dispose();
         _btnScrollDown = null;
         _line1.dispose();
         _line1 = null;
         _line2.dispose();
         _line2 = null;
         _line3.dispose();
         _line3 = null;
         _line4.dispose();
         _line4 = null;
         _line5.dispose();
         _line5 = null;
         _mouseLayer.onMouseWheel.removeAll();
         _mouseLayer.dispose();
         _mouseLayer = null;
      }
      
      public function get content() : SymbolGoalStatisticsContentGeneric
      {
         return _content;
      }
      
      private function doubleClickLine(param1:UiGoalStatisticsLine) : void
      {
      }
      
      private function handleMouseWheel(param1:InteractionEvent) : void
      {
         if(param1.mouseWheelDelta > 0)
         {
            scrollUp(1,true);
         }
         else
         {
            scrollDown(1,true);
         }
      }
      
      private function onClickScrollUp(param1:InteractionEvent) : void
      {
         scrollUp(5,false);
      }
      
      private function onClickScrollDown(param1:InteractionEvent) : void
      {
         scrollDown(5,false);
      }
      
      private function scrollUp(param1:int, param2:Boolean) : void
      {
         if(!_btnScrollUp.visible)
         {
            return;
         }
         _offset = _offset - param1;
         if(_offset < 0)
         {
            _offset = 0;
            param2 = false;
         }
         if(param2)
         {
            Environment.audio.playFX("ui_button_click.mp3");
         }
         refreshList();
      }
      
      private function scrollDown(param1:int, param2:Boolean) : void
      {
         if(!_btnScrollDown.visible)
         {
            return;
         }
         _offset = _offset + param1;
         if(_offset > _statisticGoals.length - 5)
         {
            _offset = _statisticGoals.length - 5;
            param2 = false;
         }
         if(param2)
         {
            Environment.audio.playFX("ui_button_click.mp3");
         }
         refreshList();
      }
      
      public function refresh(param1:Character) : void
      {
         _character = param1;
         _statisticGoals = param1.statisticGoalValues;
         refreshList();
      }
      
      private function refreshList() : void
      {
         if(_btnScrollDown == null)
         {
            return;
         }
         var _loc1_:int = LocText.current.gender;
         LocText.current.gender = !!_character.isMale?1:2;
         _btnScrollUp.visible = _statisticGoals.length > 5;
         _btnScrollDown.visible = _statisticGoals.length > 5;
         _btnScrollUp.buttonEnabled = _offset > 0;
         _btnScrollDown.buttonEnabled = _offset < _statisticGoals.length - 5;
         _line1.refresh(_character,_statisticGoals.length >= _offset + 1?_statisticGoals[_offset + 0]:null,1);
         _line2.refresh(_character,_statisticGoals.length >= _offset + 2?_statisticGoals[_offset + 1]:null,2);
         _line3.refresh(_character,_statisticGoals.length >= _offset + 3?_statisticGoals[_offset + 2]:null,3);
         _line4.refresh(_character,_statisticGoals.length >= _offset + 4?_statisticGoals[_offset + 3]:null,4);
         _line5.refresh(_character,_statisticGoals.length >= _offset + 5?_statisticGoals[_offset + 4]:null,5);
         LocText.current.gender = _loc1_;
         _btnScrollUp.tooltip = LocText.current.text("dialog/goals/scroll_position",Math.ceil(_offset / 5 + 1).toString(),Math.ceil(_statisticGoals.length / 5).toString());
         _btnScrollDown.tooltip = _btnScrollUp.tooltip;
      }
   }
}
