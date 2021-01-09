package com.playata.application.ui.dialogs
{
   import com.playata.application.data.event.EventQuest;
   import com.playata.application.data.event.EventQuestObjective;
   import com.playata.application.data.user.User;
   import com.playata.application.ui.elements.event.UiEventQuestButton;
   import com.playata.application.ui.elements.event.UiEventQuestObjectiveComplete;
   import com.playata.application.ui.elements.event.UiEventQuestObjectiveInfo;
   import com.playata.application.ui.elements.event.UiEventQuestObjectiveLine;
   import com.playata.application.ui.elements.generic.UiInfoTooltipButton;
   import com.playata.application.ui.elements.generic.button.UiButton;
   import com.playata.application.ui.elements.generic.dialog.UiDialog;
   import com.playata.application.ui.elements.generic.progressbar.UiProgressBarBig;
   import com.playata.application.ui.elements.generic.textfield.UiTextTooltip;
   import com.playata.framework.application.Environment;
   import com.playata.framework.core.Runtime;
   import com.playata.framework.core.TypedObject;
   import com.playata.framework.core.timer.ITimer;
   import com.playata.framework.input.InteractionEvent;
   import com.playata.framework.localization.LocText;
   import flash.geom.Rectangle;
   import visuals.ui.dialogs.SymbolDialogEventQuestProgressGeneric;
   
   public class DialogEventQuestProgress extends UiDialog
   {
      
      private static const MAX_LINES:int = 3;
      
      private static const SCROLL_VALUE:int = 3;
       
      
      private var _btnClose:UiButton = null;
      
      private var _btnScrollUp:UiButton = null;
      
      private var _btnScrollDown:UiButton = null;
      
      private var _line1:UiEventQuestObjectiveLine = null;
      
      private var _line2:UiEventQuestObjectiveLine = null;
      
      private var _line3:UiEventQuestObjectiveLine = null;
      
      private var _objectiveInfo:UiEventQuestObjectiveInfo = null;
      
      private var _objectiveComplete:UiEventQuestObjectiveComplete = null;
      
      private var _progressBar:UiProgressBarBig = null;
      
      private var _eventQuest:EventQuest = null;
      
      private var _currentObjective:EventQuestObjective = null;
      
      private var _selectedLine:UiEventQuestObjectiveLine = null;
      
      private var _offset:int = 0;
      
      private var _listLocked:Boolean = false;
      
      private var _timer:ITimer = null;
      
      private var _tooltip:UiTextTooltip;
      
      public function DialogEventQuestProgress(param1:EventQuest)
      {
         var _loc2_:* = null;
         var _loc3_:SymbolDialogEventQuestProgressGeneric = new SymbolDialogEventQuestProgressGeneric();
         super(_loc3_);
         _eventQuest = param1;
         _queued = false;
         _loc3_.txtDialogTitle.text = _eventQuest.name;
         _loc3_.txtDialogTitle.autoFontSize = true;
         if(_loc3_.txtDialogTitle.numLines == 1)
         {
            _loc3_.txtDialogTitle.y = _loc3_.txtDialogTitle.y + 20;
         }
         _btnClose = new UiButton(_loc3_.btnClose,"",onClickClose);
         _btnScrollUp = new UiButton(_loc3_.btnUp,"",onClickScrollUp);
         _btnScrollDown = new UiButton(_loc3_.btnDown,"",onClickScrollDown);
         _line1 = new UiEventQuestObjectiveLine(_loc3_.line1,selectLine,doubleClickLine);
         _line2 = new UiEventQuestObjectiveLine(_loc3_.line2,selectLine,doubleClickLine);
         _line3 = new UiEventQuestObjectiveLine(_loc3_.line3,selectLine,doubleClickLine);
         _objectiveInfo = new UiEventQuestObjectiveInfo(_loc3_.objectiveInfo,switchToList,switchToCompleteFromInfo);
         _objectiveComplete = new UiEventQuestObjectiveComplete(_loc3_.objectiveComplete,switchToList,close);
         onMouseWheel.add(handleMouseWheel);
         _loc3_.objectiveInfo.x = 560;
         _loc3_.objectiveComplete.x = 560;
         _progressBar = new UiProgressBarBig(_loc3_.progressBar);
         _loc3_.header.setUriSprite(_eventQuest.headerImageUrl,900,630,true);
         _loc3_.header.applySettings(new TypedObject({"interactionEnabled":false}));
         _timer = Environment.createTimer("DialogEventQuestProgress::timer",1000,onUpdateTime);
         _timer.start();
         onUpdateTime();
         _btnClose.bringToTop();
         if(Environment.info.isTouchScreen && _eventQuest.hasConventionData)
         {
            _tooltip = new UiTextTooltip(_loc3_.progressBar,UiEventQuestButton.getTooltip(_eventQuest));
            _loc2_ = _loc3_.txtDialogTitle.textBounds;
            UiInfoTooltipButton.assign(_loc3_,_tooltip,_loc3_.txtDialogTitle.x + _loc2_.x + _loc3_.txtDialogTitle.textWidth + 15,_loc3_.txtDialogTitle.y + _loc2_.y);
         }
         refreshList(false,true);
      }
      
      private function onUpdateTime() : void
      {
         if(!User.current)
         {
            _timer.stop();
            return;
         }
         var _loc1_:SymbolDialogEventQuestProgressGeneric = _vo as SymbolDialogEventQuestProgressGeneric;
         _loc1_.txtTimeLeft.text = LocText.current.text("screen/quest_progress/wait",_eventQuest.timeRemainingString);
      }
      
      override public function dispose() : void
      {
         _btnClose.dispose();
         _btnClose = null;
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
         _objectiveInfo.dispose();
         _objectiveInfo = null;
         _progressBar.dispose();
         _progressBar = null;
         _timer.dispose();
         _timer = null;
         if(_tooltip)
         {
            _tooltip.dispose();
            _tooltip = null;
         }
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
      
      private function onClickClose(param1:InteractionEvent) : void
      {
         close();
      }
      
      private function onClickScrollUp(param1:InteractionEvent) : void
      {
         scrollUp(3,false);
      }
      
      private function onClickScrollDown(param1:InteractionEvent) : void
      {
         scrollDown(3,false);
      }
      
      private function scrollUp(param1:int, param2:Boolean) : void
      {
         if(!_btnScrollUp.visible || _btnScrollUp.x != 244 || _listLocked)
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
         if(!_btnScrollDown.visible || _btnScrollDown.x != 244 || _listLocked)
         {
            return;
         }
         _offset = _offset + param1;
         if(_offset > objectiveCount - 3)
         {
            _offset = objectiveCount - 3;
            param2 = false;
         }
         if(param2)
         {
            Environment.audio.playFX("ui_button_click.mp3");
         }
         refreshList();
      }
      
      private function get objectiveCount() : int
      {
         return _eventQuest.objectives.length;
      }
      
      private function refreshObjectiveList() : void
      {
         _offset = 0;
      }
      
      private function refreshList(param1:Boolean = false, param2:Boolean = false) : void
      {
         select = param1;
         refreshListContent = param2;
         if(!_vo)
         {
            return;
         }
         if(_eventQuest.isCompleted(true))
         {
            close();
            var openOutroDialog:Function = function():void
            {
               Environment.panelManager.showDialog(new DialogEventQuestOutro(_eventQuest));
            };
            Runtime.delayFunction(openOutroDialog,0.3);
            return;
         }
         if(refreshListContent)
         {
            refreshObjectiveList();
         }
         var vo:SymbolDialogEventQuestProgressGeneric = _vo as SymbolDialogEventQuestProgressGeneric;
         if(_selectedLine != null)
         {
            _currentObjective = _selectedLine.objective;
         }
         var progressValue:int = _eventQuest.progressValue;
         vo.txtCompleted.text = LocText.current.text("dialog/goals/completed_text",_eventQuest.finishedObjectiveCount,objectiveCount,progressValue);
         _progressBar.value = progressValue;
         _btnScrollUp.visible = objectiveCount > 3;
         _btnScrollDown.visible = objectiveCount > 3;
         _btnScrollUp.buttonEnabled = _offset > 0;
         _btnScrollDown.buttonEnabled = _offset < objectiveCount - 3;
         _line1.refresh(objectiveCount >= _offset + 1?_eventQuest.objectives[_offset + 0]:null,1);
         _line2.refresh(objectiveCount >= _offset + 2?_eventQuest.objectives[_offset + 1]:null,2);
         _line3.refresh(objectiveCount >= _offset + 3?_eventQuest.objectives[_offset + 2]:null,3);
         if(_currentObjective != null && !select)
         {
            if(_line1.objective == _currentObjective)
            {
               selectLine(_line1);
            }
            else if(_line2.objective == _currentObjective)
            {
               selectLine(_line2);
            }
            else if(_line3.objective == _currentObjective)
            {
               selectLine(_line3);
            }
            else
            {
               selectLine(null);
            }
         }
         else if(_line1.objective != null && select)
         {
            selectLine(_line1);
         }
         _btnScrollUp.tooltip = LocText.current.text("dialog/goals/scroll_position",Math.ceil(_offset / 3 + 1).toString(),Math.ceil(objectiveCount / 3).toString());
         _btnScrollDown.tooltip = _btnScrollUp.tooltip;
      }
      
      private function selectLine(param1:UiEventQuestObjectiveLine) : void
      {
         _selectedLine = param1;
         _line1.highlight(_line1 == _selectedLine);
         _line2.highlight(_line2 == _selectedLine);
         _line3.highlight(_line3 == _selectedLine);
      }
      
      private function doubleClickLine(param1:UiEventQuestObjectiveLine) : void
      {
         if(_listLocked)
         {
            return;
         }
         var _loc3_:SymbolDialogEventQuestProgressGeneric = _vo as SymbolDialogEventQuestProgressGeneric;
         selectLine(param1);
         if(_selectedLine.objective.isCollected)
         {
            return;
         }
         if(!_selectedLine.objective.isCollectable)
         {
            _objectiveInfo.content.visible = true;
            _objectiveComplete.content.visible = false;
            _objectiveInfo.refresh(_selectedLine.objective);
         }
         else
         {
            _objectiveInfo.content.visible = false;
            _objectiveComplete.content.visible = true;
            _objectiveComplete.refresh(_selectedLine.objective);
         }
         var _loc2_:* = 0.3;
         _line1.content.tweenTo(_loc2_,{"x":-947});
         _line2.content.tweenTo(_loc2_,{"x":-947});
         _line3.content.tweenTo(_loc2_,{"x":-947});
         _loc3_.objectiveInfo.tweenTo(_loc2_,{"x":-200});
         _loc3_.objectiveComplete.tweenTo(_loc2_,{"x":-208});
         _btnScrollDown.tweenTo(_loc2_,{"x":-947});
         _btnScrollUp.tweenTo(_loc2_,{"x":-947});
         _loc3_.txtCompleted.tweenTo(_loc2_,{"x":-869});
         _loc3_.progressBar.tweenTo(_loc2_,{"x":-873});
         Environment.audio.playFX("ui_dialog_open.mp3");
      }
      
      private function switchToCompleteFromInfo(param1:EventQuestObjective) : void
      {
         objective = param1;
         if(!_objectiveInfo.content.visible)
         {
            return;
         }
         if(!objective.isCollectable)
         {
            return;
         }
         _objectiveComplete.content.visible = true;
         _objectiveComplete.refresh(objective);
         _objectiveComplete.content.x = 492;
         var duration:Number = 0.3;
         _objectiveInfo.content.tweenTo(duration,{"x":-900});
         _objectiveComplete.content.tweenTo(duration,{"x":-200});
         var cleanupCallback:Function = function():void
         {
            if(!_objectiveInfo)
            {
               return;
            }
            _objectiveInfo.content.visible = false;
            _objectiveInfo.content.x = -200;
         };
         Runtime.delayFunction(cleanupCallback,0.3);
         Environment.audio.playFX("ui_dialog_open.mp3");
      }
      
      private function switchToList(param1:Boolean) : void
      {
         refresh = param1;
         var vo:SymbolDialogEventQuestProgressGeneric = _vo as SymbolDialogEventQuestProgressGeneric;
         var currentLine:UiEventQuestObjectiveLine = _selectedLine;
         if(refresh)
         {
            if(_eventQuest)
            {
               _eventQuest.sortObjectives();
            }
            var currentY:Number = currentLine.content.y;
            _listLocked = true;
            var refreshCallback:Function = function():void
            {
               currentLine.content.x = -247;
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
                  "x":vo.progressBar.x + vo.progressBar.width / 2,
                  "y":vo.progressBar.y + vo.progressBar.height / 2,
                  "scaleX":0.1,
                  "scaleY":0.1,
                  "alpha":0,
                  "onComplete":refreshCallback
               });
            };
            Runtime.delayFunction(removeCallback,0.3);
         }
         else
         {
            refreshList();
         }
         var duration:Number = 0.3;
         _line1.content.tweenTo(duration,{"x":-247});
         _line2.content.tweenTo(duration,{"x":-247});
         _line3.content.tweenTo(duration,{"x":-247});
         vo.objectiveInfo.tweenTo(duration,{"x":492});
         vo.objectiveComplete.tweenTo(duration,{"x":500});
         _btnScrollDown.tweenTo(duration,{"x":244});
         _btnScrollUp.tweenTo(duration,{"x":244});
         vo.txtCompleted.tweenTo(duration,{"x":-169});
         vo.progressBar.tweenTo(duration,{"x":-173});
         Environment.audio.playFX("ui_dialog_open.mp3");
      }
      
      override public function onEscape() : void
      {
         close();
      }
   }
}
