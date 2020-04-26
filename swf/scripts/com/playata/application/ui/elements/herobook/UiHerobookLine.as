package com.playata.application.ui.elements.herobook
{
   import com.playata.application.data.constants.CConstant;
   import com.playata.application.data.herobook.HerobookObjective;
   import com.playata.application.platform.ServerInfo;
   import com.playata.application.ui.ViewManager;
   import com.playata.application.ui.dialogs.DialogRenewHerobookObjective;
   import com.playata.application.ui.elements.generic.button.UiButton;
   import com.playata.application.ui.elements.generic.button.UiPremiumButton;
   import com.playata.application.ui.elements.generic.button.UiTextButton;
   import com.playata.application.ui.elements.generic.textfield.UiTextTooltip;
   import com.playata.framework.application.Environment;
   import com.playata.framework.application.request.ActionRequestResponse;
   import com.playata.framework.input.InteractionEvent;
   import com.playata.framework.localization.LocText;
   import visuals.ui.elements.herobook.SymbolHerobookLineGeneric;
   
   public class UiHerobookLine
   {
       
      
      private var _content:SymbolHerobookLineGeneric = null;
      
      private var _index:int = 0;
      
      private var _objective:HerobookObjective = null;
      
      private var _onClickFunction:Function = null;
      
      private var _onRenewFunction:Function = null;
      
      private var _btnRight:UiButton = null;
      
      private var _btnCollect:UiTextButton = null;
      
      private var _btnInstantFinish:UiPremiumButton = null;
      
      private var _finishedTooltip:UiTextTooltip = null;
      
      private var _timer:UiHerobookTimer = null;
      
      private var _btnRenew:UiButton = null;
      
      public function UiHerobookLine(param1:SymbolHerobookLineGeneric, param2:Function, param3:Function)
      {
         super();
         _content = param1;
         _onClickFunction = param2;
         _onRenewFunction = param3;
         _btnRight = new UiButton(_content.btnRight,LocText.current.text("dialog/goals/button_info_tooltip"),onClickRight);
         _btnCollect = new UiTextButton(_content.btnCollect,LocText.current.text("dialog/goals/button_collect"),LocText.current.text("dialog/goals/button_collect_tooltip"),onClickCollect);
         _btnInstantFinish = new UiPremiumButton(_content.btnInstantFinish,0,"",LocText.current.text("dialog/herobook/button_instant_finish"),"",LocText.current.text("dialog/herobook/button_instant_finish_tooltip"),onClickInstantFinish);
         _btnInstantFinish.premium = true;
         _finishedTooltip = new UiTextTooltip(_content.tooltip,"",requestTooltip);
         _btnRenew = new UiHerobookRenewButton(_content.iconRenew,LocText.current.text("dialog/herobook/button_renew_objective_tooltip"),openRenewDialog);
         _btnRenew.visible = false;
         _timer = new UiHerobookTimer(_content.timer,timerFinished);
      }
      
      private function timerFinished() : void
      {
         refresh(_objective,_index,false);
      }
      
      public function get content() : SymbolHerobookLineGeneric
      {
         return _content;
      }
      
      public function get index() : int
      {
         return _index;
      }
      
      public function get objective() : HerobookObjective
      {
         return _objective;
      }
      
      public function dispose() : void
      {
         _btnRight.dispose();
         _btnRight = null;
         _btnCollect.dispose();
         _btnCollect = null;
         _btnInstantFinish.dispose();
         _btnInstantFinish = null;
         _finishedTooltip.dispose();
         _finishedTooltip = null;
         _btnRenew.dispose();
         _btnRenew = null;
         _timer.dispose();
         _timer = null;
         _onClickFunction = null;
      }
      
      private function onClickRight(param1:InteractionEvent) : void
      {
      }
      
      private function onClickCollect(param1:InteractionEvent) : void
      {
      }
      
      private function onClickInstantFinish(param1:InteractionEvent) : void
      {
         Environment.application.sendActionRequest("instantFinishHerobookObjective",{"id":_objective.id},handleRequests);
      }
      
      private function openRenewDialog(param1:InteractionEvent) : void
      {
         Environment.panelManager.showDialog(new DialogRenewHerobookObjective(_objective,_onRenewFunction));
      }
      
      public function refresh(param1:HerobookObjective, param2:int, param3:Boolean) : void
      {
         var _loc4_:int = 0;
         _index = param2;
         _objective = param1;
         if(_objective == null)
         {
            if(param3)
            {
               _content.visible = true;
               changeVisibleityOfAllElements(false);
               _content.iconLock.visible = true;
               _content.txtWeeklyInfo.visible = true;
               _content.txtWeeklyInfo.text = LocText.current.text("dialog/herobook/no_weekly_info");
               _content.txtWeeklyInfo.autoFontSize = true;
               _content.iconCharacter.visible = true;
               _content.iconCharacter.iconCharacter.setUriSprite(ServerInfo.assetURL("herobook_character/npc_hb_dummy","png"),81,91,true,5,null,true);
               _content.iconObjective.removeAllChildren();
            }
            else
            {
               _content.visible = false;
            }
            _timer.hide();
            return;
         }
         _content.visible = true;
         changeVisibleityOfAllElements(true);
         _content.iconLock.visible = false;
         _content.txtWeeklyInfo.visible = false;
         _content.txtTitle.text = _objective.name;
         _content.txtTitle.autoFontSize = true;
         _content.txtShortDescription.text = _objective.shortDescription;
         _content.iconCheckmark.visible = _objective.isCollected;
         _content.iconCharacter.iconCharacter.setUriSprite(_objective.characterImageUrl,79,89,true,5,null,true);
         _content.iconObjective.setUriSprite(_objective.iconImageUrl,45,45,true,5,null,true);
         if(_objective.isStarted && _objective.remainingSeconds <= 0)
         {
            _btnCollect.visible = false;
            _btnRight.visible = false;
            _btnInstantFinish.visible = false;
            _content.txtReward.visible = false;
            _content.iconCoins.visible = false;
            _content.iconPremiumCurrency.visible = false;
            _content.iconXp.visible = false;
            _content.iconStatPoints.visible = false;
            _content.iconItem.visible = false;
            _content.iconQuestEnergy.visible = false;
            _timer.hide();
            return;
         }
         _content.iconInactive.visible = false;
         _btnCollect.visible = _objective.isCollectable && !_objective.isCollected;
         _content.txtShortDescription.autoFontSize = true;
         _btnRight.visible = !_objective.isCollectable && !_objective.isCollected;
         _btnInstantFinish.visible = !_objective.isCollectable && !_objective.isCollected;
         _btnRenew.visible = !_objective.isCollectable && !_objective.isCollected;
         if(_btnInstantFinish.visible)
         {
            _loc4_ = 0;
            if(_objective.durationType == 1)
            {
               _loc4_ = CConstant.herobook_daily_objective_instant_finish_amount;
            }
            else if(_objective.durationType == 2)
            {
               _loc4_ = CConstant.herobook_weekly_objective_instant_finish_amount;
            }
            _loc4_ = Math.ceil((1 - _objective.progress) * _loc4_);
            _btnInstantFinish.premiumAmount = _loc4_;
            _btnInstantFinish.premiumTooltip = LocText.current.text("dialog/herobook/button_instant_finish_tooltip",_loc4_);
         }
         if(_objective.isCollectable || _objective.isCollected || _objective.isAborted)
         {
            _timer.hide();
         }
         else
         {
            _timer.refresh(_objective);
         }
         if(!_objective.isCollected)
         {
            _content.txtReward.text = _objective.rewardText;
            _content.iconCoins.visible = _objective.isCoinReward;
            _content.iconPremiumCurrency.visible = _objective.isPremiumCurrencyReward;
            _content.iconXp.visible = _objective.isXpReward;
            _content.iconStatPoints.visible = _objective.isStatPointReward;
            _content.iconItem.visible = _objective.isItemReward;
            _content.iconQuestEnergy.visible = _objective.isQuestEnergyReward;
         }
         else
         {
            _content.txtReward.visible = false;
            _content.iconCoins.visible = false;
            _content.iconPremiumCurrency.visible = false;
            _content.iconXp.visible = false;
            _content.iconStatPoints.visible = false;
            _content.iconItem.visible = false;
            _content.iconQuestEnergy.visible = false;
         }
      }
      
      private function changeVisibleityOfAllElements(param1:Boolean) : void
      {
         _content.txtTitle.visible = param1;
         _content.txtShortDescription.visible = param1;
         _content.txtWeeklyInfo.visible = param1;
         _content.txtReward.visible = param1;
         _content.iconCharacter.visible = param1;
         _content.iconObjective.visible = param1;
         _btnCollect.visible = param1;
         _btnRight.visible = param1;
         _btnInstantFinish.visible = param1;
         _content.iconLock.visible = param1;
         _content.iconInactive.visible = param1;
         _content.iconCheckmark.visible = param1;
         _content.iconCoins.visible = param1;
         _content.iconPremiumCurrency.visible = param1;
         _content.iconXp.visible = param1;
         _content.iconStatPoints.visible = param1;
         _content.iconItem.visible = param1;
         _content.iconQuestEnergy.visible = param1;
      }
      
      private function requestTooltip() : String
      {
         var _loc1_:* = null;
         if(_objective)
         {
            if(_objective.isCollected)
            {
               _loc1_ = _objective.longDescription;
               if(_objective.remainingSeconds > 0)
               {
                  _loc1_ = _loc1_ + ("\n\n" + LocText.current.text("dialog/herobook/new_objective",_objective.timeRemainingLongString));
               }
               return _loc1_;
            }
            if(_objective.isStarted && _objective.remainingSeconds > 0)
            {
               return LocText.current.text("dialog/herobook/objective_tooltip",_objective.timeRemainingLongString);
            }
            if(_objective.isStarted && _objective.remainingSeconds <= 0)
            {
               return LocText.current.text("dialog/herobook/objective_tooltip_inactive");
            }
         }
         return "";
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
            if(_onClickFunction != null)
            {
               _onClickFunction(objective);
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
