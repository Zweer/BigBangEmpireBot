package com.playata.application.ui.elements.event
{
   import com.playata.application.data.constants.CConstant;
   import com.playata.application.data.event.EventQuestObjective;
   import com.playata.application.ui.ViewManager;
   import com.playata.application.ui.elements.generic.button.UiButton;
   import com.playata.application.ui.elements.generic.button.UiPremiumButton;
   import com.playata.framework.application.Environment;
   import com.playata.framework.application.request.ActionRequestResponse;
   import com.playata.framework.input.InteractionEvent;
   import com.playata.framework.localization.LocText;
   import visuals.ui.elements.event.SymbolEventQuestObjectiveInfoGeneric;
   
   public class UiEventQuestObjectiveInfo
   {
       
      
      private var _content:SymbolEventQuestObjectiveInfoGeneric = null;
      
      private var _objective:EventQuestObjective = null;
      
      private var _onClickBackFunction:Function = null;
      
      private var _onClickToComplete:Function = null;
      
      private var _btnBack:UiButton = null;
      
      private var _btnInstantFinish:UiPremiumButton;
      
      private var _reward:UiEventQuestObjectiveReward = null;
      
      public function UiEventQuestObjectiveInfo(param1:SymbolEventQuestObjectiveInfoGeneric, param2:Function, param3:Function)
      {
         super();
         _content = param1;
         _onClickBackFunction = param2;
         _onClickToComplete = param3;
         _reward = new UiEventQuestObjectiveReward(_content.reward);
         _content.txtProgressCaption.text = LocText.current.text("dialog/goals/info_progress_caption");
         _content.txtRewardsCaption.text = LocText.current.text("dialog/goals/info_rewards_caption");
         _btnBack = new UiButton(_content.btnBack,"",onClickBack);
         _btnInstantFinish = new UiPremiumButton(_content.btnInstantFinish,0,"",LocText.current.text("dialog/event_quest/button_instant_finish"),"","",onClickInstantFinish);
         _btnInstantFinish.premium = true;
      }
      
      private function onClickBack(param1:InteractionEvent) : void
      {
      }
      
      private function onClickInstantFinish(param1:InteractionEvent) : void
      {
         Environment.application.sendActionRequest("instantFinishEventQuestObjective",{"objective_identifier":_objective.identifier},handleRequests);
      }
      
      public function get content() : SymbolEventQuestObjectiveInfoGeneric
      {
         return _content;
      }
      
      public function get objective() : EventQuestObjective
      {
         return _objective;
      }
      
      public function dispose() : void
      {
         _btnBack.dispose();
         _btnBack = null;
         _btnInstantFinish.dispose();
         _btnInstantFinish = null;
      }
      
      public function refresh(param1:EventQuestObjective) : void
      {
         var _loc2_:int = 0;
         _objective = param1;
         _content.iconObjective.setUriSprite(_objective.iconImageUrl,60,60,true,5,null,true);
         _content.txtTitle.text = _objective.name;
         _content.txtDescription.text = _objective.longDescription;
         _content.txtDescription.autoFontSize = true;
         _content.txtProgress.text = _objective.progressText;
         _content.iconObjective.x = _content.txtTitle.x + _content.txtTitle.width / 2 - _content.txtTitle.textWidth / 2 - 65;
         _reward.refresh(_objective);
         _btnInstantFinish.visible = !param1.isCollectable && !param1.isCollected;
         if(_btnInstantFinish.visible)
         {
            _loc2_ = CConstant.event_quest_objective_instant_finish_amount;
            _loc2_ = Math.ceil((1 - _objective.progress) * _loc2_);
            _btnInstantFinish.premiumAmount = _loc2_;
            _btnInstantFinish.premiumTooltip = LocText.current.text("dialog/event_quest/button_instant_finish_tooltip",_loc2_);
         }
      }
      
      private function handleRequests(param1:ActionRequestResponse) : void
      {
         var _loc2_:* = param1.action;
         if("instantFinishEventQuestObjective" !== _loc2_)
         {
            throw new Error("Unsupported request action \'" + param1.action + "\'!");
         }
         if(param1.error == "")
         {
            Environment.application.updateData(param1.data);
            if(_onClickToComplete != null)
            {
               _onClickToComplete(_objective);
            }
         }
         else if(param1.error == "errRemovePremiumCurrencyNotEnough")
         {
            if(_btnInstantFinish)
            {
               ViewManager.instance.showNotEnoughPremiumDialog(_btnInstantFinish.premiumAmount);
            }
         }
         else
         {
            Environment.reportError(param1.error,param1.request);
         }
      }
   }
}
