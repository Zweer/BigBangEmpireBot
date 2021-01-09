package com.playata.application.ui.dialogs
{
   import com.playata.application.AppConfig;
   import com.playata.application.data.guild.Guild;
   import com.playata.application.data.user.User;
   import com.playata.application.messaging.Message;
   import com.playata.application.messaging.MessageRouter;
   import com.playata.application.ui.ViewManager;
   import com.playata.application.ui.elements.generic.button.UiButton;
   import com.playata.application.ui.elements.generic.button.UiTextButton;
   import com.playata.application.ui.elements.generic.dialog.UiDialog;
   import com.playata.application.ui.elements.generic.dialog.UiInfoDialog;
   import com.playata.application.ui.elements.guild.UiGuildChatTab;
   import com.playata.framework.application.Environment;
   import com.playata.framework.application.request.ActionRequestResponse;
   import com.playata.framework.core.Runtime;
   import com.playata.framework.input.InteractionEvent;
   import com.playata.framework.localization.LocText;
   import visuals.ui.dialogs.SymbolDialogGuildImproveGeneric;
   
   public class DialogGuildImprove extends UiDialog
   {
       
      
      private var _statType:int = 0;
      
      private var _isTotalImprovement:Boolean = false;
      
      private var _btnClose:UiButton = null;
      
      private var _btnImprove:UiTextButton = null;
      
      private var _isOpticalChange:Boolean;
      
      public function DialogGuildImprove(param1:int)
      {
         var _loc3_:SymbolDialogGuildImproveGeneric = new SymbolDialogGuildImproveGeneric();
         super(_loc3_);
         _queued = false;
         var _loc2_:Guild = User.current.character.guild;
         _statType = param1;
         _isTotalImprovement = _loc2_.isNextImprovementOpticalChange();
         var _loc7_:int = _loc2_.getStatValue(_statType);
         var _loc4_:int = _loc7_ + 1;
         _loc3_.txtCurrentValueCaption.text = LocText.current.text("dialog/guild_improve/current_value_caption",_loc7_);
         _loc3_.txtNextValueCaption.text = LocText.current.text("dialog/guild_improve/next_value_caption",_loc4_);
         switch(int(_statType) - 1)
         {
            case 0:
               _loc3_.txtDialogTitle.text = LocText.current.text("dialog/guild_improve/guild_capacity_title");
               _loc3_.txtBonus.text = LocText.current.text("dialog/guild_improve/guild_capacity_bonus",_loc7_,_loc4_);
               break;
            case 1:
               _loc3_.txtDialogTitle.text = LocText.current.text("dialog/guild_improve/character_base_stats_boost_title");
               _loc3_.txtBonus.text = LocText.current.text("dialog/guild_improve/character_base_stats_boost_bonus",_loc7_,_loc4_);
               break;
            case 2:
               _loc3_.txtDialogTitle.text = LocText.current.text("dialog/guild_improve/quest_xp_reward_boost_title");
               _loc3_.txtBonus.text = LocText.current.text("dialog/guild_improve/quest_xp_reward_boost_bonus",_loc7_ * 2,_loc4_ * 2);
               break;
            case 3:
               _loc3_.txtDialogTitle.text = LocText.current.text("dialog/guild_improve/quest_work_game_currency_reward_boost_title");
               _loc3_.txtBonus.text = LocText.current.text("dialog/guild_improve/quest_work_game_currency_reward_boost_bonus",_loc7_ * 2,_loc4_ * 2);
         }
         var _loc5_:int = _loc2_.getNextOpticalChangeLevel(_statType);
         if(AppConfig.customGuildBackgroundsEnabled)
         {
            _isOpticalChange = _loc4_ == _loc5_;
         }
         _loc3_.txtOpticalHint.text = LocText.current.text("dialog/guild_improve/optical_hint",_loc5_);
         _loc3_.txtOpticalHint.visible = _loc5_ > 0;
         _loc3_.iconOpticalHint.visible = _loc3_.txtOpticalHint.visible;
         _loc3_.iconGuildCapacity.visible = _statType == 1;
         _loc3_.iconCharacterBaseStatsBoost.visible = _statType == 2;
         _loc3_.iconQuestXpRewardBoost.visible = _statType == 3;
         _loc3_.iconQuestWorkGameCurrencyRewardBoost.visible = _statType == 4;
         _loc3_.iconGuildCapacity2.visible = _statType == 1;
         _loc3_.iconCharacterBaseStatsBoost2.visible = _statType == 2;
         _loc3_.iconQuestXpRewardBoost2.visible = _statType == 3;
         _loc3_.iconQuestWorkGameCurrencyRewardBoost2.visible = _statType == 4;
         _loc3_.txtCostCaption.text = LocText.current.text("dialog/guild_improve/cost_caption");
         var _loc6_:int = _loc2_.getStatImprovementCostPremiumCurrency(_statType,_loc4_);
         if(_loc2_.hasAvailableStatPoints)
         {
            _loc3_.txtCoinsCenter.visible = true;
            _loc3_.txtCoinsCenter.text = LocText.current.text("general/no_cost");
            _loc3_.txtCoins.visible = false;
            _loc3_.iconPremiumCurrency.visible = false;
            _loc3_.txtPremiumCurrency.visible = false;
            _loc3_.iconCoin.visible = false;
         }
         else if(_loc6_ == 0)
         {
            _loc3_.txtCoinsCenter.visible = true;
            _loc3_.txtCoinsCenter.text = LocText.current.formatHugeNumber(_loc2_.getStatImprovementCostGameCurrency(_statType,_loc4_));
            _loc3_.iconCoin.x = _loc3_.txtCoinsCenter.x + _loc3_.txtCoinsCenter.width / 2 - _loc3_.txtCoinsCenter.textWidth / 2 - 40;
            _loc3_.txtCoins.visible = false;
            _loc3_.iconPremiumCurrency.visible = false;
            _loc3_.txtPremiumCurrency.visible = false;
         }
         else
         {
            _loc3_.txtCoinsCenter.visible = false;
            _loc3_.txtCoins.text = LocText.current.formatHugeNumber(_loc2_.getStatImprovementCostGameCurrency(_statType,_loc4_));
            _loc3_.txtPremiumCurrency.text = LocText.current.formatHugeNumber(_loc6_);
         }
         _btnClose = new UiButton(_loc3_.btnClose,"",onClickClose);
         _btnImprove = new UiTextButton(_loc3_.btnImprove,LocText.current.text("dialog/create_guild/button_improve"),"",onClickImprove);
         _btnImprove.buttonEnabled = User.current.character.guildRank != 3;
         if(!_btnImprove.buttonEnabled)
         {
            _btnImprove.tooltip = LocText.current.text("dialog/create_guild/button_improve_locked_tooltip");
         }
         MessageRouter.addListener("ViewMessage.notifyNeededGuildDonationMade",handleMessages);
      }
      
      override public function dispose() : void
      {
         MessageRouter.removeAllListeners(handleMessages);
         if(_btnClose == null)
         {
            return;
         }
         _btnClose.dispose();
         _btnClose = null;
         _btnImprove.dispose();
         _btnImprove = null;
         super.dispose();
      }
      
      private function onClickClose(param1:InteractionEvent) : void
      {
         close();
      }
      
      private function onClickImprove(param1:InteractionEvent) : void
      {
         improveGuildStat();
      }
      
      private function improveGuildStat() : void
      {
         Environment.application.sendActionRequest("improveGuildStat",{"stat_type":_statType},handleRequests);
      }
      
      private function closeDialog() : void
      {
         close();
      }
      
      private function handleRequests(param1:ActionRequestResponse) : void
      {
         var _loc2_:* = null;
         var _loc3_:int = 0;
         var _loc4_:* = param1.action;
         if("improveGuildStat" !== _loc4_)
         {
            throw new Error("Unsupported request action \'" + param1.action + "\'!");
         }
         _loc2_ = User.current.character.guild;
         _loc3_ = _loc2_.getStatValue(_statType) + 1;
         if(param1.error == "")
         {
            Environment.application.updateData(param1.data);
            close();
            Environment.audio.playFX("event_guild_improved.mp3");
            UiGuildChatTab.instance.refreshGuildLog();
            Environment.panelManager.showDialog(new UiInfoDialog(LocText.current.text("dialog/guild_improve/success_title"),LocText.current.text("dialog/guild_improve/success_text",Guild.getStatName(_statType),_loc2_.getStatValue(_statType)),LocText.current.text("general/button_ok")));
            if(AppConfig.customGuildBackgroundsEnabled)
            {
               if(_isTotalImprovement)
               {
                  Environment.panelManager.showDialog(new UiInfoDialog(LocText.current.text("dialog/guild_improve_optical_change/success_title"),LocText.current.text("dialog/guild_improve_room_actors/success_text",Math.floor(_loc2_.totalImprovementPercentage())),LocText.current.text("general/button_ok")));
               }
               if(_isOpticalChange)
               {
                  switch(int(_statType) - 1)
                  {
                     case 0:
                        Environment.panelManager.showDialog(new UiInfoDialog(LocText.current.text("dialog/guild_improve_optical_change/success_title"),LocText.current.text("dialog/guild_improve_quarter/success_text",_loc3_),LocText.current.text("general/button_ok")));
                        break;
                     case 1:
                        Environment.panelManager.showDialog(new UiInfoDialog(LocText.current.text("dialog/guild_improve_optical_change/success_title"),LocText.current.text("dialog/guild_improve_equipment/success_text",_loc3_),LocText.current.text("general/button_ok")));
                        break;
                     case 2:
                        Environment.panelManager.showDialog(new UiInfoDialog(LocText.current.text("dialog/guild_improve_optical_change/success_title"),LocText.current.text("dialog/guild_improve_popularity/success_text",_loc3_),LocText.current.text("general/button_ok")));
                        break;
                     case 3:
                        Environment.panelManager.showDialog(new UiInfoDialog(LocText.current.text("dialog/guild_improve_optical_change/success_title"),LocText.current.text("dialog/guild_improve_motivation/success_text",_loc3_),LocText.current.text("general/button_ok")));
                  }
                  if(_isTotalImprovement || _isOpticalChange)
                  {
                     MessageRouter.dispatch(new Message("ViewMessage.notifyGuildUpgraded",null,this));
                  }
               }
            }
            else if(_isTotalImprovement)
            {
               Environment.panelManager.showDialog(new UiInfoDialog(LocText.current.text("dialog/guild_improve_optical_change/success_title"),LocText.current.text("dialog/guild_improve_optical_change/success_text",Math.floor(_loc2_.totalImprovementPercentage())),LocText.current.text("general/button_ok")));
            }
         }
         else if(param1.error == "errRemoveGameCurrencyNotEnough" || param1.error == "errRemovePremiumCurrencyNotEnough")
         {
            ViewManager.instance.showGuildNotEnoughGameCurrencyPremiumCurrencyDialog(_loc2_.getStatImprovementCostGameCurrency(_statType,_loc3_),_loc2_.getStatImprovementCostPremiumCurrency(_statType,_loc3_),closeDialog);
         }
         else if(param1.error == "errImproveStatNoPermission")
         {
            Environment.panelManager.showDialog(new UiInfoDialog(LocText.current.text("dialog/guild_improve/no_permission_title"),LocText.current.text("dialog/guild_improve/no_permission_text"),LocText.current.text("general/button_ok")));
         }
         else
         {
            Environment.reportError(param1.error,param1.request);
         }
      }
      
      private function handleMessages(param1:Message) : void
      {
         var _loc2_:* = param1.type;
         if("ViewMessage.notifyNeededGuildDonationMade" !== _loc2_)
         {
            throw new Error("Encountered unknown message type! type=" + param1.type);
         }
         _btnImprove.buttonEnabled = false;
         Runtime.delayFunction(improveGuildStat,0.3);
      }
      
      override public function onEscape() : void
      {
         close();
      }
   }
}
