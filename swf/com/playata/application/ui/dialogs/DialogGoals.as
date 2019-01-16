package com.playata.application.ui.dialogs
{
   import com.playata.application.data.character.Character;
   import com.playata.application.data.goal.Goal;
   import com.playata.application.data.goal.GoalValue;
   import com.playata.application.data.goal.Goals;
   import com.playata.application.data.user.User;
   import com.playata.application.ui.ViewManager;
   import com.playata.application.ui.elements.generic.button.UiButton;
   import com.playata.application.ui.elements.generic.dialog.UiDialog;
   import com.playata.application.ui.elements.generic.tab.UiTabButton;
   import com.playata.application.ui.elements.goal.UiGoalComplete;
   import com.playata.application.ui.elements.goal.UiGoalFilter;
   import com.playata.application.ui.elements.goal.UiGoalInfo;
   import com.playata.application.ui.elements.goal.UiGoalLine;
   import com.playata.application.ui.elements.goal.UiGoalSheet;
   import com.playata.application.ui.elements.goal.UiGoalSummary;
   import com.playata.framework.application.Environment;
   import com.playata.framework.core.Runtime;
   import com.playata.framework.input.IInteractionTarget;
   import com.playata.framework.input.InteractionEvent;
   import com.playata.framework.localization.LocText;
   import visuals.ui.dialogs.SymbolDialogGoalsGeneric;
   
   public class DialogGoals extends UiDialog
   {
      
      private static var _ownDialogOpen:Boolean = false;
      
      private static const MAX_LINES:int = 4;
      
      private static const SCROLL_VALUE:int = 4;
       
      
      private var _btnHelp:UiButton = null;
      
      private var _btnClose:UiButton = null;
      
      private var _btnTabOpen:UiTabButton = null;
      
      private var _btnTabFinished:UiTabButton = null;
      
      private var _btnScrollUp:UiButton = null;
      
      private var _btnScrollDown:UiButton = null;
      
      private var _btnFilter:UiButton = null;
      
      private var _line1:UiGoalLine = null;
      
      private var _line2:UiGoalLine = null;
      
      private var _line3:UiGoalLine = null;
      
      private var _line4:UiGoalLine = null;
      
      private var _goalInfo:UiGoalInfo = null;
      
      private var _goalComplete:UiGoalComplete = null;
      
      private var _goalSummary:UiGoalSummary = null;
      
      private var _currentGoalValue:GoalValue = null;
      
      private var _selectedLine:UiGoalLine = null;
      
      private var _offset:int = 0;
      
      private var _character:Character = null;
      
      private var _ownGoals:Boolean = false;
      
      private var _listLocked:Boolean = false;
      
      private var _currentCategory:int = 0;
      
      private var _sheetSummary:UiGoalSheet = null;
      
      private var _sheet1:UiGoalSheet = null;
      
      private var _sheet2:UiGoalSheet = null;
      
      private var _sheet3:UiGoalSheet = null;
      
      private var _sheet4:UiGoalSheet = null;
      
      private var _sheet5:UiGoalSheet = null;
      
      private var _sheet6:UiGoalSheet = null;
      
      private var _goalFilter:UiGoalFilter = null;
      
      private var _openGoalValues:Vector.<GoalValue> = null;
      
      private var _finishedGoalValues:Vector.<GoalValue> = null;
      
      private var _collectableGoalValuesFiltered:Vector.<GoalValue> = null;
      
      private var _collectableGoalValues:Vector.<GoalValue> = null;
      
      private var _totalGoalValues:int = 0;
      
      public function DialogGoals(param1:Character, param2:GoalValue = null)
      {
         var _loc4_:int = 0;
         var _loc3_:SymbolDialogGoalsGeneric = new SymbolDialogGoalsGeneric();
         super(_loc3_);
         _queued = false;
         _character = param1;
         _ownGoals = _character == User.current.character;
         if(_ownGoals)
         {
            ownDialogOpen = true;
            ViewManager.instance.tutorialArrow.hide();
         }
         ViewManager.instance.baseUserPanel.refreshGoalIcon();
         _loc3_.txtNoGoals.text = LocText.current.text("dialog/goals/no_goals");
         if(_ownGoals)
         {
            _loc3_.txtTitle.text = LocText.current.text("dialog/goals/own_title");
         }
         else
         {
            _loc3_.txtTitle.text = LocText.current.text("dialog/goals/other_title",param1.name);
            _loc3_.txtTitle.y = _loc3_.txtTitle.y - 10;
         }
         _btnClose = new UiButton(_loc3_.btnClose,"",onClickClose);
         _btnHelp = new UiButton(_loc3_.btnHelp,LocText.current.text("general/button_help"),onClickHelp);
         _btnTabOpen = new UiTabButton(_loc3_.btnTabOpen,LocText.current.text("dialog/goals/button_open",""),"",onClickTabOpen);
         _btnTabFinished = new UiTabButton(_loc3_.btnTabFinished,LocText.current.text("dialog/goals/button_finished",""),"",onClickTabFinished);
         _btnScrollUp = new UiButton(_loc3_.btnUp,"",onClickScrollUp);
         _btnScrollDown = new UiButton(_loc3_.btnDown,"",onClickScrollDown);
         _btnFilter = new UiButton(_loc3_.btnFilter,"",onClickFilter);
         _sheetSummary = new UiGoalSheet(_loc3_.sheetSummary,LocText.current.text("dialog/goals/category/summary"),"",onSheetChange);
         _sheet1 = new UiGoalSheet(_loc3_.sheet1,LocText.current.text("dialog/goals/category/all"),"",onSheetChange);
         _sheet2 = new UiGoalSheet(_loc3_.sheet2,LocText.current.text("dialog/goals/category/character"),"",onSheetChange);
         _sheet3 = new UiGoalSheet(_loc3_.sheet4,LocText.current.text("dialog/goals/category/shop"),"",onSheetChange);
         _sheet4 = new UiGoalSheet(_loc3_.sheet3,LocText.current.text("dialog/goals/category/quest"),"",onSheetChange);
         _sheet5 = new UiGoalSheet(_loc3_.sheet5,LocText.current.text("dialog/goals/category/duels"),"",onSheetChange);
         _sheet6 = new UiGoalSheet(_loc3_.sheet6,LocText.current.text("dialog/goals/category/guild"),"",onSheetChange);
         _goalFilter = new UiGoalFilter(_loc3_.goalFilter,onFilterChanged);
         _sheetSummary.tabbed = true;
         _sheet1.tabbed = false;
         _sheet2.tabbed = false;
         _sheet3.tabbed = false;
         _sheet4.tabbed = false;
         _sheet5.tabbed = false;
         _sheet6.tabbed = false;
         if(_ownGoals)
         {
            _btnTabOpen.tabbed = true;
            _btnTabFinished.tabbed = false;
         }
         else
         {
            _btnTabOpen.tabbed = false;
            _btnTabFinished.tabbed = true;
            _btnTabOpen.visible = false;
            _btnTabFinished.visible = false;
         }
         _loc3_.sheetLayer.removeAllChildren();
         _loc3_.sheetLayer.addChild(_sheetSummary);
         _loc3_.sheetLayer.addChild(_sheet1);
         _loc3_.sheetLayer.addChild(_sheet2);
         _loc3_.sheetLayer.addChild(_sheet3);
         _loc3_.sheetLayer.addChild(_sheet4);
         _loc3_.sheetLayer.addChild(_sheet5);
         _loc3_.sheetLayer.addChild(_sheet6);
         _line1 = new UiGoalLine(_loc3_.line1,selectLine,doubleClickLine,onUpdateStorygoal);
         _line2 = new UiGoalLine(_loc3_.line2,selectLine,doubleClickLine,onUpdateStorygoal);
         _line3 = new UiGoalLine(_loc3_.line3,selectLine,doubleClickLine,onUpdateStorygoal);
         _line4 = new UiGoalLine(_loc3_.line4,selectLine,doubleClickLine,onUpdateStorygoal);
         _goalInfo = new UiGoalInfo(_loc3_.goalInfo,switchToList);
         _goalComplete = new UiGoalComplete(_loc3_.goalComplete,switchToList,close);
         _goalSummary = new UiGoalSummary(_loc3_.goalSummary,_character,onClickSwitchCategory);
         _goalSummary.content.visible = false;
         onMouseWheel.add(handleMouseWheel);
         _loc3_.goalInfo.x = 630;
         _loc3_.goalComplete.x = 630;
         if(param2)
         {
            _sheetSummary.tabbed = false;
            _sheet1.tabbed = true;
            refreshList(false,true);
            _loc4_ = _openGoalValues.indexOf(param2);
            if(_loc4_ >= 0)
            {
               if(_loc4_ >= 4)
               {
                  scrollDown(Math.floor(_loc4_ / 4) * 4,false);
               }
               if(_line1.goalValue == param2)
               {
                  doubleClickLine(_line1,true);
               }
               else if(_line2.goalValue == param2)
               {
                  doubleClickLine(_line2,true);
               }
               else if(_line3.goalValue == param2)
               {
                  doubleClickLine(_line3,true);
               }
               else if(_line4.goalValue == param2)
               {
                  doubleClickLine(_line4,true);
               }
            }
         }
         else if(_ownGoals)
         {
            sheetChange(_sheet1);
         }
         else
         {
            sheetChange(_sheetSummary);
         }
      }
      
      public static function get ownDialogOpen() : Boolean
      {
         return _ownDialogOpen;
      }
      
      public static function set ownDialogOpen(param1:Boolean) : void
      {
         _ownDialogOpen = param1;
      }
      
      override public function dispose() : void
      {
         var _loc1_:SymbolDialogGoalsGeneric = _vo as SymbolDialogGoalsGeneric;
         _loc1_.sheetLayer.removeChild(_sheetSummary);
         _loc1_.sheetLayer.removeChild(_sheet1);
         _loc1_.sheetLayer.removeChild(_sheet2);
         _loc1_.sheetLayer.removeChild(_sheet3);
         _loc1_.sheetLayer.removeChild(_sheet4);
         _loc1_.sheetLayer.removeChild(_sheet5);
         _loc1_.sheetLayer.removeChild(_sheet6);
         _sheetSummary.dispose();
         _sheetSummary = null;
         _sheet1.dispose();
         _sheet1 = null;
         _sheet2.dispose();
         _sheet2 = null;
         _sheet3.dispose();
         _sheet3 = null;
         _sheet4.dispose();
         _sheet4 = null;
         _sheet5.dispose();
         _sheet5 = null;
         _sheet6.dispose();
         _sheet6 = null;
         _btnClose.dispose();
         _btnClose = null;
         _btnHelp.dispose();
         _btnHelp = null;
         _btnTabOpen.dispose();
         _btnTabOpen = null;
         _btnTabFinished.dispose();
         _btnTabFinished = null;
         _btnScrollUp.dispose();
         _btnScrollUp = null;
         _btnScrollDown.dispose();
         _btnScrollDown = null;
         _btnFilter.dispose();
         _btnFilter = null;
         _line1.dispose();
         _line1 = null;
         _line2.dispose();
         _line2 = null;
         _line3.dispose();
         _line3 = null;
         _line4.dispose();
         _line4 = null;
         _goalInfo.dispose();
         _goalInfo = null;
         _goalFilter.dispose();
         _goalFilter = null;
         super.dispose();
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
      
      private function onClickHelp(param1:InteractionEvent) : void
      {
         showTutorialDialog();
      }
      
      private function showTutorialDialog() : void
      {
         Environment.panelManager.showDialog(new DialogTutorialPopup(LocText.current.text("dialog/tutorial/goals/title"),LocText.current.text("dialog/tutorial/goals/text"),onTutorialDialogClosed));
      }
      
      private function onTutorialDialogClosed() : void
      {
         User.current.character.setTutorialFlag("goals");
      }
      
      private function onClickClose(param1:InteractionEvent) : void
      {
         close();
      }
      
      private function onClickTabOpen(param1:InteractionEvent) : void
      {
         if(!_ownGoals || _listLocked)
         {
            return;
         }
         _offset = 0;
         _selectedLine = null;
         _btnTabOpen.tabbed = true;
         _btnTabFinished.tabbed = false;
         refreshList(true,true);
         var _loc2_:SymbolDialogGoalsGeneric = _vo as SymbolDialogGoalsGeneric;
         _line1.killTweens();
         _line2.killTweens();
         _line3.killTweens();
         _line4.killTweens();
         _loc2_.goalInfo.killTweens();
         _loc2_.goalComplete.killTweens();
         switchToList(false);
      }
      
      private function onSheetChange(param1:InteractionEvent) : void
      {
         sheetChange(param1.target);
      }
      
      private function sheetChange(param1:IInteractionTarget) : void
      {
         _sheetSummary.tabbed = param1 == _sheetSummary;
         _sheet1.tabbed = param1 == _sheet1;
         _sheet2.tabbed = param1 == _sheet2;
         _sheet3.tabbed = param1 == _sheet3;
         _sheet4.tabbed = param1 == _sheet4;
         _sheet5.tabbed = param1 == _sheet5;
         _sheet6.tabbed = param1 == _sheet6;
         var _loc2_:SymbolDialogGoalsGeneric = _vo as SymbolDialogGoalsGeneric;
         if(_sheetSummary.tabbed)
         {
            _goalSummary.content.visible = true;
            _goalSummary.refresh(_character);
            _goalComplete.content.visible = false;
            _goalInfo.content.visible = false;
            _btnScrollUp.visible = false;
            _btnScrollDown.visible = false;
            _btnTabOpen.visible = false;
            _btnTabFinished.visible = false;
            _loc2_.txtCompleted.visible = false;
            _loc2_.txtNoGoals.visible = false;
            _loc2_.txtPending.visible = false;
            _btnFilter.visible = false;
            _goalFilter.hide();
            _line1.content.visible = false;
            _line2.content.visible = false;
            _line3.content.visible = false;
            _line4.content.visible = false;
         }
         else
         {
            _goalSummary.content.visible = false;
            _btnTabOpen.visible = _ownGoals;
            _btnTabFinished.visible = _ownGoals;
            if(_sheet1.tabbed)
            {
               _currentCategory = 0;
            }
            if(_sheet2.tabbed)
            {
               _currentCategory = 1;
            }
            if(_sheet3.tabbed)
            {
               _currentCategory = 2;
            }
            if(_sheet4.tabbed)
            {
               _currentCategory = 3;
            }
            if(_sheet5.tabbed)
            {
               _currentCategory = 4;
            }
            if(_sheet6.tabbed)
            {
               _currentCategory = 5;
            }
            refreshList(true,true);
            switchToList(false);
         }
      }
      
      private function onClickTabFinished(param1:InteractionEvent) : void
      {
         if(_listLocked)
         {
            return;
         }
         _selectedLine = null;
         _btnTabOpen.tabbed = false;
         _btnTabFinished.tabbed = true;
         refreshList(true,true);
         var _loc2_:SymbolDialogGoalsGeneric = _vo as SymbolDialogGoalsGeneric;
         _line1.killTweens();
         _line2.killTweens();
         _line3.killTweens();
         _line4.killTweens();
         _loc2_.goalInfo.killTweens();
         _loc2_.goalComplete.killTweens();
         switchToList(false);
      }
      
      private function onClickScrollUp(param1:InteractionEvent) : void
      {
         scrollUp(4,false);
      }
      
      private function onClickScrollDown(param1:InteractionEvent) : void
      {
         scrollDown(4,false);
      }
      
      private function scrollUp(param1:int, param2:Boolean) : void
      {
         if(!_btnScrollUp.visible || _btnScrollUp.x != 237 || _listLocked)
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
         if(!_btnScrollDown.visible || _btnScrollDown.x != 237 || _listLocked)
         {
            return;
         }
         _offset = _offset + param1;
         if(_offset > goalValueCount - 4)
         {
            _offset = goalValueCount - 4;
            param2 = false;
         }
         if(param2)
         {
            Environment.audio.playFX("ui_button_click.mp3");
         }
         refreshList();
      }
      
      private function onClickFilter(param1:InteractionEvent) : void
      {
         _goalFilter.toggle();
      }
      
      private function onFilterChanged() : void
      {
         _offset = 0;
         _selectedLine = null;
         refreshList(true,true);
      }
      
      private function get goalValueCount() : int
      {
         var _loc1_:Vector.<GoalValue> = _openGoalValues;
         if(_btnTabFinished.tabbed)
         {
            _loc1_ = _finishedGoalValues;
         }
         return _loc1_.length;
      }
      
      private function refreshGoalList() : void
      {
         if(_btnTabOpen.tabbed)
         {
            _openGoalValues = _character.openGoalValues(UiGoalFilter._filterLocked,_currentCategory,true);
            _collectableGoalValuesFiltered = _character.collectableGoalValues(_currentCategory,true);
            _collectableGoalValues = _character.collectableGoalValues(_currentCategory);
         }
         if(_btnTabFinished.tabbed)
         {
            _finishedGoalValues = _character.finishedGoalValues(_currentCategory);
         }
         _totalGoalValues = Goals.instance.totalGoalValues(_currentCategory,_character);
         if(_btnTabFinished.tabbed)
         {
            _offset = int(Math.max(0,_finishedGoalValues.length - 4));
         }
         else
         {
            _offset = 0;
         }
      }
      
      private function refreshList(param1:Boolean = false, param2:Boolean = false) : void
      {
         if(_btnTabFinished == null)
         {
            return;
         }
         if(param2)
         {
            refreshGoalList();
         }
         var _loc5_:int = LocText.current.gender;
         LocText.current.gender = !!_character.isMale?1:2;
         var _loc4_:SymbolDialogGoalsGeneric = _vo as SymbolDialogGoalsGeneric;
         if(_selectedLine != null)
         {
            _currentGoalValue = _selectedLine.goalValue;
         }
         var _loc3_:Vector.<GoalValue> = null;
         if(_btnTabFinished.tabbed || !_ownGoals)
         {
            _loc3_ = _finishedGoalValues;
            _btnFilter.visible = false;
            _goalFilter.hide();
         }
         else
         {
            _loc3_ = _openGoalValues;
            _btnFilter.visible = true;
            _loc4_.btnFilter.iconExclamationMark.visible = UiGoalFilter.isFilterActive;
         }
         _loc4_.txtPending.visible = !_btnTabFinished.tabbed;
         _loc4_.txtCompleted.visible = _btnTabFinished.tabbed;
         if(!_btnTabFinished.tabbed)
         {
            _loc4_.txtPending.visible = _collectableGoalValues.length > 0;
            if(_collectableGoalValues.length > _collectableGoalValuesFiltered.length)
            {
               _loc4_.txtPending.text = LocText.current.text("dialog/goals/pending_filtered_text",_collectableGoalValuesFiltered.length,_collectableGoalValues.length - _collectableGoalValuesFiltered.length);
            }
            else
            {
               _loc4_.txtPending.text = LocText.current.text("dialog/goals/pending_text",_collectableGoalValues.length);
            }
            _loc4_.txtNoGoals.text = LocText.current.text("dialog/goals/filtered_no_goals");
         }
         else
         {
            _loc4_.txtCompleted.text = LocText.current.text("dialog/goals/completed_text",_finishedGoalValues.length,_totalGoalValues,Math.round(_finishedGoalValues.length / _totalGoalValues * 100));
            _loc4_.txtNoGoals.text = LocText.current.text("dialog/goals/no_goals");
         }
         _loc4_.txtNoGoals.visible = _loc3_.length == 0;
         _btnScrollUp.visible = _loc3_.length > 4;
         _btnScrollDown.visible = _loc3_.length > 4;
         _btnScrollUp.buttonEnabled = _offset > 0;
         _btnScrollDown.buttonEnabled = _offset < goalValueCount - 4;
         _line1.refresh(_character,_loc3_.length >= _offset + 1?_loc3_[_offset + 0]:null,1);
         _line2.refresh(_character,_loc3_.length >= _offset + 2?_loc3_[_offset + 1]:null,2);
         _line3.refresh(_character,_loc3_.length >= _offset + 3?_loc3_[_offset + 2]:null,3);
         _line4.refresh(_character,_loc3_.length >= _offset + 4?_loc3_[_offset + 3]:null,4);
         LocText.current.gender = _loc5_;
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
            else
            {
               selectLine(null);
            }
         }
         else if(_line1.goalValue != null && param1)
         {
            selectLine(_line1);
         }
         _btnScrollUp.tooltip = LocText.current.text("dialog/goals/scroll_position",Math.ceil(_offset / 4 + 1).toString(),Math.ceil(goalValueCount / 4).toString());
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
         var _loc4_:SymbolDialogGoalsGeneric = _vo as SymbolDialogGoalsGeneric;
         selectLine(param1);
         if(_selectedLine.goalValue.isCollected(_character))
         {
            return;
         }
         var _loc6_:int = LocText.current.gender;
         LocText.current.gender = !!_character.isMale?1:2;
         if(!_selectedLine.goalValue.isCollectable(_character))
         {
            _goalInfo.content.visible = true;
            _goalComplete.content.visible = false;
            _goalInfo.refresh(_character,_selectedLine.goalValue);
         }
         else
         {
            _goalInfo.content.visible = false;
            _goalComplete.content.visible = true;
            _goalComplete.refresh(_character,_selectedLine.goalValue);
         }
         LocText.current.gender = _loc6_;
         var _loc5_:Number = 200;
         var _loc3_:Number = !!param2?0:0.3;
         _line1.content.tweenTo(_loc3_,{"x":-828 - _loc5_});
         _line2.content.tweenTo(_loc3_,{"x":-828 - _loc5_});
         _line3.content.tweenTo(_loc3_,{"x":-828 - _loc5_});
         _line4.content.tweenTo(_loc3_,{"x":-828 - _loc5_});
         _loc4_.goalInfo.tweenTo(_loc3_,{"x":-60});
         _loc4_.goalComplete.tweenTo(_loc3_,{"x":-60});
         _btnScrollDown.tweenTo(_loc3_,{"x":-763 - _loc5_});
         _btnScrollUp.tweenTo(_loc3_,{"x":-763 - _loc5_});
         _btnFilter.tweenTo(_loc3_,{"x":-871 - _loc5_});
         _loc4_.goalFilter.tweenTo(_loc3_,{"x":-1165 - _loc5_});
         Environment.audio.playFX("ui_dialog_open.mp3");
      }
      
      private function onUpdateStorygoal() : void
      {
         _line1.refreshStorygoalCheckbox(_character);
         _line2.refreshStorygoalCheckbox(_character);
         _line3.refreshStorygoalCheckbox(_character);
         _line4.refreshStorygoalCheckbox(_character);
      }
      
      private function switchToList(param1:Boolean) : void
      {
         refresh = param1;
         if(!_line1)
         {
            return;
         }
         var vo:SymbolDialogGoalsGeneric = _vo as SymbolDialogGoalsGeneric;
         var currentLine:UiGoalLine = _selectedLine;
         if(refresh)
         {
            var currentY:Number = currentLine.content.y;
            _listLocked = true;
            var refreshCallback:Function = function():void
            {
               currentLine.content.x = -339;
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
                  "x":vo.btnTabFinished.x,
                  "y":vo.btnTabFinished.y,
                  "scaleX":0.1,
                  "scaleY":0.1,
                  "alpha":0,
                  "onComplete":refreshCallback
               });
            };
            Runtime.delayFunction(removeCallback,0.3);
         }
         var duration:Number = 0.3;
         _line1.content.tweenTo(duration,{"x":-339});
         _line2.content.tweenTo(duration,{"x":-339});
         _line3.content.tweenTo(duration,{"x":-339});
         _line4.content.tweenTo(duration,{"x":-339});
         vo.goalInfo.tweenTo(duration,{"x":630});
         vo.goalComplete.tweenTo(duration,{"x":630});
         _btnScrollDown.tweenTo(duration,{"x":237});
         _btnScrollUp.tweenTo(duration,{"x":237});
         _btnFilter.tweenTo(duration,{"x":-345});
         vo.goalFilter.tweenTo(duration,{"x":-368});
         Environment.audio.playFX("ui_dialog_open.mp3");
      }
      
      private function onClickSwitchCategory(param1:int) : void
      {
         if(param1 == 0)
         {
            sheetChange(_sheet1);
         }
         if(param1 == 1)
         {
            sheetChange(_sheet2);
         }
         if(param1 == 2)
         {
            sheetChange(_sheet3);
         }
         if(param1 == 3)
         {
            sheetChange(_sheet4);
         }
         if(param1 == 4)
         {
            sheetChange(_sheet5);
         }
         if(param1 == 5)
         {
            sheetChange(_sheet6);
         }
      }
      
      override public function onEscape() : void
      {
         close();
      }
      
      override public function close(param1:Function = null) : void
      {
         var _loc7_:int = 0;
         var _loc6_:* = Goals.instance.goals;
         for each(var _loc3_ in Goals.instance.goals)
         {
            if(_loc3_.identifier != "account_confirmed")
            {
               if(!(_loc3_.identifier == "first_quest_resource_request_accepted" && !platform.isResourceRequestAllowed))
               {
                  if(!(_loc3_.identifier == "quest_resource_request_accepted" && !platform.isResourceRequestAllowed))
                  {
                     var _loc5_:int = 0;
                     var _loc4_:* = _loc3_.values;
                     for each(var _loc2_ in _loc3_.values)
                     {
                        _loc2_.isNew = false;
                     }
                     continue;
                  }
                  continue;
               }
               continue;
            }
         }
         if(_ownGoals)
         {
            ownDialogOpen = false;
         }
         ViewManager.instance.baseUserPanel.refreshGoalIcon(true);
         super.close(param1);
      }
   }
}
