package com.playata.application.ui.panels
{
   import com.playata.application.AppConfig;
   import com.playata.application.AppEnvironment;
   import com.playata.application.data.GameUtil;
   import com.playata.application.data.battle.Battle;
   import com.playata.application.data.battle.BattleEffect;
   import com.playata.application.data.battle.BattleVisualizationCharacter;
   import com.playata.application.data.battle.CharacterBattleRound;
   import com.playata.application.data.character.Character;
   import com.playata.application.data.duel.Duel;
   import com.playata.application.data.dungeon.DungeonQuest;
   import com.playata.application.data.guild.GuildArenaSettings;
   import com.playata.application.data.guild.GuildBattle;
   import com.playata.application.data.guild.GuildBattleCharacter;
   import com.playata.application.data.guild.GuildBattleRound;
   import com.playata.application.data.guild.GuildEmblemSettings;
   import com.playata.application.data.movie.MovieQuest;
   import com.playata.application.data.optical_changes.OpticalChangeBackground;
   import com.playata.application.data.optical_changes.OpticalChanges;
   import com.playata.application.data.quest.Quest;
   import com.playata.application.data.story_dungeon.StoryDungeon;
   import com.playata.application.data.user.User;
   import com.playata.application.messaging.Message;
   import com.playata.application.messaging.MessageRouter;
   import com.playata.application.ui.ViewManager;
   import com.playata.application.ui.elements.avatar.UiAvatarImage;
   import com.playata.application.ui.elements.battle.UiBattleAvatar;
   import com.playata.application.ui.elements.battle.UiBattleSkillsPanel;
   import com.playata.application.ui.elements.battle.UiHitPointBar;
   import com.playata.application.ui.elements.generic.button.UiTextButton;
   import com.playata.application.ui.elements.guild.UiGuildEmblem;
   import com.playata.application.ui.elements.stats.UiStats;
   import com.playata.framework.core.Runtime;
   import com.playata.framework.display.AnchorPoint;
   import com.playata.framework.display.IDisplayObject;
   import com.playata.framework.input.InteractionEvent;
   import com.playata.framework.localization.LocText;
   import visuals.ui.elements.battle.SymbolBattleAvatarGeneric;
   import visuals.ui.panels.SymbolPanelBattleGeneric;
   
   public class PanelBattle extends DefaultPanel
   {
      
      private static var _activeMovieQuest:MovieQuest = null;
      
      private static var _activeDuel:Duel = null;
      
      private static var _missedDuel:Duel = null;
      
      private static var _guildBattle:GuildBattle = null;
      
      private static var _activeQuest:Quest = null;
      
      private static var _activeDungeonQuest:DungeonQuest = null;
      
      private static var _activeStoryDungeonBattle:Battle = null;
      
      private static var _guildBattleReviewMode:Boolean = false;
      
      private static var _lastViewedMode:int;
       
      
      private var _btnSkip:UiTextButton = null;
      
      private var _btnSkipMember:UiTextButton = null;
      
      private var _btnMyCharacter:UiTextButton = null;
      
      private var _avatarA:UiBattleAvatar = null;
      
      private var _avatarB:UiBattleAvatar = null;
      
      private var _statsA:UiStats = null;
      
      private var _statsB:UiStats = null;
      
      private var _barA:UiHitPointBar = null;
      
      private var _barB:UiHitPointBar = null;
      
      private var _skillsA:UiBattleSkillsPanel = null;
      
      private var _skillsB:UiBattleSkillsPanel = null;
      
      private var _battle:Battle = null;
      
      private var _currentRoundIndex:int = 0;
      
      private var _battleFinished:Boolean = false;
      
      private var _emblemA:UiGuildEmblem = null;
      
      private var _emblemB:UiGuildEmblem = null;
      
      private var _currentGuildBattleOwnGuildCharacter:GuildBattleCharacter = null;
      
      private var _currentGuildBattleOtherGuildCharacter:GuildBattleCharacter = null;
      
      private var _avatarImageA:UiAvatarImage;
      
      private var _avatarImageB:UiAvatarImage;
      
      private var _textPositionBase:Number;
      
      private var _background:OpticalChangeBackground = null;
      
      public function PanelBattle(param1:SymbolPanelBattleGeneric)
      {
         addExcludedFontScalingTextfield(param1.statsA.barCriticalHitRating.txtStatValue);
         addExcludedFontScalingTextfield(param1.statsA.barDodgeRating.txtStatValue);
         addExcludedFontScalingTextfield(param1.statsA.barStamina.txtStatValue);
         addExcludedFontScalingTextfield(param1.statsA.barStrength.txtStatValue);
         addExcludedFontScalingTextfield(param1.statsB.barCriticalHitRating.txtStatValue);
         addExcludedFontScalingTextfield(param1.statsB.barDodgeRating.txtStatValue);
         addExcludedFontScalingTextfield(param1.statsB.barStamina.txtStatValue);
         addExcludedFontScalingTextfield(param1.statsB.barStrength.txtStatValue);
         addExcludedFontScalingTextfield(param1.hitpointBarA.txtInfo);
         addExcludedFontScalingTextfield(param1.hitpointBarB.txtInfo);
         super(param1);
         _btnSkip = new UiTextButton(param1.btnSkip,LocText.current.text("screen/battle_visualization/button_skip"),"",onClickSkip);
         _btnSkipMember = new UiTextButton(param1.btnSkipMember,LocText.current.text("screen/battle_visualization/button_skip_member"),"",onClickSkipMember);
         _btnMyCharacter = new UiTextButton(param1.btnMyCharacter,LocText.current.text("screen/battle_visualization/button_skip_to_character"),"",onClickSkipMyCharacter);
         _avatarA = new UiBattleAvatar(param1.battleAvatarA,onHitAnimationComplete,onDamageDone,onDotDamageDone,onBackfireDamageDone);
         _avatarB = new UiBattleAvatar(param1.battleAvatarB,onHitAnimationComplete,onDamageDone,onDotDamageDone,onBackfireDamageDone);
         _avatarA.otherBattleAvatar = _avatarB;
         _avatarB.otherBattleAvatar = _avatarA;
         _statsA = new UiStats(param1.statsA,false,false);
         _statsB = new UiStats(param1.statsB,false,false);
         _statsA.enableIncrease(false);
         _statsB.enableIncrease(false);
         _barA = new UiHitPointBar(param1.hitpointBarA);
         _barB = new UiHitPointBar(param1.hitpointBarB);
         _skillsA = new UiBattleSkillsPanel(param1.skillsA);
         _skillsB = new UiBattleSkillsPanel(param1.skillsB);
         _textPositionBase = param1.txtPlayerNameA.y;
         if(!§§pop())
         {
            var _loc2_:* = false;
            param1.skillsB.visible = _loc2_;
            param1.skillsA.visible = _loc2_;
         }
         _loc2_ = "overlay";
         param1.spotLightB.emblemGuildB.nativeInstance.blendMode = _loc2_;
         param1.spotLightA.emblemGuildA.nativeInstance.blendMode = _loc2_;
         _emblemA = new UiGuildEmblem(param1.spotLightA.emblemGuildA,null,95,95,null,false,2);
         _emblemB = new UiGuildEmblem(param1.spotLightB.emblemGuildB,null,95,95,null,false,2);
         _avatarImageA = new UiAvatarImage(param1.avatarImageA,false);
         _avatarImageB = new UiAvatarImage(param1.avatarImageB,false);
         _anchorContainer.add(param1.spotLightB,AnchorPoint.RIGHT_FIXED);
         _anchorContainer.add(param1.battleAvatarB,AnchorPoint.RIGHT_FIXED);
         _anchorContainer.add(param1.txtGuildBCurrentCharacter,AnchorPoint.RIGHT_FIXED);
         _anchorContainer.add(param1.txtGuildBCharacters,AnchorPoint.RIGHT_FIXED);
         _anchorContainer.add(param1.txtPlayerNameB,AnchorPoint.RIGHT_FIXED);
         _anchorContainer.add(param1.hitpointBarB,AnchorPoint.RIGHT_FIXED);
         _anchorContainer.add(param1.statsB,AnchorPoint.RIGHT_FIXED);
         _anchorContainer.add(param1.txtPlayerLevelB,AnchorPoint.RIGHT_FIXED);
         _anchorContainer.add(param1.iconPlayerLevelB,AnchorPoint.RIGHT_FIXED);
         _anchorContainer.add(param1.btnSkip,AnchorPoint.RIGHT_FIXED,0.5);
         _anchorContainer.add(param1.btnSkipMember,AnchorPoint.RIGHT_FIXED,0.5);
         _anchorContainer.add(param1.btnMyCharacter,AnchorPoint.RIGHT_FIXED,0.5);
         _anchorContainer.add(param1.spotLightA,AnchorPoint.BOTTOM_FIXED);
         _anchorContainer.add(param1.spotLightB,AnchorPoint.BOTTOM_FIXED);
         _anchorContainer.add(param1.battleAvatarA,AnchorPoint.BOTTOM_FIXED,0.6);
         _anchorContainer.add(param1.battleAvatarB,AnchorPoint.BOTTOM_FIXED,0.6);
         _anchorContainer.add(param1.statsA,AnchorPoint.BOTTOM_FIXED,0.8);
         _anchorContainer.add(param1.statsB,AnchorPoint.BOTTOM_FIXED,0.8);
         _anchorContainer.add(param1.iconPlayerLevelA,AnchorPoint.BOTTOM_FIXED,0.8);
         _anchorContainer.add(param1.iconPlayerLevelB,AnchorPoint.BOTTOM_FIXED,0.8);
         _anchorContainer.add(param1.txtPlayerLevelA,AnchorPoint.BOTTOM_FIXED,0.8);
         _anchorContainer.add(param1.txtPlayerLevelB,AnchorPoint.BOTTOM_FIXED,0.8);
         _anchorContainer.add(param1.btnSkip,AnchorPoint.BOTTOM_FIXED,0.6);
         _anchorContainer.add(param1.btnSkipMember,AnchorPoint.BOTTOM_FIXED,0.6);
         _anchorContainer.add(param1.btnMyCharacter,AnchorPoint.BOTTOM_FIXED,0.6);
         _background = new OpticalChangeBackground(param1.background,2);
      }
      
      private static function resetBattleData() : void
      {
         _activeMovieQuest = null;
         _activeDuel = null;
         _missedDuel = null;
         _guildBattle = null;
         _activeQuest = null;
         _activeDungeonQuest = null;
         _activeStoryDungeonBattle = null;
         _guildBattleReviewMode = false;
      }
      
      public static function set activeMovieQuest(param1:MovieQuest) : void
      {
         resetBattleData();
         _activeMovieQuest = param1;
      }
      
      public static function get activeMovieQuest() : MovieQuest
      {
         return _activeMovieQuest;
      }
      
      public static function set activeDuel(param1:Duel) : void
      {
         resetBattleData();
         _activeDuel = param1;
      }
      
      public static function get activeDuel() : Duel
      {
         return _activeDuel;
      }
      
      public static function set missedDuel(param1:Duel) : void
      {
         resetBattleData();
         _missedDuel = param1;
      }
      
      public static function get missedDuel() : Duel
      {
         return _missedDuel;
      }
      
      public static function set guildBattle(param1:GuildBattle) : void
      {
         resetBattleData();
         _guildBattle = param1;
      }
      
      public static function set guildHistoryBattle(param1:GuildBattle) : void
      {
         resetBattleData();
         _guildBattle = param1;
         _guildBattleReviewMode = true;
      }
      
      public static function get guildBattle() : GuildBattle
      {
         return _guildBattle;
      }
      
      public static function set activeQuest(param1:Quest) : void
      {
         resetBattleData();
         _activeQuest = param1;
      }
      
      public static function get activeQuest() : Quest
      {
         return _activeQuest;
      }
      
      public static function set activeDungeonQuest(param1:DungeonQuest) : void
      {
         resetBattleData();
         _activeDungeonQuest = param1;
      }
      
      public static function get activeDungeonQuest() : DungeonQuest
      {
         return _activeDungeonQuest;
      }
      
      public static function set activeStoryDungeonBattle(param1:Battle) : void
      {
         resetBattleData();
         _activeStoryDungeonBattle = param1;
      }
      
      public static function get activeStoryDungeonBattle() : Battle
      {
         return _activeStoryDungeonBattle;
      }
      
      public static function get isActiveMovieQuest() : Boolean
      {
         return _activeMovieQuest != null;
      }
      
      public static function get isActiveDuel() : Boolean
      {
         return activeDuel != null;
      }
      
      public static function get isMissedDuel() : Boolean
      {
         return missedDuel != null;
      }
      
      public static function get isGuildBattle() : Boolean
      {
         return guildBattle != null;
      }
      
      public static function get isActiveQuest() : Boolean
      {
         return activeQuest != null;
      }
      
      public static function get isActiveDungeonQuest() : Boolean
      {
         return activeDungeonQuest != null;
      }
      
      public static function get isActiveStoryDungeonBattle() : Boolean
      {
         return activeStoryDungeonBattle != null;
      }
      
      public static function get lastViewedMode() : int
      {
         return _lastViewedMode;
      }
      
      public static function set lastViewedMode(param1:int) : void
      {
         _lastViewedMode = param1;
      }
      
      override public function refreshAppSize() : void
      {
         super.refreshAppSize();
         _background.refreshAppSize();
      }
      
      override public function refreshPanelLocalization() : void
      {
         _btnSkip.tooltip = LocText.current.text("screen/battle_visualization/button_skip");
         _btnSkipMember.tooltip = LocText.current.text("screen/battle_visualization/button_skip_member");
      }
      
      override public function dispose() : void
      {
         super.dispose();
         _btnSkip.dispose();
         _btnSkip = null;
         _btnSkipMember.dispose();
         _btnSkipMember = null;
         _btnMyCharacter.dispose();
         _btnMyCharacter = null;
         _avatarA.dispose();
         _avatarA = null;
         _avatarB.dispose();
         _avatarB = null;
         _statsA.dispose();
         _statsA = null;
         _statsB.dispose();
         _statsB = null;
         _barA.dispose();
         _barA = null;
         _barB.dispose();
         _barB = null;
         _skillsA.dispose();
         _skillsA = null;
         _skillsB.dispose();
         _skillsB = null;
         _emblemA.dispose();
         _emblemA = null;
         _emblemB.dispose();
         _emblemB = null;
         _background.dispose();
         _background = null;
      }
      
      private function onClickSkip(param1:InteractionEvent) : void
      {
         battleFinished();
         Runtime.killDelayedFunction(startBattleVisualization);
      }
      
      private function onClickSkipMember(param1:InteractionEvent) : void
      {
         if(isGuildBattle)
         {
            skipMemberGuildBattle();
         }
         _btnSkipMember.visible = false;
         _btnMyCharacter.visible = false;
      }
      
      private function onClickSkipMyCharacter(param1:InteractionEvent) : void
      {
         if(isGuildBattle)
         {
            skipMyCharacterGuildBattle();
         }
         _btnSkipMember.visible = false;
         _btnMyCharacter.visible = false;
      }
      
      private function refreshSkipButtons() : void
      {
         if(!isGuildBattle)
         {
            _btnSkipMember.visible = false;
            _btnMyCharacter.visible = false;
            return;
         }
         var _loc2_:Boolean = true;
         var _loc1_:Boolean = false;
         if(isGuildBattle)
         {
            _loc2_ = isLastMembersGuildBattle();
            if(!_loc2_)
            {
               _loc1_ = isMyCharacterStillPendingGuildBattle();
            }
         }
         _btnSkipMember.visible = !_loc2_;
         _btnMyCharacter.visible = !_loc2_ && _loc1_;
         if(_btnSkipMember.visible && _btnMyCharacter.visible)
         {
            _btnSkipMember.content.x = 490;
         }
         else if(_btnSkipMember.visible && !_btnMyCharacter.visible)
         {
            _btnSkipMember.content.x = 560;
         }
      }
      
      override public function hide() : void
      {
         super.hide();
         if(_background)
         {
            _background.hide();
         }
         if(_avatarA)
         {
            _avatarA.emptyAvatar();
         }
         if(_avatarB)
         {
            _avatarB.emptyAvatar();
         }
      }
      
      override public function show(param1:* = null) : void
      {
         var _loc2_:* = null;
         var _loc8_:* = null;
         var _loc4_:* = null;
         var _loc3_:* = null;
         var _loc10_:* = null;
         var _loc11_:* = null;
         super.show(param1);
         _battleFinished = false;
         _btnSkip.visible = true;
         var _loc6_:SymbolPanelBattleGeneric = _vo as SymbolPanelBattleGeneric;
         _background.hide();
         var _loc7_:Vector.<int> = null;
         var _loc5_:GuildArenaSettings = null;
         if(isGuildBattle && guildBattle.attacker)
         {
            _loc5_ = GuildArenaSettings.fromGuild(guildBattle.attacker);
            if(_loc5_.arenaBackgroundId > 1)
            {
               ViewManager.instance.setBackground(_loc5_.panelBackgroundType);
            }
            else
            {
               ViewManager.instance.setBackground(6);
            }
         }
         else if(isActiveDuel || isMissedDuel)
         {
            _loc7_ = !!isActiveDuel?activeDuel.battle.opticalChanges:missedDuel.battle.opticalChanges;
            if(AppEnvironment.appPlatform.isHidePantiesAllowed)
            {
               _background.fallbackBackground = 1002;
            }
            else
            {
               _background.fallbackBackground = 2;
            }
            _background.setBackground(_loc7_);
         }
         else if(isActiveQuest)
         {
            _loc7_ = OpticalChanges.instance.getActiveOptionsForTarget(1);
            if(AppEnvironment.appPlatform.isHidePantiesAllowed)
            {
               _background.fallbackBackground = 1002;
            }
            else
            {
               _background.fallbackBackground = 2;
            }
            _background.setBackground(_loc7_);
         }
         else if(AppEnvironment.appPlatform.isHidePantiesAllowed)
         {
            ViewManager.instance.setBackground(1002);
         }
         else
         {
            ViewManager.instance.setBackground(2);
         }
         ViewManager.instance.fadeInPanel(_vo);
         ViewManager.instance.baseUserPanel.showUI(false);
         _emblemA.content.visible = false;
         _emblemB.content.visible = false;
         _loc6_.txtGuildACurrentCharacter.visible = false;
         _loc6_.txtGuildBCurrentCharacter.visible = false;
         _loc6_.txtGuildACharacters.visible = false;
         _loc6_.txtGuildBCharacters.visible = false;
         _loc6_.txtGuildAName.visible = false;
         _loc6_.txtGuildBName.visible = false;
         _loc6_.txtGuildBName.textColor = 39423;
         _loc6_.txtGuildBName.height = 25.85;
         _loc6_.txtGuildBCurrentCharacter.y = 162.45;
         _loc6_.txtGuildBCharacters.y = 183.45;
         _loc6_.spotLightA.visible = isGuildBattle;
         _loc6_.spotLightB.visible = isGuildBattle;
         _loc6_.battleAvatarA.visible = !isGuildBattle;
         _loc6_.battleAvatarB.visible = !isGuildBattle;
         _loc6_.txtPlayerNameA.visible = !isGuildBattle;
         _loc6_.txtPlayerNameB.visible = !isGuildBattle;
         _loc6_.txtPlayerLevelA.visible = !isGuildBattle;
         _loc6_.txtPlayerLevelB.visible = !isGuildBattle;
         _loc6_.iconPlayerLevelA.visible = !isGuildBattle;
         _loc6_.iconPlayerLevelB.visible = !isGuildBattle;
         _loc6_.statsA.visible = !isGuildBattle;
         _loc6_.statsB.visible = !isGuildBattle;
         _loc6_.hitpointBarA.visible = !isGuildBattle;
         _loc6_.hitpointBarB.visible = !isGuildBattle;
         _btnSkip.visible = !isGuildBattle;
         _btnSkipMember.visible = false;
         _btnMyCharacter.visible = false;
         _barA.redColor = false;
         _barB.redColor = false;
         var _loc9_:GuildEmblemSettings = null;
         if(isGuildBattle)
         {
            _loc9_ = guildBattle.ownGuild.emblemSettings;
            _loc9_.emblemBackgroundBorderColorIndex = 4;
            _loc9_.emblemBackgroundColorIndex = 4;
            _loc9_.emblemIconColorIndex = 0;
            _loc2_ = guildBattle.otherGuild.emblemSettings;
            _loc2_.emblemBackgroundBorderColorIndex = 4;
            _loc2_.emblemBackgroundColorIndex = 4;
            _loc2_.emblemIconColorIndex = 0;
            _emblemA.refresh(_loc9_);
            _emblemB.refresh(_loc2_);
            _loc6_.txtGuildAName.text = guildBattle.ownGuild.name;
            _loc6_.txtGuildBName.text = guildBattle.otherGuild.name;
            _loc6_.txtGuildACurrentCharacter.text = guildBattle.ownGuild.name;
            _loc6_.txtGuildBCurrentCharacter.text = guildBattle.otherGuild.name;
            _loc6_.txtGuildACharacters.text = guildBattle.ownGuild.name;
            _loc6_.txtGuildBCharacters.text = guildBattle.otherGuild.name;
            _currentGuildBattleOwnGuildCharacter = null;
            _currentGuildBattleOtherGuildCharacter = null;
            _lastViewedMode = 5;
         }
         else if(isActiveMovieQuest)
         {
            _missedDuel = null;
            _loc6_.txtPlayerNameA.text = User.current.character.nameWithTitle;
            _loc6_.txtPlayerNameB.text = activeMovieQuest.npcName;
            _loc6_.txtPlayerLevelA.text = LocText.current.text("general/level_general_tooltip",User.current.character.level);
            _loc6_.txtPlayerLevelB.visible = false;
            _loc6_.iconPlayerLevelB.visible = false;
            _battle = activeMovieQuest.battle;
            _skillsA.refresh(_battle.profileABattleEffects,true);
            _skillsB.refresh(_battle.profileBBattleEffects,false,activeMovieQuest.npcName);
            _avatarA.fillCharacter(User.current.character.getCurrentSettings(1),true,true);
            _avatarB.fillNpc(activeMovieQuest.npcImageUrl,activeMovieQuest.npcVoiceType);
            _avatarImageA.setToUser();
            _avatarImageB.showNpcImage(activeMovieQuest.npcThumbnailImageUrl);
            _lastViewedMode = 4;
         }
         else if(isMissedDuel)
         {
            _loc8_ = missedDuel.selfCharacter;
            _loc4_ = missedDuel.missedOpponent;
            _loc6_.txtPlayerNameA.text = _loc8_.name;
            _loc6_.txtPlayerNameB.text = _loc4_.name;
            _loc6_.txtPlayerLevelA.text = LocText.current.text("general/level_general_tooltip",_loc8_.level);
            _loc6_.txtPlayerLevelB.text = LocText.current.text("general/level_general_tooltip",_loc4_.level);
            _loc6_.txtPlayerLevelB.visible = true;
            _loc6_.iconPlayerLevelB.visible = true;
            _battle = missedDuel.battle;
            _skillsA.refresh(_battle.profileBBattleEffects,true);
            _skillsB.refresh(_battle.profileABattleEffects,false,_loc4_.name);
            _avatarA.fillCharacter(_loc8_.appearanceSettings,true,true);
            _avatarB.fillCharacter(_loc4_.appearanceSettings,false,false);
            _avatarImageA.setToUser();
            _avatarImageB.showWithSettings(_loc4_.avatarImage);
            _lastViewedMode = 2;
         }
         else if(isActiveDuel)
         {
            _loc3_ = User.current.character;
            _loc10_ = activeDuel.opponent;
            _loc6_.txtPlayerNameA.text = _loc3_.nameWithTitle;
            _loc6_.txtPlayerNameB.text = _loc10_.nameWithTitle;
            _loc6_.txtPlayerLevelA.text = LocText.current.text("general/level_general_tooltip",_loc3_.level);
            _loc6_.txtPlayerLevelB.text = LocText.current.text("general/level_general_tooltip",_loc10_.level);
            _loc6_.txtPlayerLevelB.visible = true;
            _loc6_.iconPlayerLevelB.visible = true;
            _battle = activeDuel.battle;
            _skillsA.refresh(_battle.profileABattleEffects,true);
            _skillsB.refresh(_battle.profileBBattleEffects,false,_loc10_.nameWithTitle);
            _avatarA.fillCharacter(_loc3_.getCurrentSettings(),true,true);
            _avatarB.fillCharacter(_loc10_.getCurrentSettings(),false,false);
            PanelDuels.resetLastDuelOpponentsRefresh();
            _avatarImageA.setToUser();
            _avatarImageB.showWithSettings(User.current.character.activeDuel.opponent.avatarImage);
            _lastViewedMode = 2;
         }
         else if(isActiveDungeonQuest)
         {
            _missedDuel = null;
            _loc6_.txtPlayerNameA.text = User.current.character.nameWithTitle;
            _loc6_.txtPlayerNameB.text = activeDungeonQuest.npcName;
            _loc6_.txtPlayerLevelA.text = LocText.current.text("general/level_general_tooltip",User.current.character.level);
            _loc6_.txtPlayerLevelB.text = LocText.current.text("general/level_general_tooltip",activeDungeonQuest.npcLevel);
            _battle = activeDungeonQuest.battle;
            _skillsA.refresh(_battle.profileABattleEffects,true);
            _skillsB.refresh(_battle.profileBBattleEffects,false,activeDungeonQuest.npcName);
            _avatarA.fillCharacter(User.current.character.getCurrentSettings(1),true,true);
            _avatarB.fillNpc(activeDungeonQuest.npcImageUrl,activeDungeonQuest.npcVoiceType);
            _avatarImageA.setToUser();
            _avatarImageB.showNpcImage(activeDungeonQuest.npcThumbnailImageUrl);
            _lastViewedMode = 3;
         }
         else if(isActiveStoryDungeonBattle)
         {
            _missedDuel = null;
            _battle = activeStoryDungeonBattle;
            _loc6_.txtPlayerNameA.text = User.current.character.nameWithTitle;
            _loc11_ = null;
            if(User.current.character.activeStoryDungeonAttackId == _battle.id)
            {
               _loc11_ = User.current.character.currentStoryDungeon;
            }
            else if(User.current.character.activeRepeatStoryDungeonAttackId == _battle.id)
            {
               _loc11_ = User.current.character.repeatStoryDungeon;
            }
            _loc6_.txtPlayerNameB.text = StoryDungeon.getBossName(_loc11_.storyDungeonIndex);
            _loc6_.txtPlayerLevelA.text = LocText.current.text("general/level_general_tooltip",User.current.character.level);
            _loc6_.txtPlayerLevelB.text = LocText.current.text("general/level_general_tooltip",StoryDungeon.getBossLevel(_loc11_.storyDungeonIndex));
            _skillsA.refresh(_battle.profileABattleEffects,true);
            _skillsB.refresh(_battle.profileBBattleEffects,false,StoryDungeon.getBossName(_loc11_.storyDungeonIndex));
            _avatarA.fillCharacter(User.current.character.getCurrentSettings(1),true,true);
            _avatarB.fillNpc(StoryDungeon.getBossImageUrl(_loc11_.storyDungeonIndex),StoryDungeon.getBossVoiceType(_loc11_.storyDungeonIndex));
            _avatarImageA.setToUser();
            _avatarImageB.showNpcImage(StoryDungeon.getBossThumbnailImageUrl(_loc11_.storyDungeonIndex));
            _lastViewedMode = 6;
         }
         else if(isActiveQuest)
         {
            _loc6_.txtPlayerNameA.text = User.current.character.nameWithTitle;
            _loc6_.txtPlayerNameB.text = activeQuest.npcName;
            _battle = activeQuest.battle;
            _skillsA.refresh(_battle.profileABattleEffects,true);
            _skillsB.refresh(_battle.profileBBattleEffects,false,User.current.character.activeQuest.npcName);
            _loc6_.txtPlayerLevelA.text = LocText.current.text("general/level_general_tooltip",User.current.character.level);
            _loc6_.txtPlayerLevelB.text = "";
            _loc6_.txtPlayerLevelB.visible = false;
            _loc6_.iconPlayerLevelB.visible = false;
            _avatarA.fillCharacter(User.current.character.getCurrentSettings(1),true,true);
            _avatarB.fillNpc(User.current.character.activeQuest.npcImageUrl,User.current.character.activeQuest.npcVoiceType);
            _avatarImageA.setToUser();
            _avatarImageB.showNpcImage(User.current.character.activeQuest.npcThumbnailImageUrl);
            _lastViewedMode = 1;
         }
         adjustTextPositions();
         updateSkillsBPosition();
         if(isMissedDuel)
         {
            _statsA.refreshFromBattleProfile(_battle.profileB,_battle.profileA,_loc6_.txtPlayerNameB.text,false);
            _statsB.refreshFromBattleProfile(_battle.profileB,_battle.profileA,_loc6_.txtPlayerNameB.text,true);
            _barA.init(_battle.profileBHitPoints);
            _barB.init(_battle.profileAHitPoints);
            _barA.value = _battle.profileBHitPoints;
            _barB.value = _battle.profileAHitPoints;
         }
         else if(!isGuildBattle)
         {
            _statsA.refreshFromBattleProfile(_battle.profileA,_battle.profileB,_loc6_.txtPlayerNameB.text,false);
            _statsB.refreshFromBattleProfile(_battle.profileA,_battle.profileB,_loc6_.txtPlayerNameB.text,true);
            _barA.init(_battle.profileAHitPoints);
            _barB.init(_battle.profileBHitPoints);
            _barA.value = _battle.profileAHitPoints;
            _barB.value = _battle.profileBHitPoints;
         }
         if(isActiveDuel && activeDuel.characterStatus == 2)
         {
            battleFinished();
         }
         else if(isActiveDungeonQuest && activeDungeonQuest.status == 3)
         {
            battleFinished();
         }
         else if(!isGuildBattle)
         {
            Runtime.delayFunction(startBattleVisualization,2);
         }
      }
      
      private function updateSkillsBPosition() : void
      {
         (_vo as SymbolPanelBattleGeneric).skillsB.x = 975 - _skillsB.offsetX;
      }
      
      private function adjustTextPositions() : void
      {
         var _loc1_:SymbolPanelBattleGeneric = _vo as SymbolPanelBattleGeneric;
         _loc1_.txtPlayerNameA.y = !!_skillsA.visible?_textPositionBase:Number(_textPositionBase - 23);
         _loc1_.txtPlayerNameB.y = !!_skillsB.visible?_textPositionBase:Number(_textPositionBase - 23);
      }
      
      public function startGuildBattleVisualization() : void
      {
         var _loc1_:* = null;
         var _loc2_:Number = NaN;
         if(isGuildBattle)
         {
            _loc1_ = guildBattle.battleRounds[0];
            updateGuildBattleCharacters(_loc1_);
         }
         var _loc3_:SymbolPanelBattleGeneric = _vo as SymbolPanelBattleGeneric;
         var _loc4_:Vector.<IDisplayObject> = new Vector.<IDisplayObject>();
         _loc4_.push(_loc3_.battleAvatarA);
         _loc4_.push(_loc3_.battleAvatarB);
         _loc4_.push(_emblemA.content);
         _loc4_.push(_emblemB.content);
         _loc4_.push(_loc3_.txtPlayerNameA);
         _loc4_.push(_loc3_.txtPlayerNameB);
         _loc4_.push(_loc3_.txtGuildAName);
         _loc4_.push(_loc3_.txtGuildBName);
         _loc4_.push(_loc3_.txtGuildACurrentCharacter);
         _loc4_.push(_loc3_.txtGuildBCurrentCharacter);
         _loc4_.push(_loc3_.txtGuildACharacters);
         _loc4_.push(_loc3_.txtGuildBCharacters);
         _loc4_.push(_loc3_.txtPlayerLevelA);
         _loc4_.push(_loc3_.txtPlayerLevelB);
         _loc4_.push(_loc3_.iconPlayerLevelA);
         _loc4_.push(_loc3_.iconPlayerLevelB);
         _loc4_.push(_loc3_.statsA);
         _loc4_.push(_loc3_.statsB);
         _loc4_.push(_loc3_.hitpointBarA);
         _loc4_.push(_loc3_.hitpointBarB);
         var _loc7_:int = 0;
         var _loc6_:* = _loc4_;
         for each(var _loc5_ in _loc4_)
         {
            _loc2_ = _loc5_.alpha;
            _loc5_.alpha = 0;
            _loc5_.visible = true;
            _loc5_.tweenTo(2,{"alpha":_loc2_});
         }
         Runtime.delayFunction(startBattleVisualization,2);
         _btnSkip.visible = false;
         _btnSkipMember.visible = false;
         _btnMyCharacter.visible = false;
      }
      
      private function startBattleVisualization() : void
      {
         if(!_btnSkip)
         {
            return;
         }
         _currentRoundIndex = 0;
         _battleFinished = false;
         _btnSkip.visible = true;
         refreshSkipButtons();
         if(!isGuildBattle)
         {
            if(_battle.battleRounds != null && _battle.battleRounds.length > 0)
            {
               _currentRoundIndex = Number(_currentRoundIndex) + 1;
               visualizeRound(_battle.battleRounds[Number(_currentRoundIndex)]);
            }
         }
         else if(isGuildBattle)
         {
            if(guildBattle.battleRounds != null && guildBattle.battleRounds.length > 0)
            {
               _currentRoundIndex = Number(_currentRoundIndex) + 1;
               visualizeGuildBattleRound(guildBattle.battleRounds[Number(_currentRoundIndex)]);
            }
         }
      }
      
      private function visualizeRound(param1:CharacterBattleRound) : void
      {
         var _loc8_:UiBattleAvatar = !!param1.attackerA?_avatarA:_avatarB;
         var _loc3_:UiBattleAvatar = !!param1.attackerA?_avatarB:_avatarA;
         var _loc4_:IDisplayObject = !!param1.attackerA?(_vo as SymbolPanelBattleGeneric).battleAvatarA:(_vo as SymbolPanelBattleGeneric).battleAvatarB;
         var _loc7_:UiHitPointBar = !!param1.attackerA?_barB:_barA;
         var _loc6_:UiBattleSkillsPanel = !!param1.attackerA?_skillsA:_skillsB;
         var _loc5_:UiBattleSkillsPanel = !!param1.attackerA?_skillsB:_skillsA;
         if(isMissedDuel)
         {
            _loc8_ = !!param1.attackerA?_avatarB:_avatarA;
            _loc3_ = !!param1.attackerA?_avatarA:_avatarB;
            _loc7_ = !!param1.attackerA?_barA:_barB;
            _loc6_ = !!param1.attackerA?_skillsB:_skillsA;
            _loc5_ = !!param1.attackerA?_skillsA:_skillsB;
            _loc4_ = !!param1.attackerA?(_vo as SymbolPanelBattleGeneric).battleAvatarB:(_vo as SymbolPanelBattleGeneric).battleAvatarA;
         }
         showRoundStartEffects(param1.attackerEffects,param1.attackedEffects,_loc8_,_loc3_,_loc6_,_loc5_);
         var _loc2_:String = !!param1.normalHit?"normal":!!param1.criticalHit?"crit":"dodge";
         _loc8_.attacking(_loc2_);
         if(param1.normalHit)
         {
            _loc3_.beingAttackedHit(param1.damage);
         }
         else if(param1.criticalHit)
         {
            _loc3_.beingAttackedCritical(param1.damage);
         }
         else if(param1.dodged)
         {
            _loc3_.beingAttackedDodge();
         }
      }
      
      private function onAttackComplete() : void
      {
         if(!isGuildBattle)
         {
            if(_currentRoundIndex < _battle.battleRounds.length)
            {
               _currentRoundIndex = Number(_currentRoundIndex) + 1;
               visualizeRound(_battle.battleRounds[Number(_currentRoundIndex)]);
            }
            else
            {
               battleFinished();
            }
         }
         else if(isGuildBattle)
         {
            if(_currentRoundIndex < guildBattle.battleRounds.length)
            {
               _currentRoundIndex = Number(_currentRoundIndex) + 1;
               visualizeGuildBattleRound(guildBattle.battleRounds[Number(_currentRoundIndex)]);
            }
            else
            {
               battleFinished();
            }
         }
      }
      
      private function showRoundStartEffects(param1:Vector.<int>, param2:Vector.<int>, param3:UiBattleAvatar, param4:UiBattleAvatar, param5:UiBattleSkillsPanel, param6:UiBattleSkillsPanel) : void
      {
         var _loc7_:int = 0;
         param5.deactivateSkillUsage(BattleEffect.getBattleSkillId(14),false);
         param5.deactivateSkillUsage(BattleEffect.getBattleSkillId(13),false);
         if(param1 != null)
         {
            var _loc9_:int = 0;
            var _loc8_:* = param1;
            for each(_loc7_ in param1)
            {
               if(BattleEffect.isRoundStartEffect(_loc7_))
               {
                  param3.queueEffect(GameUtil.getBattleSkillIconIdentifierFromBattleEffect(_loc7_));
                  param5.showSkillUsage(BattleEffect.getBattleSkillId(_loc7_),BattleEffect.isSingleEvent(_loc7_),!BattleEffect.multiUsePossible(_loc7_));
               }
            }
         }
         if(param2 != null)
         {
            var _loc11_:int = 0;
            var _loc10_:* = param2;
            for each(_loc7_ in param2)
            {
               if(BattleEffect.isRoundStartEffect(_loc7_))
               {
                  param4.queueEffect(GameUtil.getBattleSkillIconIdentifierFromBattleEffect(_loc7_));
                  param6.showSkillUsage(BattleEffect.getBattleSkillId(_loc7_),BattleEffect.isSingleEvent(_loc7_),!BattleEffect.multiUsePossible(_loc7_));
               }
            }
         }
      }
      
      private function showAfterHitEffects(param1:Vector.<int>, param2:Vector.<int>, param3:UiBattleAvatar, param4:UiBattleAvatar, param5:UiBattleSkillsPanel, param6:UiBattleSkillsPanel) : void
      {
         var _loc7_:int = 0;
         if(param1 != null)
         {
            var _loc9_:int = 0;
            var _loc8_:* = param1;
            for each(_loc7_ in param1)
            {
               if(BattleEffect.isAfterHitEffect(_loc7_))
               {
                  param3.queueEffect(GameUtil.getBattleSkillIconIdentifierFromBattleEffect(_loc7_));
                  param5.showSkillUsage(BattleEffect.getBattleSkillId(_loc7_),BattleEffect.isSingleEvent(_loc7_),!BattleEffect.multiUsePossible(_loc7_));
               }
            }
         }
         if(param2 != null)
         {
            var _loc11_:int = 0;
            var _loc10_:* = param2;
            for each(_loc7_ in param2)
            {
               if(BattleEffect.isAfterHitEffect(_loc7_))
               {
                  param4.queueEffect(GameUtil.getBattleSkillIconIdentifierFromBattleEffect(_loc7_));
                  param6.showSkillUsage(BattleEffect.getBattleSkillId(_loc7_),BattleEffect.isSingleEvent(_loc7_),!BattleEffect.multiUsePossible(_loc7_));
               }
            }
         }
      }
      
      private function onDamageDone() : void
      {
         var _loc8_:* = null;
         var _loc2_:* = null;
         var _loc6_:* = null;
         var _loc5_:* = null;
         var _loc4_:* = null;
         var _loc3_:* = null;
         var _loc1_:* = null;
         var _loc7_:* = null;
         try
         {
            if(!isGuildBattle)
            {
               _loc3_ = _battle.battleRounds[_currentRoundIndex - 1];
               _loc6_ = !!_loc3_.attackerA?_barB:_barA;
               _loc8_ = !!_loc3_.attackerA?_avatarA:_avatarB;
               if(isMissedDuel)
               {
                  _loc8_ = !!_loc3_.attackerA?_avatarB:_avatarA;
                  _loc6_ = !!_loc3_.attackerA?_barA:_barB;
               }
               _loc2_ = _loc8_ == _avatarA?_avatarB:_avatarA;
               _loc5_ = _loc8_ == _avatarA?_skillsA:_skillsB;
               _loc4_ = _loc8_ == _avatarA?_skillsB:_skillsA;
               showAfterHitEffects(_loc3_.attackerEffects,_loc3_.attackedEffects,_loc8_,_loc2_,_loc5_,_loc4_);
               _loc6_.decrease(_loc3_.damage);
            }
            else if(isGuildBattle)
            {
               _loc1_ = guildBattle.battleRounds[_currentRoundIndex - 1];
               _loc7_ = guildBattle.getCharacter(_loc1_.attacker);
               _loc6_ = !!_loc7_.isOwnGuildMember?_barB:_barA;
               _loc8_ = !!_loc7_.isOwnGuildMember?_avatarA:_avatarB;
               _loc2_ = _loc8_ == _avatarA?_avatarB:_avatarA;
               _loc5_ = _loc8_ == _avatarA?_skillsA:_skillsB;
               _loc4_ = _loc8_ == _avatarA?_skillsB:_skillsA;
               showAfterHitEffects(_loc1_.attackerEffects,_loc1_.attackedEffects,_loc8_,_loc2_,_loc5_,_loc4_);
               _loc6_.decrease(_loc1_.damage);
            }
            return;
         }
         catch(e:Error)
         {
            return;
         }
      }
      
      private function onDotDamageDone() : void
      {
         var _loc3_:int = 0;
         var _loc4_:* = null;
         var _loc5_:* = null;
         var _loc2_:* = null;
         var _loc1_:* = null;
         var _loc6_:* = null;
         try
         {
            _loc5_ = null;
            if(!isGuildBattle)
            {
               _loc2_ = _battle.battleRounds[_currentRoundIndex - 1];
               _loc5_ = !!_loc2_.attackerA?_barB:_barA;
               if(isMissedDuel)
               {
                  _loc5_ = !!_loc2_.attackerA?_barA:_barB;
               }
               _loc5_.decrease(_loc2_.dotDamage);
               _loc4_ = _loc5_ == _barA?_skillsB:_skillsA;
               _loc3_ = _currentRoundIndex;
               while(_loc3_ < _battle.battleRounds.length)
               {
                  if(_battle.battleRounds[_loc3_].attacker == _loc2_.attacker)
                  {
                     if(_battle.battleRounds[_loc3_].dotDamage == 0)
                     {
                        _loc4_.deactivateSkillUsage(BattleEffect.getBattleSkillId(10),false);
                     }
                     break;
                  }
                  _loc3_++;
               }
            }
            else if(isGuildBattle)
            {
               _loc1_ = guildBattle.battleRounds[_currentRoundIndex - 1];
               _loc6_ = guildBattle.getCharacter(_loc1_.attacker);
               _loc5_ = !!_loc6_.isOwnGuildMember?_barB:_barA;
               _loc5_.decrease(_loc1_.dotDamage);
               _loc4_ = _loc5_ == _barA?_skillsB:_skillsA;
               _loc3_ = _currentRoundIndex;
               while(_loc3_ < guildBattle.battleRounds.length)
               {
                  if(guildBattle.battleRounds[_loc3_].attacker == _loc1_.attacker)
                  {
                     if(guildBattle.battleRounds[_loc3_].dotDamage == 0)
                     {
                        _loc4_.deactivateSkillUsage(BattleEffect.getBattleSkillId(10),false);
                     }
                     break;
                  }
                  _loc3_++;
               }
            }
            return;
         }
         catch(e:Error)
         {
            return;
         }
      }
      
      private function onBackfireDamageDone() : void
      {
         var _loc2_:* = null;
         var _loc1_:* = null;
         var _loc4_:* = null;
         var _loc3_:UiHitPointBar = null;
         if(!isGuildBattle)
         {
            _loc2_ = _battle.battleRounds[_currentRoundIndex - 1];
            _loc3_ = !!_loc2_.attackerA?_barA:_barB;
            if(isMissedDuel)
            {
               _loc3_ = !!_loc2_.attackerA?_barB:_barA;
            }
            _loc3_.decrease(_loc2_.backfireDamage);
         }
         else if(isGuildBattle)
         {
            _loc1_ = guildBattle.battleRounds[_currentRoundIndex - 1];
            _loc4_ = guildBattle.getCharacter(_loc1_.attacker);
            _loc3_ = !!_loc4_.isOwnGuildMember?_barA:_barB;
            _loc3_.decrease(_loc1_.backfireDamage);
         }
      }
      
      private function onHitAnimationComplete(param1:Boolean = true, param2:Boolean = true) : void
      {
         var _loc9_:* = null;
         var _loc4_:* = null;
         var _loc7_:* = null;
         var _loc6_:* = null;
         var _loc5_:* = null;
         var _loc8_:* = null;
         var _loc3_:* = null;
         try
         {
            if(!isGuildBattle)
            {
               _loc5_ = _battle.battleRounds[_currentRoundIndex - 1];
               _loc9_ = !!_loc5_.attackerA?_avatarA:_avatarB;
               if(isMissedDuel)
               {
                  _loc9_ = !!_loc5_.attackerA?_avatarB:_avatarA;
               }
               _loc4_ = _loc9_ == _avatarA?_avatarB:_avatarA;
               if(param1 && _loc5_.backfireDamage > 0)
               {
                  _loc9_.beingBackfired(_loc5_.backfireDamage);
               }
               else if(param2 && _loc5_.dotDamage > 0)
               {
                  _loc4_.beingAttackedDoT(_loc5_.dotDamage);
               }
               else
               {
                  onAttackComplete();
               }
               if(_loc5_.dodged)
               {
                  _loc7_ = _loc9_ == _avatarA?_skillsA:_skillsB;
                  _loc6_ = _loc9_ == _avatarA?_skillsB:_skillsA;
                  showAfterHitEffects(_loc5_.attackerEffects,_loc5_.attackedEffects,_loc9_,_loc4_,_loc7_,_loc6_);
               }
            }
            else if(isGuildBattle)
            {
               _loc8_ = guildBattle.battleRounds[_currentRoundIndex - 1];
               _loc3_ = guildBattle.getCharacter(_loc8_.attacked);
               _loc9_ = !!_loc3_.isOwnGuildMember?_avatarB:_avatarA;
               _loc4_ = _loc9_ == _avatarA?_avatarB:_avatarA;
               if(param1 && _loc8_.backfireDamage > 0)
               {
                  _loc9_.beingBackfired(_loc8_.backfireDamage);
               }
               else if(param2 && _loc8_.dotDamage > 0)
               {
                  _loc4_.beingAttackedDoT(_loc8_.dotDamage);
               }
               else
               {
                  onAttackComplete();
               }
               if(_loc8_.dodged)
               {
                  _loc7_ = _loc9_ == _avatarA?_skillsA:_skillsB;
                  _loc6_ = _loc9_ == _avatarA?_skillsB:_skillsA;
                  showAfterHitEffects(_loc8_.attackerEffects,_loc8_.attackedEffects,_loc9_,_loc4_,_loc7_,_loc6_);
               }
            }
            return;
         }
         catch(e:Error)
         {
            return;
         }
      }
      
      private function battleFinished() : void
      {
         if(_battleFinished)
         {
            return;
         }
         _battleFinished = true;
         _btnSkip.visible = false;
         _btnSkipMember.visible = false;
         _btnMyCharacter.visible = false;
         if(!isGuildBattle)
         {
            _currentRoundIndex = _battle.battleRounds.length;
            if(isMissedDuel)
            {
               _barB.setValue(_battle.profileAEndHitPoints);
               _barA.setValue(_battle.profileBEndHitPoints);
               if(_battle.winner == "b")
               {
                  _avatarA.normal();
                  _avatarB.defeated();
               }
               else
               {
                  _avatarB.normal();
                  _avatarA.defeated();
               }
            }
            else
            {
               _barA.setValue(_battle.profileAEndHitPoints);
               _barB.setValue(_battle.profileBEndHitPoints);
               if(_battle.winner == "a")
               {
                  _avatarA.normal();
                  _avatarB.defeated();
               }
               else
               {
                  _avatarB.normal();
                  _avatarA.defeated();
               }
            }
         }
         else if(isGuildBattle)
         {
            _currentRoundIndex = guildBattle.battleRounds.length;
            updateGuildBattleCharacters(guildBattle.battleRounds[_currentRoundIndex - 1]);
            if(guildBattle.isOwnGuildWinner)
            {
               _barA.setValue(guildBattle.endHitPoints(_currentGuildBattleOwnGuildCharacter));
               _barB.setValue(0);
               _avatarA.normal();
               _avatarB.defeated();
            }
            else
            {
               _barA.setValue(0);
               _barB.setValue(guildBattle.endHitPoints(_currentGuildBattleOtherGuildCharacter));
               _avatarB.normal();
               _avatarA.defeated();
            }
         }
         if(_guildBattleReviewMode)
         {
            var completeCallback:Function = function():void
            {
               ViewManager.instance.showPanel("guild");
            };
            Runtime.delayFunction(completeCallback,2);
         }
         else
         {
            MessageRouter.dispatch(new Message("ViewMessage.notifyBattleFinished",null,this));
         }
      }
      
      override public function refresh() : void
      {
         super.refresh();
      }
      
      override public function reset() : void
      {
         resetBattleData();
         _battle = null;
         _currentRoundIndex = 0;
         _battleFinished = false;
         _btnSkip.visible = true;
      }
      
      private function visualizeGuildBattleRound(param1:GuildBattleRound) : void
      {
         var _loc3_:SymbolPanelBattleGeneric = _vo as SymbolPanelBattleGeneric;
         var _loc4_:GuildBattleCharacter = guildBattle.getCharacter(param1.attacker);
         var _loc5_:GuildBattleCharacter = guildBattle.getCharacter(param1.attacked);
         var _loc2_:GuildBattleCharacter = !!_loc4_.isOwnGuildMember?_loc4_:_loc5_;
         var _loc6_:GuildBattleCharacter = !!_loc4_.isOwnGuildMember?_loc5_:_loc4_;
         if(_currentGuildBattleOwnGuildCharacter != null && _currentGuildBattleOwnGuildCharacter != _loc2_)
         {
            _loc3_.txtGuildACurrentCharacter.tweenTo(1,{"alpha":0});
            _btnSkipMember.visible = false;
            _btnMyCharacter.visible = false;
            _barB.setValue(guildBattle.endHitPoints(_currentGuildBattleOtherGuildCharacter,_currentRoundIndex - 1));
            _avatarB.normal();
            _avatarA.defeated();
            Runtime.delayFunction(setNewOwnGuildCharacter,1);
         }
         else if(_currentGuildBattleOtherGuildCharacter != null && _currentGuildBattleOtherGuildCharacter != _loc6_)
         {
            _loc3_.txtGuildBCurrentCharacter.tweenTo(1,{"alpha":0});
            _btnSkipMember.visible = false;
            _btnMyCharacter.visible = false;
            _barA.setValue(guildBattle.endHitPoints(_currentGuildBattleOwnGuildCharacter,_currentRoundIndex - 1));
            _avatarA.normal();
            _avatarB.defeated();
            Runtime.delayFunction(setNewOtherGuildCharacter,1);
         }
         else
         {
            playGuildBattleRound();
         }
      }
      
      private function setNewOwnGuildCharacter() : void
      {
         var _loc1_:* = null;
         var _loc2_:* = null;
         try
         {
            if(_battleFinished)
            {
               return;
            }
            _loc1_ = guildBattle.battleRounds[_currentRoundIndex - 1];
            updateGuildBattleCharacters(_loc1_);
            _avatarA.fadeIn();
            _loc2_ = _vo as SymbolPanelBattleGeneric;
            _loc2_.txtGuildACurrentCharacter.killTweens();
            _loc2_.txtGuildACurrentCharacter.tweenTo(1,{"alpha":1});
            Runtime.delayFunction(playGuildBattleRound,1);
            return;
         }
         catch(e:Error)
         {
            return;
         }
      }
      
      private function setNewOtherGuildCharacter() : void
      {
         var _loc1_:* = null;
         var _loc2_:* = null;
         try
         {
            if(_battleFinished)
            {
               return;
            }
            _loc1_ = guildBattle.battleRounds[_currentRoundIndex - 1];
            updateGuildBattleCharacters(_loc1_);
            _avatarB.fadeIn();
            _loc2_ = _vo as SymbolPanelBattleGeneric;
            _loc2_.txtGuildBCurrentCharacter.killTweens();
            _loc2_.txtGuildBCurrentCharacter.tweenTo(1,{"alpha":1});
            Runtime.delayFunction(playGuildBattleRound,1);
            return;
         }
         catch(e:Error)
         {
            return;
         }
      }
      
      private function playGuildBattleRound() : void
      {
         if(_battleFinished)
         {
            return;
         }
         if(!isGuildBattle)
         {
            return;
         }
         refreshSkipButtons();
         if(_currentRoundIndex > guildBattle.battleRounds.length)
         {
            return;
         }
         var _loc3_:GuildBattleRound = guildBattle.battleRounds[_currentRoundIndex - 1];
         var _loc5_:GuildBattleCharacter = guildBattle.getCharacter(_loc3_.attacker);
         var _loc8_:GuildBattleCharacter = guildBattle.getCharacter(_loc3_.attacked);
         var _loc9_:UiBattleAvatar = !!_loc5_.isOwnGuildMember?_avatarA:_avatarB;
         var _loc2_:UiBattleAvatar = !!_loc5_.isOwnGuildMember?_avatarB:_avatarA;
         var _loc7_:UiHitPointBar = !!_loc5_.isOwnGuildMember?_barB:_barA;
         var _loc6_:UiBattleSkillsPanel = !!_loc5_.isOwnGuildMember?_skillsA:_skillsB;
         var _loc4_:UiBattleSkillsPanel = !!_loc5_.isOwnGuildMember?_skillsB:_skillsA;
         showRoundStartEffects(_loc3_.attackerEffects,_loc3_.attackedEffects,_loc9_,_loc2_,_loc6_,_loc4_);
         var _loc1_:String = _loc3_.normalHit || _loc3_.guildMissileNormalHit?"normal":_loc3_.criticalHit || _loc3_.guildMissileCriticalHit?"crit":"dodge";
         _loc9_.attacking(_loc1_);
         if(_loc3_.normalHit)
         {
            _loc2_.beingAttackedHit(_loc3_.damage);
         }
         else if(_loc3_.criticalHit)
         {
            _loc2_.beingAttackedCritical(_loc3_.damage);
         }
         else if(_loc3_.dodged)
         {
            _loc2_.beingAttackedDodge();
         }
         else if(_loc3_.guildMissileNormalHit)
         {
            _loc2_.beingAttackedGuildMissileHit(_loc3_.damage);
         }
         else if(_loc3_.guildMissileCriticalHit)
         {
            _loc2_.beingAttackedGuildMissileHit(_loc3_.damage);
         }
      }
      
      private function updateGuildBattleCharacters(param1:GuildBattleRound) : void
      {
         var _loc3_:GuildBattleCharacter = guildBattle.getCharacter(param1.attacker);
         var _loc5_:GuildBattleCharacter = guildBattle.getCharacter(param1.attacked);
         var _loc2_:GuildBattleCharacter = !!_loc3_.isOwnGuildMember?_loc3_:_loc5_;
         var _loc6_:GuildBattleCharacter = !!_loc3_.isOwnGuildMember?_loc5_:_loc3_;
         var _loc4_:SymbolPanelBattleGeneric = _vo as SymbolPanelBattleGeneric;
         if(param1.guildMissileCriticalHit || param1.guildMissileNormalHit)
         {
            if(_loc3_.isOwnGuildMember)
            {
               _avatarA.showGuildMissile(true);
            }
            else
            {
               _avatarB.showGuildMissile(false);
            }
         }
         if(_currentGuildBattleOwnGuildCharacter != _loc2_)
         {
            _currentGuildBattleOwnGuildCharacter = _loc2_;
            _loc4_.txtGuildACurrentCharacter.text = _loc2_.name;
            _loc4_.txtGuildACharacters.text = guildBattle.getRemainingCharacterNames(_loc2_);
            _skillsA.refresh(_loc2_.battleEffects,_loc2_.isMe,_loc2_.name);
            _skillsB.resetSkillUsage();
            _loc4_.txtPlayerNameA.text = _loc2_.nameWithTitle;
            _loc4_.txtPlayerLevelA.text = LocText.current.text("general/level_general_tooltip",_loc2_.level);
            _avatarA.fillCharacter(_loc2_.appearanceSettings,_loc2_.isMe,true);
            _statsA.refreshFromGuildBattleProfile(_loc2_,_loc6_,_loc2_.name,_loc6_.name);
            _statsB.refreshFromGuildBattleProfile(_loc6_,_loc2_,_loc6_.name,_loc2_.name);
            _barA.init(_loc2_.totalHitPoints);
            _barA.value = _loc2_.hitPoints;
            _avatarImageA.showWithSettings(_loc2_.avatarImage);
         }
         if(_currentGuildBattleOtherGuildCharacter != _loc6_)
         {
            _currentGuildBattleOtherGuildCharacter = _loc6_;
            _loc4_.txtGuildBCurrentCharacter.text = _loc6_.name;
            _loc4_.txtGuildBCharacters.text = _guildBattle.getRemainingCharacterNames(_loc6_);
            _skillsB.refresh(_loc6_.battleEffects,false,_loc6_.name);
            updateSkillsBPosition();
            _skillsA.resetSkillUsage();
            _loc4_.txtPlayerNameB.text = _loc6_.nameWithTitle;
            _loc4_.txtPlayerLevelB.text = LocText.current.text("general/level_general_tooltip",_loc6_.level);
            _avatarB.fillCharacter(_loc6_.appearanceSettings,false,false);
            _statsA.refreshFromGuildBattleProfile(_loc2_,_loc6_,_loc2_.name,_loc6_.name);
            _statsB.refreshFromGuildBattleProfile(_loc6_,_loc2_,_loc6_.name,_loc2_.name);
            _barB.init(_loc6_.totalHitPoints);
            _barB.value = _loc6_.hitPoints;
            _avatarImageB.showWithSettings(_loc6_.avatarImage);
         }
         adjustTextPositions();
      }
      
      private function skipMemberGuildBattle() : void
      {
         var _loc3_:int = 0;
         var _loc1_:* = null;
         var _loc4_:* = null;
         var _loc5_:* = null;
         var _loc2_:* = null;
         var _loc6_:* = null;
         _loc3_ = Math.max(_currentRoundIndex - 1,0);
         while(_loc3_ < guildBattle.battleRounds.length)
         {
            _loc1_ = guildBattle.battleRounds[_loc3_];
            _loc4_ = guildBattle.getCharacter(_loc1_.attacker);
            _loc5_ = guildBattle.getCharacter(_loc1_.attacked);
            _loc2_ = !!_loc4_.isOwnGuildMember?_loc4_:_loc5_;
            _loc6_ = !!_loc4_.isOwnGuildMember?_loc5_:_loc4_;
            if(_currentGuildBattleOwnGuildCharacter != null && _currentGuildBattleOwnGuildCharacter != _loc2_)
            {
               _currentRoundIndex = _loc3_;
               refreshSkipButtons();
               return;
            }
            if(_currentGuildBattleOtherGuildCharacter != null && _currentGuildBattleOtherGuildCharacter != _loc6_)
            {
               _currentRoundIndex = _loc3_;
               refreshSkipButtons();
               return;
            }
            _loc3_++;
         }
      }
      
      private function skipMyCharacterGuildBattle() : void
      {
         var _loc3_:int = 0;
         var _loc1_:* = null;
         var _loc4_:* = null;
         var _loc5_:* = null;
         var _loc2_:* = null;
         var _loc6_:* = null;
         _loc3_ = Math.max(_currentRoundIndex - 1,0);
         while(_loc3_ < guildBattle.battleRounds.length)
         {
            _loc1_ = guildBattle.battleRounds[_loc3_];
            _loc4_ = guildBattle.getCharacter(_loc1_.attacker);
            _loc5_ = guildBattle.getCharacter(_loc1_.attacked);
            _loc2_ = !!_loc4_.isOwnGuildMember?_loc4_:_loc5_;
            _loc6_ = !!_loc4_.isOwnGuildMember?_loc5_:_loc4_;
            if(_currentGuildBattleOwnGuildCharacter != null && _currentGuildBattleOwnGuildCharacter != _loc2_ && _loc2_.isMe)
            {
               _currentRoundIndex = _loc3_;
               refreshSkipButtons();
               return;
            }
            _loc3_++;
         }
      }
      
      private function isLastMembersGuildBattle() : Boolean
      {
         var _loc5_:int = 0;
         var _loc1_:* = null;
         var _loc6_:* = null;
         var _loc7_:* = null;
         var _loc2_:* = null;
         var _loc8_:* = null;
         var _loc9_:Boolean = true;
         var _loc3_:* = null;
         var _loc4_:* = null;
         _loc5_ = _currentRoundIndex;
         while(_loc5_ < guildBattle.battleRounds.length)
         {
            _loc1_ = guildBattle.battleRounds[_loc5_];
            _loc6_ = guildBattle.getCharacter(_loc1_.attacker);
            _loc7_ = guildBattle.getCharacter(_loc1_.attacked);
            _loc2_ = !!_loc6_.isOwnGuildMember?_loc6_:_loc7_;
            _loc8_ = !!_loc6_.isOwnGuildMember?_loc7_:_loc6_;
            if(_currentRoundIndex == _loc5_)
            {
               _loc3_ = _loc2_;
               _loc4_ = _loc8_;
            }
            if(_loc3_ != null && _loc3_ != _loc2_)
            {
               _loc9_ = false;
               break;
            }
            if(_loc4_ != null && _loc4_ != _loc8_)
            {
               _loc9_ = false;
               break;
            }
            _loc5_++;
         }
         return _loc9_;
      }
      
      private function isMyCharacterStillPendingGuildBattle() : Boolean
      {
         var _loc5_:int = 0;
         var _loc1_:* = null;
         var _loc6_:* = null;
         var _loc8_:* = null;
         var _loc2_:* = null;
         var _loc9_:* = null;
         var _loc7_:Boolean = false;
         var _loc3_:* = null;
         var _loc4_:* = null;
         _loc5_ = _currentRoundIndex;
         while(_loc5_ < guildBattle.battleRounds.length)
         {
            _loc1_ = guildBattle.battleRounds[_loc5_];
            _loc6_ = guildBattle.getCharacter(_loc1_.attacker);
            _loc8_ = guildBattle.getCharacter(_loc1_.attacked);
            _loc2_ = !!_loc6_.isOwnGuildMember?_loc6_:_loc8_;
            _loc9_ = !!_loc6_.isOwnGuildMember?_loc8_:_loc6_;
            if(_currentRoundIndex == _loc5_)
            {
               _loc3_ = _loc2_;
               _loc4_ = _loc9_;
            }
            if(_loc3_ != null && _loc3_ != _loc2_ && _loc2_.isMe)
            {
               _loc7_ = true;
               break;
            }
            _loc5_++;
         }
         return _loc7_;
      }
   }
}
