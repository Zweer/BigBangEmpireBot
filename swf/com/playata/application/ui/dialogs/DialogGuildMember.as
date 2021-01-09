package com.playata.application.ui.dialogs
{
   import com.playata.application.data.guild.GuildBattle;
   import com.playata.application.data.guild.GuildMember;
   import com.playata.application.data.user.User;
   import com.playata.application.ui.elements.generic.button.UiButton;
   import com.playata.application.ui.elements.generic.button.UiTextButton;
   import com.playata.application.ui.elements.generic.checkbox.UiCheckBox;
   import com.playata.application.ui.elements.generic.dialog.UiDialog;
   import com.playata.application.ui.elements.generic.dialog.UiInfoDialog;
   import com.playata.application.ui.elements.generic.dialog.UiTwoChoiceDialog;
   import com.playata.application.ui.elements.generic.textfield.UiTextTooltip;
   import com.playata.application.ui.elements.guild.UiGuildChatTab;
   import com.playata.framework.application.Environment;
   import com.playata.framework.application.request.ActionRequestResponse;
   import com.playata.framework.input.InteractionEvent;
   import com.playata.framework.localization.LocText;
   import visuals.ui.dialogs.SymbolDialogGuildMemberGeneric;
   
   public class DialogGuildMember extends UiDialog
   {
       
      
      private var _member:GuildMember = null;
      
      private var _btnClose:UiButton = null;
      
      private var _btnKickLeave:UiTextButton = null;
      
      private var _checkRankLeader:UiCheckBox = null;
      
      private var _checkRankOfficer:UiCheckBox = null;
      
      private var _checkRankMember:UiCheckBox = null;
      
      private var _tooltipRankLeader:UiTextTooltip = null;
      
      private var _tooltipRankOfficer:UiTextTooltip = null;
      
      private var _tooltipRankMember:UiTextTooltip = null;
      
      public function DialogGuildMember(param1:GuildMember)
      {
         _member = param1;
         var _loc2_:SymbolDialogGuildMemberGeneric = new SymbolDialogGuildMemberGeneric();
         super(_loc2_);
         _queued = false;
         _loc2_.txtDialogTitle.text = LocText.current.text("dialog/guild_member/title");
         _loc2_.txtName.text = _member.name;
         _loc2_.txtLevel.text = LocText.current.text("dialog/guild_member/level",_member.level);
         _loc2_.txtJoinDate.text = LocText.current.text("dialog/guild_member/join_date",_member.joinDate);
         _loc2_.txtCoinDonation.text = LocText.current.text("dialog/guild_member/coin_donation",_member.gameCurrencyDonation);
         _loc2_.txtPremiumCurrencyDonation.text = LocText.current.text("dialog/guild_member/premium_currency_donation",_member.premiumCurrencyDonation);
         _loc2_.txtRankCaption.text = LocText.current.text("dialog/guild_member/rank_caption");
         var _loc3_:int = LocText.current.gender;
         LocText.current.gender = !!param1.isMale?1:2;
         _loc2_.txtRankLeader.text = LocText.current.text("guild/rank_leader");
         _loc2_.txtRankOfficer.text = LocText.current.text("guild/rank_officer");
         _loc2_.txtRankMember.text = LocText.current.text("guild/rank_member");
         LocText.current.gender = _loc3_;
         _btnClose = new UiButton(_loc2_.btnClose,"",onClickClose);
         _btnKickLeave = new UiTextButton(_loc2_.btnKick,LocText.current.text("dialog/guild_member/button_kick"),"",onClickKickLeave);
         if(_member.isMe)
         {
            if(_member.guildRank == 1 && User.current.character.guild.memberCount == 1)
            {
               _btnKickLeave.caption = LocText.current.text("dialog/guild_member/button_delete_guild");
            }
            else
            {
               _btnKickLeave.caption = LocText.current.text("dialog/guild_member/button_leave");
            }
         }
         _checkRankLeader = new UiCheckBox(_loc2_.checkRankLeader,_member.guildRank == 1,LocText.current.text("dialog/guild_member/change_rank_tooltip"),null,onBeforeCheckedChangedRankLeader,_loc2_.txtRankLeader);
         _checkRankOfficer = new UiCheckBox(_loc2_.checkRankOfficer,_member.guildRank == 2,LocText.current.text("dialog/guild_member/change_rank_tooltip"),null,onBeforeCheckedChangedRankOfficer,_loc2_.txtRankOfficer);
         _checkRankMember = new UiCheckBox(_loc2_.checkRankMember,_member.guildRank == 3,LocText.current.text("dialog/guild_member/change_rank_tooltip"),null,onBeforeCheckedChangedRankMember,_loc2_.txtRankMember);
         _tooltipRankLeader = new UiTextTooltip(_loc2_.txtRankLeader,"");
         _tooltipRankOfficer = new UiTextTooltip(_loc2_.txtRankOfficer,"");
         _tooltipRankMember = new UiTextTooltip(_loc2_.txtRankMember,"");
         refresh();
         refreshKickLeaveButton();
      }
      
      private function refreshKickLeaveButton() : void
      {
         _btnKickLeave.visible = _member.isInOwnGuild;
         if(!_member.isMe)
         {
            if(User.current.character.guildRank == 3)
            {
               _btnKickLeave.buttonEnabled = false;
               _btnKickLeave.tooltip = LocText.current.text("dialog/guild_member/button_kick_no_permission_tooltip");
            }
            else if(_member.guildRank == 1)
            {
               _btnKickLeave.buttonEnabled = false;
               _btnKickLeave.tooltip = LocText.current.text("dialog/guild_member/button_kick_no_leader_kick_tooltip");
            }
            else if(User.current.character.guildRank == 2 && _member.guildRank == 2)
            {
               _btnKickLeave.buttonEnabled = false;
               _btnKickLeave.tooltip = LocText.current.text("dialog/guild_member/button_kick_no_permission_leader_only_tooltip");
            }
            else
            {
               _btnKickLeave.buttonEnabled = true;
               _btnKickLeave.tooltip = LocText.current.text("dialog/guild_member/button_kick_tooltip");
            }
         }
      }
      
      override public function dispose() : void
      {
         _btnClose.dispose();
         _btnClose = null;
         _btnKickLeave.dispose();
         _btnKickLeave = null;
         _checkRankLeader.dispose();
         _checkRankLeader = null;
         _checkRankOfficer.dispose();
         _checkRankOfficer = null;
         _checkRankMember.dispose();
         _checkRankMember = null;
         _tooltipRankLeader.dispose();
         _tooltipRankLeader = null;
         _tooltipRankOfficer.dispose();
         _tooltipRankOfficer = null;
         _tooltipRankMember.dispose();
         _tooltipRankMember = null;
         super.dispose();
      }
      
      private function refresh() : void
      {
         if(!_checkRankLeader)
         {
            return;
         }
         _checkRankLeader.checked = _member.guildRank == 1;
         _checkRankOfficer.checked = _member.guildRank == 2;
         _checkRankMember.checked = _member.guildRank == 3;
         _checkRankLeader.locked = _member.guildRank == 1;
         _checkRankOfficer.locked = _member.guildRank == 2;
         _checkRankMember.locked = _member.guildRank == 3;
         _checkRankLeader.enabled = User.current.character.guildRank == 1;
         _checkRankOfficer.enabled = User.current.character.guildRank == 1;
         _checkRankMember.enabled = User.current.character.guildRank == 1;
         if(User.current.character.guildRank != 1)
         {
            _checkRankLeader.tooltip = LocText.current.text("dialog/guild_member/set_rank_locked_tooltip");
            _checkRankOfficer.tooltip = LocText.current.text("dialog/guild_member/set_rank_locked_tooltip");
            _checkRankMember.tooltip = LocText.current.text("dialog/guild_member/set_rank_locked_tooltip");
         }
         else
         {
            _checkRankLeader.tooltip = !!_checkRankLeader.checked?"":LocText.current.text("dialog/guild_member/change_rank_tooltip");
            _checkRankOfficer.tooltip = !!_checkRankOfficer.checked?"":LocText.current.text("dialog/guild_member/change_rank_tooltip");
            _checkRankMember.tooltip = !!_checkRankMember.checked?"":LocText.current.text("dialog/guild_member/change_rank_tooltip");
         }
         _tooltipRankLeader.text = _checkRankLeader.tooltip;
         _tooltipRankOfficer.text = _checkRankOfficer.tooltip;
         _tooltipRankMember.text = _checkRankMember.tooltip;
         refreshKickLeaveButton();
      }
      
      private function onClickClose(param1:InteractionEvent) : void
      {
         close();
      }
      
      private function onClickKickLeave(param1:InteractionEvent) : void
      {
         if(!_member)
         {
            return;
         }
         if(!User.current.character.hasGuild)
         {
            return;
         }
         if(_member.isMe)
         {
            if(_member.guildRank == 1 && User.current.character.guild.memberCount == 1)
            {
               Environment.panelManager.showDialog(new UiTwoChoiceDialog(LocText.current.text("dialog/delete_guild/title"),LocText.current.text("dialog/delete_guild/text",User.current.character.guild.name),LocText.current.text("general/button_yes"),LocText.current.text("general/button_no"),leaveGuild));
            }
            else
            {
               Environment.panelManager.showDialog(new UiTwoChoiceDialog(LocText.current.text("dialog/leave_guild/title"),LocText.current.text("dialog/leave_guild/text",User.current.character.guild.name),LocText.current.text("general/button_yes"),LocText.current.text("general/button_no"),leaveGuild));
            }
         }
         else
         {
            Environment.panelManager.showDialog(new UiTwoChoiceDialog(LocText.current.text("dialog/guild_kick_member/title"),LocText.current.text("dialog/guild_kick_member/text",_member.name),LocText.current.text("general/button_yes"),LocText.current.text("general/button_no"),kickMember));
         }
      }
      
      private function leaveGuild() : void
      {
         Environment.application.sendActionRequest("leaveGuild",{},handleRequests);
      }
      
      private function kickMember() : void
      {
         Environment.application.sendActionRequest("kickGuildMember",{"character_id":_member.id},handleRequests);
      }
      
      private function setLeaderRank() : void
      {
         Environment.application.sendActionRequest("setGuildMemberRank",{
            "character_id":_member.id,
            "rank":1
         },handleRequests);
      }
      
      private function setOfficerRank() : void
      {
         Environment.application.sendActionRequest("setGuildMemberRank",{
            "character_id":_member.id,
            "rank":2
         },handleRequests);
      }
      
      private function setMemberRank() : void
      {
         Environment.application.sendActionRequest("setGuildMemberRank",{
            "character_id":_member.id,
            "rank":3
         },handleRequests);
      }
      
      private function onBeforeCheckedChangedRankLeader(param1:Boolean) : Boolean
      {
         if(User.current.character.guildRank == 1)
         {
            Environment.panelManager.showDialog(new UiTwoChoiceDialog(LocText.current.text("dialog/guild_leader_change/title"),LocText.current.text("dialog/guild_leader_change/text",_member.name),LocText.current.text("dialog/guild_leader_change/button_accept"),LocText.current.text("dialog/guild_leader_change/button_cancel"),setLeaderRank));
            return false;
         }
         return false;
      }
      
      private function onBeforeCheckedChangedRankOfficer(param1:Boolean) : Boolean
      {
         if(User.current.character.guildRank == 1 && _member.id == User.current.character.id)
         {
            Environment.panelManager.showDialog(new UiInfoDialog(LocText.current.text("dialog/guild_leader_rank_locked/title"),LocText.current.text("dialog/guild_leader_rank_locked/text"),LocText.current.text("general/button_ok")));
            return false;
         }
         var _loc2_:int = LocText.current.gender;
         LocText.current.gender = !!_member.isMale?1:2;
         Environment.panelManager.showDialog(new UiTwoChoiceDialog(LocText.current.text("dialog/guild_rank_change/title"),LocText.current.text("dialog/guild_rank_change/text",_member.name,_member.guildRankName,LocText.current.text("guild/rank_officer")),LocText.current.text("general/button_yes"),LocText.current.text("general/button_no"),setOfficerRank));
         LocText.current.gender = _loc2_;
         return false;
      }
      
      private function onBeforeCheckedChangedRankMember(param1:Boolean) : Boolean
      {
         if(User.current.character.guildRank == 1 && _member.id == User.current.character.id)
         {
            Environment.panelManager.showDialog(new UiInfoDialog(LocText.current.text("dialog/guild_leader_rank_locked/title"),LocText.current.text("dialog/guild_leader_rank_locked/text"),LocText.current.text("general/button_ok")));
            return false;
         }
         var _loc2_:int = LocText.current.gender;
         LocText.current.gender = !!_member.isMale?1:2;
         Environment.panelManager.showDialog(new UiTwoChoiceDialog(LocText.current.text("dialog/guild_rank_change/title"),LocText.current.text("dialog/guild_rank_change/text",_member.name,_member.guildRankName,LocText.current.text("guild/rank_member")),LocText.current.text("general/button_yes"),LocText.current.text("general/button_no"),setMemberRank));
         LocText.current.gender = _loc2_;
         return false;
      }
      
      private function handleRequests(param1:ActionRequestResponse) : void
      {
         var _loc2_:* = param1.action;
         switch(_loc2_)
         {
            case "setGuildMemberRank":
               if(param1.error == "")
               {
                  Environment.application.updateData(param1.data);
                  refresh();
                  UiGuildChatTab.instance.refreshGuildLog();
               }
               else if(param1.error == "errSetMemberRankInvalidGuild")
               {
                  Environment.panelManager.showDialog(new UiInfoDialog(LocText.current.text("dialog/guild_set_member_rank_invalid_guild/title"),LocText.current.text("dialog/guild_set_member_rank_invalid_guild/text"),LocText.current.text("general/button_ok")));
               }
               else if(param1.error == "errSetMemberRankNoPermission")
               {
                  Environment.panelManager.showDialog(new UiInfoDialog(LocText.current.text("dialog/guild_set_member_rank_no_permission/title"),LocText.current.text("dialog/guild_set_member_rank_no_permission/text"),LocText.current.text("general/button_ok")));
               }
               else if(param1.error == "errSetMemberRankNotPossible")
               {
                  Environment.panelManager.showDialog(new UiInfoDialog(LocText.current.text("dialog/guild_set_member_rank_not_possible/title"),LocText.current.text("dialog/guild_set_member_rank_not_possible/text"),LocText.current.text("general/button_ok")));
               }
               else
               {
                  Environment.reportError(param1.error,param1.request);
               }
               break;
            case "kickGuildMember":
               if(param1.error == "")
               {
                  User.current.character.guild.removeMember(_member);
                  Environment.application.updateData(param1.data);
                  close();
                  UiGuildChatTab.instance.refreshGuildLog();
               }
               else if(param1.error == "errKickMemberNotKickable")
               {
                  Environment.panelManager.showDialog(new UiInfoDialog(LocText.current.text("dialog/guild_kick_member_not_kickable/title"),LocText.current.text("dialog/guild_kick_member_not_kickable/text"),LocText.current.text("general/button_ok")));
               }
               else if(param1.error == "errKickMemberInvalidGuild")
               {
                  Environment.panelManager.showDialog(new UiInfoDialog(LocText.current.text("dialog/guild_kick_member_invalid_guild/title"),LocText.current.text("dialog/guild_kick_member_invalid_guild/text"),LocText.current.text("general/button_ok")));
               }
               else if(param1.error == "errKickMemberNoPermission")
               {
                  Environment.panelManager.showDialog(new UiInfoDialog(LocText.current.text("dialog/guild_kick_member_no_permission/title"),LocText.current.text("dialog/guild_kick_member_no_permission/text"),LocText.current.text("general/button_ok")));
               }
               else if(param1.error == "errCharacterNoGuild")
               {
                  Environment.panelManager.showDialog(new UiInfoDialog(LocText.current.text("dialog/guild_kick_member_no_guild/title"),LocText.current.text("dialog/guild_kick_member_no_guild/text"),LocText.current.text("general/button_ok")));
               }
               else
               {
                  Environment.reportError(param1.error,param1.request);
               }
               break;
            case "leaveGuild":
               if(param1.error == "")
               {
                  Environment.application.updateData(param1.data);
                  GuildBattle.resetJoinedAttackMembers();
                  GuildBattle.resetJoinedDefenseMembers();
                  close();
               }
               else if(param1.error == "errLeaveGuildMembersFound")
               {
                  Environment.panelManager.showDialog(new UiInfoDialog(LocText.current.text("dialog/guild_delete_members_found/title"),LocText.current.text("dialog/guild_delete_members_found/text"),LocText.current.text("general/button_ok")));
               }
               else if(param1.error == "errCharacterNoGuild")
               {
                  Environment.panelManager.showDialog(new UiInfoDialog(LocText.current.text("dialog/leave_guild_no_guild/title"),LocText.current.text("dialog/leave_guild_no_guild/text"),LocText.current.text("general/button_ok")));
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
      
      override public function onEscape() : void
      {
         close();
      }
   }
}
