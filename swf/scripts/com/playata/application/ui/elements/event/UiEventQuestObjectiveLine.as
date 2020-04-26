package com.playata.application.ui.elements.event
{
   import com.playata.application.data.constants.CConstant;
   import com.playata.application.data.event.EventQuestObjective;
   import com.playata.application.ui.ViewManager;
   import com.playata.application.ui.elements.generic.button.UiButton;
   import com.playata.application.ui.elements.generic.button.UiPremiumButton;
   import com.playata.application.ui.elements.generic.button.UiTextButton;
   import com.playata.application.ui.elements.generic.textfield.UiTextTooltip;
   import com.playata.framework.application.Environment;
   import com.playata.framework.application.request.ActionRequestResponse;
   import com.playata.framework.display.InteractiveDisplayObject;
   import com.playata.framework.input.InteractionEvent;
   import com.playata.framework.localization.LocText;
   import visuals.ui.elements.event.SymbolEventQuestObjectiveLineGeneric;
   
   public class UiEventQuestObjectiveLine extends InteractiveDisplayObject
   {
       
      
      private var _content:SymbolEventQuestObjectiveLineGeneric = null;
      
      private var _index:int = 0;
      
      private var _objective:EventQuestObjective = null;
      
      private var _onClickFunction:Function = null;
      
      private var _onDoubleClickFunction:Function = null;
      
      private var _btnRight:UiButton = null;
      
      private var _btnCollect:UiTextButton = null;
      
      private var _finishedTooltip:UiTextTooltip = null;
      
      private var _btnInstantFinish:UiPremiumButton;
      
      private var _reward:UiEventQuestObjectiveReward = null;
      
      public function UiEventQuestObjectiveLine(param1:SymbolEventQuestObjectiveLineGeneric, param2:Function, param3:Function)
      {
         _content = param1;
         super(_content);
         _onClickFunction = param2;
         _onDoubleClickFunction = param3;
         _reward = new UiEventQuestObjectiveReward(_content.reward);
         _btnRight = new UiButton(_content.btnRight,LocText.current.text("dialog/goals/button_info_tooltip"),onClickRight);
         _btnCollect = new UiTextButton(_content.btnCollect,LocText.current.text("dialog/goals/button_collect"),LocText.current.text("dialog/goals/button_collect_tooltip"),onClickCollect);
         _btnInstantFinish = new UiPremiumButton(_content.btnInstantFinish,0,"",LocText.current.text("dialog/event_quest/button_instant_finish"),"",LocText.current.text("dialog/event_quest/button_instant_finish_tooltip"),onClickInstantFinish);
         _btnInstantFinish.premium = true;
         _finishedTooltip = new UiTextTooltip(_content.iconCheckmark,"");
         onClick.add(handleClick);
         onDoubleClick.add(handleDoubleClick);
         useHandCursor = false;
      }
      
      public function get content() : SymbolEventQuestObjectiveLineGeneric
      {
         return _content;
      }
      
      public function get index() : int
      {
         return _index;
      }
      
      public function get objective() : EventQuestObjective
      {
         return _objective;
      }
      
      override public function dispose() : void
      {
         _btnRight.dispose();
         _btnRight = null;
         _btnCollect.dispose();
         _btnCollect = null;
         _finishedTooltip.dispose();
         _finishedTooltip = null;
         _btnInstantFinish.dispose();
         _btnInstantFinish = null;
         super.dispose();
      }
      
      private function onClickRight(param1:InteractionEvent) : void
      {
      }
      
      private function onClickCollect(param1:InteractionEvent) : void
      {
      }
      
      private function onClickInstantFinish(param1:InteractionEvent) : void
      {
         Environment.application.sendActionRequest("instantFinishEventQuestObjective",{"objective_identifier":_objective.identifier},handleRequests);
      }
      
      private function handleClick(param1:InteractionEvent) : void
      {
         Environment.audio.playFX("ui_button_click.mp3");
      }
      
      private function handleDoubleClick(param1:InteractionEvent) : void
      {
         Environment.audio.playFX("ui_button_click.mp3");
      }
      
      public function highlight(param1:Boolean) : void
      {
         if(!_content.visible)
         {
            return;
         }
         _content.backgroundOdd.visible = _index % 2 != 0;
      }
      
      public function refresh(param1:EventQuestObjective, param2:int) : void
      {
         var _loc3_:int = 0;
         _index = param2;
         _objective = param1;
         if(_objective == null)
         {
            _content.visible = false;
            return;
         }
         _content.visible = true;
         _btnCollect.visible = _objective.isCollectable && !_objective.isCollected;
         _btnRight.visible = !_objective.isCollectable && !_objective.isCollected;
         _btnInstantFinish.visible = !_objective.isCollectable && !_objective.isCollected;
         if(_btnInstantFinish.visible)
         {
            _loc3_ = CConstant.event_quest_objective_instant_finish_amount;
            _loc3_ = Math.ceil((1 - _objective.progress) * _loc3_);
            _btnInstantFinish.premiumAmount = _loc3_;
            _btnInstantFinish.premiumTooltip = LocText.current.text("dialog/event_quest/button_instant_finish_tooltip",_loc3_);
         }
         _reward.refresh(_objective);
         _content.visible = true;
         _content.txtTitle.text = _objective.name;
         _content.txtShortDescription.text = _objective.shortDescription;
         if(_btnCollect.visible)
         {
            _content.txtTitle.width = 312;
            _content.txtShortDescription.width = 312;
         }
         else
         {
            _content.txtTitle.width = 408;
            _content.txtShortDescription.width = 408;
         }
         _content.txtShortDescription.autoFontSize = true;
         _content.iconCheckmark.visible = _objective.isCollected;
         if(_content.iconCheckmark.visible)
         {
            _finishedTooltip.text = _objective.longDescription;
         }
         _content.iconObjective.setUriSprite(_objective.iconImageUrl,60,60,true,5,null,true);
         _content.backgroundOdd.visible = _index % 2 != 0;
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
            if(_onDoubleClickFunction != null)
            {
               _onDoubleClickFunction(this);
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
