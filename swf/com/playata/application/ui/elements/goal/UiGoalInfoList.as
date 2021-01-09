package com.playata.application.ui.elements.goal
{
   import com.playata.application.data.character.Character;
   import com.playata.application.data.goal.Goal;
   import com.playata.application.data.goal.GoalValue;
   import com.playata.application.ui.elements.generic.scrollbar.UiScrollBar;
   import com.playata.framework.display.IDisplayObject;
   import com.playata.framework.display.ui.Direction;
   import com.playata.framework.display.ui.IListItem;
   import com.playata.framework.display.ui.controls.List;
   import com.playata.framework.display.ui.controls.ListLine;
   import com.playata.framework.display.ui.controls.ScrollList;
   import com.playata.framework.localization.LocText;
   import visuals.ui.elements.goal.SymbolGoalInfoListGeneric;
   
   public class UiGoalInfoList extends ScrollList
   {
       
      
      private var _content:SymbolGoalInfoListGeneric = null;
      
      private var _character:Character = null;
      
      private var _onCloseFunction:Function = null;
      
      private var _onRewardCollected:Function = null;
      
      private var _showCollectedGoalValues:Boolean = true;
      
      private var _showOpenGoalValues:Boolean = true;
      
      public function UiGoalInfoList(param1:SymbolGoalInfoListGeneric, param2:Character, param3:Function, param4:Function)
      {
         _content = param1;
         _character = param2;
         _onCloseFunction = param3;
         _onRewardCollected = param4;
         _content.txtNoGoalValues.visible = false;
         super(_content.listContainer,UiGoalInfoLine,Direction.VERTICAL,new UiScrollBar(_content.scrollBarKnob,_content.scrollBarLine,this),null,null,false,false,sortByValue);
         onListUpdated.add(refreshUI);
      }
      
      private function sortByValue(param1:GoalValue, param2:GoalValue) : int
      {
         return param1.value - param2.value;
      }
      
      public function refreshLocalization() : void
      {
         var _loc3_:int = 0;
         var _loc2_:* = _lines;
         for each(var _loc1_ in _lines)
         {
            _loc1_.refreshLocalization();
         }
      }
      
      override protected function addExistingLine(param1:IListItem, param2:int, param3:IDisplayObject) : ListLine
      {
         var _loc4_:UiGoalInfoLine = super.addExistingLine(param1,param2,param3) as UiGoalInfoLine;
         _loc4_.character = _character;
         _loc4_.onCloseFunction = _onCloseFunction;
         _loc4_.onRewardCollected = _onRewardCollected;
         return _loc4_;
      }
      
      override protected function addNewLine(param1:IListItem, param2:int) : ListLine
      {
         var _loc3_:UiGoalInfoLine = super.addNewLine(param1,param2) as UiGoalInfoLine;
         _loc3_.character = _character;
         _loc3_.onCloseFunction = _onCloseFunction;
         _loc3_.onRewardCollected = _onRewardCollected;
         return _loc3_;
      }
      
      public function refresh(param1:Goal, param2:GoalValue) : void
      {
         var _loc3_:Vector.<GoalValue> = null;
         var _loc5_:GoalValue = null;
         if(_showCollectedGoalValues && _showOpenGoalValues)
         {
            _loc3_ = param1.values;
         }
         else if(_showCollectedGoalValues && !_showOpenGoalValues)
         {
            _loc3_ = new Vector.<GoalValue>();
            var _loc7_:int = 0;
            var _loc6_:* = param1.values;
            for each(_loc5_ in param1.values)
            {
               if(_loc5_.isCollected(_character))
               {
                  _loc3_.push(_loc5_);
               }
            }
         }
         else
         {
            _loc3_ = new Vector.<GoalValue>();
            var _loc9_:int = 0;
            var _loc8_:* = param1.values;
            for each(_loc5_ in param1.values)
            {
               if(!_loc5_.isCollected(_character))
               {
                  _loc3_.push(_loc5_);
               }
            }
         }
         syncItemsFromVector(_loc3_);
         var _loc4_:UiGoalInfoLine = getLineForItem(param2) as UiGoalInfoLine;
         if(_loc4_)
         {
            scrollTo(_direction,_loc4_.y,0);
         }
      }
      
      private function refreshUI(param1:List) : void
      {
         _content.txtNoGoalValues.visible = currentItemCount == 0;
         if(currentItemCount == 0)
         {
            if(currentFilter == null)
            {
               _content.txtNoGoalValues.text = LocText.current.text("dialog/goals/list/no_goal_values");
            }
            else
            {
               _content.txtNoGoalValues.text = LocText.current.text("dialog/goals/list/no_filtered_goal_values");
            }
         }
      }
      
      public function set showCollectedGoalValues(param1:Boolean) : void
      {
         _showCollectedGoalValues = param1;
      }
      
      public function set showOpenGoalValues(param1:Boolean) : void
      {
         _showOpenGoalValues = param1;
      }
   }
}
