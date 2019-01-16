package com.playata.application.ui.dialogs
{
   import com.playata.application.data.guild.Guild;
   import com.playata.application.data.guild.GuildBattle;
   import com.playata.application.data.user.User;
   import com.playata.application.ui.AppUiUtil;
   import com.playata.application.ui.ViewManager;
   import com.playata.application.ui.elements.generic.button.UiTextButton;
   import com.playata.application.ui.elements.generic.dialog.UiDialog;
   import com.playata.application.ui.elements.generic.dialog.UiInfoDialog;
   import com.playata.application.ui.elements.guild.UiGuildChatTab;
   import com.playata.application.ui.elements.guild.UiGuildEmblem;
   import com.playata.application.ui.elements.guild.UiGuildMemberInfoTab;
   import com.playata.framework.application.Environment;
   import com.playata.framework.application.request.ActionRequestResponse;
   import com.playata.framework.core.collection.IntMap;
   import com.playata.framework.display.ui.controls.Button;
   import com.playata.framework.input.InteractionEvent;
   import com.playata.framework.localization.LocText;
   import visuals.ui.dialogs.SymbolDialogGuildBattlePendingGeneric;
   
   public class DialogGuildBattlePending extends UiDialog
   {
      
      private static var _showing:Boolean = false;
      
      private static var _shownGuildBattles:IntMap = new IntMap();
       
      
      private var _guildBattle:GuildBattle = null;
      
      private var _btnAttack:UiTextButton = null;
      
      private var _btnDefend:UiTextButton = null;
      
      private var _emblem:UiGuildEmblem = null;
      
      public function DialogGuildBattlePending(param1:GuildBattle)
      {
         _showing = true;
         _guildBattle = param1;
         var _loc2_:SymbolDialogGuildBattlePendingGeneric = new SymbolDialogGuildBattlePendingGeneric();
         super(_loc2_);
         _queued = false;
         _btnAttack = new UiTextButton(_loc2_.btnAttack,LocText.current.text("dialog/guild_battle_attack_pending/button_attack"),"",onClickJoin);
         _btnDefend = new UiTextButton(_loc2_.btnDefend,LocText.current.text("dialog/guild_battle_defense_pending/button_defend"),"",onClickJoin);
         if(_guildBattle.isOwnGuildAttack)
         {
            _loc2_.txtDialogTitle.text = LocText.current.text("dialog/guild_battle_attack_pending/title");
            _loc2_.txtInfo.text = LocText.current.text("dialog/guild_battle_attack_pending/info_text");
            _loc2_.txtGuildName.text = _guildBattle.defender.name;
            _emblem = new UiGuildEmblem(_loc2_.emblem,_guildBattle.defender.emblemSettings,100,100,onClickEmblem,true,3);
            _emblem.enableButton = true;
            _btnDefend.visible = false;
            Environment.audio.playFX("event_duel_time_complete.mp3");
         }
         else
         {
            _loc2_.txtDialogTitle.text = LocText.current.text("dialog/guild_battle_defense_pending/title");
            _loc2_.txtInfo.text = LocText.current.text("dialog/guild_battle_defense_pending/info_text");
            _loc2_.txtGuildName.text = _guildBattle.attacker.name;
            _emblem = new UiGuildEmblem(_loc2_.emblem,_guildBattle.attacker.emblemSettings,100,100,onClickEmblem,true,3);
            _emblem.enableButton = true;
            _btnAttack.visible = false;
            Environment.audio.playFX("event_duel_time_complete.mp3");
         }
         _emblem.tooltip = LocText.current.text("dialog/guild_battle_pending/emblem_tooltip");
         _loc2_.txtTime.text = _guildBattle.battleTimeString;
         AppUiUtil.alignVerticallyCentered(_loc2_,-4,_loc2_.iconTime,_loc2_.txtTime);
      }
      
      public static function get isShowing() : Boolean
      {
         return _showing;
      }
      
      public static function wasShown(param1:int) : Boolean
      {
         return _shownGuildBattles.exists(param1);
      }
      
      public static function reset() : void
      {
         _shownGuildBattles = new IntMap();
      }
      
      override public function dispose() : void
      {
         if(_btnAttack == null)
         {
            return;
         }
         _btnAttack.dispose();
         _btnAttack = null;
         _btnDefend.dispose();
         _btnDefend = null;
         _emblem.dispose();
         _emblem = null;
         super.dispose();
      }
      
      private function onClickJoin(param1:InteractionEvent) : void
      {
         Environment.application.sendActionRequest("joinGuildBattle",{"attack":_guildBattle.isOwnGuildAttack},handleRequests);
      }
      
      private function onClickEmblem() : void
      {
         if(_guildBattle.isOwnGuildAttack)
         {
            Environment.application.sendActionRequest("getGuild",{"guild_id":_guildBattle.guildDefenderId},handleRequests);
         }
         else
         {
            Environment.application.sendActionRequest("getGuild",{"guild_id":_guildBattle.guildAttackerId},handleRequests);
         }
      }
      
      private function handleRequests(param1:ActionRequestResponse) : void
      {
         var _loc2_:* = null;
         var _loc3_:* = param1.action;
         switch(_loc3_)
         {
            case "joinGuildBattle":
               _shownGuildBattles.setData(_guildBattle.id,true);
               if(param1.error == "")
               {
                  Environment.application.updateData(param1.data);
                  close();
                  UiGuildMemberInfoTab.instance.refresh(User.current.character.guild);
                  UiGuildChatTab.instance.refreshGuildLog();
               }
               else if(param1.error == "errAddCharacterNoPermission")
               {
                  Environment.panelManager.showDialog(new UiInfoDialog(LocText.current.text("dialog/guild_battle_pending_no_permission/title"),LocText.current.text("dialog/guild_battle_pending_no_permission/text"),LocText.current.text("general/button_ok")));
                  close();
               }
               else if(param1.error == "errAddCharacterInvalidGuild")
               {
                  Environment.panelManager.showDialog(new UiInfoDialog(LocText.current.text("dialog/guild_battle_pending_invalid_guild/title"),LocText.current.text("dialog/guild_battle_pending_invalid_guild/text"),LocText.current.text("general/button_ok")));
                  close();
               }
               else if(param1.error == "errJoinGuildBattleInvalidGuildBattle")
               {
                  Environment.panelManager.showDialog(new UiInfoDialog(LocText.current.text("dialog/guild_battle_pending_invalid_guild_battle/title"),LocText.current.text("dialog/guild_battle_pending_invalid_guild_battle/text"),LocText.current.text("general/button_ok")));
                  close();
               }
               else if(param1.error != "errAddCharacterIdAlreadyJoined")
               {
                  if(param1.error == "errCharacterNoGuild")
                  {
                     Environment.panelManager.showDialog(new UiInfoDialog(LocText.current.text("dialog/join_guild_battle_no_guild/title"),LocText.current.text("dialog/join_guild_battle_no_guild/text"),LocText.current.text("general/button_ok")));
                     close();
                  }
                  else if(param1.error == "errJoinGuildBattleAlreadyFought")
                  {
                     Environment.panelManager.showDialog(new UiInfoDialog(LocText.current.text("dialog/join_guild_battle_character_already_fought/title"),LocText.current.text("dialog/join_guild_battle_character_already_fought/text"),LocText.current.text("general/button_ok")));
                     close();
                  }
                  else
                  {
                     Environment.reportError(param1.error,param1.request);
                  }
               }
               break;
            case "getGuild":
               if(param1.error == "")
               {
                  _loc2_ = Guild.fromData(param1.data);
                  ViewManager.instance.showGuild(_loc2_);
                  close();
               }
               else
               {
                  Environment.reportError(param1.error,param1.request);
               }
               break;
            default:
               throw new Error("Unsupported request action \'" + param1.action + "\'!");
         }
      }
      
      override public function close(param1:Function = null) : void
      {
         _showing = false;
         super.close(param1);
      }
      
      override public function get defaultButton() : Button
      {
         if(_guildBattle.isOwnGuildAttack)
         {
            return _btnAttack;
         }
         return _btnDefend;
      }
   }
}
