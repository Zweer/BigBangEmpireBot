package com.playata.application.ui.elements.guild
{
   import com.playata.application.AppConfig;
   import com.playata.application.data.GameUtil;
   import com.playata.application.data.guild.GuildMember;
   import com.playata.application.data.user.User;
   import com.playata.application.ui.ViewManager;
   import com.playata.application.ui.dialogs.DialogGuildLeaderVoteInfo;
   import com.playata.application.ui.elements.avatar.UiCharacterTooltip;
   import com.playata.application.ui.elements.generic.UiOnlinePoint;
   import com.playata.application.ui.elements.generic.button.UiButton;
   import com.playata.application.ui.elements.generic.textfield.UiTextTooltip;
   import com.playata.framework.application.Environment;
   import com.playata.framework.application.request.ActionRequestResponse;
   import com.playata.framework.display.InteractiveDisplayObject;
   import com.playata.framework.input.InteractionEvent;
   import com.playata.framework.localization.LocText;
   import visuals.ui.elements.guild.SymbolGuildMemberInfoLineGeneric;
   
   public class UiGuildMemberInfoLine extends InteractiveDisplayObject
   {
       
      
      private var _content:SymbolGuildMemberInfoLineGeneric = null;
      
      private var _index:int = 0;
      
      private var _member:GuildMember = null;
      
      private var _tooltipRankLeader:UiCharacterTooltip = null;
      
      private var _tooltipRankOfficer:UiCharacterTooltip = null;
      
      private var _tooltipRankMember:UiCharacterTooltip = null;
      
      private var _tooltipName:UiCharacterTooltip = null;
      
      private var _tooltipAttacking:UiTextTooltip = null;
      
      private var _tooltipDefending:UiTextTooltip = null;
      
      private var _onlinePoint:UiOnlinePoint = null;
      
      private var _onClickFunction:Function = null;
      
      private var _onDoubleClickFunction:Function = null;
      
      private var _btnLeaderVote:UiButton = null;
      
      public function UiGuildMemberInfoLine(param1:SymbolGuildMemberInfoLineGeneric, param2:int, param3:Function, param4:Function)
      {
         _content = param1;
         super(_content);
         _index = param2;
         _onClickFunction = param3;
         _onDoubleClickFunction = param4;
         _tooltipRankLeader = new UiCharacterTooltip(_content.iconRankLeader);
         _tooltipRankOfficer = new UiCharacterTooltip(_content.iconRankOfficer);
         _tooltipRankMember = new UiCharacterTooltip(_content.iconRankMember);
         _tooltipName = new UiCharacterTooltip(_content.txtName);
         _tooltipAttacking = new UiTextTooltip(_content.iconGuildBattleAttack,LocText.current.text("screen/guild/member_info/attacking_tooltip"));
         _tooltipDefending = new UiTextTooltip(_content.iconGuildBattleDefense,LocText.current.text("screen/guild/member_info/defending_tooltip"));
         _onlinePoint = new UiOnlinePoint(_content.iconOnline,null);
         onClick.add(handleClick);
         onDoubleClick.add(handleDoubleClick);
         _btnLeaderVote = new UiButton(_content.iconLeaderVote,LocText.current.text("dialog/guild_member/voteout_tooltip"),onClickLeaderVote);
         useHandCursor = false;
      }
      
      override public function dispose() : void
      {
         _btnLeaderVote.dispose();
         _btnLeaderVote = null;
         _tooltipRankLeader.dispose();
         _tooltipRankLeader = null;
         _tooltipRankOfficer.dispose();
         _tooltipRankOfficer = null;
         _tooltipRankMember.dispose();
         _tooltipRankMember = null;
         _tooltipName.dispose();
         _tooltipName = null;
         _tooltipAttacking.dispose();
         _tooltipAttacking = null;
         _tooltipDefending.dispose();
         _tooltipDefending = null;
         _onlinePoint.dispose();
         _onlinePoint = null;
         super.dispose();
      }
      
      public function get index() : int
      {
         return _index;
      }
      
      public function get member() : GuildMember
      {
         return _member;
      }
      
      private function handleClick(param1:InteractionEvent) : void
      {
         Environment.audio.playFX("ui_button_click.mp3");
      }
      
      private function handleDoubleClick(param1:InteractionEvent) : void
      {
         Environment.audio.playFX("ui_button_click.mp3");
      }
      
      private function onClickLeaderVote(param1:InteractionEvent) : void
      {
         Environment.application.sendActionRequest("initGuildLeaderVote",{},handleRequests);
      }
      
      public function highlight(param1:Boolean) : void
      {
         if(!_content.visible)
         {
            return;
         }
         _content.backgroundHighlight.visible = param1;
         _content.backgroundEven.visible = !param1 && _index % 2 == 0;
         _content.backgroundOdd.visible = !param1 && _index % 2 != 0;
      }
      
      public function get donationTextWidth() : Number
      {
         if(_member == null)
         {
            return 0;
         }
         return _content.txtDonated.textWidth;
      }
      
      public function refreshName(param1:Number) : void
      {
         if(_member == null)
         {
            return;
         }
         _content.txtName.width = param1;
         _content.txtName.setTextToFit(_member.name,"...");
         _content.iconPremiumCurrency.x = _content.txtName.x + _content.txtName.width + 1;
         _content.iconGameCurrency.x = _content.txtName.x + _content.txtName.width + 6;
         _content.iconGuildCompetition.x = _content.txtName.x + _content.txtName.width + 2;
         _content.txtDonated.x = _content.txtName.x + _content.txtName.width + 21;
         _onlinePoint.refresh(_member.isOnline,_member.name);
      }
      
      public function refresh(param1:GuildMember, param2:int, param3:int) : void
      {
         var _loc5_:* = null;
         _index = param2;
         _member = param1;
         if(_member == null)
         {
            _content.visible = false;
            return;
         }
         _content.visible = true;
         var _loc7_:int = LocText.current.gender;
         LocText.current.gender = !!_member.isMale?1:2;
         _tooltipAttacking.text = LocText.current.text("screen/guild/member_info/attacking_tooltip");
         _tooltipDefending.text = LocText.current.text("screen/guild/member_info/defending_tooltip");
         _content.iconRankLeader.visible = _member.guildRank == 1;
         _content.iconRankOfficer.visible = _member.guildRank == 2;
         _content.iconRankMember.visible = _member.guildRank == 3;
         var _loc6_:String = !!AppConfig.titlesEnabled?_member.nameWithTitle:"";
         var _loc4_:String = LocText.current.text("screen/guild/member_info/name_tooltip",_member.guildRankName,_member.level);
         var _loc8_:String = LocText.current.text("dialog/guild_member/join_date",_member.joinDate);
         if(_member.isInOwnGuild)
         {
            _loc5_ = "";
            if(_member.premiumCurrencyDonation == 0 && _member.gameCurrencyDonation == 0)
            {
               _loc5_ = LocText.current.text("screen/guild/member_info/no_donations");
            }
            else
            {
               _loc5_ = LocText.current.text("screen/guild/member_info/donations",GameUtil.getPremiumCurrencyString(_member.premiumCurrencyDonation),GameUtil.getGameCurrencyString(_member.gameCurrencyDonation));
            }
            _tooltipName.setText(_loc6_,param1,_loc4_ + "\n" + _loc5_ + "\n\n" + _member.lastOnlineInfo + "\n" + _loc8_);
            _tooltipRankLeader.setText(_loc6_,param1,_loc4_ + "\n" + _loc5_ + "\n\n" + _member.lastOnlineInfo + "\n" + _loc8_);
            _tooltipRankOfficer.setText(_loc6_,param1,_loc4_ + "\n" + _loc5_ + "\n\n" + _member.lastOnlineInfo + "\n" + _loc8_);
            _tooltipRankMember.setText(_loc6_,param1,_loc4_ + "\n" + _loc5_ + "\n\n" + _member.lastOnlineInfo + "\n" + _loc8_);
            switch(int(param3))
            {
               case 0:
                  _content.iconGuildBattleAttack.visible = _member.isAttacking;
                  _content.iconGuildBattleDefense.visible = _member.isDefending;
                  _content.iconPremiumCurrency.visible = false;
                  _content.iconGameCurrency.visible = false;
                  _content.iconGuildCompetition.visible = false;
                  _btnLeaderVote.visible = !_member.guild.hasPendingLeaderVote && _member.isVoteOutAllowed;
                  _content.txtDonated.visible = false;
                  break;
               case 1:
                  _content.iconGuildBattleAttack.visible = false;
                  _content.iconGuildBattleDefense.visible = false;
                  _content.iconPremiumCurrency.visible = true;
                  _content.iconGameCurrency.visible = false;
                  _content.iconGuildCompetition.visible = false;
                  _btnLeaderVote.visible = false;
                  _content.txtDonated.visible = true;
                  _content.txtDonated.text = LocText.current.formatHugeNumber(_member.premiumCurrencyDonation);
                  break;
               case 2:
                  _content.iconGuildBattleAttack.visible = false;
                  _content.iconGuildBattleDefense.visible = false;
                  _content.iconPremiumCurrency.visible = false;
                  _content.iconGameCurrency.visible = true;
                  _content.iconGuildCompetition.visible = false;
                  _btnLeaderVote.visible = false;
                  _content.txtDonated.visible = true;
                  _content.txtDonated.text = LocText.current.formatHugeNumber(_member.gameCurrencyDonation);
                  break;
               case 3:
                  _content.iconGuildBattleAttack.visible = false;
                  _content.iconGuildBattleDefense.visible = false;
                  _content.iconPremiumCurrency.visible = false;
                  _content.iconGameCurrency.visible = false;
                  _content.iconGuildCompetition.visible = true;
                  _btnLeaderVote.visible = false;
                  _content.txtDonated.visible = true;
                  _content.txtDonated.text = LocText.current.formatHugeNumber(_member.guildCompetitionPointsGathered);
            }
            _content.txtName.width = 142;
         }
         else
         {
            _tooltipName.setText(_loc6_,param1,_loc4_ + "\n\n" + _loc8_);
            _tooltipRankLeader.setText(_loc6_,param1,_loc4_ + "\n\n" + _loc8_);
            _tooltipRankOfficer.setText(_loc6_,param1,_loc4_ + "\n\n" + _loc8_);
            _tooltipRankMember.setText(_loc6_,param1,_loc4_ + "\n\n" + _loc8_);
            _content.iconGuildBattleAttack.visible = false;
            _content.iconGuildBattleDefense.visible = false;
            _content.iconPremiumCurrency.visible = false;
            _content.iconGameCurrency.visible = false;
            _content.iconGuildCompetition.visible = false;
            _btnLeaderVote.visible = false;
            _content.txtDonated.visible = false;
            _content.txtName.width = 170;
         }
         _content.txtName.setTextToFit(_member.name,"...");
         _onlinePoint.refresh(_member.isOnline,_member.name);
         LocText.current.gender = _loc7_;
         _content.backgroundEven.visible = _index % 2 == 0;
         _content.backgroundOdd.visible = _index % 2 != 0;
      }
      
      private function handleRequests(param1:ActionRequestResponse) : void
      {
         var _loc2_:* = param1.action;
         if("initGuildLeaderVote" !== _loc2_)
         {
            throw new Error("Unsupported request action \'" + param1.action + "\'!");
         }
         if(param1.error == "")
         {
            Environment.application.updateData(param1.data);
            Environment.panelManager.showDialog(new DialogGuildLeaderVoteInfo(User.current.character.guild.leaderVote));
         }
         else if(param1.error == "errCreateVoteAlreadyRunning")
         {
            ViewManager.instance.refresh();
         }
         else
         {
            Environment.reportError(param1.error,param1.request);
         }
      }
   }
}
