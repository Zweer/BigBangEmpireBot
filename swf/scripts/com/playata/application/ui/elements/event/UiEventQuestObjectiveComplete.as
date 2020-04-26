package com.playata.application.ui.elements.event
{
   import com.playata.application.data.GameUtil;
   import com.playata.application.data.event.EventQuestObjective;
   import com.playata.application.data.item.Item;
   import com.playata.application.data.user.User;
   import com.playata.application.ui.ViewManager;
   import com.playata.application.ui.effects.EffectsLayer;
   import com.playata.application.ui.elements.generic.button.UiTextButton;
   import com.playata.application.ui.elements.generic.dialog.UiTwoChoiceDialog;
   import com.playata.framework.application.Environment;
   import com.playata.framework.application.request.ActionRequestResponse;
   import com.playata.framework.input.InteractionEvent;
   import com.playata.framework.localization.LocText;
   import visuals.ui.elements.event.SymbolEventQuestObjectiveCompleteGeneric;
   
   public class UiEventQuestObjectiveComplete
   {
       
      
      private var _content:SymbolEventQuestObjectiveCompleteGeneric = null;
      
      private var _objective:EventQuestObjective = null;
      
      private var _finishedFunction:Function = null;
      
      private var _closeFunction:Function = null;
      
      private var _btnCollect:UiTextButton = null;
      
      private var _reward:UiEventQuestObjectiveReward = null;
      
      public function UiEventQuestObjectiveComplete(param1:SymbolEventQuestObjectiveCompleteGeneric, param2:Function, param3:Function)
      {
         super();
         _content = param1;
         _finishedFunction = param2;
         _closeFunction = param3;
         _reward = new UiEventQuestObjectiveReward(_content.reward);
         _content.txtRewardsCaption.text = LocText.current.text("dialog/goals/complete_rewards_caption");
         _content.txtDescription.text = LocText.current.text("dialog/event_quest_progress/objective_complete_text");
         _btnCollect = new UiTextButton(_content.btnCollect,LocText.current.text("dialog/goals/complete_button_collect"),"",onClickCollect);
      }
      
      private function onClickCollect(param1:InteractionEvent) : void
      {
         Environment.application.sendActionRequest("claimEventQuestObjectiveRewards",{
            "objective_identifier":_objective.identifier,
            "discard_item":false
         },handleRequests);
      }
      
      public function get content() : SymbolEventQuestObjectiveCompleteGeneric
      {
         return _content;
      }
      
      public function get objective() : EventQuestObjective
      {
         return _objective;
      }
      
      public function dispose() : void
      {
         _btnCollect.dispose();
         _btnCollect = null;
      }
      
      public function refresh(param1:EventQuestObjective) : void
      {
         _objective = param1;
         _content.iconObjective.setUriSprite(_objective.iconImageUrl,60,60,true,5,null,true);
         _content.txtTitle.text = _objective.name;
         _content.iconObjective.x = _content.txtTitle.x + _content.txtTitle.width / 2 - _content.txtTitle.textWidth / 2 - 65;
         _reward.refresh(_objective);
      }
      
      private function handleRequests(param1:ActionRequestResponse) : void
      {
         var _loc2_:* = param1.action;
         if("claimEventQuestObjectiveRewards" !== _loc2_)
         {
            throw new Error("Unsupported request action \'" + param1.action + "\'!");
         }
         if(param1.error == "")
         {
            Environment.application.updateData(param1.data);
            Environment.audio.playFX("goal_collected.mp3");
            showRewardEffect(!param1.request.getBoolean("discard_item"));
            _finishedFunction(true);
         }
         else if(param1.error == "errInventoryNoEmptySlot")
         {
            Environment.panelManager.showDialog(new UiTwoChoiceDialog(LocText.current.text("dialog/no_free_slot/title"),LocText.current.text("dialog/no_free_slot/text",GameUtil.getGameCurrencyString(_objective.rewardItem.sellPrice)),LocText.current.text("dialog/no_free_slot/button_go_to_shop"),LocText.current.text("dialog/no_free_slot/button_discard_item"),onClickGotoShop,onClickDiscardItem,false));
         }
         else if(param1.error != "errFinishObjectiveAlreadyCollected")
         {
            Environment.reportError(param1.error,param1.request);
         }
      }
      
      private function showRewardEffect(param1:Boolean) : void
      {
         var _loc2_:* = null;
         if(_content.reward.iconGameCurrency.visible)
         {
            EffectsLayer.instance.show(0,{"emitter":_content.reward.iconGameCurrency});
         }
         if(_content.reward.iconXP.visible)
         {
            EffectsLayer.instance.show(1,{"emitter":_content.reward.iconXP});
         }
         if(_content.reward.iconPremiumCurrency.visible)
         {
            EffectsLayer.instance.show(2,{
               "emitter":_content.reward.iconPremiumCurrency,
               "amount":GameUtil.getEventQuestObjectiveRewardAmount(_objective.rewardType,_objective.rewardFactor,User.current.character.level)
            });
         }
         if(param1 && _objective.isItemReward)
         {
            _loc2_ = new Item({"identifier":_objective.rewardReference});
            EffectsLayer.instance.show(3,{
               "emitter":_content.reward.iconItem,
               "imageUrl":_loc2_.iconImageUrl
            });
            _loc2_.dispose();
         }
         if(_content.reward.iconStatPoints.visible)
         {
            EffectsLayer.instance.show(7,{
               "emitter":_content.reward.iconStatPoints,
               "amount":GameUtil.getEventQuestObjectiveRewardAmount(_objective.rewardType,_objective.rewardFactor,User.current.character.level)
            });
         }
      }
      
      private function onClickGotoShop() : void
      {
         ViewManager.instance.showPanel("shop");
      }
      
      private function onClickDiscardItem() : void
      {
         Environment.application.sendActionRequest("claimEventQuestObjectiveRewards",{
            "objective_identifier":_objective.identifier,
            "discard_item":true
         },handleRequests);
      }
   }
}
