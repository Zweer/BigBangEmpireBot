package com.playata.application.ui.elements.goal
{
   import com.playata.application.data.character.Character;
   import com.playata.application.data.goal.GoalValue;
   import com.playata.application.ui.elements.generic.button.UiButton;
   import com.playata.application.ui.elements.generic.button.UiTextButton;
   import com.playata.application.ui.elements.generic.checkbox.UiCheckBox;
   import com.playata.application.ui.elements.generic.textfield.UiTextTooltip;
   import com.playata.framework.application.Environment;
   import com.playata.framework.application.request.ActionRequestResponse;
   import com.playata.framework.display.InteractiveDisplayObject;
   import com.playata.framework.input.InteractionEvent;
   import com.playata.framework.localization.LocText;
   import visuals.ui.elements.goal.SymbolGoalLineGeneric;
   
   public class UiGoalLine extends InteractiveDisplayObject
   {
       
      
      private var _content:SymbolGoalLineGeneric = null;
      
      private var _index:int = 0;
      
      private var _goalValue:GoalValue = null;
      
      private var _onClickFunction:Function = null;
      
      private var _onDoubleClickFunction:Function = null;
      
      private var _onStorygoalUpdateFunction:Function = null;
      
      private var _btnRight:UiButton = null;
      
      private var _btnCollect:UiTextButton = null;
      
      private var _finishedTooltip:UiTextTooltip = null;
      
      private var _tooltipLock:UiTextTooltip = null;
      
      private var _tooltipDefaultGoal:UiTextTooltip = null;
      
      private var _iconLock:InteractiveDisplayObject = null;
      
      private var _ckbStorygoal:UiCheckBox = null;
      
      public function UiGoalLine(param1:SymbolGoalLineGeneric, param2:Function, param3:Function, param4:Function)
      {
         _content = param1;
         super(_content);
         _onClickFunction = param2;
         _onDoubleClickFunction = param3;
         _onStorygoalUpdateFunction = param4;
         _content.txtNew.text = LocText.current.text("dialog/goals/new");
         _btnRight = new UiButton(_content.btnRight,LocText.current.text("dialog/goals/button_info_tooltip"),onClickRight);
         _btnCollect = new UiTextButton(_content.btnCollect,LocText.current.text("dialog/goals/button_collect"),LocText.current.text("dialog/goals/button_collect_tooltip"),onClickCollect);
         _finishedTooltip = new UiTextTooltip(_content.iconCheckmark,"");
         _tooltipLock = new UiTextTooltip(_content.iconLock,LocText.current.text("dialog/goals/goal_locked_tooltip"));
         _tooltipDefaultGoal = new UiTextTooltip(_content.checkStorygoalDefault,LocText.current.text("dialog/goals/storygoal_hint_auto"));
         onClick.add(handleClick);
         onDoubleClick.add(handleDoubleClick);
         _iconLock = new InteractiveDisplayObject(_content.iconLock);
         _iconLock.onClick.add(handleLockClick);
         _ckbStorygoal = new UiCheckBox(param1.checkStorygoal,false,"",onStorygoalChanged);
         useHandCursor = false;
      }
      
      private function onStorygoalChanged(param1:Boolean) : void
      {
         var _loc2_:int = !!param1?_goalValue.value:-1;
         Environment.application.sendActionRequest("selectStorygoal",{
            "identifier":_goalValue.goal.identifier,
            "value":_loc2_
         },handleRequests);
      }
      
      private function handleLockClick(param1:InteractionEvent) : void
      {
         Environment.audio.playFX("ui_button_click_disabled.mp3");
      }
      
      public function get content() : SymbolGoalLineGeneric
      {
         return _content;
      }
      
      public function get index() : int
      {
         return _index;
      }
      
      public function get goalValue() : GoalValue
      {
         return _goalValue;
      }
      
      override public function dispose() : void
      {
         _iconLock.dispose();
         _btnRight.dispose();
         _btnRight = null;
         _btnCollect.dispose();
         _btnCollect = null;
         _finishedTooltip.dispose();
         _finishedTooltip = null;
         _tooltipLock.dispose();
         _tooltipLock = null;
         _ckbStorygoal.dispose();
         _ckbStorygoal = null;
         super.dispose();
      }
      
      private function onClickRight(param1:InteractionEvent) : void
      {
      }
      
      private function onClickCollect(param1:InteractionEvent) : void
      {
      }
      
      private function handleClick(param1:InteractionEvent) : void
      {
         if(_onClickFunction == null)
         {
            return;
         }
         Environment.audio.playFX("ui_button_click.mp3");
         §§push(_onClickFunction(this));
      }
      
      private function handleDoubleClick(param1:InteractionEvent) : void
      {
         if(_onDoubleClickFunction == null)
         {
            return;
         }
         Environment.audio.playFX("ui_button_click.mp3");
         §§push(_onDoubleClickFunction(this));
      }
      
      public function refresh(param1:Character, param2:GoalValue, param3:int) : void
      {
         _index = param3;
         _goalValue = param2;
         if(_goalValue == null)
         {
            _content.visible = false;
            return;
         }
         _content.visible = true;
         _content.iconLock.visible = !_goalValue.isAvailable(param1) && !_goalValue.isCollected(param1) && !_goalValue.isCollectable(param1);
         _content.iconLock.bringToTop();
         _btnCollect.visible = _goalValue.isCollectable(param1) && !_goalValue.isCollected(param1) && !_content.iconLock.visible;
         _btnRight.visible = !_goalValue.isCollectable(param1) && !_goalValue.isCollected(param1);
         _content.visible = true;
         _content.txtTitle.text = _goalValue.title;
         if(!_content.iconLock.visible)
         {
            _content.txtShortDescription.text = _goalValue.shortDescription(param1);
         }
         else
         {
            _content.txtShortDescription.text = LocText.current.text("dialog/goal/goal_locked");
         }
         _content.iconNew.visible = _goalValue.isNew;
         _content.txtNew.visible = _content.iconNew.visible;
         _content.txtNew.x = _content.txtTitle.x + _content.txtTitle.textWidth + 10;
         _content.iconNew.x = _content.txtNew.x + _content.txtNew.textWidth + 5;
         _content.iconCheckmark.visible = _goalValue.isCollected(param1);
         if(_content.iconCheckmark.visible)
         {
            _finishedTooltip.text = _goalValue.longDescription(param1) + "\n\n" + LocText.current.text("dialog/goal/collected_date",_goalValue.collectedDate(param1));
         }
         _content.iconGoal.setUriSprite(_goalValue.goal.iconImageUrl,60,60,true,5,null,true);
         refreshStorygoalCheckbox(param1);
      }
      
      public function refreshStorygoalCheckbox(param1:Character) : void
      {
         var _loc2_:* = null;
         var _loc3_:* = null;
         if(param1.isMe && _goalValue && !_goalValue.goal.isHidden && (_goalValue.isAvailable(param1) || _goalValue.isCollectable(param1)))
         {
            _loc2_ = param1.pinnedStorygoal;
            _loc3_ = param1.defaultStorygoal;
            _content.checkStorygoalDefault.visible = _loc3_ == _goalValue && (_loc2_ == null || _loc2_ == _loc3_);
            _content.checkStorygoal.visible = !_content.checkStorygoalDefault.visible;
            _ckbStorygoal.checked = _loc2_ == goalValue;
            if(!Environment.info.isTouchScreen)
            {
               _ckbStorygoal.tooltip = !!_ckbStorygoal.checked?LocText.current.text("dialog/goals/storygoal_hint_selected"):LocText.current.text("dialog/goals/storygoal_hint");
            }
            if(_goalValue.isCollected(param1))
            {
               var _loc4_:Boolean = false;
               _content.checkStorygoalDefault.visible = _loc4_;
               _content.checkStorygoal.visible = _loc4_;
            }
         }
         else
         {
            _loc4_ = false;
            _content.checkStorygoalDefault.visible = _loc4_;
            _content.checkStorygoal.visible = _loc4_;
         }
      }
      
      private function handleRequests(param1:ActionRequestResponse) : void
      {
         var _loc2_:* = param1.action;
         if("selectStorygoal" !== _loc2_)
         {
            throw new Error("Unsupported request action \'" + param1.action + "\'!");
         }
         if(param1.error == "")
         {
            Environment.application.updateData(param1.data);
            _onStorygoalUpdateFunction();
         }
         else
         {
            Environment.reportError(param1.error,param1.request);
         }
      }
   }
}
