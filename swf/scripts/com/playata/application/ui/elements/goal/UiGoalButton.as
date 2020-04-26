package com.playata.application.ui.elements.goal
{
   import com.playata.application.data.goal.GoalValue;
   import com.playata.application.data.quest.Quest;
   import com.playata.application.ui.elements.citymap.ICitymapQuestButton;
   import com.playata.application.ui.elements.generic.button.UiButtonWrapper;
   import com.playata.framework.display.IDisplayObject;
   import com.playata.framework.display.InteractiveDisplayObject;
   import com.playata.framework.display.ui.controls.Tooltip;
   import com.playata.framework.input.InteractionEvent;
   import visuals.ui.elements.goal.SymbolGoalItemGeneric;
   
   public class UiGoalButton implements ICitymapQuestButton
   {
       
      
      private var _callback:Function = null;
      
      private var _quest:Quest = null;
      
      private var _buttonWrapper:UiButtonWrapper;
      
      private var _goalTooltip:UiGoalButtonTooltip = null;
      
      private var _container:SymbolGoalItemGeneric;
      
      public function UiGoalButton(param1:SymbolGoalItemGeneric, param2:Quest, param3:Function, param4:Function, param5:Function)
      {
         super();
         _buttonWrapper = new UiButtonWrapper(param1,handleClick,param4,param5);
         _quest = param2;
         _callback = param3;
         _container = param1;
      }
      
      public function dispose() : void
      {
         _buttonWrapper.dispose();
         _buttonWrapper = null;
         _quest = null;
         if(_goalTooltip != null)
         {
            _goalTooltip.dispose();
            _goalTooltip = null;
         }
         _container = null;
      }
      
      public function set goalValue(param1:GoalValue) : void
      {
         if(_goalTooltip == null)
         {
            _goalTooltip = new UiGoalButtonTooltip(new InteractiveDisplayObject(_container),param1);
         }
         _goalTooltip.goalValue = param1;
      }
      
      private function handleClick(param1:InteractionEvent) : void
      {
         if(_callback != null)
         {
            _callback(this);
         }
      }
      
      public function get quest() : Quest
      {
         return _quest;
      }
      
      public function get tooltip() : Tooltip
      {
         return _goalTooltip;
      }
      
      public function get displayObject() : IDisplayObject
      {
         return _container;
      }
   }
}
