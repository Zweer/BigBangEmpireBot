package com.playata.application.ui.elements.herobook
{
   import com.playata.application.data.constants.CConstant;
   import com.playata.application.data.herobook.HerobookObjective;
   import com.playata.application.data.user.User;
   import com.playata.application.ui.ViewManager;
   import com.playata.application.ui.dialogs.DialogRenewHerobookObjective;
   import com.playata.application.ui.elements.generic.button.UiButton;
   import com.playata.application.ui.elements.generic.button.UiPremiumButton;
   import com.playata.application.ui.elements.item.UiItemSlot;
   import com.playata.framework.application.Environment;
   import com.playata.framework.application.request.ActionRequestResponse;
   import com.playata.framework.input.InteractionEvent;
   import com.playata.framework.localization.LocText;
   import visuals.ui.elements.herobook.SymbolHerobookInfoGeneric;
   
   public class UiHerobookObjectiveInfo
   {
       
      
      private var _content:SymbolHerobookInfoGeneric = null;
      
      private var _objective:HerobookObjective = null;
      
      private var _onClickBackFunction:Function = null;
      
      private var _btnBack:UiButton = null;
      
      private var _itemReward:UiItemSlot = null;
      
      private var _btnInstantFinish:UiPremiumButton;
      
      private var _timer:UiHerobookTimer;
      
      private var _onClickToComplete:Function;
      
      private var _btnRenew:UiButton;
      
      public function UiHerobookObjectiveInfo(param1:SymbolHerobookInfoGeneric, param2:Function, param3:Function)
      {
         super();
         _content = param1;
         _onClickBackFunction = param2;
         _onClickToComplete = param3;
         _content.txtProgressCaption.text = LocText.current.text("dialog/goals/info_progress_caption");
         _content.txtRewardsCaption.text = LocText.current.text("dialog/goals/info_rewards_caption");
         _btnBack = new UiButton(_content.btnBack,"",onClickBack);
         _btnInstantFinish = new UiPremiumButton(_content.btnInstantFinish,0,"",LocText.current.text("dialog/herobook/button_instant_finish"),"","",onClickInstantFinish);
         _btnInstantFinish.premium = true;
         _btnRenew = new UiButton(_content.btnRenewObjective,LocText.current.text("dialog/herobook/button_renew_objective_tooltip"),openRenewDialog);
         _itemReward = new UiItemSlot(_content.itemReward,0);
         _timer = new UiHerobookTimer(_content.timer,timerFinished);
      }
      
      private function timerFinished() : void
      {
      }
      
      private function onClickBack(param1:InteractionEvent) : void
      {
      }
      
      public function get content() : SymbolHerobookInfoGeneric
      {
         return _content;
      }
      
      public function get objective() : HerobookObjective
      {
         return _objective;
      }
      
      public function dispose() : void
      {
         _btnBack.dispose();
         _btnBack = null;
         _timer.dispose();
         _timer = null;
         _btnInstantFinish.dispose();
         _btnInstantFinish = null;
         _itemReward.dispose();
         _itemReward = null;
         _btnRenew.dispose();
         _btnRenew = null;
         _onClickBackFunction = null;
         _onClickToComplete = null;
         _content = null;
      }
      
      private function onClickInstantFinish(param1:InteractionEvent) : void
      {
         Environment.application.sendActionRequest("instantFinishHerobookObjective",{"id":_objective.id},handleRequests);
      }
      
      private function openRenewDialog(param1:InteractionEvent) : void
      {
         Environment.panelManager.showDialog(new DialogRenewHerobookObjective(_objective,_onClickBackFunction));
      }
      
      public function refresh(param1:HerobookObjective) : void
      {
         var _loc2_:int = 0;
         _objective = param1;
         _content.iconObjective.setUriSprite(_objective.iconImageUrl,45,45,true,5,null,true);
         _content.iconCharacter.iconCharacter.setUriSprite(_objective.characterImageUrl,79,89,true,5,null,true);
         _timer.refresh(_objective);
         _content.txtTitle.text = _objective.name;
         _content.txtDescription.text = _objective.longDescription;
         _content.txtDescription.autoFontSize = true;
         _content.txtProgress.text = _objective.progressText;
         _content.txtShortDescription.text = _objective.shortDescription;
         _content.txtReward.text = _objective.rewardText;
         _content.txtReward.visible = !_objective.isItemReward;
         _content.iconCoins.visible = _objective.isCoinReward;
         _content.iconPremiumCurrency.visible = _objective.isPremiumCurrencyReward;
         _content.iconXp.visible = _objective.isXpReward;
         _content.iconStatPoints.visible = _objective.isStatPointReward;
         _content.iconQuestEnergy.visible = _objective.isQuestEnergyReward;
         _content.iconFans.visible = _objective.isFansReward;
         _content.iconStreamingResource.visible = _objective.isStreamingResourceReward;
         _btnInstantFinish.visible = !param1.isCollectable && !param1.isCollected;
         _btnRenew.visible = !param1.isCollectable && !param1.isCollected;
         if(_btnInstantFinish.visible)
         {
            _loc2_ = 0;
            if(_objective.durationType == 1)
            {
               _loc2_ = CConstant.herobook_daily_objective_instant_finish_amount;
            }
            else if(_objective.durationType == 2)
            {
               _loc2_ = CConstant.herobook_weekly_objective_instant_finish_amount;
            }
            _loc2_ = Math.ceil((1 - _objective.progress) * _loc2_);
            _btnInstantFinish.premiumAmount = _loc2_;
            _btnInstantFinish.premiumTooltip = LocText.current.text("dialog/herobook/button_instant_finish_tooltip",_loc2_);
         }
         if(_objective.isItemReward)
         {
            _itemReward.item = User.current.character.getItemById(_objective.reward.itemId);
            _content.itemReward.visible = true;
         }
         else
         {
            _content.itemReward.visible = false;
         }
      }
      
      private function handleRequests(param1:ActionRequestResponse) : void
      {
         var _loc2_:* = param1.action;
         if("instantFinishHerobookObjective" !== _loc2_)
         {
            throw new Error("Unsupported request action \'" + param1.action + "\'!");
         }
         if(param1.error == "")
         {
            Environment.application.updateData(param1.data);
            if(_onClickToComplete != null)
            {
               _onClickToComplete(objective);
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
