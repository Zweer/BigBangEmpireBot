package com.playata.application.ui.dialogs
{
   import com.playata.application.data.GameUtil;
   import com.playata.application.data.guild.GuildBattleAttackTime;
   import com.playata.application.data.user.User;
   import com.playata.application.messaging.Message;
   import com.playata.application.messaging.MessageRouter;
   import com.playata.application.ui.ViewManager;
   import com.playata.application.ui.elements.generic.button.UiButton;
   import com.playata.application.ui.elements.generic.button.UiTextButton;
   import com.playata.application.ui.elements.generic.checkbox.UiCheckBox;
   import com.playata.application.ui.elements.generic.dialog.UiDialog;
   import com.playata.application.ui.elements.generic.dialog.UiInfoDialog;
   import com.playata.application.ui.elements.guild.UiGuildChatTab;
   import com.playata.framework.application.Environment;
   import com.playata.framework.application.request.ActionRequestResponse;
   import com.playata.framework.core.Runtime;
   import com.playata.framework.display.ui.controls.Button;
   import com.playata.framework.display.ui.controls.ILabelArea;
   import com.playata.framework.input.InteractionEvent;
   import com.playata.framework.localization.LocText;
   import visuals.ui.dialogs.SymbolDialogGuildBattleCreateGeneric;
   
   public class DialogGuildBattleCreate extends UiDialog
   {
       
      
      private var _guildId:int = 0;
      
      private var _btnClose:UiButton = null;
      
      private var _btnAttack:UiTextButton = null;
      
      private var _checkTime1:UiCheckBox = null;
      
      private var _checkTime2:UiCheckBox = null;
      
      private var _checkTime3:UiCheckBox = null;
      
      private var _checkTime4:UiCheckBox = null;
      
      private var _checkTime5:UiCheckBox = null;
      
      public function DialogGuildBattleCreate(param1:int)
      {
         _guildId = param1;
         var _loc2_:SymbolDialogGuildBattleCreateGeneric = new SymbolDialogGuildBattleCreateGeneric();
         super(_loc2_);
         _queued = false;
         _loc2_.txtDialogTitle.text = LocText.current.text("dialog/guild_battle_create/title");
         _loc2_.txtTimeCaption.text = LocText.current.text("dialog/guild_battle_create/time_caption");
         _loc2_.txtCostCaption.text = LocText.current.text("dialog/guild_battle_create/cost_caption");
         _loc2_.txtCoins.text = LocText.current.formatHugeNumber(GameUtil.guildBattleCost(User.current.character.guild.totalImprovementPercentage()));
         _btnClose = new UiButton(_loc2_.btnClose,"",onClickClose);
         _btnAttack = new UiTextButton(_loc2_.btnAttack,LocText.current.text("dialog/guild_battle_create/button_attack"),"",onClickAttack);
         _checkTime1 = new UiCheckBox(_loc2_.checkTime1,true,"",onCheckedChanged1,null,_loc2_.txtTime1);
         _checkTime2 = new UiCheckBox(_loc2_.checkTime2,false,"",onCheckedChanged2,null,_loc2_.txtTime2);
         _checkTime3 = new UiCheckBox(_loc2_.checkTime3,false,"",onCheckedChanged3,null,_loc2_.txtTime3);
         _checkTime4 = new UiCheckBox(_loc2_.checkTime4,false,"",onCheckedChanged4,null,_loc2_.txtTime4);
         _checkTime5 = new UiCheckBox(_loc2_.checkTime5,false,"",onCheckedChanged5,null,_loc2_.txtTime5);
         updateAttackTimes();
         MessageRouter.addListener("ViewMessage.notifyNeededGuildDonationMade",handleMessages);
      }
      
      private function updateAttackTimes() : void
      {
         var _loc1_:SymbolDialogGuildBattleCreateGeneric = _vo as SymbolDialogGuildBattleCreateGeneric;
         var _loc2_:Vector.<GuildBattleAttackTime> = new Vector.<GuildBattleAttackTime>();
         _loc2_.push(new GuildBattleAttackTime(1));
         _loc2_.push(new GuildBattleAttackTime(2));
         _loc2_.push(new GuildBattleAttackTime(3));
         _loc2_.push(new GuildBattleAttackTime(4));
         _loc2_.push(new GuildBattleAttackTime(5));
         _loc2_.sort(sortByLocalTimestamp);
         _loc1_.txtTime1.text = _loc2_[0].battleAttackTimeString;
         _loc1_.txtTime2.text = _loc2_[1].battleAttackTimeString;
         _loc1_.txtTime3.text = _loc2_[2].battleAttackTimeString;
         _loc1_.txtTime4.text = _loc2_[3].battleAttackTimeString;
         _loc1_.txtTime5.text = _loc2_[4].battleAttackTimeString;
         _checkTime1.tooltip = LocText.current.text("dialog/guild_battle_create/time_tooltip",_loc2_[0].battleAttackTimeStringEventLog);
         _checkTime2.tooltip = LocText.current.text("dialog/guild_battle_create/time_tooltip",_loc2_[1].battleAttackTimeStringEventLog);
         _checkTime3.tooltip = LocText.current.text("dialog/guild_battle_create/time_tooltip",_loc2_[2].battleAttackTimeStringEventLog);
         _checkTime4.tooltip = LocText.current.text("dialog/guild_battle_create/time_tooltip",_loc2_[3].battleAttackTimeStringEventLog);
         _checkTime5.tooltip = LocText.current.text("dialog/guild_battle_create/time_tooltip",_loc2_[4].battleAttackTimeStringEventLog);
         _checkTime1.tag = _loc2_[0].guildBattleTime;
         _checkTime2.tag = _loc2_[1].guildBattleTime;
         _checkTime3.tag = _loc2_[2].guildBattleTime;
         _checkTime4.tag = _loc2_[3].guildBattleTime;
         _checkTime5.tag = _loc2_[4].guildBattleTime;
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
         _btnAttack.dispose();
         _btnAttack = null;
         _checkTime1.dispose();
         _checkTime1 = null;
         _checkTime2.dispose();
         _checkTime2 = null;
         _checkTime3.dispose();
         _checkTime3 = null;
         _checkTime4.dispose();
         _checkTime4 = null;
         _checkTime5.dispose();
         _checkTime5 = null;
         super.dispose();
      }
      
      private function onClickClose(param1:InteractionEvent) : void
      {
         close();
      }
      
      private function onClickAttack(param1:InteractionEvent) : void
      {
         attackGuild();
      }
      
      private function attackGuild() : void
      {
         var _loc4_:ILabelArea = null;
         var _loc3_:int = 0;
         var _loc1_:SymbolDialogGuildBattleCreateGeneric = _vo as SymbolDialogGuildBattleCreateGeneric;
         if(_checkTime1.checked)
         {
            _loc3_ = _checkTime1.tagAsInt;
            _loc4_ = _loc1_.txtTime1;
         }
         else if(_checkTime2.checked)
         {
            _loc3_ = _checkTime2.tagAsInt;
            _loc4_ = _loc1_.txtTime2;
         }
         else if(_checkTime3.checked)
         {
            _loc3_ = _checkTime3.tagAsInt;
            _loc4_ = _loc1_.txtTime3;
         }
         else if(_checkTime4.checked)
         {
            _loc3_ = _checkTime4.tagAsInt;
            _loc4_ = _loc1_.txtTime4;
         }
         else if(_checkTime5.checked)
         {
            _loc3_ = _checkTime5.tagAsInt;
            _loc4_ = _loc1_.txtTime5;
         }
         var _loc2_:GuildBattleAttackTime = new GuildBattleAttackTime(_loc3_);
         if(_loc2_.battleAttackTimeString != _loc4_.text)
         {
            Environment.panelManager.showDialog(new UiInfoDialog(LocText.current.text("dialog/guild_battle_create_times_changed/title"),LocText.current.text("dialog/guild_battle_create_times_changed/text"),LocText.current.text("general/button_ok")));
            updateAttackTimes();
         }
         else
         {
            Environment.application.sendActionRequest("attackGuild",{
               "guild_id":_guildId,
               "time":_loc3_
            },handleRequests);
         }
      }
      
      private function closeDialog() : void
      {
         close();
      }
      
      private function onCheckedChanged1(param1:Boolean) : void
      {
         refreshTimeOptions(1);
      }
      
      private function onCheckedChanged2(param1:Boolean) : void
      {
         refreshTimeOptions(2);
      }
      
      private function onCheckedChanged3(param1:Boolean) : void
      {
         refreshTimeOptions(3);
      }
      
      private function onCheckedChanged4(param1:Boolean) : void
      {
         refreshTimeOptions(4);
      }
      
      private function onCheckedChanged5(param1:Boolean) : void
      {
         refreshTimeOptions(5);
      }
      
      private function refreshTimeOptions(param1:int) : void
      {
         _checkTime1.checked = param1 == 1;
         _checkTime2.checked = param1 == 2;
         _checkTime3.checked = param1 == 3;
         _checkTime4.checked = param1 == 4;
         _checkTime5.checked = param1 == 5;
      }
      
      private function handleRequests(param1:ActionRequestResponse) : void
      {
         var _loc2_:* = null;
         var _loc3_:* = param1.action;
         if("attackGuild" !== _loc3_)
         {
            throw new Error("Unsupported request action \'" + param1.action + "\'!");
         }
         if(param1.error == "")
         {
            Environment.application.updateData(param1.data);
            close();
            ViewManager.instance.showPanel("guild");
            UiGuildChatTab.instance.refreshGuildLog();
         }
         else if(param1.error == "errCreateInvalidGuild")
         {
            Environment.panelManager.showDialog(new UiInfoDialog(LocText.current.text("dialog/guild_battle_create_invalid_guild/title"),LocText.current.text("dialog/guild_battle_create_invalid_guild/text"),LocText.current.text("general/button_ok")));
            close();
         }
         else if(param1.error == "errCreateNoPermission")
         {
            Environment.panelManager.showDialog(new UiInfoDialog(LocText.current.text("dialog/guild_battle_create_no_permission/title"),LocText.current.text("dialog/guild_battle_create_no_permission/text"),LocText.current.text("general/button_ok")));
            close();
         }
         else if(param1.error == "errRemoveGameCurrencyNotEnough")
         {
            ViewManager.instance.showGuildNotEnoughGameCurrencyPremiumCurrencyDialog(GameUtil.guildBattleCost(User.current.character.guild.totalImprovementPercentage()),0,closeDialog);
         }
         else if(param1.error == "errCreateAlreadyAttacking")
         {
            Environment.panelManager.showDialog(new UiInfoDialog(LocText.current.text("dialog/guild_battle_create_already_attacking/title"),LocText.current.text("dialog/guild_battle_create_already_attacking/text"),LocText.current.text("general/button_ok")));
            close();
         }
         else if(param1.error == "errCreateAttackingUs")
         {
            Environment.panelManager.showDialog(new UiInfoDialog(LocText.current.text("dialog/guild_battle_create_attacking_us/title"),LocText.current.text("dialog/guild_battle_create_attacking_us/text"),LocText.current.text("general/button_ok")));
            close();
         }
         else if(param1.error == "errCreateAlreadyAttacked")
         {
            Environment.panelManager.showDialog(new UiInfoDialog(LocText.current.text("dialog/guild_battle_create_already_attacked/title"),LocText.current.text("dialog/guild_battle_create_already_attacked/text"),LocText.current.text("general/button_ok")));
            close();
         }
         else if(param1.error == "errCreateNotYetAvailable")
         {
            Environment.panelManager.showDialog(new UiInfoDialog(LocText.current.text("dialog/guild_battle_create_not_yet_available/title"),LocText.current.text("dialog/guild_battle_create_not_yet_available/text"),LocText.current.text("general/button_ok")));
         }
         else if(param1.error.indexOf("errCreateCooldown_") != -1)
         {
            _loc2_ = param1.error.substr("errCreateCooldown_".length);
            Environment.panelManager.showDialog(new UiInfoDialog(LocText.current.text("dialog/guild_battle_create_cooldown/title"),LocText.current.text("dialog/guild_battle_create_cooldown/text",_loc2_),LocText.current.text("general/button_ok")));
         }
         else if(param1.error == "errCreateSameGuild")
         {
            Environment.panelManager.showDialog(new UiInfoDialog(LocText.current.text("dialog/guild_battle_create_same_guild/title"),LocText.current.text("dialog/guild_battle_create_same_guild/text"),LocText.current.text("general/button_ok")));
            close();
         }
         else if(param1.error == "errCreateNoHonorTooStrong")
         {
            Environment.panelManager.showDialog(new UiInfoDialog(LocText.current.text("dialog/guild_battle_create_too_strong/title"),LocText.current.text("dialog/guild_battle_create_too_strong/text"),LocText.current.text("general/button_ok")));
         }
         else if(param1.error == "errCreateNoHonorTooWeak")
         {
            Environment.panelManager.showDialog(new UiInfoDialog(LocText.current.text("dialog/guild_battle_create_too_weak/title"),LocText.current.text("dialog/guild_battle_create_too_weak/text"),LocText.current.text("general/button_ok")));
         }
         else if(param1.error == "errCreateAlreadyFought")
         {
            Environment.panelManager.showDialog(new UiInfoDialog(LocText.current.text("dialog/guild_battle_character_already_fought/title"),LocText.current.text("dialog/guild_battle_character_already_fought/text"),LocText.current.text("general/button_ok")));
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
         _btnAttack.buttonEnabled = false;
         Runtime.delayFunction(attackGuild,0.3);
      }
      
      override public function get defaultButton() : Button
      {
         return _btnAttack;
      }
      
      override public function onEscape() : void
      {
         close();
      }
      
      private function sortByLocalTimestamp(param1:GuildBattleAttackTime, param2:GuildBattleAttackTime) : int
      {
         if(param1.serverTimestamp < param2.serverTimestamp)
         {
            return -1;
         }
         if(param1.serverTimestamp > param2.serverTimestamp)
         {
            return 1;
         }
         return 0;
      }
   }
}
