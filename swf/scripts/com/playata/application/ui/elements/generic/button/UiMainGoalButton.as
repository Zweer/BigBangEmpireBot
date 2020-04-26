package com.playata.application.ui.elements.generic.button
{
   import com.playata.application.data.user.User;
   import com.playata.application.ui.ViewManager;
   import com.playata.application.ui.dialogs.DialogGoals;
   import com.playata.application.ui.effects.ScaleInOutEffect;
   import com.playata.framework.application.Environment;
   import com.playata.framework.display.layout.LayoutUtil;
   import com.playata.framework.input.InteractionEvent;
   import com.playata.framework.localization.LocText;
   import visuals.ui.elements.goal.SymbolButtonGoalGeneric;
   
   public class UiMainGoalButton extends UiButton
   {
       
      
      private var _realContent:SymbolButtonGoalGeneric = null;
      
      private var _scaleInOutEffect:ScaleInOutEffect = null;
      
      public function UiMainGoalButton(param1:SymbolButtonGoalGeneric)
      {
         _realContent = param1;
         super(param1,LocText.current.text("general/base_panel/goals_tooltip"),onClickGoals);
         _scaleInOutEffect = new ScaleInOutEffect(param1.exclamationMark,1,0.45);
         _realContent.exclamationMark.visible = false;
      }
      
      override public function dispose() : void
      {
         _scaleInOutEffect.dispose();
         super.dispose();
      }
      
      public function refresh(param1:Boolean) : void
      {
         var _loc2_:Boolean = _realContent.exclamationMark.visible;
         _realContent.exclamationMark.visible = User.current.character.hasCollectableGoalValues && !DialogGoals.ownDialogOpen && !param1;
         _realContent.checkMark.visible = false;
         if(!_loc2_ && _realContent.exclamationMark.visible)
         {
            animate();
         }
         else if(_loc2_ && !_realContent.exclamationMark.visible)
         {
            idle();
         }
         if(_realContent.exclamationMark.visible && !User.current.character.hasTutorialFlag("goals_button") && User.current.character.hasTutorialFlag("storygoals"))
         {
            ViewManager.instance.tutorialArrow.showTutorial(LocText.current.text("tutorial/goals_arrow_text"),"left_front","right",850 + LayoutUtil.deviceAdjustedWidthCorrection,45);
         }
      }
      
      public function idle() : void
      {
         _scaleInOutEffect.stop();
      }
      
      public function animate() : void
      {
         _scaleInOutEffect.play();
      }
      
      private function onClickGoals(param1:InteractionEvent) : void
      {
         if(User.current.character.hasTutorialFlag("storygoals") && !User.current.character.hasTutorialFlag("goals_button") && _realContent.exclamationMark.visible)
         {
            User.current.character.setTutorialFlag("goals_button");
            ViewManager.instance.tutorialArrow.hide();
         }
         Environment.panelManager.showDialog(new DialogGoals(User.current.character));
      }
   }
}
