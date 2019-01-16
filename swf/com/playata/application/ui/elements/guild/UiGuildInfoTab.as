package com.playata.application.ui.elements.guild
{
   import com.playata.application.AppConfig;
   import com.playata.application.data.GameUtil;
   import com.playata.application.data.character.Character;
   import com.playata.application.data.constants.CConstant;
   import com.playata.application.data.guild.Guild;
   import com.playata.application.data.user.User;
   import com.playata.application.ui.dialogs.DialogGuildApplySettings;
   import com.playata.application.ui.dialogs.DialogGuildBattleAutoJoinsSettings;
   import com.playata.application.ui.dialogs.DialogGuildBattleCreate;
   import com.playata.application.ui.dialogs.DialogGuildBattleSearch;
   import com.playata.application.ui.dialogs.DialogGuildDonation;
   import com.playata.application.ui.dialogs.DialogGuildInvitation;
   import com.playata.application.ui.dialogs.DialogGuildJoinInfo;
   import com.playata.application.ui.dialogs.DialogGuildMissileSettings;
   import com.playata.application.ui.dialogs.DialogGuildRechargeGuildBattleAutoJoins;
   import com.playata.application.ui.dialogs.DialogGuildRechargeMissiles;
   import com.playata.application.ui.dialogs.DialogGuildStatistics;
   import com.playata.application.ui.dialogs.DialogMailCompose;
   import com.playata.application.ui.dialogs.DialogMovieHistory;
   import com.playata.application.ui.elements.generic.button.UiButton;
   import com.playata.application.ui.elements.generic.checkbox.UiCheckBox;
   import com.playata.application.ui.elements.generic.dialog.UiInfoDialog;
   import com.playata.application.ui.elements.generic.locale_picker.UiLocalePicker;
   import com.playata.application.ui.elements.generic.textfield.UiTextTooltip;
   import com.playata.framework.application.Environment;
   import com.playata.framework.application.request.ActionRequestResponse;
   import com.playata.framework.input.InteractionEvent;
   import com.playata.framework.localization.LocText;
   import visuals.ui.elements.guild.SymbolGuildInfoTabGeneric;
   
   public class UiGuildInfoTab
   {
       
      
      private var _guild:Guild = null;
      
      private var _content:SymbolGuildInfoTabGeneric = null;
      
      private var _btnDonate:UiButton = null;
      
      private var _btnRechargeMissiles:UiButton = null;
      
      private var _btnMissileSettings:UiButton = null;
      
      private var _btnRechargeAutoJoins:UiButton = null;
      
      private var _btnAutoJoinsSettings:UiButton = null;
      
      private var _btnApplySettings:UiButton = null;
      
      private var _btnApply:UiButton = null;
      
      private var _btnJoin:UiButton = null;
      
      private var _btnStatistics:UiButton = null;
      
      private var _btnAttack:UiButton = null;
      
      private var _btnInvite:UiButton = null;
      
      private var _btnMovies:UiButton = null;
      
      private var _btnCustomizeStudio:UiButton;
      
      private var _checkAcceptMembers:UiCheckBox = null;
      
      private var _statBarGuildCapacity:UiGuildStatBar = null;
      
      private var _statBarCharacterBaseStatsBoost:UiGuildStatBar = null;
      
      private var _statBarQuestXpRewardBoost:UiGuildStatBar = null;
      
      private var _statBarQuestWorkGameCurrencyRewardBoost:UiGuildStatBar = null;
      
      private var _tooltipHonor:UiTextTooltip = null;
      
      private var _tooltipHonorText:UiTextTooltip = null;
      
      private var _tooltipArtifacts:UiTextTooltip = null;
      
      private var _tooltipArtifactsText:UiTextTooltip = null;
      
      private var _tooltipLocale:UiTextTooltip = null;
      
      private var _onShowCustomization:Function;
      
      private var _localePicker:UiLocalePicker = null;
      
      public function UiGuildInfoTab(param1:SymbolGuildInfoTabGeneric, param2:Function)
      {
         super();
         _content = param1;
         _onShowCustomization = param2;
         _content.txtAcceptMembers.text = LocText.current.text("screen/guild/guild_info/accept_members");
         _checkAcceptMembers = new UiCheckBox(_content.checkAcceptMembers,false,LocText.current.text("screen/guild/guild_info/accept_members_change"),onCheckedChangedAcceptMembers,null,_content.txtAcceptMembers);
         _btnDonate = new UiButton(_content.btnDonate,LocText.current.text("screen/guild/guild_info/button_donate_tooltip"),onClickButtonDonate);
         _btnApply = new UiButton(_content.btnApply,"",onClickButtonApply);
         _btnJoin = new UiButton(_content.btnJoin,"",onClickButtonJoin);
         _btnStatistics = new UiButton(_content.btnStatistics,LocText.current.text("screen/guild/guild_info/button_statistics_tooltip"),onClickButtonStatistics);
         _btnAttack = new UiButton(_content.btnAttack,"",onClickButtonAttack);
         _btnRechargeMissiles = new UiButton(_content.btnRechargeMissiles,LocText.current.text("screen/guild/guild_info/button_recharge_missiles_tooltip"),onClickButtonRechargeMissiles);
         _btnMissileSettings = new UiButton(_content.btnMissileSettings,LocText.current.text("screen/guild/guild_info/missile_settings_tooltip"),onClickButtonMissileSettings);
         _btnRechargeAutoJoins = new UiButton(_content.btnRechargeGuildBattleAutoJoins,LocText.current.text("screen/guild/guild_info/button_recharge_auto_joins_tooltip"),onClickButtonRechargeAutoJoins);
         _btnAutoJoinsSettings = new UiButton(_content.btnGuildBattleAutoJoinSettings,LocText.current.text("screen/guild/guild_info/auto_joins_settings_tooltip"),onClickButtonAutoJoinsSettings);
         _btnApplySettings = new UiButton(_content.btnApplySettings,LocText.current.text("screen/guild/guild_info/apply_settings_tooltip"),onClickButtonApplySettings);
         _btnInvite = new UiButton(_content.btnInvite,LocText.current.text("screen/guild/member_info/button_invite_tooltip"),onClickInvite);
         _btnMovies = new UiButton(_content.btnMovies,"",onClickViewMovies);
         _btnCustomizeStudio = new UiButton(_content.btnCustomizeStudio,LocText.current.text("screen/guild/guild_info/button_customize_studio_tooltip"),onClickCustomize);
         _btnDonate.extendClickArea(30,25,-10,5);
         _btnRechargeMissiles.extendClickArea(30,25,-10,5);
         _btnRechargeAutoJoins.extendClickArea(30,25,-10,5);
         if(AppConfig.teamLocaleEnabled && AppConfig.alternativeLocales != null)
         {
            _localePicker = new UiLocalePicker(_content.localePicker,Environment.info.availableLocales,Environment.info.defaultLocale,onLocaleChange,null,true,false);
            _content.localePicker.iconSelectedLocale.dropDownBackground.visible = false;
            _content.localePicker.bringToTop();
         }
         else
         {
            _content.localePicker.visible = false;
         }
         _btnCustomizeStudio.visible = AppConfig.customGuildBackgroundsEnabled;
         _statBarGuildCapacity = new UiGuildStatBar(_content.statBarGuildCapacity,1,CConstant.max_stat_guild_capacity);
         _statBarCharacterBaseStatsBoost = new UiGuildStatBar(_content.statBarCharacterBaseStatsBoost,2,CConstant.max_stat_character_base_stats_boost);
         _statBarQuestXpRewardBoost = new UiGuildStatBar(_content.statBarQuestXpRewardBoost,3,CConstant.max_stat_quest_xp_reward_boost);
         _statBarQuestWorkGameCurrencyRewardBoost = new UiGuildStatBar(_content.statBarQuestWorkGameCurrencyRewardBoost,4,CConstant.max_stat_quest_game_currency_reward_boost);
         _tooltipHonor = new UiTextTooltip(_content.iconHonor,LocText.current.text("screen/guild/guild_info/honor_tooltip"));
         _tooltipHonorText = new UiTextTooltip(_content.txtGuildHonor,LocText.current.text("screen/guild/guild_info/honor_tooltip"));
         _tooltipArtifacts = new UiTextTooltip(_content.iconArtifact,LocText.current.text("screen/guild/guild_info/artifacts_tooltip"));
         _tooltipArtifactsText = new UiTextTooltip(_content.txtGuildArtifacts,LocText.current.text("screen/guild/guild_info/artifacts_tooltip"));
         _tooltipLocale = new UiTextTooltip(_content.localePicker.iconSelectedLocale,LocText.current.text("screen/guild/guild_info/locale_tooltip"));
      }
      
      public function dispose() : void
      {
         _btnDonate.dispose();
         _btnDonate = null;
         _btnApply.dispose();
         _btnApply = null;
         _btnJoin.dispose();
         _btnJoin = null;
         _btnStatistics.dispose();
         _btnStatistics = null;
         _btnAttack.dispose();
         _btnAttack = null;
         _btnRechargeMissiles.dispose();
         _btnRechargeMissiles = null;
         _btnMissileSettings.dispose();
         _btnMissileSettings = null;
         _btnRechargeAutoJoins.dispose();
         _btnRechargeAutoJoins = null;
         _btnAutoJoinsSettings.dispose();
         _btnAutoJoinsSettings = null;
         _btnApplySettings.dispose();
         _btnApplySettings = null;
         _btnInvite.dispose();
         _btnInvite = null;
         _btnMovies.dispose();
         _btnMovies = null;
         _btnCustomizeStudio.dispose();
         _btnCustomizeStudio = null;
         _checkAcceptMembers.dispose();
         _checkAcceptMembers = null;
         _statBarGuildCapacity.dispose();
         _statBarCharacterBaseStatsBoost.dispose();
         _statBarQuestXpRewardBoost.dispose();
         _statBarQuestWorkGameCurrencyRewardBoost.dispose();
         _statBarGuildCapacity = null;
         _statBarCharacterBaseStatsBoost = null;
         _statBarQuestXpRewardBoost = null;
         _statBarQuestWorkGameCurrencyRewardBoost = null;
         if(_localePicker)
         {
            _localePicker.dispose();
            _localePicker = null;
         }
         _tooltipHonor.dispose();
         _tooltipHonor = null;
         _tooltipArtifacts.dispose();
         _tooltipArtifacts = null;
         _tooltipHonorText.dispose();
         _tooltipHonorText = null;
         _tooltipArtifactsText.dispose();
         _tooltipArtifactsText = null;
         _onShowCustomization = null;
      }
      
      public function refresh(param1:Guild) : void
      {
         if(!User.current)
         {
            return;
         }
         _guild = param1;
         if(!_guild)
         {
            return;
         }
         refreshInfo();
         refreshStats();
         refreshBank();
         refreshButtons();
      }
      
      private function refreshInfo() : void
      {
         if(!_guild)
         {
            return;
         }
         var _loc1_:Boolean = _guild.isOwnGuild;
         var _loc2_:Character = User.current.character;
         _content.txtMemberCount.text = LocText.current.text("screen/guild/guild_info/member_count",_guild.onlineMemberCount,_guild.memberCount);
         _checkAcceptMembers.checked = _guild.acceptMembers;
         _checkAcceptMembers.locked = !_loc1_ || _loc2_.guildRank == 3;
         if(_checkAcceptMembers.locked)
         {
            _checkAcceptMembers.tooltip = "";
         }
         else
         {
            _checkAcceptMembers.tooltip = LocText.current.text("screen/guild/guild_info/accept_members_change");
         }
         _content.checkAcceptMembers.visible = _loc1_ && _loc2_.guildRank != 3;
         _content.iconAcceptMembersYes.visible = (!_loc1_ || _loc2_.guildRank == 3) && _guild.acceptMembers;
         _content.iconAcceptMembersNo.visible = (!_loc1_ || _loc2_.guildRank == 3) && !_guild.acceptMembers;
         if(_guild.acceptMembers)
         {
            _content.txtAcceptMembers.text = LocText.current.text("screen/guild/guild_info/accept_members");
         }
         else
         {
            _content.txtAcceptMembers.text = LocText.current.text("screen/guild/guild_info/accept_no_members");
         }
         _content.txtAcceptMembers.autoFontSize = true;
         _content.txtGuildHonor.text = LocText.current.formatHugeNumber(_guild.honor);
         _content.txtGuildArtifacts.text = _guild.artifactsOwnedCurrent.toString();
         if(_guild.isOwnGuild)
         {
            _content.txtMissiles.text = GameUtil.getGuildMissileString(_guild.missiles);
            _content.txtGuildBattleAutoJoin.text = GameUtil.getGuildAutoJoinsString(_guild.autoJoins);
         }
         _content.iconMissiles.visible = _loc1_;
         _content.txtMissiles.visible = _loc1_;
         _content.iconGuildBattleAutoJoins.visible = _loc1_;
         _content.txtGuildBattleAutoJoin.visible = _loc1_;
         _btnRechargeMissiles.visible = _loc1_;
         _btnMissileSettings.visible = _loc1_;
         _btnRechargeAutoJoins.visible = _loc1_;
         _btnAutoJoinsSettings.visible = _loc1_;
         _btnApplySettings.visible = _loc1_ && _guild.acceptMembers && _loc2_.guildRank == 1;
      }
      
      private function refreshStats() : void
      {
         if(!_guild)
         {
            return;
         }
         var _loc1_:Boolean = _guild.isOwnGuild;
         _statBarGuildCapacity.guild = _guild;
         _statBarCharacterBaseStatsBoost.guild = _guild;
         _statBarQuestXpRewardBoost.guild = _guild;
         _statBarQuestWorkGameCurrencyRewardBoost.guild = _guild;
         _statBarGuildCapacity.increaseButton.visible = _loc1_;
         _statBarCharacterBaseStatsBoost.increaseButton.visible = _loc1_;
         _statBarQuestXpRewardBoost.increaseButton.visible = _loc1_;
         _statBarQuestWorkGameCurrencyRewardBoost.increaseButton.visible = _loc1_;
         if(_loc1_ && _guild.hasData("stat_points_available") && _guild.hasAvailableStatPoints && User.current.character.guildRank != 3)
         {
            if(!_statBarGuildCapacity.isFullyImproved)
            {
               _statBarGuildCapacity.increaseButton.glow();
            }
            else
            {
               _statBarGuildCapacity.increaseButton.idle();
            }
            if(!_statBarCharacterBaseStatsBoost.isFullyImproved)
            {
               _statBarCharacterBaseStatsBoost.increaseButton.glow();
            }
            else
            {
               _statBarCharacterBaseStatsBoost.increaseButton.idle();
            }
            if(!_statBarQuestXpRewardBoost.isFullyImproved)
            {
               _statBarQuestXpRewardBoost.increaseButton.glow();
            }
            else
            {
               _statBarQuestXpRewardBoost.increaseButton.idle();
            }
            if(!_statBarQuestWorkGameCurrencyRewardBoost.isFullyImproved)
            {
               _statBarQuestWorkGameCurrencyRewardBoost.increaseButton.glow();
            }
            else
            {
               _statBarQuestWorkGameCurrencyRewardBoost.increaseButton.idle();
            }
         }
         else
         {
            _statBarGuildCapacity.increaseButton.idle();
            _statBarCharacterBaseStatsBoost.increaseButton.idle();
            _statBarQuestXpRewardBoost.increaseButton.idle();
            _statBarQuestWorkGameCurrencyRewardBoost.increaseButton.idle();
         }
      }
      
      private function refreshBank() : void
      {
         if(!_guild)
         {
            return;
         }
         var _loc1_:Boolean = _guild.isOwnGuild;
         _content.iconCoin.visible = _loc1_;
         _content.iconPremiumCurrency.visible = _loc1_;
         _content.txtCoins.visible = _loc1_;
         _content.txtPremiumCurrency.visible = _loc1_;
         _btnDonate.visible = _loc1_;
         if(_loc1_)
         {
            _content.txtCoins.text = LocText.current.formatHugeNumber(_guild.gameCurrency);
            _content.txtPremiumCurrency.text = LocText.current.formatHugeNumber(_guild.premiumCurrency);
         }
      }
      
      private function refreshButtons() : void
      {
         var _loc3_:int = 0;
         if(!_guild)
         {
            return;
         }
         var _loc1_:Boolean = _guild.isOwnGuild;
         var _loc2_:Character = User.current.character;
         _btnApply.visible = !_loc1_ && !_guild.applyOpen;
         _btnApply.buttonEnabled = _guild.acceptMembers && _loc2_.meetsGuildApplyRequirements(_guild) && _guild.leader != null;
         _btnJoin.visible = !_loc1_ && _guild.applyOpen;
         _btnJoin.buttonEnabled = _guild.acceptMembers && User.current.character.meetsGuildApplyRequirements(_guild);
         _btnInvite.visible = _loc1_;
         _btnInvite.buttonEnabled = _guild.isOwnGuild && _loc2_.guildRank != 3 && !_guild.isFull;
         if(_btnInvite.visible)
         {
            if(_btnInvite.buttonEnabled)
            {
               _btnInvite.tooltip = LocText.current.text("screen/guild/member_info/button_invite_tooltip");
            }
            else if(_guild.isOwnGuild && _loc2_.guildRank == 3)
            {
               _btnInvite.tooltip = LocText.current.text("screen/guild/member_info/button_invite_no_permission_tooltip");
            }
            else if(_guild.isOwnGuild && _guild.isFull)
            {
               _btnInvite.tooltip = LocText.current.text("screen/guild/member_info/button_invite_full_tooltip");
            }
            else
            {
               _btnInvite.tooltip = "";
            }
         }
         if(_guild.acceptMembers)
         {
            _btnApply.tooltip = LocText.current.text("screen/guild/guild_info/button_apply_active_tooltip");
            _btnJoin.tooltip = LocText.current.text("screen/guild/guild_info/button_join_active_tooltip");
            if(!_loc2_.meetsGuildApplyRequirements(_guild))
            {
               if(_guild.hasMinApplyLevel && _guild.minApplyLevel > _loc2_.level && _guild.hasMinApplyHonor && _guild.minApplyHonor > _loc2_.honor)
               {
                  _btnApply.tooltip = LocText.current.text("screen/guild/guild_info/button_apply_requirements_not_met_level_honor_tooltip",LocText.current.formatHugeNumber(_guild.minApplyLevel),LocText.current.formatHugeNumber(_guild.minApplyHonor));
                  _btnJoin.tooltip = LocText.current.text("screen/guild/guild_info/button_apply_requirements_not_met_level_honor_tooltip",LocText.current.formatHugeNumber(_guild.minApplyLevel),LocText.current.formatHugeNumber(_guild.minApplyHonor));
               }
               else if(_guild.hasMinApplyLevel && _guild.minApplyLevel > _loc2_.level)
               {
                  _btnApply.tooltip = LocText.current.text("screen/guild/guild_info/button_apply_requirements_not_met_level_tooltip",LocText.current.formatHugeNumber(_guild.minApplyLevel));
                  _btnJoin.tooltip = LocText.current.text("screen/guild/guild_info/button_apply_requirements_not_met_level_tooltip",LocText.current.formatHugeNumber(_guild.minApplyLevel));
               }
               else if(CConstant.message_min_level > _loc2_.level)
               {
                  _btnApply.tooltip = LocText.current.text("screen/guild/guild_info/button_apply_requirements_not_met_level_tooltip",LocText.current.formatHugeNumber(CConstant.message_min_level));
                  _btnJoin.tooltip = LocText.current.text("screen/guild/guild_info/button_apply_requirements_not_met_level_tooltip",LocText.current.formatHugeNumber(CConstant.message_min_level));
               }
               else
               {
                  _btnApply.tooltip = LocText.current.text("screen/guild/guild_info/button_apply_requirements_not_met_honor_tooltip",LocText.current.formatHugeNumber(_guild.minApplyHonor));
                  _btnJoin.tooltip = LocText.current.text("screen/guild/guild_info/button_apply_requirements_not_met_honor_tooltip",LocText.current.formatHugeNumber(_guild.minApplyHonor));
               }
            }
            else if(_guild.leader == null)
            {
               _btnApply.tooltip = LocText.current.text("screen/guild/guild_info/button_apply_inactive_tooltip");
               _btnJoin.tooltip = LocText.current.text("screen/guild/guild_info/button_apply_inactive_tooltip");
            }
         }
         else
         {
            _btnApply.tooltip = LocText.current.text("screen/guild/guild_info/button_apply_inactive_tooltip");
            _btnJoin.tooltip = LocText.current.text("screen/guild/guild_info/button_apply_inactive_tooltip");
         }
         _btnAttack.buttonEnabled = _loc2_.guildRank != 3 && _loc2_.guild != null && _loc2_.guild.leader != null && _loc2_.guild.pendingAttackGuildBattle == null && (_loc2_.guild.pendingDefenseGuildBattle == null || _loc2_.guild.pendingDefenseGuildBattle.guildAttackerId != _guild.id);
         if(_btnAttack.buttonEnabled && _loc1_)
         {
            _btnAttack.tooltip = LocText.current.text("screen/guild/guild_info/button_attack_own_guild_tooltip");
         }
         else if(_btnAttack.buttonEnabled && !_loc1_)
         {
            _btnAttack.tooltip = LocText.current.text("screen/guild/guild_info/button_attack_other_guild_tooltip");
         }
         else if(_loc2_.guildRank == 3 && _loc1_)
         {
            _btnAttack.tooltip = LocText.current.text("screen/guild/guild_info/button_attack_no_permission_own_guild_tooltip");
         }
         else if(_loc2_.guildRank == 3 && !_loc1_)
         {
            _btnAttack.tooltip = LocText.current.text("screen/guild/guild_info/button_attack_no_permission_other_guild_tooltip");
         }
         else if(_loc2_.guild != null && _loc2_.guild.pendingAttackGuildBattle != null && _loc2_.guild.pendingAttackGuildBattle.guildDefenderId == _guild.id)
         {
            _btnAttack.tooltip = LocText.current.text("screen/guild/guild_info/button_attack_pending_attack_this_guild_tooltip");
         }
         else if(_loc2_.guild != null && _loc2_.guild.pendingAttackGuildBattle != null)
         {
            _btnAttack.tooltip = LocText.current.text("screen/guild/guild_info/button_attack_pending_attack_tooltip");
         }
         else if(_loc2_.guild != null && _loc2_.guild.pendingDefenseGuildBattle != null && _loc2_.guild.pendingDefenseGuildBattle.guildAttackerId == _guild.id)
         {
            _btnAttack.tooltip = LocText.current.text("screen/guild/guild_info/button_attack_attacking_us_tooltip");
         }
         else if(_loc2_.guild == null)
         {
            _btnAttack.tooltip = LocText.current.text("screen/guild/guild_info/button_attack_no_guild_tooltip");
         }
         _btnInvite.visible = _btnInvite.visible && _guild.status != 2;
         _btnApply.visible = _btnApply.visible && _guild.status != 2;
         _btnJoin.visible = _btnJoin.visible && _guild.status != 2;
         _btnAttack.visible = _btnAttack.visible && _guild.status != 2;
         if(_guild.movies > 0)
         {
            _btnMovies.buttonEnabled = true;
            if(_loc1_)
            {
               _btnMovies.tooltip = LocText.current.text("screen/guild/guild_info/button_movies_own_guild");
            }
            else
            {
               _btnMovies.tooltip = LocText.current.text("screen/guild/guild_info/button_movies_other_guild",_guild.name);
            }
         }
         else
         {
            _btnMovies.buttonEnabled = false;
            if(_loc1_)
            {
               _btnMovies.tooltip = LocText.current.text("screen/guild/guild_info/button_no_movies_own_guild");
            }
            else
            {
               _btnMovies.tooltip = LocText.current.text("screen/guild/guild_info/button_no_movies_other_guild",_guild.name);
            }
         }
         _btnCustomizeStudio.visible = AppConfig.customGuildBackgroundsEnabled && _loc1_;
         if(_btnCustomizeStudio.visible)
         {
            _loc3_ = _guild.getFreeCustomizations().length;
            _content.btnCustomizeStudio.bubbleNew.txt.text = _loc3_.toString();
            _content.btnCustomizeStudio.bubbleNew.visible = _content.btnCustomizeStudio.bubbleNew.txt.text != "0";
            _btnCustomizeStudio.tooltip = _loc3_ > 0?LocText.current.text("screen/guild/guild_info/button_customize_studio_free_tooltip",_loc3_):LocText.current.text("screen/guild/guild_info/button_customize_studio_tooltip");
         }
         if(_localePicker != null)
         {
            _localePicker.setActiveLocale(_guild.locale);
            _localePicker.enabled = _loc1_ && User.current.character.guildRank == 1;
         }
      }
      
      private function onClickButtonDonate(param1:InteractionEvent) : void
      {
         Environment.panelManager.showDialog(new DialogGuildDonation());
      }
      
      private function onClickButtonRechargeMissiles(param1:InteractionEvent) : void
      {
         Environment.panelManager.showDialog(new DialogGuildRechargeMissiles());
      }
      
      private function onClickButtonMissileSettings(param1:InteractionEvent) : void
      {
         Environment.panelManager.showDialog(new DialogGuildMissileSettings());
      }
      
      private function onClickButtonRechargeAutoJoins(param1:InteractionEvent) : void
      {
         Environment.panelManager.showDialog(new DialogGuildRechargeGuildBattleAutoJoins());
      }
      
      private function onClickButtonAutoJoinsSettings(param1:InteractionEvent) : void
      {
         Environment.panelManager.showDialog(new DialogGuildBattleAutoJoinsSettings());
      }
      
      private function onClickButtonApplySettings(param1:InteractionEvent) : void
      {
         Environment.panelManager.showDialog(new DialogGuildApplySettings());
      }
      
      private function onClickButtonApply(param1:InteractionEvent) : void
      {
         Environment.panelManager.showDialog(new DialogMailCompose(_guild.leader.name,LocText.current.text("screen/guild/guild_info/apply_mail_subject_text",_guild.name),LocText.current.text("screen/guild/guild_info/apply_mail_body_text"),"guild_application"));
      }
      
      private function onClickButtonJoin(param1:InteractionEvent) : void
      {
         Environment.panelManager.showDialog(new DialogGuildJoinInfo(_guild.id,_guild.name));
      }
      
      private function onClickButtonStatistics(param1:InteractionEvent) : void
      {
         Environment.panelManager.showDialog(new DialogGuildStatistics(_guild));
      }
      
      private function onClickButtonAttack(param1:InteractionEvent) : void
      {
         if(_guild.isOwnGuild)
         {
            Environment.panelManager.showDialog(new DialogGuildBattleSearch());
         }
         else
         {
            Environment.application.sendActionRequest("checkAttackGuild",{
               "guild_id":_guild.id,
               "time":1
            },handleRequests);
         }
      }
      
      private function onClickInvite(param1:InteractionEvent) : void
      {
         Environment.panelManager.showDialog(new DialogGuildInvitation());
      }
      
      private function onClickViewMovies(param1:InteractionEvent) : void
      {
         Environment.panelManager.showDialog(new DialogMovieHistory(_guild));
      }
      
      private function onClickCustomize(param1:InteractionEvent) : void
      {
      }
      
      private function onCheckedChangedAcceptMembers(param1:Boolean) : void
      {
         Environment.application.sendActionRequest("setGuildAcceptMembers",{"value":_checkAcceptMembers.checked},handleRequests);
      }
      
      protected function onLocaleChange(param1:String) : void
      {
         _localePicker.close();
         Environment.application.sendActionRequest("setGuildLocale",{"locale":param1},handleRequests);
      }
      
      private function handleRequests(param1:ActionRequestResponse) : void
      {
         var _loc2_:* = null;
         var _loc3_:* = param1.action;
         switch(_loc3_)
         {
            case "setGuildAcceptMembers":
               if(param1.error == "")
               {
                  Environment.application.updateData(param1.data);
                  refresh(_guild);
               }
               else
               {
                  Environment.reportError(param1.error,param1.request);
               }
               break;
            case "checkAttackGuild":
               if(param1.error == "")
               {
                  Environment.application.updateData(param1.data);
                  Environment.panelManager.showDialog(new DialogGuildBattleCreate(_guild));
               }
               else if(param1.error == "errCreateInvalidGuild")
               {
                  Environment.panelManager.showDialog(new UiInfoDialog(LocText.current.text("dialog/guild_battle_create_invalid_guild/title"),LocText.current.text("dialog/guild_battle_create_invalid_guild/text"),LocText.current.text("general/button_ok")));
               }
               else if(param1.error == "errCreateNoPermission")
               {
                  Environment.panelManager.showDialog(new UiInfoDialog(LocText.current.text("dialog/guild_battle_create_no_permission/title"),LocText.current.text("dialog/guild_battle_create_no_permission/text"),LocText.current.text("general/button_ok")));
               }
               else if(param1.error == "errCreateAlreadyAttacking")
               {
                  Environment.panelManager.showDialog(new UiInfoDialog(LocText.current.text("dialog/guild_battle_create_already_attacking/title"),LocText.current.text("dialog/guild_battle_create_already_attacking/text"),LocText.current.text("general/button_ok")));
               }
               else if(param1.error == "errCreateAttackingUs")
               {
                  Environment.panelManager.showDialog(new UiInfoDialog(LocText.current.text("dialog/guild_battle_create_attacking_us/title"),LocText.current.text("dialog/guild_battle_create_attacking_us/text"),LocText.current.text("general/button_ok")));
               }
               else if(param1.error == "errCreateAlreadyAttacked")
               {
                  Environment.panelManager.showDialog(new UiInfoDialog(LocText.current.text("dialog/guild_battle_create_already_attacked/title"),LocText.current.text("dialog/guild_battle_create_already_attacked/text"),LocText.current.text("general/button_ok")));
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
               break;
            case "setGuildLocale":
               if(param1.error == "")
               {
                  Environment.application.updateData(param1.data);
               }
               else if(param1.error == "errCharacterNoGuild")
               {
                  Environment.panelManager.showDialog(new UiInfoDialog(LocText.current.text("dialog/change_guild_locale_no_guild/title"),LocText.current.text("dialog/change_guild_locale_no_guild/text"),LocText.current.text("general/button_ok")));
               }
               else if(param1.error == "errGuildSetLocaleNoPermission")
               {
                  Environment.panelManager.showDialog(new UiInfoDialog(LocText.current.text("dialog/change_guild_locale_no_permission/title"),LocText.current.text("dialog/change_guild_locale_no_permission/text"),LocText.current.text("general/button_ok")));
               }
               else if(param1.error != "errGuildSetLocaleSameLocale")
               {
                  if(param1.error == "errNewLocaleInvalidLocale")
                  {
                     Environment.panelManager.showDialog(new UiInfoDialog(LocText.current.text("dialog/change_guild_locale_invalid_locale/title"),LocText.current.text("dialog/change_guild_locale_invalid_locale/text"),LocText.current.text("general/button_ok")));
                  }
                  else
                  {
                     Environment.reportError(param1.error,param1.request);
                  }
               }
               break;
            default:
               throw new Error("Unsupported request action \'" + param1.action + "\'!");
         }
      }
   }
}
