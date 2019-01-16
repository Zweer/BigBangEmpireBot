package com.playata.application.ui.elements.goal
{
   import com.playata.application.data.character.Character;
   import com.playata.application.data.goal.GoalValue;
   import com.playata.application.ui.elements.generic.button.UiButton;
   import com.playata.framework.application.Environment;
   import com.playata.framework.display.InteractiveDisplayObject;
   import com.playata.framework.input.InteractionEvent;
   import com.playata.framework.localization.LocText;
   import visuals.ui.elements.goal.SymbolGoalStatisticLineGeneric;
   
   public class UiGoalStatisticsLine extends InteractiveDisplayObject
   {
       
      
      private var _content:SymbolGoalStatisticLineGeneric = null;
      
      private var _btnRight:UiButton = null;
      
      private var _goalValue:GoalValue = null;
      
      private var _onClickFunction:Function = null;
      
      private var _onDoubleClickFunction:Function = null;
      
      private var _index:int = 0;
      
      public function UiGoalStatisticsLine(param1:SymbolGoalStatisticLineGeneric, param2:Function, param3:Function)
      {
         _content = param1;
         super(_content);
         _onClickFunction = param2;
         _onDoubleClickFunction = param3;
         _content.txtTitle.autoFontSize = true;
         _content.txtShortDescription.autoFontSize = true;
         _btnRight = new UiButton(_content.btnRight,LocText.current.text("dialog/goals/button_info_tooltip"),onClickRight);
         onClick.add(handleClick);
         onDoubleClick.add(handleDoubleClick);
         useHandCursor = false;
      }
      
      public function get content() : SymbolGoalStatisticLineGeneric
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
         _btnRight.dispose();
         _btnRight = null;
         super.dispose();
      }
      
      private function onClickRight(param1:InteractionEvent) : void
      {
         if(_onDoubleClickFunction == null)
         {
            return;
         }
         §§push(_onDoubleClickFunction(this));
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
         _content.txtTitle.text = _goalValue.statisticsDescription(param1);
         if(param1.isMe)
         {
            _content.txtTitle.y = 11;
            _content.txtShortDescription.visible = true;
            if(_goalValue.currentValue >= _goalValue.value)
            {
               _btnRight.visible = false;
               _content.txtShortDescription.text = LocText.current.text("dialog/goal_statistics/last_goal_value_completed");
            }
            else
            {
               _btnRight.visible = true;
               _content.txtShortDescription.text = LocText.current.text("dialog/goal_statistics/next_goal_value",LocText.current.formatHugeNumber(_goalValue.value - _goalValue.currentValue));
            }
         }
         else
         {
            _content.txtTitle.y = 21;
            _btnRight.visible = false;
            _content.txtShortDescription.visible = false;
         }
         _content.iconGoal.setUriSprite(_goalValue.goal.iconImageUrl,60,60,true,5,null,true);
      }
   }
}
