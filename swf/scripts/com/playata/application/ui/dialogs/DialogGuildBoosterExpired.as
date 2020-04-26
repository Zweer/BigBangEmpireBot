package com.playata.application.ui.dialogs
{
   import com.playata.application.data.guild.Guild;
   import com.playata.application.data.user.User;
   import com.playata.application.ui.ViewManager;
   import com.playata.application.ui.elements.generic.button.UiButton;
   import com.playata.application.ui.elements.generic.dialog.UiDialog;
   import com.playata.application.ui.elements.generic.dialog.UiInfoDialog;
   import com.playata.application.ui.elements.generic.dialog.UiTwoChoiceDialog;
   import com.playata.application.ui.elements.guild.UiGuildBoosterExpiredButton;
   import com.playata.framework.application.Environment;
   import com.playata.framework.application.request.ActionRequestResponse;
   import com.playata.framework.input.InteractionEvent;
   import com.playata.framework.localization.LocText;
   import visuals.ui.dialogs.SymbolDialogGuildBoosterExpiredGeneric;
   
   public class DialogGuildBoosterExpired extends UiDialog
   {
       
      
      private var _btnClose:UiButton = null;
      
      private var _confirmationBoosterBtn:UiGuildBoosterExpiredButton;
      
      private var _booster1:UiGuildBoosterExpiredButton;
      
      private var _booster2:UiGuildBoosterExpiredButton;
      
      public function DialogGuildBoosterExpired(param1:Vector.<String>)
      {
         var _loc3_:SymbolDialogGuildBoosterExpiredGeneric = new SymbolDialogGuildBoosterExpiredGeneric();
         super(_loc3_);
         _queued = false;
         var _loc2_:Guild = User.current.character.guild;
         _loc3_.booster2.visible = param1.length > 1;
         switch(int(param1.length) - 1)
         {
            case 0:
               _loc3_.dialogBackground.height = 248;
               _booster1 = new UiGuildBoosterExpiredButton(_loc3_.booster1,param1[0],_loc2_,onBoosterClicked);
               break;
            case 1:
               _loc3_.dialogBackground.height = 323;
               _booster1 = new UiGuildBoosterExpiredButton(_loc3_.booster1,param1[0],_loc2_,onBoosterClicked);
               _booster2 = new UiGuildBoosterExpiredButton(_loc3_.booster2,param1[1],_loc2_,onBoosterClicked);
         }
         centerDialog(_loc3_);
         _btnClose = new UiButton(_loc3_.btnClose,"",onClickClose);
         if(param1.length == 1)
         {
            if(_booster1.isQuestBooster)
            {
               _loc3_.txtDialogTitle.text = LocText.current.text("dialog/quest_guild_booster_expired/title");
               _loc3_.txtInfo.text = LocText.current.text("dialog/quest_guild_booster_expired/text");
            }
            else if(_booster1.isDuelBooster)
            {
               _loc3_.txtDialogTitle.text = LocText.current.text("dialog/duel_guild_booster_expired/title");
               _loc3_.txtInfo.text = LocText.current.text("dialog/duel_guild_booster_expired/text");
            }
         }
         else
         {
            _loc3_.txtDialogTitle.text = LocText.current.text("dialog/multiple_guild_boosters_expired/title");
            _loc3_.txtInfo.text = LocText.current.text("dialog/multiple_guild_boosters_expired/text");
         }
         refresh(false);
      }
      
      private function centerDialog(param1:SymbolDialogGuildBoosterExpiredGeneric) : void
      {
         var _loc3_:int = 0;
         var _loc4_:int = int(param1.dialogBackground.height / 2) * -1;
         var _loc2_:int = param1.dialogBackground.y - _loc4_;
         if(_loc2_ != 0)
         {
            _loc3_ = 0;
            while(_loc3_ < param1.numChildren)
            {
               _vo.getChildAt(_loc3_).y = _vo.getChildAt(_loc3_).y - _loc2_;
               _loc3_++;
            }
         }
      }
      
      override public function dispose() : void
      {
         _btnClose.dispose();
         _btnClose = null;
         _booster1.dispose();
         _booster1 = null;
         if(_booster2)
         {
            _booster2.dispose();
            _booster2 = null;
         }
         super.dispose();
      }
      
      private function refresh(param1:Boolean = true) : void
      {
         var _loc3_:Boolean = false;
         if(!_booster1)
         {
            return;
         }
         var _loc2_:Guild = User.current.character.guild;
         _booster1.refresh(_loc2_);
         if(_booster2)
         {
            _booster2.refresh(_loc2_);
         }
         if(param1)
         {
            _loc3_ = _booster1.extended;
            if(_loc3_ && _booster2)
            {
               _loc3_ = _booster2.extended;
            }
            if(_loc3_)
            {
               close();
            }
         }
      }
      
      private function onBoosterClicked(param1:UiGuildBoosterExpiredButton) : void
      {
         _confirmationBoosterBtn = param1;
         var _loc2_:Guild = User.current.character.guild;
         if(_loc2_.questBoosterActive && param1.isQuestBooster)
         {
            if(_loc2_.activeQuestBoosterId != param1.boosterId)
            {
               Environment.panelManager.showDialog(new UiTwoChoiceDialog(LocText.current.text("dialog/guild_boosters/overwrite_title"),LocText.current.text("dialog/guild_boosters/overwrite_text_quest"),LocText.current.text("general/button_yes"),LocText.current.text("general/button_no"),onClickOverwrite));
            }
            else
            {
               buyBooster(param1.boosterId,false,true);
            }
         }
         else if(_loc2_.duelBoosterActive && param1.isDuelBooster)
         {
            if(_loc2_.activeDuelBoosterId != param1.boosterId)
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
      
      private function onClickOverwrite() : void
      {
         buyBooster(_confirmationBoosterBtn.boosterId,true);
      }
      
      private function handleRequests(param1:ActionRequestResponse) : void
      {
         var _loc2_:* = null;
         var _loc3_:* = param1.action;
         if("buyGuildBooster" !== _loc3_)
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
            _loc2_ = null;
            if(param1.error == "errRemoveGameCurrencyNotEnough")
            {
               _loc2_ = User.current.character.guild;
               ViewManager.instance.showGuildNotEnoughGameCurrencyPremiumCurrencyDialog(_loc2_.getGuildBoosterCostGameCurrency(),0);
            }
            else if(param1.error == "errRemovePremiumCurrencyNotEnough")
            {
               _loc2_ = User.current.character.guild;
               ViewManager.instance.showGuildNotEnoughGameCurrencyPremiumCurrencyDialog(0,_loc2_.getGuildBoosterCostPremiumCurrency());
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
            else if(param1.error == "errTeamBoosterOtherBoosterActive")
            {
               if(_confirmationBoosterBtn.isQuestBooster)
               {
                  Environment.panelManager.showDialog(new UiTwoChoiceDialog(LocText.current.text("dialog/guild_boosters/overwrite_title"),LocText.current.text("dialog/guild_boosters/overwrite_text_quest"),LocText.current.text("general/button_yes"),LocText.current.text("general/button_no"),onClickOverwrite));
               }
               else if(_confirmationBoosterBtn.isDuelBooster)
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
      
      private function onClickClose(param1:InteractionEvent) : void
      {
         close();
      }
      
      override public function onEscape() : void
      {
         close();
      }
   }
}
