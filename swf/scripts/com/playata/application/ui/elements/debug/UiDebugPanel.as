package com.playata.application.ui.elements.debug
{
   import com.playata.application.AppEnvironment;
   import com.playata.application.advertisment.AdvertismentUtil;
   import com.playata.application.data.user.User;
   import com.playata.application.ui.ViewManager;
   import com.playata.application.ui.dialogs.DialogOptInMarketing;
   import com.playata.application.ui.dialogs.DialogUserStory;
   import com.playata.application.ui.elements.generic.button.UiTextButton;
   import com.playata.application.ui.elements.guild.UiGuildChatTab;
   import com.playata.application.ui.panels.PanelDungeon;
   import com.playata.framework.application.Environment;
   import com.playata.framework.application.request.ActionRequestResponse;
   import com.playata.framework.core.Core;
   import com.playata.framework.display.UriSprite;
   import com.playata.framework.input.InteractionEvent;
   import visuals.ui.elements.debug.SymbolDebugPanelGeneric;
   
   public class UiDebugPanel
   {
       
      
      private var _content:SymbolDebugPanelGeneric;
      
      private var _btnToggleDebugButtons:UiTextButton = null;
      
      private var _list:UiDebugPanelList;
      
      private var _currentSeperator:UiDebugPanelListLineItem = null;
      
      public function UiDebugPanel(param1:SymbolDebugPanelGeneric)
      {
         super();
         _content = param1;
         _content.visible = false;
         _content.content.visible = false;
         _list = new UiDebugPanelList(_content.content);
         addDebug("performanceMonitor","performanceMonitor");
         addSeperator("Game");
         addDebug("SyncGame","syncGame");
         addDebug("CrashClient","crashClient");
         addDebug("SimulateNewDay","gameTestSimulateNewDay");
         addDebug("OptInMarketing","optInMarketing");
         addSeperator("Character");
         addDebug("LevelUp","gameTestLevelUp",1);
         addDebug("MaxLevel","gameTestMaxLevel");
         addDebug("StageUp","gameTestStageUp");
         addDebug("AddGameCurrency","gameTestAddGameCurrency",1000000);
         addDebug("AddPremiumCurrency","gameTestAddPremiumCurrency",10000);
         addDebug("FinishTimeBasedActivity","gameTestFinishTimeBasedActivity");
         addDebug("ResetQuestEnergy","gameTestResetQuestEnergy");
         addDebug("BoostersAlmostExpired","gameTestBoostersAlmostExpired");
         addDebug("AddReskillItem","gameTestAddReskillItem");
         addDebug("ResetCharacter","gameTestResetCharacter");
         addDebug("AddHonor","gameTestAddHonor",100);
         addDebug("RemoveHonor","gameTestRemoveHonor",100);
         addDebug("AddFans","gameTestAddFans",100);
         addDebug("RemoveFans","gameTestRemoveFans",100);
         addSeperator("Guild");
         addDebug("FinishPendingAttackGuildBattle","gameTestFinishPendingAttackGuildBattle");
         addDebug("FinishPendingDefenseGuildBattle","gameTestFinishPendingDefenseGuildBattle");
         addDebug("JoinAllGuildMembers","gameTestJoinAllGuildMembers");
         addDebug("AddGuildPremiumCurrency","gameTestAddGuildPremiumCurrency",10000);
         addDebug("KickGuildLeader","gameTestKickGuildLeader");
         addDebug("GuildBoostersAlmostExpired","gameTestGuildBoostersAlmostExpired");
         addDebug("RandomGuildArtifacts","gameTestRandomGuildArtifacts");
         addDebug("ResetGuildArtifacts","gameTestResetGuildArtifacts");
         addDebug("AddGuildHonor","gameTestAddGuildHonor",100);
         addDebug("RemoveGuildHonor","gameTestRemoveGuildHonor",100);
         addSeperator("Leaderboard");
         addDebug("SyncLeaderboard","gameTestSyncLeaderboard");
         addDebug("addAllCharactersToLeaderboard","gameTestAddAllCharactersToLeaderboard");
         addDebug("addLeaderboardTestCharactersAndGuilds","gameTestAddLeaderboardTestCharactersAndGuilds",100);
         addDebug("removeLeaderboardTestCharactersAndGuilds","gameTestRemoveLeaderboardTestCharactersAndGuilds",100);
         addSeperator("Convention");
         addDebug("StartConvention","gameTestStartConvention","");
         addDebug("PerformShow","gameTestPerformConventionShow");
         addDebug("FinishConventionFailed","gameTestFinishConventionFailed");
         addDebug("ConventionAlmostSuccess","gameTestConventionAlmostSuccess");
         addDebug("ConventionAlmostFinished","gameTestConventionAlmostFinished");
         addSeperator("Evemt Quest");
         addDebug("ResetEventQuest","gameTestResetEventQuest");
         addDebug("FinishAllObjectives","gameTestFinishAllObjectivesEventQuest");
         addDebug("AbortEventQuest","gameTestAbortEventQuest");
         addDebug("UnassignEventQuest","gameTestUnassignEventQuest");
         addSeperator("Dungeon");
         addDebug("AddDungeonKey","gameTestAddDungeonKey");
         addDebug("DungeonAlmostFinished","gameTestDungeonAlmostFinished");
         addDebug("ProgressDungeon","gameTestProgressDungeon");
         addSeperator("Movie");
         addDebug("ResetDailyMovieCount","gameTestResetMovieCount");
         addDebug("MovieAlmostComplete","gameTestMovieAlmostComplete");
         addDebug("MovieAlmostTimeUp","gameTestMovieAlmostTimeUp");
         addDebug("AddMovieTournamentRewards","gameTestAddMovieTournamentRewards");
         addDebug("AddMoviesToTournament","gameTestAddMoviesToTournament");
         addDebug("AddVotes","gameTestAddVotes",10);
         addSeperator("Story Dungeon");
         addDebug("StoryDungeon CollectAllPoints","gameTestCollectAllStoryDungeonPoints");
         addDebug("StoryDungeon Restart All","gameTestResetAllStoryDungeons");
         addSeperator("Item Pattern");
         addDebug("SyncItemPattern","gameTestSyncItemPattern");
         addDebug("CollectItemPattern","gameTestCollectItemPattern");
         addDebug("ResetCollectedItemPattern","gameTestResetCollectedItemPattern");
         addSeperator("Guild Competition");
         addDebug("AddGuildsToGuildCompetition","gameTestAddGuildsToGuildCompetition");
         addDebug("ClearGuildsFromGuildCompetition","gameTestClearGuildsFromGuildCompetition");
         addDebug("AddGuildCompetitionTournamentReward","gameTestAddGuildCompetitionTournamentReward");
         addDebug("ChangeGuildCompetition","gameTestChangeGuildCompetition");
         addSeperator("Dating");
         addDebug("CollectAllDatingPoints","gameTestCollectAllDatingPoints");
         addDebug("ResetDating","gameTestResetDating");
         addSeperator("Herobook");
         addDebug("FinishAllHerobookObjectives","gameTestFinishAllHerobookObjectives");
         addDebug("NewHerobookObjectives","gameTestNewHerobookObjectives");
         addDebug("HerobookObjectivesAlmostEnded","gameTestHerobookObjectivesAlmostEnded");
         addDebug("UnlockWeeklyHerobookObjectives","gameTestUnlockWeeklyHerobookObjectives");
         addSeperator("Fan Foto");
         addDebug("ResetFanFoto","gameTestResetFanFoto");
         addDebug("CollectFanFotosOfTags","gameTestCollectFanFotosOfTags");
         addDebug("CollectAllFanFotos","gameTestCollectFanFotos");
         addSeperator("UserStory");
         addDebug("MoveCreatedUserStoriesToVoting","gameTestMoveCreatedUserStoriesToVoting");
         addDebug("MoveVotingUserStoriesToHallOfFame","gameTestMoveVotingUserStoriesToHallOfFame");
         addSeperator("Friendbar");
         addDebug("SyncFriendBar","syncFriendBar");
         addDebug("ClearFriendBarCache","gameTestClearFriendBarCache");
         addSeperator("Advertisment");
         addDebug("FinishVideoAdvertisment","gameTestFinishVideoAdvertisment");
         addDebug("ResetVideoAdvertismentLimit","gameTestResetVideoAdvertismentLimit");
         addDebug("showOfferwall","showOfferwall");
         addSeperator("Streaming");
         addDebug("ResetStreaming","gameTestResetStreaming");
         addDebug("StreamingShowsAlmostFinished","gameTestStreamingShowsAlmostFinished");
         _list.refreshList();
         _btnToggleDebugButtons = new UiTextButton(_content.btnToggleDebugButtons,"Debug","",onToggleDebugButtons);
         _btnToggleDebugButtons.visible = Environment.info.isTestMode;
         if(_btnToggleDebugButtons.visible)
         {
            Environment.application.sendActionRequest("gameTestTestmodeEnabled",{},handleRequests);
         }
      }
      
      private function addDebug(param1:String, param2:String, param3:* = null) : void
      {
         _list.addItem(new UiDebugPanelListLineItem(param1,param2,false,param3,onTestFunctionality,_currentSeperator),false);
      }
      
      private function addSeperator(param1:String) : void
      {
         _currentSeperator = new UiDebugPanelListLineItem(param1,"",true);
         _list.addItem(_currentSeperator,false);
      }
      
      public function dispose() : void
      {
         _list.dispose();
         _list = null;
         _btnToggleDebugButtons.dispose();
         _btnToggleDebugButtons = null;
      }
      
      private function onToggleDebugButtons(param1:InteractionEvent) : void
      {
         _content.content.visible = !_content.content.visible;
      }
      
      private function onTestFunctionality(param1:String, param2:String = null) : void
      {
         var _loc4_:* = null;
         var _loc3_:int = 0;
         var _loc5_:* = param1;
         switch(_loc5_)
         {
            case "optInMarketing":
               Environment.panelManager.showDialog(new DialogOptInMarketing());
               break;
            case "crashClient":
               onToggleDebugButtons(null);
               return;
               break;
            case "multiRequest":
               Environment.application.sendActionRequest("refreshUser",{},handleRequests);
               Environment.application.sendActionRequest("refreshUser",{},handleRequests,false);
               Environment.application.sendActionRequest("refreshUser",{},handleRequests);
               break;
            case "performanceMonitor":
               Environment.display.displayContext.showStats = !Environment.display.displayContext.showStats;
               UriSprite.cache.printCachedObjects();
               break;
            case "gameTestFinishPendingAttackGuildBattle":
               Environment.application.sendActionRequest("gameTestFinishPendingGuildBattle",{"attack":true},handleRequests);
               break;
            case "gameTestFinishPendingDefenseGuildBattle":
               Environment.application.sendActionRequest("gameTestFinishPendingGuildBattle",{"attack":false},handleRequests);
               break;
            case "gameTestStartConvention":
               Environment.application.sendActionRequest("gameTestStartConvention",{
                  "stage":User.current.character.currentQuestStage,
                  "identifier":param2
               },handleRequests);
               break;
            case "gameTestPerformConventionShow":
               _loc3_ = User.current.character.conventionId;
               §§push(new UiEffectViewer());
               if(_loc3_ <= 0)
               {
                  return;
               }
               Environment.application.sendActionRequest("gameTestPerformConventionShow",{
                  "show_count":20,
                  "convention_id":_loc3_
               },handleRequests);
               break;
            case "gameTestFinishConventionFailed":
               _loc3_ = User.current.character.conventionId;
               if(_loc3_ <= 0)
               {
                  return;
               }
               Environment.application.sendActionRequest("gameTestFinishConventionFailed",{"convention_id":_loc3_},handleRequests);
               break;
            case "gameTestConventionAlmostSuccess":
               _loc3_ = User.current.character.conventionId;
               if(_loc3_ <= 0)
               {
                  return;
               }
               Environment.application.sendActionRequest("gameTestConventionAlmostSuccess",{"convention_id":_loc3_},handleRequests);
               break;
            case "gameTestConventionAlmostFinished":
               _loc3_ = User.current.character.conventionId;
               if(_loc3_ <= 0)
               {
                  return;
               }
               Environment.application.sendActionRequest("gameTestConventionAlmostFinished",{"convention_id":_loc3_},handleRequests);
               break;
            case "gameTestFinishVideoAdvertisment":
               if(!AdvertismentUtil.currentVideoAd)
               {
                  return;
               }
               Environment.application.sendActionRequest("gameTestFinishVideoAdvertisment",{"id":AdvertismentUtil.currentVideoAd.id},handleRequests);
               break;
            case "showOfferwall":
               AppEnvironment.appPlatform.showOfferwall(User.current.id);
               break;
            case "syncFriendBar":
               AppEnvironment.friendBar.syncFriendBar();
               break;
            case "syncGame":
               ViewManager.instance.baseUserPanel.onSynGame();
               break;
            case "getGuildLog":
               UiGuildChatTab.instance.refreshGuildLog(true);
               break;
            default:
               Environment.application.sendActionRequest(param1,{"amount":param2},handleRequests);
         }
      }
      
      private function handleRequests(param1:ActionRequestResponse) : void
      {
         var _loc2_:* = param1.action;
         switch(_loc2_)
         {
            case "gameTestResetCharacter":
               Environment.platform.reload();
               break;
            case "gameTestFinishVideoAdvertisment":
               if(param1.error == "")
               {
                  if(!AdvertismentUtil.currentVideoAd)
                  {
                     return;
                  }
                  AdvertismentUtil.currentVideoAd.completed(true,param1.appResponse.hash);
               }
               else
               {
                  Environment.reportError(param1.error,param1.request);
               }
               break;
            case "refreshUser":
               if(param1.error == "")
               {
                  Environment.application.updateData(param1.data);
               }
               else
               {
                  Environment.reportError(param1.error,param1.request);
               }
               break;
            case "gameTestProgressDungeon":
               if(param1.error == "")
               {
                  PanelDungeon.visualizeProgress = true;
                  Environment.application.updateData(param1.data);
                  if(ViewManager.instance.activePanel == "dungeon")
                  {
                     ViewManager.instance.activePanelInstance.refresh();
                  }
               }
               else
               {
                  Environment.reportError(param1.error,param1.request);
               }
               break;
            case "gameTestTestmodeEnabled":
               if(param1.error == "")
               {
                  _content.visible = _btnToggleDebugButtons.visible && param1.appResponse.is_enabled;
               }
               else
               {
                  _content.visible = false;
               }
               break;
            case "gameTestMoveCreatedUserStoriesToVoting":
            case "gameTestMoveVotingUserStoriesToHallOfFame":
               if(param1.error == "")
               {
                  DialogUserStory.reset();
                  Environment.application.updateData(param1.data);
               }
               else
               {
                  Environment.reportError(param1.error,param1.request);
               }
               break;
            default:
               if(param1.error == "")
               {
                  Environment.application.updateData(param1.data);
               }
               else
               {
                  Environment.reportError(param1.error,param1.request);
               }
         }
      }
   }
}
