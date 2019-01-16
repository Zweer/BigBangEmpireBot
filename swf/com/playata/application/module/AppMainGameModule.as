package com.playata.application.module
{
   import com.playata.application.AppConfig;
   import com.playata.application.AppEnvironment;
   import com.playata.application.Application;
   import com.playata.application.data.application.ApplicationOptions;
   import com.playata.application.data.battle.BattleSkills;
   import com.playata.application.data.bonus.BonusInfo;
   import com.playata.application.data.bonus.DailyLoginBonusRewards;
   import com.playata.application.data.character.Character;
   import com.playata.application.data.constants.CBattleSkill;
   import com.playata.application.data.constants.CGoal;
   import com.playata.application.data.constants.CItemPattern;
   import com.playata.application.data.constants.CItemTemplate;
   import com.playata.application.data.constants.CTitle;
   import com.playata.application.data.convention.ConventionShow;
   import com.playata.application.data.dataobject.DOBattle;
   import com.playata.application.data.duel.Duel;
   import com.playata.application.data.goal.Goals;
   import com.playata.application.data.item_pattern.ItemPatterns;
   import com.playata.application.data.marriage.Marriages;
   import com.playata.application.data.movie.MovieQuest;
   import com.playata.application.data.optical_changes.OpticalChanges;
   import com.playata.application.data.payment.ItemOfferCategories;
   import com.playata.application.data.quest.Quest;
   import com.playata.application.data.server.SyncStates;
   import com.playata.application.data.story_dungeon.StoryDungeon;
   import com.playata.application.data.titles.Titles;
   import com.playata.application.data.tournament.MovieTournament;
   import com.playata.application.data.tournament.Tournament;
   import com.playata.application.data.user.User;
   import com.playata.application.data.voucher.UserVoucher;
   import com.playata.application.request.AppRequestResponseData;
   import com.playata.application.ui.ViewManager;
   import com.playata.application.ui.dialogs.DialogAutomaticUserVoucherRedeemed;
   import com.playata.application.ui.dialogs.DialogBoosterExpired;
   import com.playata.application.ui.dialogs.DialogDailyLoginBonus;
   import com.playata.application.ui.dialogs.DialogDeletionReactivationCode;
   import com.playata.application.ui.dialogs.DialogGuildBoosterExpired;
   import com.playata.application.ui.dialogs.DialogNewUserVoucher;
   import com.playata.application.ui.dialogs.DialogStoryDungeonUnlocked;
   import com.playata.application.ui.effects.EffectsLayer;
   import com.playata.application.ui.elements.background.UiBackgroundFader;
   import com.playata.application.ui.elements.generic.button.UiButton;
   import com.playata.application.ui.elements.generic.dialog.UiTwoChoiceDialog;
   import com.playata.framework.application.Environment;
   import com.playata.framework.application.request.ActionRequestResponse;
   import com.playata.framework.assets.AssetsConfig;
   import com.playata.framework.audio.lib.flash.FlashUriSoundProvider;
   import com.playata.framework.core.Core;
   import com.playata.framework.core.Runtime;
   import com.playata.framework.core.logging.Logger;
   import com.playata.framework.core.util.NumberUtil;
   import com.playata.framework.data.DataObjectArray;
   import com.playata.framework.data.constants.Constants;
   import com.playata.framework.localization.LocText;
   
   public class AppMainGameModule extends AppModuleBase
   {
       
      
      public function AppMainGameModule(param1:Application)
      {
         super(param1);
      }
      
      public function onInitGame() : void
      {
         new Goals(CGoal.constantsData);
         new ItemPatterns(CItemPattern.constantsData,CItemTemplate.constantsData);
         new OpticalChanges();
         if(AppConfig.titlesEnabled)
         {
            new Titles(CTitle.constantsData);
         }
         new BattleSkills(CBattleSkill.constantsData);
         new Marriages();
      }
      
      override public function onInit(param1:ApplicationOptions = null) : void
      {
         Logger.debug("[Application] AppMainGameModule:: Init...");
         var _loc2_:String = null;
         if(param1 == null || !param1.defaultSoundStreamUrl)
         {
            _loc2_ = AssetsConfig.cdnURL + "assets/sounds/";
         }
         else
         {
            _loc2_ = param1.defaultSoundStreamUrl;
         }
         Environment.audio.soundProvider = new FlashUriSoundProvider(_loc2_);
         Environment.audio.checkPlay = checkSoundPlay;
         Environment.audio.cacheSounds = param1 == null || param1.dontCacheSounds === false;
         Environment.audio.cacheSound("ui_button_click.mp3");
         Environment.audio.cacheSound("ui_dialog_open.mp3");
         Environment.audio.cacheSound("ui_dialog_close.mp3");
         Environment.audio.cacheSound("battle_attack1.mp3");
         Environment.audio.cacheSound("battle_attack2.mp3");
         Environment.audio.cacheSound("battle_attack3.mp3");
         Environment.audio.cacheSound("battle_attack4.mp3");
         Environment.audio.cacheSound("battle_attack5.mp3");
         Environment.audio.cacheSound("battle_attack6.mp3");
         Environment.audio.cacheSound("battle_punch1.mp3");
         Environment.audio.cacheSound("battle_punch2.mp3");
         Environment.audio.cacheSound("battle_punch3.mp3");
         Environment.audio.cacheSound("battle_punch4.mp3");
         Environment.audio.cacheSound("battle_punch5.mp3");
         Environment.audio.cacheSound("battle_punch6.mp3");
         Environment.audio.cacheSound("voice_male_dodge.mp3");
         Environment.audio.cacheSound("voice_male_normal1.mp3");
         Environment.audio.cacheSound("voice_male_normal2.mp3");
         Environment.audio.cacheSound("voice_male_normal3.mp3");
         Environment.audio.cacheSound("voice_male_normal4.mp3");
         Environment.audio.cacheSound("voice_male_normal5.mp3");
         Environment.audio.cacheSound("voice_male_normal6.mp3");
         Environment.audio.cacheSound("voice_male_normal7.mp3");
         Environment.audio.cacheSound("voice_male_normal8.mp3");
         Environment.audio.cacheSound("voice_male_normal9.mp3");
         Environment.audio.cacheSound("voice_male_normal10.mp3");
         Environment.audio.cacheSound("voice_male_critical1.mp3");
         Environment.audio.cacheSound("voice_male_critical2.mp3");
         Environment.audio.cacheSound("voice_male_critical3.mp3");
         Environment.audio.cacheSound("voice_male_critical4.mp3");
         Environment.audio.cacheSound("voice_male_critical5.mp3");
         Environment.audio.cacheSound("voice_male_critical6.mp3");
         Environment.audio.cacheSound("voice_male_critical7.mp3");
         Environment.audio.cacheSound("voice_male_critical8.mp3");
         Environment.audio.cacheSound("voice_male_critical9.mp3");
         Environment.audio.cacheSound("voice_male_critical10.mp3");
         Environment.audio.cacheSound("voice_female_dodge.mp3");
         Environment.audio.cacheSound("voice_female_normal1.mp3");
         Environment.audio.cacheSound("voice_female_normal2.mp3");
         Environment.audio.cacheSound("voice_female_normal3.mp3");
         Environment.audio.cacheSound("voice_female_normal4.mp3");
         Environment.audio.cacheSound("voice_female_normal5.mp3");
         Environment.audio.cacheSound("voice_female_normal6.mp3");
         Environment.audio.cacheSound("voice_female_normal7.mp3");
         Environment.audio.cacheSound("voice_female_normal8.mp3");
         Environment.audio.cacheSound("voice_female_normal9.mp3");
         Environment.audio.cacheSound("voice_female_normal10.mp3");
         Environment.audio.cacheSound("voice_female_critical1.mp3");
         Environment.audio.cacheSound("voice_female_critical2.mp3");
         Environment.audio.cacheSound("voice_female_critical3.mp3");
         Environment.audio.cacheSound("voice_female_critical4.mp3");
         Environment.audio.cacheSound("voice_female_critical5.mp3");
         Environment.audio.cacheSound("voice_female_critical6.mp3");
         Environment.audio.cacheSound("voice_female_critical7.mp3");
         Environment.audio.cacheSound("voice_female_critical8.mp3");
         Environment.audio.cacheSound("voice_female_critical9.mp3");
         Environment.audio.cacheSound("voice_female_critical10.mp3");
      }
      
      public function onUserAssigned() : void
      {
         var _loc3_:User = this.user;
         if(!_loc3_.playBackgroundSounds)
         {
            Environment.audio.stopMusic();
         }
         var _loc2_:Object = _loc3_.getSettingValue("sound_volume");
         var _loc1_:* = 1;
         if(_loc2_ != null)
         {
            _loc1_ = Number(_loc2_ as Number);
            _loc1_ = Number(NumberUtil.roundDecimal(_loc1_,1));
            if(_loc1_ > 1)
            {
               _loc1_ = 1;
            }
            if(_loc1_ < 0)
            {
               _loc1_ = 0;
            }
         }
         Environment.audio.volumeMaster = _loc1_;
         Environment.audio.soundProvider.soundPackage = _loc3_.soundPackage;
         ViewManager.instance.setClientAnimationQuality(_loc3_.clientAnimationQuality);
         UiBackgroundFader.useMovieClipAnimations = _loc3_.clientAnimationQuality > 1;
         UiButton.defaultInteractionOverMode = !!UiBackgroundFader.useMovieClipAnimations?"growTweened":"grow";
         if(EffectsLayer.instance)
         {
            EffectsLayer.instance.enabled = UiBackgroundFader.useMovieClipAnimations;
         }
      }
      
      override public function onUserLogin(param1:AppRequestResponseData) : void
      {
         Environment.panelManager.dialogManager.resetCloseAllDialogs();
         if(param1.hasData("constants"))
         {
            if(Constants.current)
            {
               Constants.current.setData(param1.constants);
            }
         }
      }
      
      override public function onRefreshData(param1:Object) : void
      {
         updateData = param1;
         var _user:User = this.user;
         var appData:AppRequestResponseData = new AppRequestResponseData(updateData);
         if(appData.reactivation_code)
         {
            Runtime.delayFunction(function():void
            {
               Environment.panelManager.showDialog(new DialogDeletionReactivationCode(appData.reactivation_code));
            },2);
         }
         if(platform.isForumLinkAllowed)
         {
            if(appData.new_version && !_user.getWhiteLabelId())
            {
               Environment.panelManager.showDialog(new UiTwoChoiceDialog(LocText.current.text("dialog/new_version/title"),LocText.current.text("dialog/new_version/text"),LocText.current.text("dialog/new_version/button_read"),LocText.current.text("dialog/new_version/button_play"),onClickReadChangeLog,null,true,false));
            }
         }
         if(appData.hasData("constants_override",true))
         {
            Constants.current.addConstantsOverride(appData.constants_override);
         }
         if(appData.hasData("ad_provider_keys",true) && AppEnvironment.adFactory)
         {
            AppEnvironment.adFactory.update(appData.ad_provider_keys);
         }
         if(appData.hasData("character",true))
         {
            _user.refreshCharacter(appData.character);
            if(appData.character.hasData("ts_last_duel_stamina_change",true))
            {
               _user.character.resetDuelStaminaCorrection();
            }
         }
         if(appData.hasData("daily_login_bonus_rewards") && appData.hasData("daily_login_bonus_day"))
         {
            var dailyLoginBonusRewards:DailyLoginBonusRewards = new DailyLoginBonusRewards(appData.daily_login_bonus_rewards);
            Environment.panelManager.showDialog(new DialogDailyLoginBonus(dailyLoginBonusRewards,appData.daily_login_bonus_day));
         }
         if(appData.hasData("bonus_info",true))
         {
            BonusInfo.update(appData.bonus_info);
            ViewManager.instance.showBonusInfoNotifications();
         }
         if(_user != null && _user.character != null)
         {
            if(appData.hasData("ingame_notifications",true))
            {
               _user.character.ingameNotifications.refresh(appData.ingame_notifications);
            }
         }
         if(_user != null && _user.character != null)
         {
            if(appData.hasData("current_goal_values",true))
            {
               _user.character.refreshGoalValues(appData.current_goal_values);
            }
            if(appData.hasData("collected_goals",true))
            {
               _user.character.refreshCollectedGoals(appData.collected_goals);
            }
         }
         if(_user != null && _user.character != null)
         {
            if(appData.hasData("current_item_pattern_values",true))
            {
               _user.character.refreshItemPatternValues(appData.current_item_pattern_values);
            }
            if(appData.hasData("collected_item_pattern",true))
            {
               _user.character.refreshCollectedItemPattern(appData.collected_item_pattern);
            }
         }
         if(_user != null && _user.character != null)
         {
            if(appData.hasData("current_optical_changes",true))
            {
               _user.character.refreshOpticalChanges(appData.current_optical_changes);
            }
            if(appData.hasData("collected_optical_changes",true))
            {
               _user.character.refreshCollectedOpticalChanges(appData.collected_optical_changes);
            }
         }
         if(AppConfig.titlesEnabled)
         {
            if(appData.hasData("titles",true))
            {
               _user.character.refreshTitles(appData.titles);
            }
            if(appData.hasData("title",true))
            {
               _user.character.refreshTitle(appData.title);
            }
         }
         if(appData.hasData("inventory",true))
         {
            _user.character.refreshInventory(appData.inventory,true);
         }
         if(appData.hasData("bank_inventory",true))
         {
            _user.character.refreshBankInventory(appData.bank_inventory);
         }
         if(appData.hasData("duel",true))
         {
            var duel:Duel = _user.character.refreshDuel(appData.duel);
            if(appData.hasData("battles",true) && getBattleFromId(appData.battles,duel.battleId))
            {
               duel.refreshBattle(getBattleFromId(appData.battles,duel.battleId));
            }
            else if(appData.hasData("battle",true) && duel.battleId == appData.battle.id)
            {
               duel.refreshBattle(appData.battle);
            }
            if(appData.hasData("opponent",true))
            {
               var opponent:Character = duel.refreshOpponent(appData.opponent);
               if(appData.hasData("opponent_inventory"))
               {
                  opponent.refreshInventory(appData.opponent_inventory,false);
               }
               if(appData.hasData("opponent_inventory_items"))
               {
                  opponent.refreshItems(appData.opponent_inventory_items);
               }
            }
         }
         if(appData.hasData("quests",true))
         {
            _user.character.refreshQuests(appData.quests);
            if(appData.hasData("battles",true))
            {
               var _loc4_:int = 0;
               var _loc3_:* = _user.character.quests;
               for each(q in _user.character.quests)
               {
                  if(q.isFightQuest && q.fightBattleId && getBattleFromId(appData.battles,q.fightBattleId))
                  {
                     q.refreshBattle(getBattleFromId(appData.battles,q.fightBattleId));
                  }
               }
            }
            else if(appData.hasData("battle",true))
            {
               var _loc6_:int = 0;
               var _loc5_:* = _user.character.quests;
               for each(q in _user.character.quests)
               {
                  if(q.fightBattleId == appData.battle.id)
                  {
                     q.refreshBattle(appData.battle);
                     break;
                  }
               }
            }
         }
         if(appData.hasData("quest",true))
         {
            var quest:Quest = _user.character.refreshQuest(appData.quest);
            if(quest != null)
            {
               if(appData.hasData("battles",true) && getBattleFromId(appData.battles,quest.fightBattleId))
               {
                  quest.refreshBattle(getBattleFromId(appData.battles,quest.fightBattleId));
               }
               else if(appData.hasData("battle",true) && quest.fightBattleId == appData.battle.id)
               {
                  quest.refreshBattle(appData.battle);
               }
            }
         }
         if(appData.hasData("convention_show",true))
         {
            var conventionShow:ConventionShow = _user.character.refreshConventionShow(appData.convention_show);
            if(conventionShow != null)
            {
               if(appData.hasData("convention_previous_stars",true))
               {
                  conventionShow.refreshPreviousStars(appData.convention_previous_stars);
               }
            }
         }
         if(appData.hasData("item",true))
         {
            _user.character.refreshItem(appData.item);
         }
         if(appData.hasData("items",true))
         {
            _user.character.refreshItems(appData.items);
         }
         if(appData.hasData("opponents",true))
         {
            _user.character.refreshDuelOpponents(appData.opponents);
         }
         if(appData.hasData("missed_duels",true) && _user.character != null)
         {
            _user.character.missedDuels = appData.missed_duels;
         }
         if(appData.hasData("new_messages",true) && _user.character != null)
         {
            _user.character.newMessages = appData.new_messages;
         }
         if(appData.hasData("new_guild_log_entries",true) && _user.character != null)
         {
            _user.character.newGuildLogEntries = appData.new_guild_log_entries;
         }
         if(appData.hasData("guild",true))
         {
            _user.character.refreshGuild(appData.guild);
         }
         if(appData.hasData("guild_members",true))
         {
            if(_user.character.guild != null)
            {
               _user.character.guild.refreshMembers(appData.guild_members);
            }
         }
         if(appData.hasData("pending_guild_battle_attack",true))
         {
            if(_user.character.guild != null)
            {
               _user.character.guild.refreshPendingGuildBattleAttack(appData.pending_guild_battle_attack);
            }
         }
         if(appData.hasData("pending_guild_battle_defense",true))
         {
            if(_user.character.guild != null)
            {
               _user.character.guild.refreshPendingGuildBattleDefense(appData.pending_guild_battle_defense);
            }
         }
         if(appData.hasData("finished_guild_battle_attack",true))
         {
            if(_user.character != null)
            {
               _user.character.refreshFinishedGuildBattleAttack(appData.finished_guild_battle_attack);
            }
         }
         if(appData.hasData("finished_guild_battle_defense",true))
         {
            if(_user.character != null)
            {
               _user.character.refreshFinishedGuildBattleDefense(appData.finished_guild_battle_defense);
            }
         }
         if(appData.hasData("guild_battle_guilds",true))
         {
            if(_user.character.guild != null)
            {
               _user.character.guild.refreshGuildBattleGuilds(appData.guild_battle_guilds);
            }
         }
         if(appData.hasData("guild_battle_rewards",true))
         {
            if(_user.character.guild != null)
            {
               _user.character.guild.refreshGuildBattleRewards(appData.guild_battle_rewards);
            }
         }
         if(appData.hasData("guild_log",true))
         {
            if(_user.character.guild != null)
            {
               _user.character.guild.refreshLogMessages(appData.guild_log);
            }
         }
         if(appData.hasData("conventions",true))
         {
            if(_user.character != null)
            {
               _user.character.refreshConventions(appData.conventions);
            }
         }
         if(appData.hasData("convention",true))
         {
            if(_user.character != null)
            {
               _user.character.refreshConvention(appData.convention);
            }
         }
         if(appData.hasData("convention_rewards",true))
         {
            if(_user.character != null)
            {
               _user.character.refreshConventionRewards(appData.convention_rewards);
            }
         }
         if(appData.hasData("convention_reward",true))
         {
            if(_user.character != null)
            {
               _user.character.refreshConventionReward(appData.convention_reward);
            }
         }
         if(appData.hasData("convention_character_data",true))
         {
            if(_user.character != null)
            {
               _user.character.refreshConventionCharacterData(appData.convention_character_data);
            }
         }
         if(appData.hasData("dungeon",true))
         {
            if(_user.character != null)
            {
               _user.character.refreshDungeon(appData.dungeon);
            }
         }
         if(appData.hasData("dungeon_level",true))
         {
            if(_user.character != null)
            {
               _user.character.refreshDungeonLevel(appData.dungeon_level);
            }
         }
         if(appData.hasData("dungeon_levels",true))
         {
            if(_user.character != null)
            {
               _user.character.refreshDungeonLevels(appData.dungeon_levels);
            }
         }
         if(appData.hasData("dungeon_quest",true))
         {
            if(_user.character != null)
            {
               _user.character.refreshDungeonQuest(appData.dungeon_quest);
            }
            if(appData.hasData("battles",true) && _user.character != null && _user.character.activeDungeonQuest && getBattleFromId(appData.battles,_user.character.activeDungeonQuest.battleId))
            {
               _user.character.activeDungeonQuest.refreshBattle(getBattleFromId(appData.battles,_user.character.activeDungeonQuest.battleId));
            }
            if(appData.hasData("battle",true) && _user.character != null && _user.character.activeDungeonQuest && _user.character.activeDungeonQuest.battleId == appData.battle.id)
            {
               _user.character.activeDungeonQuest.refreshBattle(appData.battle);
            }
         }
         if(appData.hasData("movie",true))
         {
            if(_user.character != null)
            {
               _user.character.refreshMovie(appData.movie);
            }
         }
         if(appData.hasData("movies",true))
         {
            if(_user.character != null)
            {
               _user.character.refreshMovies(appData.movies);
            }
         }
         if(appData.hasData("movie_quests",true))
         {
            if(_user.character != null)
            {
               _user.character.movie.refreshMovieQuests(appData.movie_quests);
            }
         }
         if(appData.hasData("movie_quest",true))
         {
            if(_user.character != null)
            {
               _user.character.movie.refreshMovieQuest(appData.movie_quest);
            }
         }
         if(appData.hasData("movie_battle",true))
         {
            var _loc8_:int = 0;
            var _loc7_:* = _user.character.movie.movieQuests;
            for each(mq in _user.character.movie.movieQuests)
            {
               if(mq.fightBattleId == appData.movie_battle.id)
               {
                  mq.refreshBattle(appData.movie_battle);
                  break;
               }
            }
         }
         if(appData.hasData("event_quest",true))
         {
            if(_user.character != null)
            {
               _user.character.refreshEventQuest(appData.event_quest);
            }
         }
         if(appData.hasData("herobook_objectives",true))
         {
            if(_user.character != null)
            {
               _user.character.refreshHerobook(appData.getTypedObject("herobook_objectives"));
            }
         }
         if(appData.hasData("guild_leader_vote",true))
         {
            if(_user.character.guild != null && _user.character.guild.id == appData.guild_leader_vote.guildId)
            {
               _user.character.guild.refreshGuildLeaderVote(appData.guild_leader_vote);
            }
         }
         if(appData.hasData("guild_competition_data",true))
         {
            if(_user.character.guild != null)
            {
               _user.character.guild.refreshGuildCompetition(appData.guild_competition_data);
            }
         }
         if(appData.hasData("resource_request",true))
         {
            if(_user.character != null)
            {
               _user.character.refreshResourceRequest(appData.resource_request);
            }
         }
         if(appData.hasData("resource_requests",true))
         {
            if(_user.character != null)
            {
               _user.character.refreshResourceRequests(appData.resource_requests);
            }
         }
         if(appData.hasData("tournament_end_timestamp",true))
         {
            Tournament.tournamentEndTimestamp = appData.tournament_end_timestamp;
         }
         if(appData.hasData("movie_tournament_end_timestamp",true))
         {
            MovieTournament.movieTournamentEndTimestamp = appData.movie_tournament_end_timestamp;
         }
         if(appData.hasData("story_dungeons",true))
         {
            if(_user.character != null)
            {
               _user.character.refreshStoryDungeons(appData.story_dungeons);
            }
            if(appData.hasData("battles",true) && _user.character != null && _user.character.currentStoryDungeon && getBattleFromId(appData.battles,_user.character.currentStoryDungeon.battleId))
            {
               _user.character.currentStoryDungeon.refreshBattle(getBattleFromId(appData.battles,_user.character.currentStoryDungeon.battleId));
            }
            else if(appData.hasData("battles",true) && _user.character != null && _user.character.repeatStoryDungeon && getBattleFromId(appData.battles,_user.character.repeatStoryDungeon.battleId))
            {
               _user.character.repeatStoryDungeon.refreshBattle(getBattleFromId(appData.battles,_user.character.repeatStoryDungeon.battleId));
            }
            if(appData.hasData("battle",true) && _user.character != null && _user.character.currentStoryDungeon && _user.character.currentStoryDungeon.battleId == appData.battle.id)
            {
               _user.character.currentStoryDungeon.refreshBattle(appData.battle);
            }
            else if(appData.hasData("battle",true) && _user.character != null && _user.character.repeatStoryDungeon && _user.character.repeatStoryDungeon.battleId == appData.battle.id)
            {
               _user.character.repeatStoryDungeon.refreshBattle(appData.battle);
            }
         }
         if(appData.hasData("story_dungeon",true))
         {
            if(_user.character != null)
            {
               _user.character.refreshStoryDungeon(appData.story_dungeon);
            }
            if(appData.hasData("battles",true) && _user.character != null && _user.character.currentStoryDungeon && getBattleFromId(appData.battles,_user.character.currentStoryDungeon.battleId))
            {
               _user.character.currentStoryDungeon.refreshBattle(getBattleFromId(appData.battles,_user.character.currentStoryDungeon.battleId));
            }
            else if(appData.hasData("battles",true) && _user.character != null && _user.character.repeatStoryDungeon && getBattleFromId(appData.battles,_user.character.repeatStoryDungeon.battleId))
            {
               _user.character.repeatStoryDungeon.refreshBattle(getBattleFromId(appData.battles,_user.character.repeatStoryDungeon.battleId));
            }
            if(appData.hasData("battle",true) && _user.character != null && _user.character.currentStoryDungeon && _user.character.currentStoryDungeon.battleId == appData.battle.id)
            {
               _user.character.currentStoryDungeon.refreshBattle(appData.battle);
            }
            else if(appData.hasData("battle",true) && _user.character != null && _user.character.repeatStoryDungeon && _user.character.repeatStoryDungeon.battleId == appData.battle.id)
            {
               _user.character.repeatStoryDungeon.refreshBattle(appData.battle);
            }
         }
         if(appData.hasData("completed_story_dungeons",true))
         {
            if(_user.character != null)
            {
               _user.character.completedStoryDungeons = appData.completed_story_dungeons;
            }
         }
         if(appData.hasData("dating_lookup",true))
         {
            if(_user.character != null)
            {
               _user.character.refreshDating(appData.dating_lookup);
            }
         }
         if(appData.hasData("dating_step",true))
         {
            if(_user.character != null)
            {
               _user.character.dating.refreshDatingSteps(appData.dating_step);
            }
         }
         if(appData.hasData("completed_dating_steps",true))
         {
            if(_user.character != null)
            {
               _user.character.dating.completedDatingSteps = appData.completed_dating_steps;
            }
         }
         if(appData.hasData("fan_foto",true))
         {
            if(_user.character != null)
            {
               _user.character.refreshFanFoto(appData.fan_foto);
            }
         }
         if(appData.hasData("movie_vote_reward",true))
         {
            if(_user.character != null)
            {
               _user.character.refreshMovieVoteRewards(appData.movie_vote_reward);
            }
         }
         if(appData.hasData("marriage",true))
         {
            Marriages.instance.refreshMarriage(appData.marriage);
         }
         if(appData.hasData("marriages",true))
         {
            Marriages.instance.refreshMarriages(appData.marriages);
         }
         if(appData.hasData("outfit",true))
         {
            if(_user.character != null)
            {
               _user.character.refreshOutfit(appData.outfit);
            }
         }
         if(appData.hasData("outfits",true))
         {
            if(_user.character != null)
            {
               _user.character.refreshOutfits(appData.outfits);
            }
         }
         if(appData.hasData("sync_states",true))
         {
            SyncStates.refresh(appData.sync_states);
         }
      }
      
      public function onAfterRefreshData(param1:Object) : void
      {
         var _loc2_:User = this.user;
         var _loc3_:AppRequestResponseData = new AppRequestResponseData(param1);
         if(_loc3_.hasData("expired_boosters",true) && _loc3_.expired_boosters.length > 0)
         {
            Environment.panelManager.showDialog(new DialogBoosterExpired(_loc3_.expired_boosters));
         }
         if(_loc3_.hasData("expired_guild_boosters",true) && _loc3_.expired_guild_boosters.length > 0 && _loc2_.character.guild.getMemberById(_loc2_.character.id).guildRank != 3)
         {
            Environment.panelManager.showDialog(new DialogGuildBoosterExpired(_loc3_.expired_guild_boosters));
         }
         if(_loc2_ && _loc2_.character && _loc2_.character.hasNewUserVouchers && !DialogNewUserVoucher.isOpen)
         {
            Environment.application.sendActionRequest("getUserVoucher",{"id":_loc2_.character.allNewUserVoucherIds[0]},handleRequestResponse);
         }
         if(_loc2_ && _loc2_.character && StoryDungeon.newStoryDungeonAvailable(_loc2_.character))
         {
            Environment.panelManager.showDialog(new DialogStoryDungeonUnlocked(StoryDungeon.getNewStoryDungeonIndex(_loc2_.character)));
         }
         if(_loc3_.hasData("user_voucher_rewards",true) && _loc3_.user_voucher_rewards.length > 0)
         {
            Environment.panelManager.showDialog(new DialogAutomaticUserVoucherRedeemed(_loc3_.user_voucher_rewards));
         }
      }
      
      private function checkSoundPlay(param1:String) : Boolean
      {
         if(user == null)
         {
            return true;
         }
         if(param1.indexOf("guild_notification") === 0)
         {
            return user.playGuildSounds;
         }
         if(param1.indexOf("ambience_") === 0)
         {
            return user.playBackgroundSounds;
         }
         if(param1.indexOf("ui_") === 0)
         {
            return user.playGuiSounds;
         }
         return user.playNotificationSounds;
      }
      
      private function getBattleFromId(param1:DataObjectArray, param2:int) : DOBattle
      {
         var _loc5_:int = 0;
         var _loc4_:* = param1;
         for each(var _loc3_ in param1)
         {
            if(_loc3_.id == param2)
            {
               return _loc3_;
            }
         }
         return null;
      }
      
      private function onClickReadChangeLog() : void
      {
         Environment.platform.openLink(AppConfig.urlChangelog);
      }
      
      private function get user() : User
      {
         return Application.userController.appUser;
      }
      
      private function handleRequestResponse(param1:ActionRequestResponse) : void
      {
         Logger.debug("[Application] Handling request response for: " + param1.action);
         var _loc2_:* = param1.action;
         if("getUserVoucher" !== _loc2_)
         {
            throw new Error("Failure handling response to action \'" + param1.action + "\'. Action not supported");
         }
         if(param1.error == "")
         {
            if(param1.appResponse.hasData("voucher",true))
            {
               Environment.panelManager.showDialog(new DialogNewUserVoucher(new UserVoucher(param1.appResponse.voucher)));
            }
         }
         else if(param1.error != "errGetUserVoucherInvalidId")
         {
            Environment.reportError(param1.error,param1.request,false,true);
         }
      }
   }
}
