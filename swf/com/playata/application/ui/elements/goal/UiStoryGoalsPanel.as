package com.playata.application.ui.elements.goal
{
   import com.greensock.TimelineMax;
   import com.greensock.TweenMax;
   import com.greensock.easing.Back;
   import com.playata.application.data.character.Character;
   import com.playata.application.data.goal.GoalValue;
   import com.playata.application.data.user.User;
   import com.playata.application.messaging.Message;
   import com.playata.application.messaging.MessageRouter;
   import com.playata.application.ui.dialogs.DialogGoals;
   import com.playata.application.ui.elements.generic.textfield.UiTextTooltip;
   import com.playata.framework.application.Environment;
   import com.playata.framework.display.InteractiveDisplayObject;
   import com.playata.framework.input.InteractionEvent;
   import com.playata.framework.localization.LocText;
   import visuals.ui.elements.goal.SymbolStoryGoalsCompleteGeneric;
   import visuals.ui.elements.goal.SymbolStoryGoalsIconContainerGeneric;
   
   public class UiStoryGoalsPanel extends InteractiveDisplayObject
   {
       
      
      private var _content:SymbolStoryGoalsCompleteGeneric;
      
      private var _iconContainer:SymbolStoryGoalsIconContainerGeneric;
      
      private var _currentGoalValue:GoalValue;
      
      private var _timelineOverOut:TimelineMax;
      
      private var _tooltipNoGoalIcon:UiTextTooltip;
      
      private var _tooltipNoGoal:UiTextTooltip;
      
      private var _tooltipGoalIcon:UiStoryGoalTooltip;
      
      private var _tooltipGoal:UiStoryGoalTooltip;
      
      public function UiStoryGoalsPanel(param1:SymbolStoryGoalsCompleteGeneric, param2:SymbolStoryGoalsIconContainerGeneric)
      {
         _content = param1;
         _iconContainer = param2;
         super(_content);
         _iconContainer.itemContainer.removeAllChildren();
         param1.nativeInstance.blendMode = "layer";
         param2.nativeInstance.blendMode = "layer";
         var _loc4_:* = 0.85;
         param2.scaleY = _loc4_;
         _loc4_ = _loc4_;
         param2.scaleX = _loc4_;
         _loc4_ = _loc4_;
         param1.scaleY = _loc4_;
         param1.scaleX = _loc4_;
         onInteractionOver.add(onOver);
         onInteractionOut.add(onOut);
         onClick.add(onCollectGoalClicked);
         _timelineOverOut = new TimelineMax({"paused":true});
         var _loc3_:* = 0.92;
         _timelineOverOut.insert(new TweenMax(param1,0.4,{
            "scaleX":_loc3_,
            "scaleY":_loc3_,
            "rotation":-1,
            "ease":Back.easeOut
         }));
         _timelineOverOut.insert(new TweenMax(param2,0.4,{
            "scaleX":_loc3_,
            "scaleY":_loc3_,
            "rotation":-1,
            "ease":Back.easeOut
         }));
         _tooltipNoGoalIcon = new UiTextTooltip(_iconContainer,"");
         _tooltipNoGoal = new UiTextTooltip(_content,"");
         _tooltipGoalIcon = new UiStoryGoalTooltip(_iconContainer);
         if(!Environment.info.isTouchScreen)
         {
            _tooltipGoal = new UiStoryGoalTooltip(_content);
         }
         MessageRouter.addListener("CharacterMessage.notifyGoalCollectable",handleMessages);
      }
      
      private function handleMessages(param1:Message) : void
      {
         var _loc2_:* = param1.type;
         if("CharacterMessage.notifyGoalCollectable" === _loc2_)
         {
            refresh();
         }
      }
      
      private function onOver(param1:InteractionEvent) : void
      {
         _timelineOverOut.timeScale(1);
         _timelineOverOut.reversed(false);
         _timelineOverOut.resume();
      }
      
      private function onOut(param1:InteractionEvent) : void
      {
         _timelineOverOut.timeScale(2);
         _timelineOverOut.reversed(true);
         _timelineOverOut.resume();
      }
      
      private function onCollectGoalClicked(param1:InteractionEvent) : void
      {
         if(!_content.visible)
         {
            return;
         }
         User.current.character.setTutorialFlag("storygoals");
         Environment.panelManager.showDialog(new DialogGoals(User.current.character,_currentGoalValue));
      }
      
      public function refresh() : void
      {
         var _loc1_:Character = User.current.character;
         if(!_loc1_.hasTutorialFlag("tutorial_finished") || !User.current.showStorygoals)
         {
            _currentGoalValue = null;
            _iconContainer.itemContainer.removeAllChildren();
            var _loc3_:Boolean = false;
            _iconContainer.itemContainer.visible = _loc3_;
            _content.visible = _loc3_;
            return;
         }
         var _loc2_:GoalValue = _loc1_.currentStoryGoal;
         if(_loc2_ == null)
         {
            _currentGoalValue = null;
            _content.m.x = -3 - _content.m.width;
            _iconContainer.itemContainer.removeAllChildren();
            _content.txtProgress.x = -5;
            _content.txtProgress.width = 175;
            _content.txtProgress.text = LocText.current.text("general/base_panel/story_goals/no_goal");
            _content.checked.visible = false;
            _tooltipNoGoalIcon.text = LocText.current.text("general/base_panel/tooltip_no_story_goal");
            _tooltipNoGoal.text = LocText.current.text("general/base_panel/tooltip_no_story_goal");
            _tooltipGoalIcon.refresh(null);
            if(_tooltipGoal != null)
            {
               _tooltipGoal.refresh(null);
            }
            return;
         }
         if(_currentGoalValue != _loc2_)
         {
            _currentGoalValue = _loc2_;
            _iconContainer.itemContainer.setUriSprite(_loc2_.goal.iconImageUrl,61,61,true,1,null,true);
         }
         _loc3_ = true;
         _iconContainer.itemContainer.visible = _loc3_;
         _content.visible = _loc3_;
         _content.txtProgress.x = 30;
         _content.txtProgress.width = 140;
         _content.txtProgress.text = _currentGoalValue.progressText(_loc1_);
         if(_currentGoalValue.progressValue(_loc1_) > 0)
         {
            _content.m.x = -143 + 140 * _currentGoalValue.progressValue(_loc1_);
         }
         else
         {
            _content.m.x = -3 - _content.m.width;
         }
         _tooltipNoGoalIcon.text = "";
         _tooltipNoGoal.text = "";
         _tooltipGoalIcon.refresh(_currentGoalValue);
         if(_tooltipGoal != null)
         {
            _tooltipGoal.refresh(_currentGoalValue);
         }
         _content.checked.visible = _currentGoalValue.isAvailable(_loc1_) && _currentGoalValue.isCollectable(_loc1_) && !_currentGoalValue.isCollected(_loc1_);
      }
      
      public function reset() : void
      {
         _currentGoalValue = null;
      }
   }
}
