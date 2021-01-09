package com.playata.application.ui.dialogs
{
   import com.playata.application.data.constants.CConstant;
   import com.playata.application.data.herobook.HerobookObjective;
   import com.playata.application.data.user.User;
   import com.playata.application.ui.ViewManager;
   import com.playata.application.ui.elements.generic.button.UiButton;
   import com.playata.application.ui.elements.generic.button.UiPremiumButton;
   import com.playata.application.ui.elements.generic.dialog.UiDialog;
   import com.playata.application.ui.elements.herobook.UiHerobookTimer;
   import com.playata.application.ui.elements.item.UiItemSlot;
   import com.playata.framework.application.Environment;
   import com.playata.framework.application.request.ActionRequestResponse;
   import com.playata.framework.core.Runtime;
   import com.playata.framework.input.InteractionEvent;
   import com.playata.framework.localization.LocText;
   import visuals.ui.dialogs.SymbolDialogHerobookObjectiveRenewGeneric;
   
   public class DialogRenewHerobookObjective extends UiDialog
   {
       
      
      private var _btnClose:UiButton = null;
      
      private var _btnRenew:UiPremiumButton = null;
      
      private var _herobookObjective:HerobookObjective;
      
      private var _timer:UiHerobookTimer;
      
      private var _itemReward:UiItemSlot = null;
      
      private var _onRenewFunction:Function;
      
      public function DialogRenewHerobookObjective(param1:HerobookObjective, param2:Function = null)
      {
         var _loc4_:SymbolDialogHerobookObjectiveRenewGeneric = new SymbolDialogHerobookObjectiveRenewGeneric();
         super(_loc4_);
         _queued = false;
         _onRenewFunction = param2;
         _loc4_.txtDialogTitle.text = LocText.current.text("dialog/renew_herobook_objective/title");
         _loc4_.txtInfo.text = LocText.current.text("dialog/renew_herobook_objective/info");
         _btnClose = new UiButton(_loc4_.btnClose,"",onClickClose);
         var _loc3_:int = User.current.character.herobookObjectivesRenewedToday * CConstant.herobook_objective_renew_amount;
         _btnRenew = new UiPremiumButton(_loc4_.btnRenew,_loc3_,LocText.current.text("dialog/renew_herobook_objective/button_renew"),LocText.current.text("dialog/renew_herobook_objective/button_renew"),"","",onClickRenew);
         _btnRenew.premium = _loc3_ > 0;
         _timer = new UiHerobookTimer(_loc4_.timer,timerFinished);
         _itemReward = new UiItemSlot(_loc4_.itemReward,0);
         refresh(param1);
      }
      
      override public function dispose() : void
      {
         _btnClose.dispose();
         _btnClose = null;
         _btnRenew.dispose();
         _btnRenew = null;
         _timer.dispose();
         _timer = null;
         super.dispose();
      }
      
      private function onClickClose(param1:InteractionEvent) : void
      {
         close();
      }
      
      private function onClickRenew(param1:InteractionEvent) : void
      {
         Environment.application.sendActionRequest("renewHerobookObjective",{"id":_herobookObjective.id},handleRequests);
      }
      
      private function refresh(param1:HerobookObjective) : void
      {
         _herobookObjective = param1;
         var _loc2_:SymbolDialogHerobookObjectiveRenewGeneric = _vo as SymbolDialogHerobookObjectiveRenewGeneric;
         _loc2_.iconObjective.setUriSprite(_herobookObjective.iconImageUrl,45,45,true,5,null,true);
         _loc2_.iconCharacter.setUriSprite(_herobookObjective.characterImageUrl,79,89,true,5,null,true);
         _timer.refresh(_herobookObjective);
         _loc2_.txtObjectiveCaption.text = _herobookObjective.name;
         _loc2_.txtObjectiveCaption.autoFontSize = true;
         _loc2_.txtProgress.text = _herobookObjective.shortDescription;
         _loc2_.txtProgress.autoFontSize = true;
         _loc2_.txtReward.text = _herobookObjective.rewardText;
         _loc2_.iconCoins.visible = _herobookObjective.isCoinReward;
         _loc2_.iconPremiumCurrency.visible = _herobookObjective.isPremiumCurrencyReward;
         _loc2_.iconXp.visible = _herobookObjective.isXpReward;
         _loc2_.iconStatPoints.visible = _herobookObjective.isStatPointReward;
         _loc2_.iconQuestEnergy.visible = _herobookObjective.isQuestEnergyReward;
         _loc2_.iconFans.visible = _herobookObjective.isFansReward;
         _loc2_.iconStreamingResource.visible = _herobookObjective.isStreamingResourceReward;
         if(_herobookObjective.isItemReward)
         {
            _itemReward.item = User.current.character.getItemById(_herobookObjective.reward.itemId);
            _loc2_.itemReward.visible = true;
         }
         else
         {
            _loc2_.itemReward.visible = false;
         }
      }
      
      private function timerFinished() : void
      {
         close();
      }
      
      private function handleRequests(param1:ActionRequestResponse) : void
      {
         var _loc2_:* = null;
         var _loc3_:* = null;
         var _loc6_:* = param1.action;
         if("renewHerobookObjective" !== _loc6_)
         {
            throw new Error("Unsupported request action \'" + param1.action + "\'!");
         }
         if(param1.error == "")
         {
            _loc2_ = null;
            _loc3_ = null;
            _loc6_ = 0;
            var _loc5_:* = param1.typedData.getData("herobook_objectives");
            for(var _loc4_ in param1.typedData.getData("herobook_objectives"))
            {
               if(_loc4_ == "newObjectivesCreated")
               {
                  delete param1.data.herobook_objectives.newObjectivesCreated;
               }
               else
               {
                  if(_loc2_ == null || param1.data.herobook_objectives[_loc4_].id > param1.data.herobook_objectives[_loc2_].id)
                  {
                     _loc2_ = _loc4_;
                  }
                  if(param1.data.herobook_objectives[_loc4_].id == param1.request.getData("id"))
                  {
                     _loc3_ = _loc4_;
                  }
               }
            }
            if(_loc2_ && _loc3_)
            {
               param1.data.herobook_objectives[_loc2_].index = User.current.character.herobook.getObjectiveById(param1.data.herobook_objectives[_loc3_].id).index;
            }
            Environment.application.updateData(param1.data);
            close();
            Runtime.delayFunction(_onRenewFunction,0.01);
         }
         else if(param1.error == "errRemovePremiumCurrencyNotEnough")
         {
            if(_btnRenew)
            {
               ViewManager.instance.showNotEnoughPremiumDialog(_btnRenew.premiumAmount);
            }
            close();
         }
         else if(param1.error != "errInvalidHerobookObjectiveId")
         {
            Environment.reportError(param1.error,param1.request);
         }
      }
      
      override public function onEscape() : void
      {
         close();
      }
   }
}
