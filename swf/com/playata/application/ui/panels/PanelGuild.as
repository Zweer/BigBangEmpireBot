package com.playata.application.ui.panels
{
   import com.playata.application.data.AppDateTime;
   import com.playata.application.data.GameUtil;
   import com.playata.application.data.guild.Guild;
   import com.playata.application.data.guild.GuildBattle;
   import com.playata.application.data.user.User;
   import com.playata.application.messaging.Message;
   import com.playata.application.messaging.MessageRouter;
   import com.playata.application.ui.ViewManager;
   import com.playata.application.ui.dialogs.DialogGuildBattleHistory;
   import com.playata.application.ui.dialogs.DialogGuildBattlePending;
   import com.playata.application.ui.dialogs.DialogGuildBattleResult;
   import com.playata.application.ui.dialogs.DialogGuildBattleSearch;
   import com.playata.application.ui.dialogs.DialogGuildBattleView;
   import com.playata.application.ui.dialogs.DialogGuildBoosters;
   import com.playata.application.ui.dialogs.DialogGuildCompetitionProgress;
   import com.playata.application.ui.dialogs.DialogGuildCompetitionReward;
   import com.playata.application.ui.dialogs.DialogGuildEmblem;
   import com.playata.application.ui.dialogs.DialogGuildRename;
   import com.playata.application.ui.dialogs.DialogTutorialPopup;
   import com.playata.application.ui.elements.background.UiBackgroundFader;
   import com.playata.application.ui.elements.generic.button.UiButton;
   import com.playata.application.ui.elements.generic.tab.UiTabButton;
   import com.playata.application.ui.elements.generic.textfield.UiTextTooltip;
   import com.playata.application.ui.elements.guild.UiDialogNoGuild;
   import com.playata.application.ui.elements.guild.UiGuildBoosterIcon;
   import com.playata.application.ui.elements.guild.UiGuildChatTab;
   import com.playata.application.ui.elements.guild.UiGuildCustomizeStudioTab;
   import com.playata.application.ui.elements.guild.UiGuildDescriptionTab;
   import com.playata.application.ui.elements.guild.UiGuildEmblem;
   import com.playata.application.ui.elements.guild.UiGuildInfoTab;
   import com.playata.application.ui.elements.guild.UiGuildLeaderVoteInfo;
   import com.playata.application.ui.elements.guild.UiGuildMemberInfoTab;
   import com.playata.application.ui.elements.guild.UiGuildNoteTab;
   import com.playata.application.ui.elements.guild_competition.UiGuildCompetitionButton;
   import com.playata.framework.application.Environment;
   import com.playata.framework.application.request.ActionRequestResponse;
   import com.playata.framework.core.util.TimeUtil;
   import com.playata.framework.display.AnchorPoint;
   import com.playata.framework.display.IDisplayObject;
   import com.playata.framework.display.InteractiveDisplayObject;
   import com.playata.framework.display.Sprite;
   import com.playata.framework.display.UriSprite;
   import com.playata.framework.display.ui.Align;
   import com.playata.framework.display.ui.controls.ILabel;
   import com.playata.framework.input.InteractionEvent;
   import com.playata.framework.localization.LocText;
   import visuals.ui.panels.SymbolPanelGuildGeneric;
   
   public class PanelGuild extends DefaultPanel
   {
       
      
      private var _btnHelp:UiButton = null;
      
      private var _btnTabInfo:UiTabButton = null;
      
      private var _btnTabMembers:UiTabButton = null;
      
      private var _btnTabChat:UiTabButton = null;
      
      private var _btnTabNote:UiTabButton = null;
      
      private var _btnTabDescription:UiTabButton = null;
      
      private var _btnGuildName:UiButton = null;
      
      private var _btnBattleHistory:UiButton = null;
      
      private var _btnVisitGuildPage:UiButton = null;
      
      private var _btnGuildCompetition:UiGuildCompetitionButton = null;
      
      private var _btnGuildBooster:UiButton = null;
      
      private var _customGuild:Guild = null;
      
      private var _emblem:UiGuildEmblem = null;
      
      private var _dialogNoGuild:UiDialogNoGuild = null;
      
      private var _guildInfoTab:UiGuildInfoTab = null;
      
      private var _guildMemberInfoTab:UiGuildMemberInfoTab = null;
      
      private var _guildCustomizationTab:UiGuildCustomizeStudioTab;
      
      private var _guildLeaderVoteInfo:UiGuildLeaderVoteInfo = null;
      
      private var _guildDescriptionTab:UiGuildDescriptionTab = null;
      
      private var _guildNoteTab:UiGuildNoteTab = null;
      
      private var _guildChatTab:UiGuildChatTab = null;
      
      private var _ownGuildBottomFrameCollapsed:Boolean = true;
      
      private var _tooltipAttack:UiTextTooltip = null;
      
      private var _tooltipAttackTime:UiTextTooltip = null;
      
      private var _tooltipDefense:UiTextTooltip = null;
      
      private var _tooltipDefenseTime:UiTextTooltip = null;
      
      private var _iconGuildBattleAttack:InteractiveDisplayObject = null;
      
      private var _iconGuildBattleDefense:InteractiveDisplayObject = null;
      
      public function PanelGuild(param1:SymbolPanelGuildGeneric)
      {
         super(param1);
         _emblem = new UiGuildEmblem(param1.emblem,null,80,80,onClickEmblem,false,3);
         _btnHelp = new UiButton(param1.btnHelp,LocText.current.text("general/button_help"),onClickHelp);
         _btnTabInfo = new UiTabButton(param1.btnTabInfo,LocText.current.text("screen/guild/button_tab_info"),"",onClickTabInfo);
         _btnTabMembers = new UiTabButton(param1.btnTabMembers,LocText.current.text("screen/guild/button_tab_members"),"",onClickTabMembers);
         _btnTabChat = new UiTabButton(param1.btnTabChat,LocText.current.text("screen/guild/button_tab_chat"),LocText.current.text("screen/guild/button_tab_chat_tooltip"),onClickTabChat);
         _btnTabNote = new UiTabButton(param1.btnTabNote,LocText.current.text("screen/guild/button_tab_note"),LocText.current.text("screen/guild/button_tab_note_tooltip"),onClickTabNote);
         _btnTabDescription = new UiTabButton(param1.btnTabDescription,LocText.current.text("screen/guild/button_tab_description"),LocText.current.text("screen/guild/button_tab_description_tooltip"),onClickTabDescription);
         _btnVisitGuildPage = new UiButton(param1.btnVisitGuildPage,LocText.current.text("screen/guild/guild_info/button_link_tooltip"),onClickVisitGuildPage);
         _btnGuildCompetition = new UiGuildCompetitionButton(param1.btnGuildCompetition,"",onClickGuildCompetition);
         var _loc2_:Sprite = createCenteredTextButton(param1.txtName);
         _btnGuildName = new UiButton(_loc2_,"",onClickRename);
         _vo.addChild(_btnGuildName);
         _btnBattleHistory = new UiButton(param1.btnBattleHistory,LocText.current.text("dialog/guild_fight_history/title"),onClickBattleHistory);
         _btnGuildBooster = new UiButton(param1.btnGuildBooster,LocText.current.text("dialog/guild_booster/own_guild_no_booster"),onClickGuildBooster);
         _btnTabInfo.tabbed = true;
         _btnTabMembers.tabbed = false;
         _btnTabChat.tabbed = false;
         _btnTabNote.tabbed = true;
         _btnTabDescription.tabbed = false;
         _guildInfoTab = new UiGuildInfoTab(param1.guildInfoTab,onShowCustomization);
         _guildMemberInfoTab = new UiGuildMemberInfoTab(param1.memberInfoTab);
         _guildCustomizationTab = new UiGuildCustomizeStudioTab(param1.guildCustomization,param1.background,onHideCustomization);
         _guildLeaderVoteInfo = new UiGuildLeaderVoteInfo(param1.leaderVoteInfo);
         _guildDescriptionTab = new UiGuildDescriptionTab(param1.descriptionTab,onBottomCollapseChanged);
         _guildNoteTab = new UiGuildNoteTab(param1.noteTab,onBottomCollapseChanged);
         _guildChatTab = new UiGuildChatTab(param1.chatTab,onBottomCollapseChanged);
         _dialogNoGuild = new UiDialogNoGuild(param1.dialogNoGuild);
         _emblem.content.bringToTop();
         param1.chatTab.bringToTop();
         _iconGuildBattleAttack = new InteractiveDisplayObject(param1.battleInfo.iconGuildBattleAttack);
         _iconGuildBattleAttack.onClick.add(handleAttackIconClick);
         param1.battleInfo.txtGuildBattleAttack.onClick.add(handleAttackIconClick);
         _iconGuildBattleDefense = new InteractiveDisplayObject(param1.battleInfo.iconGuildBattleDefense);
         _iconGuildBattleDefense.onClick.add(handleDefenseIconClick);
         param1.battleInfo.txtGuildBattleDefense.onClick.add(handleDefenseIconClick);
         _tooltipAttack = new UiTextTooltip(_iconGuildBattleAttack,"");
         _tooltipAttackTime = new UiTextTooltip(param1.battleInfo.txtGuildBattleAttack,"");
         _tooltipDefense = new UiTextTooltip(_iconGuildBattleDefense,"");
         _tooltipDefenseTime = new UiTextTooltip(param1.battleInfo.txtGuildBattleDefense,"");
         param1.battleInfo.txtGuildBattleAttack.autoFontSize = true;
         param1.battleInfo.txtGuildBattleDefense.autoFontSize = true;
         MessageRouter.addListener("ViewMessage.notifyBattleFinished",handleMessages);
         MessageRouter.addListener("ViewMessage.notifyGuildUpgraded",handleMessages);
         _anchorContainer.add(param1.dialogNoGuild,AnchorPoint.RIGHT_FIXED,0.5);
         _anchorContainer.add(_emblem,AnchorPoint.RIGHT_FIXED,0.5);
         _anchorContainer.add(_btnGuildName,AnchorPoint.RIGHT_FIXED,0.5);
         _anchorContainer.add(param1.battleInfo,AnchorPoint.RIGHT_FIXED,0.5);
         _anchorContainer.add(param1.btnGuildCompetition,AnchorPoint.RIGHT_FIXED);
         _anchorContainer.add(param1.btnBattleHistory,AnchorPoint.RIGHT_FIXED);
         _anchorContainer.add(param1.btnGuildBooster,AnchorPoint.RIGHT_FIXED);
         _anchorContainer.add(param1.leaderVoteInfo,AnchorPoint.RIGHT_FIXED);
         _anchorContainer.add(param1.dialogNoGuild,AnchorPoint.BOTTOM_FIXED,0.5);
         _anchorContainer.add(param1.btnTabInfo,AnchorPoint.BOTTOM_FIXED,0.5);
         _anchorContainer.add(param1.btnTabMembers,AnchorPoint.BOTTOM_FIXED,0.5);
         _anchorContainer.add(param1.memberInfoTab,AnchorPoint.BOTTOM_FIXED,0.5);
         _anchorContainer.add(param1.guildInfoTab,AnchorPoint.BOTTOM_FIXED,0.5);
      }
      
      override public function refreshAppSize() : void
      {
         super.refreshAppSize();
         var _loc1_:SymbolPanelGuildGeneric = _vo as SymbolPanelGuildGeneric;
         UiBackgroundFader.scaleWidthCenter(_loc1_.background,0,-1,Align.RIGHT);
      }
      
      override public function refreshPanelLocalization() : void
      {
         _btnHelp.tooltip = LocText.current.text("general/button_help");
         _btnTabInfo.caption = LocText.current.text("screen/guild/button_tab_info");
         _btnTabMembers.caption = LocText.current.text("screen/guild/button_tab_members");
         _btnTabChat.caption = LocText.current.text("screen/guild/button_tab_chat");
         _btnTabChat.tooltip = LocText.current.text("screen/guild/button_tab_chat_tooltip");
         _btnTabNote.caption = LocText.current.text("screen/guild/button_tab_note");
         _btnTabNote.tooltip = LocText.current.text("screen/guild/button_tab_note_tooltip");
         _btnTabDescription.caption = LocText.current.text("screen/guild/button_tab_description");
         _btnTabDescription.tooltip = LocText.current.text("screen/guild/button_tab_description_tooltip");
         _btnGuildBooster.tooltip = LocText.current.text("dialog/guild_booster/own_guild_no_booster");
         _guildMemberInfoTab.refreshLocalization();
         _guildChatTab.refreshLocalization();
      }
      
      override public function dispose() : void
      {
         super.dispose();
         MessageRouter.removeAllListeners(handleMessages);
         _iconGuildBattleAttack.dispose();
         _iconGuildBattleDefense.dispose();
         _emblem.dispose();
         _emblem = null;
         _guildInfoTab.dispose();
         _guildInfoTab = null;
         _guildMemberInfoTab.dispose();
         _guildMemberInfoTab = null;
         _guildCustomizationTab.dispose();
         _guildCustomizationTab = null;
         _guildLeaderVoteInfo.dispose();
         _guildLeaderVoteInfo = null;
         _guildDescriptionTab.dispose();
         _guildDescriptionTab = null;
         _guildNoteTab.dispose();
         _guildNoteTab = null;
         _guildChatTab.dispose();
         _guildChatTab = null;
         _btnHelp.dispose();
         _btnHelp = null;
         _btnTabInfo.dispose();
         _btnTabInfo = null;
         _btnTabMembers.dispose();
         _btnTabMembers = null;
         _btnTabChat.dispose();
         _btnTabChat = null;
         _btnTabNote.dispose();
         _btnTabNote = null;
         _btnTabDescription.dispose();
         _btnTabDescription = null;
         _btnGuildName.dispose();
         _btnGuildName = null;
         _btnVisitGuildPage.dispose();
         _btnVisitGuildPage = null;
         _btnBattleHistory.dispose();
         _btnBattleHistory = null;
         _dialogNoGuild.dispose();
         _dialogNoGuild = null;
         _tooltipAttack.dispose();
         _tooltipAttack = null;
         _tooltipAttackTime.dispose();
         _tooltipAttackTime = null;
         _tooltipDefense.dispose();
         _tooltipDefense = null;
         _tooltipDefenseTime.dispose();
         _tooltipDefenseTime = null;
         _btnGuildCompetition.dispose();
         _btnGuildCompetition = null;
         _btnGuildBooster.dispose();
         _btnGuildBooster = null;
      }
      
      private function onBottomCollapseChanged(param1:Boolean) : void
      {
         if(param1)
         {
            _btnTabChat.content.y = 394;
            if(_guildLeaderVoteInfo.isActive)
            {
               _guildLeaderVoteInfo.show();
            }
         }
         else
         {
            _btnTabChat.content.y = 205;
            if(_guildLeaderVoteInfo.isActive)
            {
               _guildLeaderVoteInfo.hide(false);
            }
         }
         _btnTabNote.content.y = _btnTabChat.content.y;
         _btnTabDescription.content.y = _btnTabChat.content.y;
         _btnVisitGuildPage.content.y = _btnTabChat.content.y;
         _guildDescriptionTab.collapse(param1);
         _guildNoteTab.collapse(param1);
         _guildChatTab.collapse(param1);
         if(currentGuild && currentGuild.isOwnGuild)
         {
            _ownGuildBottomFrameCollapsed = param1;
         }
      }
      
      override public function show(param1:* = null) : void
      {
         if(ViewManager.instance.baseUserPanel.isGuildButtonHighlighted)
         {
            _btnTabChat.tabbed = true;
            _btnTabNote.tabbed = false;
            _btnTabDescription.tabbed = false;
         }
         ViewManager.instance.baseUserPanel.resetGuildButton();
         ViewManager.instance.setBackground(5);
         ViewManager.instance.fadeInPanel(_vo);
         var _loc2_:SymbolPanelGuildGeneric = _vo as SymbolPanelGuildGeneric;
         _loc2_.guildCustomization.visible = false;
         super.show(param1);
         _loc2_.dialogNoGuild.visible = !User.current.character.hasGuild;
         _loc2_.background.visible = !_loc2_.dialogNoGuild.visible;
         if(currentGuild && currentGuild.isOwnGuild)
         {
            onBottomCollapseChanged(_ownGuildBottomFrameCollapsed);
         }
      }
      
      private function loadBackgrounds() : void
      {
         if(!currentGuild || _guildCustomizationTab.visible)
         {
            return;
         }
         var _loc2_:SymbolPanelGuildGeneric = _vo as SymbolPanelGuildGeneric;
         _loc2_.background.removeAllChildren();
         var _loc3_:Vector.<String> = currentGuild.backgroundLayerMovieUrls;
         if(_loc3_ && _loc3_.length > 0)
         {
            var _loc5_:int = 0;
            var _loc4_:* = _loc3_;
            for each(var _loc1_ in _loc3_)
            {
               _loc2_.background.addChild(UriSprite.load(_loc1_,1120,630,true));
            }
         }
      }
      
      public function set customGuild(param1:Guild) : void
      {
         _customGuild = param1;
         if(_customGuild != null)
         {
            _btnTabInfo.tabbed = true;
            _btnTabMembers.tabbed = false;
            if(ViewManager.instance.activePanel == "guild")
            {
               onBottomCollapseChanged(true);
               loadBackgrounds();
               refresh();
            }
         }
      }
      
      public function get customGuild() : Guild
      {
         return _customGuild;
      }
      
      override public function reset() : void
      {
         _customGuild = null;
         _btnTabInfo.tabbed = true;
         _btnTabMembers.tabbed = false;
         _btnTabChat.tabbed = false;
         _btnTabNote.tabbed = true;
         _btnTabDescription.tabbed = false;
         _guildChatTab.reset();
         GuildBattle.resetJoinedAttackMembers();
         GuildBattle.resetJoinedDefenseMembers();
         DialogGuildBattleSearch.reset();
         DialogGuildBattlePending.reset();
      }
      
      private function onClickHelp(param1:InteractionEvent) : void
      {
         showTutorialDialog();
      }
      
      private function onClickRename(param1:InteractionEvent) : void
      {
         Environment.panelManager.showDialog(new DialogGuildRename());
      }
      
      private function onClickBattleHistory(param1:InteractionEvent) : void
      {
         Environment.panelManager.showDialog(new DialogGuildBattleHistory());
      }
      
      private function onClickGuildBooster(param1:InteractionEvent) : void
      {
         Environment.panelManager.showDialog(new DialogGuildBoosters(currentGuild));
      }
      
      private function onClickTabInfo(param1:InteractionEvent) : void
      {
         if(_btnTabInfo.tabbed)
         {
            return;
         }
         _btnTabInfo.tabbed = true;
         _btnTabMembers.tabbed = false;
         refresh();
      }
      
      private function onClickTabMembers(param1:InteractionEvent) : void
      {
         if(_btnTabMembers.tabbed)
         {
            return;
         }
         _btnTabInfo.tabbed = false;
         _btnTabMembers.tabbed = true;
         _guildMemberInfoTab.resetOffset();
         refresh();
      }
      
      private function onShowCustomization() : void
      {
         _guildCustomizationTab.show();
         refresh();
      }
      
      private function onHideCustomization() : void
      {
         refresh();
      }
      
      private function onClickTabChat(param1:InteractionEvent) : void
      {
         if(_btnTabChat.tabbed)
         {
            return;
         }
         _btnTabChat.tabbed = true;
         _btnTabNote.tabbed = false;
         _btnTabDescription.tabbed = false;
         refreshBottomTabs(true);
      }
      
      private function onClickTabNote(param1:InteractionEvent) : void
      {
         _btnTabChat.tabbed = false;
         _btnTabNote.tabbed = true;
         _btnTabDescription.tabbed = false;
         refreshBottomTabs();
      }
      
      private function onClickTabDescription(param1:InteractionEvent) : void
      {
         _btnTabChat.tabbed = false;
         _btnTabNote.tabbed = false;
         _btnTabDescription.tabbed = true;
         refreshBottomTabs();
      }
      
      private function onClickEmblem() : void
      {
         Environment.panelManager.showDialog(new DialogGuildEmblem(currentGuild));
      }
      
      private function onClickVisitGuildPage(param1:InteractionEvent) : void
      {
         platform.openLink(currentGuild.forumPage);
      }
      
      private function onClickGuildCompetition(param1:InteractionEvent) : void
      {
         _btnGuildCompetition.disableHighlight();
         Environment.panelManager.showDialog(new DialogGuildCompetitionProgress());
      }
      
      private function get currentGuild() : Guild
      {
         if(_customGuild != null)
         {
            return _customGuild;
         }
         if(!User.current)
         {
            return null;
         }
         return User.current.character.guild;
      }
      
      override public function refresh() : void
      {
         var _loc6_:Boolean = false;
         var _loc2_:* = null;
         var _loc7_:* = null;
         var _loc3_:Number = NaN;
         var _loc5_:Number = NaN;
         super.refresh();
         _dialogNoGuild.refresh();
         var _loc4_:SymbolPanelGuildGeneric = _vo as SymbolPanelGuildGeneric;
         _loc4_.dialogNoGuild.visible = !User.current.character.hasGuild && _customGuild == null;
         _loc4_.background.visible = !_loc4_.dialogNoGuild.visible;
         if(_loc4_.background.visible)
         {
            loadBackgrounds();
         }
         var _loc1_:Guild = currentGuild;
         if(_loc1_ == null)
         {
            _loc4_.txtName.visible = false;
            _loc4_.emblem.visible = false;
            _btnTabInfo.visible = false;
            _btnTabMembers.visible = false;
            _btnTabChat.visible = false;
            _btnTabNote.visible = false;
            _btnTabDescription.visible = false;
            _btnBattleHistory.visible = false;
            _btnVisitGuildPage.visible = false;
            _btnGuildBooster.visible = false;
            _loc4_.guildInfoTab.visible = false;
            _loc4_.memberInfoTab.visible = false;
            _loc4_.guildCustomization.visible = false;
            _loc4_.descriptionTab.visible = false;
            _loc4_.noteTab.visible = false;
            _loc4_.chatTab.visible = false;
            _loc4_.battleInfo.guildBattleInfo.visible = false;
            _loc4_.battleInfo.iconGuildBattleAttack.visible = false;
            _loc4_.battleInfo.iconGuildBattleDefense.visible = false;
            _loc4_.battleInfo.txtGuildBattleAttack.visible = false;
            _loc4_.battleInfo.txtGuildBattleDefense.visible = false;
            _loc4_.btnGuildCompetition.visible = false;
         }
         else
         {
            _loc4_.txtName.visible = true;
            _loc4_.emblem.visible = true;
            _btnTabInfo.visible = true;
            _btnTabMembers.visible = true;
            _btnTabChat.visible = _loc1_.isOwnGuild;
            _btnTabNote.visible = _loc1_.isOwnGuild;
            _btnTabDescription.visible = _loc1_.isOwnGuild;
            _loc6_ = currentGuild.isOwnGuild;
            _emblem.enableButton = _loc6_;
            if(_loc6_ && User.current.character.guildRank == 1)
            {
               _emblem.tooltip = LocText.current.text("screen/guild/button_emblem_tooltip");
            }
            else if(_loc6_)
            {
               _emblem.tooltip = LocText.current.text("screen/guild/button_emblem_view_tooltip");
            }
            else
            {
               _emblem.tooltip = LocText.current.text("screen/guild/button_emblem_default_tooltip",currentGuild.name);
            }
            _loc4_.txtName.text = _loc1_.name;
            _btnGuildName.buttonEnabled = currentGuild.isOwnGuild;
            _btnGuildName.alpha = 1;
            _btnBattleHistory.visible = currentGuild.isOwnGuild;
            _btnGuildBooster.visible = true;
            updateGuildBoosterTooltip();
            _emblem.content.x = _loc4_.txtName.parent.x - _loc4_.txtName.textWidth / 2 - 100;
            _emblem.refresh(_loc1_.emblemSettings);
            if(_loc1_.isOwnGuild && _guildCustomizationTab.visible)
            {
               _loc4_.guildInfoTab.visible = false;
               _loc4_.memberInfoTab.visible = false;
               _loc4_.chatTab.visible = false;
               _loc4_.noteTab.visible = false;
               _loc4_.descriptionTab.visible = false;
               _btnTabInfo.visible = false;
               _btnTabMembers.visible = false;
               _btnTabChat.visible = false;
               _btnTabNote.visible = false;
               _btnTabDescription.visible = false;
               _btnBattleHistory.visible = false;
               _btnVisitGuildPage.visible = false;
               _loc4_.battleInfo.guildBattleInfo.visible = false;
               _loc4_.battleInfo.iconGuildBattleAttack.visible = false;
               _loc4_.battleInfo.iconGuildBattleDefense.visible = false;
               _loc4_.battleInfo.txtGuildBattleAttack.visible = false;
               _loc4_.battleInfo.txtGuildBattleDefense.visible = false;
               _loc4_.btnGuildCompetition.visible = false;
               _guildCustomizationTab.refresh();
            }
            else
            {
               _loc4_.guildCustomization.visible = false;
               _loc4_.guildInfoTab.visible = _btnTabInfo.tabbed;
               _loc4_.memberInfoTab.visible = _btnTabMembers.tabbed;
               if(_btnTabInfo.tabbed)
               {
                  _guildInfoTab.refresh(_loc1_);
               }
               else
               {
                  _guildMemberInfoTab.refresh(_loc1_);
               }
               refreshBottomTabs();
               _guildLeaderVoteInfo.refresh(_loc1_);
               if(!_ownGuildBottomFrameCollapsed && _guildLeaderVoteInfo.isActive)
               {
                  _guildLeaderVoteInfo.hide(false);
               }
               _btnGuildCompetition.refresh(_loc1_);
               _loc4_.battleInfo.guildBattleInfo.visible = _loc1_.isOwnGuild && (_loc1_.isAttacking || _loc1_.isDefending);
               _loc4_.battleInfo.iconGuildBattleAttack.visible = _loc1_.isOwnGuild && _loc1_.isAttacking;
               _loc4_.battleInfo.iconGuildBattleDefense.visible = _loc1_.isOwnGuild && _loc1_.isDefending;
               _loc4_.battleInfo.txtGuildBattleAttack.visible = _loc1_.isOwnGuild && _loc1_.isAttacking;
               _loc4_.battleInfo.txtGuildBattleDefense.visible = _loc1_.isOwnGuild && _loc1_.isDefending;
               _loc2_ = [];
               if(_loc1_.isOwnGuild && _loc1_.isAttacking)
               {
                  _loc4_.battleInfo.txtGuildBattleAttack.htmlText = "<a href=\'event:null\'>" + _loc1_.pendingAttackGuildBattle.battleTimeString + "</a>";
                  _tooltipAttack.text = LocText.current.text("screen/guild/guild_battle_attack",_loc1_.pendingAttackGuildBattle.defender.name,AppDateTime.getDateTimeString(TimeUtil.localDateTime,_loc1_.pendingAttackGuildBattle.tsAttack,2)) + "\n\n" + getGuildBattleHonor(_loc1_,_loc1_.pendingAttackGuildBattle.defender);
                  _tooltipAttackTime.text = _tooltipAttack.text;
                  _loc4_.battleInfo.iconGuildBattleAttack.infoJoinedMembers.text = _loc1_.pendingAttackGuildBattle.ownGuildJoinedMemberCount + "/" + _loc1_.memberCount;
                  _loc2_.push({
                     "id":_loc1_.pendingAttackGuildBattle.id,
                     "t":_loc1_.pendingAttackGuildBattle.tsAttack,
                     "elements":[_loc4_.battleInfo.iconGuildBattleAttack,_loc4_.battleInfo.txtGuildBattleAttack]
                  });
               }
               if(_loc1_.isOwnGuild && _loc1_.isDefending)
               {
                  _loc4_.battleInfo.txtGuildBattleDefense.htmlText = "<a href=\'event:null\'>" + _loc1_.pendingDefenseGuildBattle.battleTimeString + "</a>";
                  _tooltipDefense.text = LocText.current.text("screen/guild/guild_battle_defense",_loc1_.pendingDefenseGuildBattle.attacker.name,AppDateTime.getDateTimeString(TimeUtil.localDateTime,_loc1_.pendingDefenseGuildBattle.tsAttack,2)) + "\n\n" + getGuildBattleHonor(_loc1_,_loc1_.pendingDefenseGuildBattle.attacker);
                  _tooltipDefenseTime.text = _tooltipDefense.text;
                  _loc4_.battleInfo.iconGuildBattleDefense.infoJoinedMembers.text = _loc1_.pendingDefenseGuildBattle.ownGuildJoinedMemberCount + "/" + _loc1_.memberCount;
                  _loc2_.push({
                     "id":_loc1_.pendingDefenseGuildBattle.id,
                     "t":_loc1_.pendingDefenseGuildBattle.tsAttack,
                     "elements":[_loc4_.battleInfo.iconGuildBattleDefense,_loc4_.battleInfo.txtGuildBattleDefense]
                  });
               }
               if(_loc2_.length > 0)
               {
                  _loc2_.sortOn(["t","id"],16);
                  _loc7_ = [];
                  var _loc11_:int = 0;
                  var _loc10_:* = _loc2_;
                  for each(var _loc8_ in _loc2_)
                  {
                     _loc7_ = _loc7_.concat(_loc8_.elements);
                  }
                  _loc4_.battleInfo.guildBattleInfo.x = 473;
                  _loc3_ = _loc4_.battleInfo.guildBattleInfo.x + 15;
                  var _loc13_:int = 0;
                  var _loc12_:* = _loc7_;
                  for each(var _loc9_ in _loc7_)
                  {
                     _loc9_.x = _loc3_;
                     _loc3_ = _loc3_ + Math.round(_loc9_.width + (_loc9_ is ILabel?14:-10));
                  }
                  _loc4_.battleInfo.guildBattleInfo.width = _loc3_ - _loc4_.battleInfo.guildBattleInfo.x + 5;
                  _loc5_ = _loc4_.battleInfo.guildBattleInfo.width >> 1;
                  _loc4_.battleInfo.guildBattleInfo.x = _loc4_.battleInfo.guildBattleInfo.x - _loc5_;
                  var _loc15_:int = 0;
                  var _loc14_:* = _loc7_;
                  for each(_loc9_ in _loc7_)
                  {
                     _loc9_.x = _loc9_.x - _loc5_;
                  }
               }
               _btnVisitGuildPage.visible = !_loc1_.isOwnGuild && _loc1_.hasGuildPageLink && _loc1_.status != 2;
            }
            if(_loc1_.isOwnGuild)
            {
               UiGuildChatTab.instance.checkForGuildBattles();
               checkForGuildCompetitionTournamentRewards();
            }
         }
      }
      
      private function checkForGuildCompetitionTournamentRewards() : void
      {
         if(DialogGuildBattleView.isShowing)
         {
            return;
         }
         if(DialogGuildBattlePending.isShowing)
         {
            return;
         }
         if(DialogGuildCompetitionReward.isShowing)
         {
            return;
         }
         if(User.current.character.pendingGuildCompetitionTournamentRewards)
         {
            Environment.application.sendActionRequest("getGuildCompetitionTournamentReward",{},handleRequests);
         }
      }
      
      private function updateGuildBoosterTooltip() : void
      {
         var _loc2_:* = null;
         var _loc1_:Guild = currentGuild;
         if(_loc1_.isOwnGuild)
         {
            _btnGuildBooster.buttonEnabled = true;
            if(_loc1_.getMemberById(User.current.character.id).guildRank == 3)
            {
               if(!_loc1_.questBoosterActive && !_loc1_.duelBoosterActive)
               {
                  _loc2_ = LocText.current.text("dialog/guild_booster/own_guild_no_booster_member");
               }
               else
               {
                  _loc2_ = LocText.current.text("dialog/guild_booster/own_guild_booster_active_member");
                  if(_loc1_.questBoosterActive)
                  {
                     _loc2_ = _loc2_ + ("\n" + LocText.current.text("dialog/guild_booster/own_guild_booster_quest",_loc1_.activeQuestBoosterAmount,UiGuildBoosterIcon.getExpirationDateTime(_loc1_.tsActiveQuestBoostExpires)));
                  }
                  if(_loc1_.duelBoosterActive)
                  {
                     _loc2_ = _loc2_ + ("\n" + LocText.current.text("dialog/guild_booster/own_guild_booster_duel",_loc1_.activeDuelBoosterAmount,UiGuildBoosterIcon.getExpirationDateTime(_loc1_.tsActiveDuelBoostExpires)));
                  }
               }
            }
            else if(!_loc1_.questBoosterActive && !_loc1_.duelBoosterActive)
            {
               _loc2_ = LocText.current.text("dialog/guild_booster/own_guild_no_booster");
            }
            else
            {
               _loc2_ = LocText.current.text("dialog/guild_booster/own_guild_booster_active");
               if(_loc1_.questBoosterActive)
               {
                  _loc2_ = _loc2_ + ("\n" + LocText.current.text("dialog/guild_booster/own_guild_booster_quest",_loc1_.activeQuestBoosterAmount,UiGuildBoosterIcon.getExpirationDateTime(_loc1_.tsActiveQuestBoostExpires)));
               }
               if(_loc1_.duelBoosterActive)
               {
                  _loc2_ = _loc2_ + ("\n" + LocText.current.text("dialog/guild_booster/own_guild_booster_duel",_loc1_.activeDuelBoosterAmount,UiGuildBoosterIcon.getExpirationDateTime(_loc1_.tsActiveDuelBoostExpires)));
               }
            }
         }
         else
         {
            if(!_loc1_.questBoosterActive && !_loc1_.duelBoosterActive)
            {
               _loc2_ = LocText.current.text("dialog/guild_booster/other_guild_no_booster",_loc1_.name);
            }
            else
            {
               _loc2_ = LocText.current.text("dialog/guild_booster/other_guild_booster_active",_loc1_.name);
               if(_loc1_.questBoosterActive)
               {
                  _loc2_ = _loc2_ + ("\n" + LocText.current.text("dialog/guild_booster/other_guild_booster_quest",_loc1_.activeQuestBoosterAmount));
               }
               if(_loc1_.duelBoosterActive)
               {
                  _loc2_ = _loc2_ + ("\n" + LocText.current.text("dialog/guild_booster/other_guild_booster_duel",_loc1_.activeDuelBoosterAmount));
               }
            }
            _btnGuildBooster.buttonEnabled = false;
         }
         _btnGuildBooster.tooltip = _loc2_;
      }
      
      public function getGuildBattleHonor(param1:Guild, param2:Guild) : String
      {
         var _loc4_:int = GameUtil.guildBattleHonorWinReward(param1.honor,param2.honor);
         var _loc5_:int = GameUtil.guildBattleHonorLostReward(param2.honor,param1.honor);
         var _loc3_:String = "";
         if(_loc4_ == 0)
         {
            _loc3_ = LocText.current.text("dialog/guild_battle_search/tooltip_win_no_honor");
         }
         else
         {
            _loc3_ = LocText.current.text("dialog/guild_battle_search/tooltip_win_honor",GameUtil.getHonorString(_loc4_));
         }
         _loc3_ = _loc3_ + "\n\n";
         if(_loc5_ == 0)
         {
            _loc3_ = _loc3_ + LocText.current.text("dialog/guild_battle_search/tooltip_lose_no_honor");
         }
         else
         {
            _loc3_ = _loc3_ + LocText.current.text("dialog/guild_battle_search/tooltip_lose_honor",GameUtil.getHonorString(_loc5_));
         }
         return _loc3_;
      }
      
      private function handleAttackIconClick(param1:InteractionEvent) : void
      {
         Environment.audio.playFX("ui_button_click.mp3");
         var _loc2_:Guild = currentGuild;
         if(_loc2_.isAttacking)
         {
            Environment.application.sendActionRequest("getGuild",{"guild_id":_loc2_.pendingAttackGuildBattle.guildDefenderId},handleRequests);
         }
      }
      
      private function handleDefenseIconClick(param1:InteractionEvent) : void
      {
         Environment.audio.playFX("ui_button_click.mp3");
         var _loc2_:Guild = currentGuild;
         if(_loc2_.isDefending)
         {
            Environment.application.sendActionRequest("getGuild",{"guild_id":_loc2_.pendingDefenseGuildBattle.guildAttackerId},handleRequests);
         }
      }
      
      private function refreshBottomTabs(param1:Boolean = false) : void
      {
         var _loc3_:SymbolPanelGuildGeneric = _vo as SymbolPanelGuildGeneric;
         var _loc2_:Guild = currentGuild;
         _loc3_.chatTab.visible = _btnTabChat.tabbed && _loc2_.isOwnGuild;
         _loc3_.noteTab.visible = _btnTabNote.tabbed && _loc2_.isOwnGuild;
         _loc3_.descriptionTab.visible = _btnTabDescription.tabbed || !_loc2_.isOwnGuild;
         if(_loc3_.descriptionTab.visible)
         {
            _guildDescriptionTab.refresh(_loc2_);
         }
         else if(_loc3_.noteTab.visible)
         {
            _guildNoteTab.refresh(_loc2_);
         }
         else
         {
            _guildChatTab.refresh(_loc2_);
            if(param1)
            {
               _guildChatTab.setFocus();
            }
         }
      }
      
      private function showTutorialDialog() : void
      {
         Environment.panelManager.showDialog(new DialogTutorialPopup(LocText.current.text("dialog/tutorial/guild/title"),LocText.current.text("dialog/tutorial/guild/text"),onTutorialDialogClosed));
      }
      
      private function onTutorialDialogClosed() : void
      {
         User.current.character.setTutorialFlag("guild");
      }
      
      private function handleMessages(param1:Message) : void
      {
         var _loc2_:* = param1.type;
         switch(_loc2_)
         {
            case "ViewMessage.notifyBattleFinished":
               if(PanelBattle.lastViewedMode != 5)
               {
                  return;
               }
               if(PanelBattle.guildBattle != null)
               {
                  Environment.panelManager.showDialog(new DialogGuildBattleResult(PanelBattle.guildBattle));
               }
               break;
            case "ViewMessage.notifyGuildUpgraded":
               if(_shown && !_guildCustomizationTab.visible)
               {
                  _guildCustomizationTab.show();
                  refresh();
               }
               break;
            default:
               throw new Error("Encountered unknown message type! type=" + param1.type);
         }
      }
      
      private function handleRequests(param1:ActionRequestResponse) : void
      {
         var _loc2_:* = null;
         var _loc3_:* = param1.action;
         switch(_loc3_)
         {
            case "getGuild":
               if(param1.error == "")
               {
                  Environment.application.updateData(param1.data);
                  _loc2_ = Guild.fromData(param1.data);
                  ViewManager.instance.showGuild(_loc2_);
               }
               else
               {
                  Environment.reportError(param1.error,param1.request);
               }
               break;
            case "getGuildCompetitionTournamentReward":
               if(param1.error == "")
               {
                  Environment.application.updateData(param1.data);
                  if(param1.appResponse.tournament_guild_competition_reward && !DialogGuildCompetitionReward.isShowing)
                  {
                     Environment.panelManager.showDialog(new DialogGuildCompetitionReward(param1.appResponse.tournament_guild_competition_reward));
                  }
               }
               else if(param1.error != "errTournamentLocked")
               {
                  Environment.reportError(param1.error,param1.request);
               }
               break;
            default:
               throw new Error("Unsupported request action \'" + param1.action + "\'!");
         }
      }
   }
}
