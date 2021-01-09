package com.playata.application.ui.elements.goal
{
   import com.playata.application.data.character.Character;
   import com.playata.application.data.goal.GoalValue;
   import com.playata.application.data.user.User;
   import com.playata.application.ui.elements.generic.button.UiButton;
   import com.playata.framework.application.Environment;
   import com.playata.framework.application.request.ActionRequestResponse;
   import com.playata.framework.core.collection.StringMap;
   import com.playata.framework.display.ui.IListFilter;
   import com.playata.framework.input.InteractionEvent;
   import com.playata.framework.localization.LocText;
   import visuals.ui.elements.goal.SymbolGoalInfoGeneric;
   
   public class UiGoalInfo
   {
      
      public static var GOAL_ITEM_IDS:StringMap = new StringMap();
       
      
      private var _content:SymbolGoalInfoGeneric = null;
      
      private var _goalValue:GoalValue = null;
      
      private var _onClickBackFunction:Function = null;
      
      private var _btnBack:UiButton = null;
      
      private var _character:Character;
      
      private var _list:UiGoalInfoList = null;
      
      private var _refreshListOnBackButton:Boolean = false;
      
      public function UiGoalInfo(param1:SymbolGoalInfoGeneric, param2:Character, param3:Function, param4:Function)
      {
         super();
         _content = param1;
         _character = param2;
         _onClickBackFunction = param3;
         _content.txtStageCaption.text = LocText.current.text("dialog/goals/info_stage_caption");
         _content.txtProgressCaption.text = LocText.current.text("dialog/goals/info_progress_caption");
         _content.txtRewardsCaption.text = LocText.current.text("dialog/goals/info_rewards_caption");
         _btnBack = new UiButton(_content.btnBack,"",onClickBack);
         _list = new UiGoalInfoList(_content.list,_character,param4,onRewardCollected);
      }
      
      public function set currentFilter(param1:IListFilter) : void
      {
         _list.currentFilter = param1;
      }
      
      private function onClickBack(param1:InteractionEvent) : void
      {
         _onClickBackFunction(_refreshListOnBackButton);
         _refreshListOnBackButton = false;
      }
      
      private function onRewardCollected() : void
      {
         if(_goalValue && _goalValue.goal.currentTargetValue(_character) != _goalValue)
         {
            _refreshListOnBackButton = true;
            _goalValue = _goalValue.goal.currentTargetValue(_character);
            _content.txtTitle.text = _goalValue.title;
            _content.txtDescription.text = _goalValue.longDescription(_character);
            _content.txtDescription.text = _content.txtDescription.text + _goalValue.stageInfo();
            _list.refreshList(false);
         }
      }
      
      public function get content() : SymbolGoalInfoGeneric
      {
         return _content;
      }
      
      public function get goalValue() : GoalValue
      {
         return _goalValue;
      }
      
      public function dispose() : void
      {
         _btnBack.dispose();
         _btnBack = null;
         _list.dispose();
         _list = null;
      }
      
      public function refresh(param1:GoalValue) : void
      {
         var _loc2_:int = 0;
         var _loc3_:* = null;
         _goalValue = param1;
         _content.iconGoal.setUriSprite(_goalValue.goal.iconImageUrl,60,60,true,5,null,true);
         _content.iconLock.visible = !_goalValue.isAvailable(_character) && !_goalValue.isCollected(_character) && !_goalValue.isCollectable(_character);
         _content.iconLock.bringToTop();
         _content.txtTitle.text = _goalValue.title;
         _content.txtDescription.text = _goalValue.longDescription(_character);
         _content.txtDescription.text = _content.txtDescription.text + _goalValue.stageInfo();
         _content.txtDescription.autoFontSize = true;
         _list.refresh(_goalValue.goal,_goalValue);
         _content.iconGoal.x = _content.txtTitle.x + _content.txtTitle.width / 2 - _content.txtTitle.textWidth / 2 - 65;
         _content.iconLock.x = _content.iconGoal.x + 32;
         if(_character.isMe)
         {
            _loc2_ = 0;
            while(_loc2_ < _goalValue.goal.values.length)
            {
               _loc3_ = _goalValue.goal.values[_loc2_];
               if(_loc3_.isCollectable(_character))
               {
                  if(!_loc3_.isCollected(_character) && _loc3_.isItemReward)
                  {
                     if(!GOAL_ITEM_IDS.exists(_loc3_.itemId) || !User.current.character.hasItem(GOAL_ITEM_IDS.getData(_loc3_.itemId)))
                     {
                        Environment.application.sendActionRequest("getGoalItemRewards",{"identifier":_loc3_.goal.identifier},handleRequests);
                        break;
                     }
                  }
                  _loc2_++;
                  continue;
               }
               break;
            }
         }
      }
      
      private function handleRequests(param1:ActionRequestResponse) : void
      {
         var _loc4_:* = param1.action;
         if("getGoalItemRewards" !== _loc4_)
         {
            throw new Error("Unsupported request action \'" + param1.action + "\'!");
         }
         if(param1.error == "")
         {
            Environment.application.updateData(param1.data);
            _loc4_ = 0;
            var _loc3_:* = _goalValue.goal.values;
            for each(var _loc2_ in _goalValue.goal.values)
            {
               if(param1.appResponse.goal_item_ids.hasData(_loc2_.value.toString()))
               {
                  GOAL_ITEM_IDS.setData(_loc2_.itemId,param1.appResponse.goal_item_ids.getInt(_loc2_.value.toString()));
               }
            }
            _list.refreshList(false);
         }
         else
         {
            Environment.reportError(param1.error,param1.request);
         }
      }
      
      public function onFilterChanged() : void
      {
         _list.refreshList();
      }
      
      public function set showCollectedGoalValues(param1:Boolean) : void
      {
         _list.showCollectedGoalValues = param1;
      }
      
      public function set showOpenGoalValues(param1:Boolean) : void
      {
         _list.showOpenGoalValues = param1;
      }
   }
}
