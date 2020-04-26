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
   import com.playata.application.ui.elements.goal.UiGoalFilter;
   import com.playata.application.ui.elements.goal.UiGoalInfo;
   import com.playata.application.ui.elements.goal.UiGoalList;
   import com.playata.application.ui.elements.goal.UiGoalSheet;
   import com.playata.application.ui.elements.goal.UiGoalSummary;
   import com.playata.framework.application.Environment;
   import com.playata.framework.input.IInteractionTarget;
   import com.playata.framework.input.InteractionEvent;
   import com.playata.framework.localization.LocText;
   import visuals.ui.dialogs.SymbolDialogGoalsGeneric;
   
   public class DialogGoals extends UiDialog
   {
      
      private static var _ownDialogOpen:Boolean = false;
       
      
      private var _btnHelp:UiButton = null;
      
      private var _btnClose:UiButton = null;
      
      private var _btnTabOpen:UiTabButton = null;
      
      private var _btnTabFinished:UiTabButton = null;
      
      private var _btnFilter:UiButton = null;
      
      private var _goalList:UiGoalList = null;
      
      private var _goalInfo:UiGoalInfo = null;
      
      private var _goalSummary:UiGoalSummary = null;
      
      private var _character:Character = null;
      
      private var _ownGoals:Boolean = false;
      
      private var _currentCategory:int = 0;
      
      private var _sheetSummary:UiGoalSheet = null;
      
      private var _sheet1:UiGoalSheet = null;
      
      private var _sheet2:UiGoalSheet = null;
      
      private var _sheet3:UiGoalSheet = null;
      
      private var _sheet4:UiGoalSheet = null;
      
      private var _sheet5:UiGoalSheet = null;
      
      private var _sheet6:UiGoalSheet = null;
      
      private var _goalFilter:UiGoalFilter = null;
      
      private var _goalListOriginalX:Number = 0;
      
      private var _goalInfoOriginalX:Number = 0;
      
      private var _backgroundWidth:Number = 0;
      
      public function DialogGoals(param1:Character, param2:GoalValue = null)
      {
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
         _btnFilter = new UiButton(_loc3_.btnFilter,"",onClickFilter);
         _sheetSummary = new UiGoalSheet(_loc3_.sheetSummary,LocText.current.text("dialog/goals/category/summary"),"",onSheetChange);
         _sheet1 = new UiGoalSheet(_loc3_.sheet1,LocText.current.text("dialog/goals/category/all"),"",onSheetChange);
         _sheet2 = new UiGoalSheet(_loc3_.sheet2,LocText.current.text("dialog/goals/category/character"),"",onSheetChange);
         _sheet3 = new UiGoalSheet(_loc3_.sheet4,LocText.current.text("dialog/goals/category/shop"),"",onSheetChange);
         _sheet4 = new UiGoalSheet(_loc3_.sheet3,LocText.current.text("dialog/goals/category/quest"),"",onSheetChange);
         _sheet5 = new UiGoalSheet(_loc3_.sheet5,LocText.current.text("dialog/goals/category/duels"),"",onSheetChange);
         _sheet6 = new UiGoalSheet(_loc3_.sheet6,LocText.current.text("dialog/goals/category/guild"),"",onSheetChange);
         _sheetSummary.tabbed = true;
         _sheet1.tabbed = false;
         _sheet2.tabbed = false;
         _sheet3.tabbed = false;
         _sheet4.tabbed = false;
         _sheet5.tabbed = false;
         _sheet6.tabbed = false;
         _loc3_.sheetLayer.removeAllChildren();
         _loc3_.sheetLayer.addChild(_sheetSummary);
         _loc3_.sheetLayer.addChild(_sheet1);
         _loc3_.sheetLayer.addChild(_sheet2);
         _loc3_.sheetLayer.addChild(_sheet3);
         _loc3_.sheetLayer.addChild(_sheet4);
         _loc3_.sheetLayer.addChild(_sheet5);
         _loc3_.sheetLayer.addChild(_sheet6);
         _goalFilter = new UiGoalFilter(_loc3_.goalFilter,onFilterChanged,_character);
         _goalList = new UiGoalList(_loc3_.goalList,_character,switchToGoalInfo);
         _goalInfo = new UiGoalInfo(_loc3_.goalInfo,_character,switchToList,close);
         _goalSummary = new UiGoalSummary(_loc3_.goalSummary,_character,onClickSwitchCategory,close);
         _goalSummary.content.visible = false;
         _loc3_.btnFilter.iconExclamationMark.visible = UiGoalFilter.isFilterActive;
         _goalListOriginalX = _loc3_.goalList.x;
         _goalInfoOriginalX = _loc3_.goalInfo.x;
         _backgroundWidth = _loc3_.background.width;
         _loc3_.goalInfo.x = _goalInfoOriginalX + _backgroundWidth;
         if(_ownGoals)
         {
            _btnTabOpen.tabbed = true;
            _btnTabFinished.tabbed = false;
            _goalInfo.currentFilter = _goalFilter;
            if(param2)
            {
               _sheetSummary.tabbed = false;
               _sheet1.tabbed = true;
               _goalList.scrollToGoal(param2,_btnTabOpen.tabbed,_currentCategory);
            }
            else
            {
               sheetChange(_sheet1);
            }
         }
         else
         {
            _btnTabOpen.tabbed = false;
            _btnTabFinished.tabbed = true;
            _btnTabOpen.visible = false;
            _btnTabFinished.visible = false;
            _goalInfo.showOpenGoalValues = false;
            sheetChange(_sheetSummary);
         }
         onMouseWheel.add(handleMouseWheel);
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
         _goalInfo.dispose();
         _goalInfo = null;
         _goalList.dispose();
         _goalList = null;
         _btnFilter.dispose();
         _btnFilter = null;
         _goalFilter.dispose();
         _goalFilter = null;
         super.dispose();
      }
      
      private function handleMouseWheel(param1:InteractionEvent) : void
      {
         if(_goalList.listLocked)
         {
            return;
         }
         if(param1.mouseWheelDelta > 0)
         {
            if(_goalList.content.visible)
            {
               _goalList.scrollUp(1,true);
            }
         }
         else if(_goalList.content.visible)
         {
            _goalList.scrollDown(1,true);
         }
      }
      
      private function onClickFilter(param1:InteractionEvent) : void
      {
         _goalFilter.toggle();
      }
      
      private function onFilterChanged() : void
      {
         _goalList.reset();
         _goalList.refresh(_btnTabOpen.tabbed,_currentCategory,true);
         if(_goalInfo.content.visible)
         {
            _goalInfo.onFilterChanged();
         }
         var _loc1_:SymbolDialogGoalsGeneric = _vo as SymbolDialogGoalsGeneric;
         _loc1_.btnFilter.iconExclamationMark.visible = UiGoalFilter.isFilterActive;
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
         if(!_ownGoals || _goalList.listLocked)
         {
            return;
         }
         if(!_btnTabOpen.tabbed)
         {
            _goalList.reset();
         }
         _btnTabOpen.tabbed = true;
         _btnTabFinished.tabbed = false;
         _btnFilter.visible = _btnTabOpen.tabbed;
         var _loc2_:SymbolDialogGoalsGeneric = _vo as SymbolDialogGoalsGeneric;
         _loc2_.btnFilter.iconExclamationMark.visible = UiGoalFilter.isFilterActive;
         _goalList.refresh(_btnTabOpen.tabbed,_currentCategory);
         _goalList.content.killTweens();
         _goalInfo.content.killTweens();
         _goalInfo.currentFilter = _goalFilter;
         _goalInfo.showOpenGoalValues = true;
         switchToList(false);
      }
      
      private function onClickTabFinished(param1:InteractionEvent) : void
      {
         if(_goalList.listLocked)
         {
            return;
         }
         if(!_btnTabFinished.tabbed)
         {
            _goalList.reset();
         }
         _btnTabOpen.tabbed = false;
         _btnTabFinished.tabbed = true;
         _btnFilter.visible = _btnTabOpen.tabbed;
         _goalFilter.hide();
         _goalList.refresh(_btnTabOpen.tabbed,_currentCategory);
         _goalList.content.killTweens();
         _goalInfo.content.killTweens();
         _goalInfo.currentFilter = null;
         _goalInfo.showOpenGoalValues = false;
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
            _goalSummary.refresh();
            _goalInfo.content.visible = false;
            _goalList.content.visible = false;
            _btnTabOpen.visible = false;
            _btnTabFinished.visible = false;
            _btnFilter.visible = false;
         }
         else
         {
            _goalSummary.content.visible = false;
            _btnTabOpen.visible = _ownGoals;
            _btnTabFinished.visible = _ownGoals;
            _btnFilter.visible = _btnTabOpen.tabbed;
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
            _goalList.content.visible = true;
            if(_goalList.currentCategory != _currentCategory)
            {
               _goalList.reset();
            }
            _goalList.refresh(_btnTabOpen.tabbed,_currentCategory);
            switchToList(false);
         }
      }
      
      private function switchToList(param1:Boolean) : void
      {
         refresh = param1;
         if(!_goalList)
         {
            return;
         }
         if(refresh)
         {
            _goalList.animateCurrentLine();
         }
         _goalList.content.killTweens();
         _goalInfo.content.killTweens();
         _goalList.content.visible = true;
         var duration:Number = 0.3;
         _goalInfo.content.tweenTo(duration,{
            "x":_goalInfoOriginalX + _backgroundWidth,
            "onComplete":function():void
            {
               _goalInfo.content.visible = false;
            }
         });
         _goalList.content.tweenTo(duration,{"x":_goalListOriginalX});
         Environment.audio.playFX("ui_dialog_open.mp3");
      }
      
      private function switchToGoalInfo(param1:GoalValue, param2:Boolean = false) : void
      {
         goalValue = param1;
         showInstant = param2;
         if(_goalList.listLocked)
         {
            return;
         }
         var currentGender:int = LocText.current.gender;
         LocText.current.gender = !!_character.isMale?1:2;
         _goalInfo.content.visible = true;
         _goalInfo.refresh(goalValue);
         LocText.current.gender = currentGender;
         _goalInfo.content.x = _goalInfoOriginalX + _backgroundWidth;
         _goalList.content.killTweens();
         _goalInfo.content.killTweens();
         var duration:Number = !!showInstant?0:0.3;
         _goalInfo.content.tweenTo(duration,{"x":_goalInfoOriginalX});
         _goalList.content.tweenTo(duration,{
            "x":_goalListOriginalX - _backgroundWidth,
            "onComplete":function():void
            {
               _goalList.content.visible = false;
            }
         });
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
