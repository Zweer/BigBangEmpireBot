package com.playata.application.ui.elements.goal
{
   import com.playata.application.data.character.Character;
   import com.playata.application.data.goal.Goal;
   import com.playata.application.data.goal.GoalValue;
   import com.playata.application.data.goal.Goals;
   import com.playata.application.data.user.User;
   import com.playata.application.ui.elements.generic.button.UiButton;
   import com.playata.framework.application.Environment;
   import com.playata.framework.core.Runtime;
   import com.playata.framework.input.InteractionEvent;
   import com.playata.framework.localization.LocText;
   import visuals.ui.elements.goal.SymbolGoalListGeneric;
   
   public class UiGoalList
   {
      
      private static const MAX_LINES:int = 5;
      
      private static const SCROLL_VALUE:int = 5;
       
      
      private var _btnScrollUp:UiButton = null;
      
      private var _btnScrollDown:UiButton = null;
      
      private var _line1:UiGoalLine = null;
      
      private var _line2:UiGoalLine = null;
      
      private var _line3:UiGoalLine = null;
      
      private var _line4:UiGoalLine = null;
      
      private var _line5:UiGoalLine = null;
      
      private var _currentGoalValue:GoalValue = null;
      
      private var _selectedLine:UiGoalLine = null;
      
      private var _offset:int = 0;
      
      private var _character:Character = null;
      
      private var _ownGoals:Boolean = false;
      
      private var _listLocked:Boolean = false;
      
      private var _currentCategory:int = -1;
      
      private var _showOpenGoals:Boolean = false;
      
      private var _openGoals:Vector.<Goal> = null;
      
      private var _finishedGoal:Vector.<Goal> = null;
      
      private var _collectableGoalValuesFilteredCount:int = 0;
      
      private var _collectableGoalValuesCount:int = 0;
      
      private var _totalGoalValues:int = 0;
      
      private var _finishedGoalValues:int = 0;
      
      private var _content:SymbolGoalListGeneric = null;
      
      private var _switchToGoalInfoFunction:Function = null;
      
      public function UiGoalList(param1:SymbolGoalListGeneric, param2:Character, param3:Function)
      {
         super();
         _content = param1;
         _switchToGoalInfoFunction = param3;
         _character = param2;
         _ownGoals = _character == User.current.character;
         _content.txtNoGoals.text = LocText.current.text("dialog/goals/no_goals");
         _btnScrollUp = new UiButton(_content.btnUp,"",onClickScrollUp);
         _btnScrollDown = new UiButton(_content.btnDown,"",onClickScrollDown);
         _line1 = new UiGoalLine(_content.line1,selectLine,doubleClickLine,onUpdateStorygoal);
         _line2 = new UiGoalLine(_content.line2,selectLine,doubleClickLine,onUpdateStorygoal);
         _line3 = new UiGoalLine(_content.line3,selectLine,doubleClickLine,onUpdateStorygoal);
         _line4 = new UiGoalLine(_content.line4,selectLine,doubleClickLine,onUpdateStorygoal);
         _line5 = new UiGoalLine(_content.line5,selectLine,doubleClickLine,onUpdateStorygoal);
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
      }
      
      public function scrollToGoal(param1:GoalValue, param2:Boolean, param3:int) : void
      {
         if(!_openGoals)
         {
            refresh(param2,param3);
         }
         var _loc4_:int = _openGoals.indexOf(param1.goal);
         if(_loc4_ >= 0)
         {
            if(_loc4_ >= 5)
            {
               scrollDown(Math.floor(_loc4_ / 5) * 5,false);
            }
            if(_line1.goalValue == param1)
            {
               doubleClickLine(_line1,true);
            }
            else if(_line2.goalValue == param1)
            {
               doubleClickLine(_line2,true);
            }
            else if(_line3.goalValue == param1)
            {
               doubleClickLine(_line3,true);
            }
            else if(_line4.goalValue == param1)
            {
               doubleClickLine(_line4,true);
            }
            else if(_line5.goalValue == param1)
            {
               doubleClickLine(_line5,true);
            }
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
      
      public function scrollUp(param1:int, param2:Boolean) : void
      {
         if(!_btnScrollUp.visible || _content.isTweening || _listLocked)
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
      
      public function scrollDown(param1:int, param2:Boolean) : void
      {
         if(!_btnScrollDown.visible || _content.isTweening || _listLocked)
         {
            return;
         }
         _offset = _offset + param1;
         if(_offset > goalCount - 5)
         {
            _offset = goalCount - 5;
            param2 = false;
         }
         if(param2)
         {
            Environment.audio.playFX("ui_button_click.mp3");
         }
         refreshList();
      }
      
      private function get goalCount() : int
      {
         if(_showOpenGoals)
         {
            return _openGoals.length;
         }
         return _finishedGoal.length;
      }
      
      public function reset() : void
      {
         _offset = 0;
         _selectedLine = null;
      }
      
      public function refresh(param1:Boolean, param2:int, param3:Boolean = false) : void
      {
         var _loc4_:Boolean = false;
         if(param1 != _showOpenGoals || param2 != _currentCategory || param3)
         {
            _loc4_ = true;
         }
         _showOpenGoals = param1;
         _currentCategory = param2;
         refreshList(true,_loc4_);
      }
      
      private function refreshGoalList() : void
      {
         if(_showOpenGoals)
         {
            _openGoals = _character.openGoals(UiGoalFilter.filterLocked,_currentCategory,true,true);
            _collectableGoalValuesFilteredCount = _character.collectableGoalValues(_currentCategory,true).length;
            _collectableGoalValuesCount = _character.collectableGoalValues(_currentCategory).length;
         }
         else
         {
            _finishedGoal = _character.finishedGoals(_currentCategory);
         }
         _finishedGoalValues = _character.finishedGoalValueCount(_currentCategory);
         _totalGoalValues = Goals.instance.totalGoalValues(_currentCategory,_character);
         if(_showOpenGoals)
         {
            _offset = int(Math.max(0,Math.min(_offset,_openGoals.length - 5)));
         }
         else
         {
            _offset = int(Math.max(0,_finishedGoal.length - 5));
         }
      }
      
      private function refreshList(param1:Boolean = false, param2:Boolean = false) : void
      {
         if(_btnScrollDown == null)
         {
            return;
         }
         if(param2)
         {
            refreshGoalList();
         }
         var _loc4_:int = LocText.current.gender;
         LocText.current.gender = !!_character.isMale?1:2;
         if(_selectedLine != null)
         {
            _currentGoalValue = _selectedLine.goalValue;
         }
         var _loc3_:int = 0;
         if(!_showOpenGoals || !_ownGoals)
         {
            _loc3_ = _finishedGoal.length;
            _line1.refreshWithGoal(_character,_loc3_ >= _offset + 1?_finishedGoal[_offset + 0]:null,true);
            _line2.refreshWithGoal(_character,_loc3_ >= _offset + 2?_finishedGoal[_offset + 1]:null,true);
            _line3.refreshWithGoal(_character,_loc3_ >= _offset + 3?_finishedGoal[_offset + 2]:null,true);
            _line4.refreshWithGoal(_character,_loc3_ >= _offset + 4?_finishedGoal[_offset + 3]:null,true);
            _line5.refreshWithGoal(_character,_loc3_ >= _offset + 5?_finishedGoal[_offset + 4]:null,true);
         }
         else
         {
            _loc3_ = _openGoals.length;
            _line1.refreshWithGoal(_character,_loc3_ >= _offset + 1?_openGoals[_offset + 0]:null);
            _line2.refreshWithGoal(_character,_loc3_ >= _offset + 2?_openGoals[_offset + 1]:null);
            _line3.refreshWithGoal(_character,_loc3_ >= _offset + 3?_openGoals[_offset + 2]:null);
            _line4.refreshWithGoal(_character,_loc3_ >= _offset + 4?_openGoals[_offset + 3]:null);
            _line5.refreshWithGoal(_character,_loc3_ >= _offset + 5?_openGoals[_offset + 4]:null);
         }
         if(_showOpenGoals)
         {
            _content.txtCompleted.visible = false;
            _content.txtPending.visible = _collectableGoalValuesCount > 0;
            if(_collectableGoalValuesCount > _collectableGoalValuesFilteredCount)
            {
               _content.txtPending.text = LocText.current.text("dialog/goals/pending_filtered_text",_collectableGoalValuesFilteredCount,_collectableGoalValuesCount - _collectableGoalValuesFilteredCount);
            }
            else
            {
               _content.txtPending.text = LocText.current.text("dialog/goals/pending_text",_collectableGoalValuesCount);
            }
            _content.txtNoGoals.text = LocText.current.text("dialog/goals/filtered_no_goals");
         }
         else
         {
            _content.txtCompleted.visible = true;
            _content.txtPending.visible = false;
            _content.txtCompleted.text = LocText.current.text("dialog/goals/completed_text",_finishedGoalValues,_totalGoalValues,Math.round(_finishedGoalValues / _totalGoalValues * 100));
            _content.txtNoGoals.text = LocText.current.text("dialog/goals/no_goals");
         }
         _content.txtNoGoals.visible = _loc3_ == 0;
         _btnScrollUp.visible = _loc3_ > 5;
         _btnScrollDown.visible = _loc3_ > 5;
         _btnScrollUp.buttonEnabled = _offset > 0;
         _btnScrollDown.buttonEnabled = _offset < _loc3_ - 5;
         LocText.current.gender = _loc4_;
         if(_currentGoalValue != null && !param1)
         {
            if(_line1.goalValue == _currentGoalValue)
            {
               selectLine(_line1);
            }
            else if(_line2.goalValue == _currentGoalValue)
            {
               selectLine(_line2);
            }
            else if(_line3.goalValue == _currentGoalValue)
            {
               selectLine(_line3);
            }
            else if(_line4.goalValue == _currentGoalValue)
            {
               selectLine(_line4);
            }
            else if(_line5.goalValue == _currentGoalValue)
            {
               selectLine(_line5);
            }
            else
            {
               selectLine(null);
            }
         }
         else if(_line1.goalValue != null && param1)
         {
            selectLine(_line1);
         }
         _btnScrollUp.tooltip = LocText.current.text("dialog/goals/scroll_position",Math.ceil(_offset / 5 + 1).toString(),Math.ceil(_loc3_ / 5).toString());
         _btnScrollDown.tooltip = _btnScrollUp.tooltip;
      }
      
      private function selectLine(param1:UiGoalLine) : void
      {
         _selectedLine = param1;
      }
      
      private function doubleClickLine(param1:UiGoalLine, param2:Boolean = false) : void
      {
         if(_listLocked)
         {
            return;
         }
         selectLine(param1);
         §§push(_switchToGoalInfoFunction(_selectedLine.goalValue,param2));
      }
      
      private function onUpdateStorygoal() : void
      {
         _line1.refreshStorygoalCheckbox(_character);
         _line2.refreshStorygoalCheckbox(_character);
         _line3.refreshStorygoalCheckbox(_character);
         _line4.refreshStorygoalCheckbox(_character);
         _line5.refreshStorygoalCheckbox(_character);
      }
      
      public function animateCurrentLine() : void
      {
         var currentLine:UiGoalLine = _selectedLine;
         var currentX:Number = currentLine.content.x;
         var currentY:Number = currentLine.content.y;
         _listLocked = true;
         var refreshCallback:Function = function():void
         {
            currentLine.content.x = currentX;
            currentLine.content.y = currentY;
            currentLine.content.scaleX = 1;
            currentLine.content.scaleY = 1;
            currentLine.content.alpha = 1;
            refreshList(false,true);
            _listLocked = false;
         };
         var removeCallback:Function = function():void
         {
            currentLine.content.tweenTo(0.5,{
               "x":400,
               "y":-40,
               "scaleX":0.1,
               "scaleY":0.1,
               "alpha":0,
               "onComplete":refreshCallback
            });
         };
         Runtime.delayFunction(removeCallback,0.3);
      }
      
      public function get content() : SymbolGoalListGeneric
      {
         return _content;
      }
      
      public function get listLocked() : Boolean
      {
         return _listLocked || _content.isTweening;
      }
      
      public function get currentCategory() : int
      {
         return _currentCategory;
      }
   }
}
