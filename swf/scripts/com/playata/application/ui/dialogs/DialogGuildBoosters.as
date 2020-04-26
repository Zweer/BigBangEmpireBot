package com.playata.application.ui.dialogs
{
   import com.playata.application.data.guild.Guild;
   import com.playata.application.ui.ViewManager;
   import com.playata.application.ui.elements.generic.button.UiButton;
   import com.playata.application.ui.elements.generic.dialog.UiDialog;
   import com.playata.application.ui.elements.generic.dialog.UiInfoDialog;
   import com.playata.application.ui.elements.generic.dialog.UiTwoChoiceDialog;
   import com.playata.application.ui.elements.guild.UiGuildBoosterButton;
   import com.playata.framework.application.Environment;
   import com.playata.framework.application.request.ActionRequestResponse;
   import com.playata.framework.input.InteractionEvent;
   import com.playata.framework.localization.LocText;
   import visuals.ui.dialogs.SymbolDialogGuildBoostersGeneric;
   
   public class DialogGuildBoosters extends UiDialog
   {
       
      
      private var _btnClose:UiButton = null;
      
      private var _buttonQuest1:UiGuildBoosterButton = null;
      
      private var _buttonDuel1:UiGuildBoosterButton = null;
      
      private var _confirmationBoosterBtn:UiGuildBoosterButton;
      
      private var _guild:Guild = null;
      
      public function DialogGuildBoosters(param1:Guild)
      {
         var _loc4_:* = null;
         var _loc3_:SymbolDialogGuildBoostersGeneric = new SymbolDialogGuildBoostersGeneric();
         addExcludedFontScalingTextfield(_loc3_.btnBoostQuest1.txtDuration);
         addExcludedFontScalingTextfield(_loc3_.btnBoostQuest1.txtEffectAmount);
         addExcludedFontScalingTextfield(_loc3_.btnBoostDuel1.txtDuration);
         addExcludedFontScalingTextfield(_loc3_.btnBoostDuel1.txtEffectAmount);
         super(_loc3_);
         _queued = false;
         _guild = param1;
         _loc3_.txtDialogTitle.text = LocText.current.text("dialog/guild_boosters/title");
         _loc3_.txtBoostQuest.text = LocText.current.text("dialog/guild_boosters/quest_boost");
         _loc3_.txtBoostDuel.text = LocText.current.text("dialog/guild_boosters/duel_boost");
         var _loc2_:Boolean = false;
         _loc2_ = _loc3_.txtBoostQuest.numLines > 1 || _loc3_.txtBoostDuel.numLines > 1;
         if(_loc2_)
         {
            _loc4_ = _loc3_.txtBoostQuest.text;
            if(_loc4_.indexOf(" ") >= 0)
            {
               _loc3_.txtBoostQuest.y = _loc3_.txtBoostQuest.y - 20;
               _loc3_.txtBoostQuest.height = _loc3_.txtBoostQuest.height + 30;
               _loc3_.txtBoostQuest.text = _loc4_.substr(0,_loc4_.lastIndexOf(" ")) + "\n" + _loc4_.substr(_loc4_.lastIndexOf(" ") + 1);
               _loc3_.txtBoostQuest.autoFontSize = true;
            }
            _loc4_ = _loc3_.txtBoostDuel.text;
            if(_loc4_.indexOf(" ") >= 0)
            {
               _loc3_.txtBoostDuel.y = _loc3_.txtBoostDuel.y - 20;
               _loc3_.txtBoostDuel.height = _loc3_.txtBoostDuel.height + 30;
               _loc3_.txtBoostDuel.text = _loc4_.substr(0,_loc4_.lastIndexOf(" ")) + "\n" + _loc4_.substr(_loc4_.lastIndexOf(" ") + 1);
               _loc3_.txtBoostDuel.autoFontSize = true;
            }
         }
         _btnClose = new UiButton(_loc3_.btnClose,"",onClickClose);
         _buttonQuest1 = new UiGuildBoosterButton(_loc3_.btnBoostQuest1,"guild_booster_quest1",_guild,onClickBooster);
         _buttonDuel1 = new UiGuildBoosterButton(_loc3_.btnBoostDuel1,"guild_booster_duel1",_guild,onClickBooster);
      }
      
      private function refresh() : void
      {
         if(!_buttonQuest1)
         {
            return;
         }
         _buttonQuest1.refresh(_guild);
         _buttonDuel1.refresh(_guild);
      }
      
      override public function dispose() : void
      {
         _btnClose.dispose();
         _btnClose = null;
         _buttonQuest1.dispose();
         _buttonDuel1.dispose();
         _buttonQuest1 = null;
         _buttonDuel1 = null;
         super.dispose();
      }
      
      private function onClickBooster(param1:UiGuildBoosterButton) : void
      {
         if(!_guild.isOwnGuild)
         {
            return;
         }
         _confirmationBoosterBtn = param1;
         if(_guild.questBoosterActive && param1.boosterType == 1)
         {
            if(_guild.activeQuestBoosterId != param1.boosterId)
            {
               Environment.panelManager.showDialog(new UiTwoChoiceDialog(LocText.current.text("dialog/guild_boosters/overwrite_title"),LocText.current.text("dialog/guild_boosters/overwrite_text_quest"),LocText.current.text("general/button_yes"),LocText.current.text("general/button_no"),onClickOverwrite));
            }
            else
            {
               buyBooster(param1.boosterId,false,true);
            }
         }
         else if(_guild.duelBoosterActive && param1.boosterType == 2)
         {
            if(_guild.activeDuelBoosterId != param1.boosterId)
            {
               Environment.panelManager.showDialog(new UiTwoChoiceDialog(LocText.current.text("dialog/guild_boosters/overwrite_title"),LocText.current.text("dialog/guild_boosters/overwrite_text_duel"),LocText.current.text("general/button_yes"),LocText.current.text("general/button_no"),onClickOverwrite));
            }
            else
            {
               buyBooster(param1.boosterId,false,true);
            }
         }
         else
         {
            buyBooster(param1.boosterId);
         }
      }
      
      private function buyBooster(param1:String, param2:Boolean = false, param3:Boolean = false) : void
      {
         Environment.application.sendActionRequest("buyGuildBooster",{
            "id":param1,
            "overrideBooster":param2,
            "extendBooster":param3
         },handleRequests);
      }
      
      private function onClickClose(param1:InteractionEvent) : void
      {
         close();
      }
      
      private function onClickOverwrite() : void
      {
         buyBooster(_confirmationBoosterBtn.boosterId,true);
      }
      
      private function handleRequests(param1:ActionRequestResponse) : void
      {
         var _loc2_:* = param1.action;
         if("buyGuildBooster" !== _loc2_)
         {
            throw new Error("Unsupported request action \'" + param1.action + "\'!");
         }
         if(param1.error == "")
         {
            Environment.application.updateData(param1.data);
            Environment.audio.playFX("booster_activate.mp3");
            refresh();
         }
         else
         {
            if(param1.error == "errRemoveGameCurrencyNotEnough")
            {
               ViewManager.instance.showGuildNotEnoughGameCurrencyPremiumCurrencyDialog(_guild.getGuildBoosterCostGameCurrency(),0);
            }
            else if(param1.error == "errRemovePremiumCurrencyNotEnough")
            {
               ViewManager.instance.showGuildNotEnoughGameCurrencyPremiumCurrencyDialog(0,_guild.getGuildBoosterCostPremiumCurrency());
            }
            else if(param1.error == "errCharacterNoGuild")
            {
               Environment.panelManager.showDialog(new UiInfoDialog(LocText.current.text("dialog/guild_booster/no_guild_title"),LocText.current.text("dialog/guild_booster/no_guild_text"),LocText.current.text("general/button_ok")));
               close();
            }
            else if(param1.error == "errBuyGuildBoosterNoPermission")
            {
               Environment.panelManager.showDialog(new UiInfoDialog(LocText.current.text("dialog/guild_booster/no_permission_title"),LocText.current.text("dialog/guild_booster/no_permission_text"),LocText.current.text("general/button_ok")));
               close();
            }
            else if(param1.error == "errConsumeGuildBoosterAlreadyBought")
            {
               Environment.panelManager.showDialog(new UiInfoDialog(LocText.current.text("dialog/guild_booster/already_bought_title"),LocText.current.text("dialog/guild_booster/already_bought_text"),LocText.current.text("general/button_ok")));
               close();
            }
            else if(param1.error == "errConsumeGuilBoosterOtherBoosterActive")
            {
               if(_confirmationBoosterBtn.boosterType == 1)
               {
                  Environment.panelManager.showDialog(new UiTwoChoiceDialog(LocText.current.text("dialog/guild_boosters/overwrite_title"),LocText.current.text("dialog/guild_boosters/overwrite_text_quest"),LocText.current.text("general/button_yes"),LocText.current.text("general/button_no"),onClickOverwrite));
               }
               else if(_confirmationBoosterBtn.boosterType == 2)
               {
                  Environment.panelManager.showDialog(new UiTwoChoiceDialog(LocText.current.text("dialog/guild_boosters/overwrite_title"),LocText.current.text("dialog/guild_boosters/overwrite_text_duel"),LocText.current.text("general/button_yes"),LocText.current.text("general/button_no"),onClickOverwrite));
               }
            }
            else if(param1.error == "errConsumeGuildBoosterNotYetAllowed")
            {
               panelManager.showDialog(new UiInfoDialog(LocText.current.text("general/error"),LocText.current.text("dialog/start_duel_active_duel/title"),LocText.current.text("general/button_ok")));
            }
            else
            {
               Environment.reportError(param1.error,param1.request);
            }
            ViewManager.instance.refresh();
         }
      }
      
      override public function onEscape() : void
      {
         close();
      }
   }
}
