package com.playata.application.ui.elements.goal
{
   import com.playata.application.data.character.Character;
   import com.playata.application.data.goal.GoalValue;
   import com.playata.application.data.goal.Goals;
   import com.playata.application.ui.elements.generic.button.UiButton;
   import com.playata.application.ui.elements.generic.progressbar.UiProgressBarBig;
   import com.playata.framework.input.InteractionEvent;
   import com.playata.framework.localization.LocText;
   import visuals.ui.elements.goal.SymbolGoalProgressSummaryMainBarGeneric;
   
   public class UiGoalProgressSummaryMainCategory
   {
       
      
      private var _content:SymbolGoalProgressSummaryMainBarGeneric = null;
      
      private var _categoryName:String = null;
      
      private var _categoryIndex:int = 0;
      
      private var _btnSwitch:UiButton = null;
      
      private var _onClickSwitchCategory:Function = null;
      
      private var _progressBar:UiProgressBarBig = null;
      
      private var _character:Character;
      
      public function UiGoalProgressSummaryMainCategory(param1:SymbolGoalProgressSummaryMainBarGeneric, param2:Character, param3:Function)
      {
         super();
         _content = param1;
         _categoryName = LocText.current.text("dialog/goals/category/all");
         _categoryIndex = 0;
         _onClickSwitchCategory = param3;
         _character = param2;
         _progressBar = new UiProgressBarBig(_content.progressBar);
         _btnSwitch = new UiButton(_content.btnSwitch,"",onClickSwitch);
      }
      
      public function dispose() : void
      {
         _btnSwitch.dispose();
         _btnSwitch = null;
         _progressBar.dispose();
         _progressBar = null;
      }
      
      public function get categoryIndex() : int
      {
         return _categoryIndex;
      }
      
      public function refresh(param1:Character) : void
      {
         var _loc4_:Vector.<GoalValue> = param1.finishedGoalValues(_categoryIndex);
         var _loc2_:int = Goals.instance.totalGoalValues(_categoryIndex,_character);
         var _loc3_:Number = Math.round(_loc4_.length / _loc2_ * 100);
         _progressBar.value = _loc3_;
         _content.txtName.text = _categoryName;
         _content.txtProgress.text = LocText.current.text("dialog/goals/summary/progress_text",_loc4_.length,_loc2_,_loc3_);
         _content.txtName.autoFontSize = true;
         _content.txtProgress.autoFontSize = true;
      }
      
      private function onClickSwitch(param1:InteractionEvent) : void
      {
         if(_onClickSwitchCategory == null)
         {
            return;
         }
         §§push(_onClickSwitchCategory(_categoryIndex));
      }
   }
}
