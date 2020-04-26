package com.playata.application.ui.elements.herobook
{
   import com.playata.application.data.GameUtil;
   import com.playata.application.data.herobook.HerobookObjective;
   import com.playata.application.data.user.User;
   import com.playata.application.ui.ViewManager;
   import com.playata.application.ui.effects.EffectsLayer;
   import com.playata.application.ui.elements.generic.button.UiTextButton;
   import com.playata.application.ui.elements.generic.dialog.UiTwoChoiceDialog;
   import com.playata.application.ui.elements.item.UiItemSlot;
   import com.playata.framework.application.Environment;
   import com.playata.framework.application.request.ActionRequestResponse;
   import com.playata.framework.input.InteractionEvent;
   import com.playata.framework.localization.LocText;
   import visuals.ui.elements.herobook.SymbolHerobookCompleteGeneric;
   
   public class UiHerobookObjectiveComplete
   {
       
      
      private var _content:SymbolHerobookCompleteGeneric = null;
      
      private var _objective:HerobookObjective = null;
      
      private var _finishedFunction:Function = null;
      
      private var _closeFunction:Function = null;
      
      private var _btnCollect:UiTextButton = null;
      
      private var _itemReward:UiItemSlot = null;
      
      public function UiHerobookObjectiveComplete(param1:SymbolHerobookCompleteGeneric, param2:Function, param3:Function)
      {
         super();
         _content = param1;
         _finishedFunction = param2;
         _closeFunction = param3;
         _content.txtRewardsCaption.text = LocText.current.text("dialog/goals/complete_rewards_caption");
         _content.txtDescription.text = LocText.current.text("dialog/herobook/complete_text");
         _content.txtDescription.autoFontSize = true;
         _btnCollect = new UiTextButton(_content.btnCollect,LocText.current.text("dialog/goals/complete_button_collect"),"",onClickCollect);
         _itemReward = new UiItemSlot(_content.itemReward,0);
      }
      
      private function onClickCollect(param1:InteractionEvent) : void
      {
         Environment.application.sendActionRequest("collectHerobookReward",{
            "id":_objective.id,
            "discard_item":false
         },handleRequests);
      }
      
      public function get content() : SymbolHerobookCompleteGeneric
      {
         return _content;
      }
      
      public function get objective() : HerobookObjective
      {
         return _objective;
      }
      
      public function dispose() : void
      {
         _btnCollect.dispose();
         _btnCollect = null;
         _itemReward.dispose();
         _itemReward = null;
      }
      
      public function refresh(param1:HerobookObjective) : void
      {
         _objective = param1;
         _content.iconObjective.setUriSprite(_objective.iconImageUrl,45,45,true,5,null,true);
         _content.iconCharacter.iconCharacter.setUriSprite(_objective.characterImageUrl,79,89,true,5,null,true);
         _content.txtTitle.text = _objective.name;
         _content.txtReward.text = _objective.rewardText;
         _content.txtShortDescription.text = _objective.shortDescription;
         _content.iconCoins.visible = _objective.isCoinReward;
         _content.iconPremiumCurrency.visible = _objective.isPremiumCurrencyReward;
         _content.iconXp.visible = _objective.isXpReward;
         _content.iconStatPoints.visible = _objective.isStatPointReward;
         _content.iconItem.visible = _objective.isItemReward;
         _content.iconQuestEnergy.visible = _objective.isQuestEnergyReward;
         _content.itemReward.visible = _objective.isItemReward;
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
         if(!_itemReward)
         {
            return;
         }
         var _loc2_:* = param1.action;
         if("collectHerobookReward" !== _loc2_)
         {
            throw new Error("Unsupported request action \'" + param1.action + "\'!");
         }
         if(param1.error == "")
         {
            Environment.application.updateData(param1.data);
            Environment.audio.playFX("goal_collected.mp3");
            showRewardEffect(!param1.request.getBoolean("discard_item"));
            _finishedFunction();
         }
         else if(param1.error == "errInventoryNoEmptySlot")
         {
            Environment.panelManager.showDialog(new UiTwoChoiceDialog(LocText.current.text("dialog/no_free_slot/title"),LocText.current.text("dialog/no_free_slot/text",GameUtil.getGameCurrencyString(_itemReward.item.sellPrice)),LocText.current.text("dialog/no_free_slot/button_go_to_shop"),LocText.current.text("dialog/no_free_slot/button_discard_item"),onClickGotoShop,onClickDiscardItem));
         }
         else if(param1.error == "errInvalidHerobookObjectiveId")
         {
            _finishedFunction();
         }
         else
         {
            Environment.reportError(param1.error,param1.request);
         }
      }
      
      private function showRewardEffect(param1:Boolean) : void
      {
         try
         {
            if(_content.iconCoins.visible)
            {
               EffectsLayer.instance.show(0,{"emitter":_content.iconCoins});
            }
            if(_content.iconXp.visible)
            {
               EffectsLayer.instance.show(1,{"emitter":_content.iconXp});
            }
            if(_content.iconPremiumCurrency.visible)
            {
               EffectsLayer.instance.show(2,{
                  "emitter":_content.iconPremiumCurrency,
                  "amount":_objective.reward.premiumCurrency
               });
            }
            if(param1 && _objective.isItemReward && _itemReward && _itemReward.item)
            {
               EffectsLayer.instance.show(3,{
                  "emitter":_content.itemReward,
                  "imageUrl":_itemReward.item.iconImageUrl
               });
            }
            if(_content.iconStatPoints.visible)
            {
               EffectsLayer.instance.show(7,{
                  "emitter":_content.iconCoins,
                  "amount":Math.round(_objective.reward.statPoints)
               });
            }
            return;
         }
         catch(e:Error)
         {
            return;
         }
      }
      
      private function onClickGotoShop() : void
      {
         ViewManager.instance.showPanel("shop");
      }
      
      private function onClickDiscardItem() : void
      {
         Environment.application.sendActionRequest("collectHerobookReward",{
            "id":_objective.id,
            "discard_item":true
         },handleRequests);
      }
   }
}
