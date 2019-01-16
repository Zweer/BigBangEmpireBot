package com.playata.application.ui.panels
{
   import com.playata.application.AppConfig;
   import com.playata.application.Application;
   import com.playata.application.billing.AppPremiumSpecialBillingProductInfo;
   import com.playata.application.data.character.Character;
   import com.playata.application.data.constants.CConstant;
   import com.playata.application.data.mailbox.Mailbox;
   import com.playata.application.data.server.SyncStates;
   import com.playata.application.data.user.User;
   import com.playata.application.messaging.Message;
   import com.playata.application.messaging.MessageRouter;
   import com.playata.application.request.ApplicationRequest;
   import com.playata.application.ui.ViewManager;
   import com.playata.application.ui.dialogs.DialogLeaderboard;
   import com.playata.application.ui.dialogs.DialogMailbox;
   import com.playata.application.ui.dialogs.DialogMovieTournamentResult;
   import com.playata.application.ui.dialogs.DialogNewUserVoucher;
   import com.playata.application.ui.dialogs.DialogPaymentBase;
   import com.playata.application.ui.dialogs.DialogSoloGuildCompetitionReward;
   import com.playata.application.ui.elements.account_settings.UiOptionsBase;
   import com.playata.application.ui.elements.account_settings.UiOptionsDialog;
   import com.playata.application.ui.elements.account_settings.UiOptionsPopup;
   import com.playata.application.ui.elements.generic.UiCounterBubble;
   import com.playata.application.ui.elements.generic.button.UiButton;
   import com.playata.application.ui.elements.generic.button.UiMainGoalButton;
   import com.playata.application.ui.elements.goal.UiStoryGoalsPanel;
   import com.playata.application.ui.elements.hud.UiGameCurrencyPanel;
   import com.playata.application.ui.elements.hud.UiMainNavigationButton;
   import com.playata.application.ui.elements.hud.UiPlayerPanel;
   import com.playata.application.ui.elements.hud.UiPremiumCurrencyPanel;
   import com.playata.framework.application.Environment;
   import com.playata.framework.application.request.ActionRequestResponse;
   import com.playata.framework.billing.IBillingProduct;
   import com.playata.framework.core.TypedObject;
   import com.playata.framework.core.timer.ITimer;
   import com.playata.framework.core.util.TimeUtil;
   import com.playata.framework.display.AnchorPoint;
   import com.playata.framework.display.IDisplayObject;
   import com.playata.framework.display.Sprite;
   import com.playata.framework.input.InteractionEvent;
   import com.playata.framework.localization.LocText;
   import com.playata.framework.network.NetworkCore;
   import com.playata.framework.network.request.RequestData;
   import com.playata.framework.platform.PlatformConfig;
   import visuals.ui.elements.generic.SymbolBackgroundNavigationGeneric;
   import visuals.ui.panels.SymbolPanelBaseUserGeneric;
   
   public class PanelBaseUser extends DefaultPanel
   {
      
      private static const SYNC_GAME_INTERVAL:int = 60000;
      
      private static var _syncGamePending:Boolean = false;
      
      private static var _gameSyncing:Boolean = false;
       
      
      private var _realContent:SymbolPanelBaseUserGeneric = null;
      
      private var _backgroundNavigation:SymbolBackgroundNavigationGeneric = null;
      
      private var _btnQuests:UiMainNavigationButton = null;
      
      private var _btnDuels:UiMainNavigationButton = null;
      
      private var _btnCharacter:UiMainNavigationButton = null;
      
      private var _btnShop:UiMainNavigationButton = null;
      
      private var _btnWork:UiMainNavigationButton = null;
      
      private var _btnBoosters:UiMainNavigationButton = null;
      
      private var _btnLeaderboard:UiMainNavigationButton = null;
      
      private var _btnMovie:UiMainNavigationButton = null;
      
      private var _btnGuild:UiMainNavigationButton = null;
      
      private var _btnBuyCurrency:UiMainNavigationButton = null;
      
      private var _btnOptions:UiButton = null;
      
      private var _btnMailbox:UiButton = null;
      
      private var _btnGoals:UiMainGoalButton = null;
      
      private var _btnBuyPremiumCurrencyAB:UiButton = null;
      
      private var _currentMailboxDialog:DialogMailbox = null;
      
      private var _playerPanel:UiPlayerPanel = null;
      
      private var _gameCurrencyPanel:UiGameCurrencyPanel = null;
      
      private var _premiumCurrencyPanel:UiPremiumCurrencyPanel = null;
      
      private var _optionsPopup:UiOptionsBase = null;
      
      private var _storyGoalsPanel:UiStoryGoalsPanel;
      
      private var _mainNavigationButtonsBlocked:Boolean = false;
      
      private var _lastSyncDate:int = -1;
      
      private var _syncGameTimer:ITimer = null;
      
      private var _hasAvailableFreeDuelLastSync:Boolean = true;
      
      private var _hideBoosterBubble:Boolean = false;
      
      private var _hideGoalExclamationMark:Boolean = false;
      
      private var _progressUpdater:ProgressUpdater;
      
      public function PanelBaseUser(param1:SymbolPanelBaseUserGeneric)
      {
         super(param1);
         _realContent = param1;
         _backgroundNavigation = _realContent.mainNavigationBar.backgroundNavigation;
         _btnQuests = new UiMainNavigationButton(_realContent.mainNavigationBar.btnQuests,_realContent.mainNavigationBar.btnQuestsContent,LocText.current.text("general/base_panel/quests_tooltip"),onClickQuests);
         _btnDuels = new UiMainNavigationButton(_realContent.mainNavigationBar.btnDuels,_realContent.mainNavigationBar.btnDuelsContent,LocText.current.text("general/base_panel/duel_tooltip"),onClickDuels);
         _btnCharacter = new UiMainNavigationButton(_realContent.mainNavigationBar.btnCharacter,_realContent.mainNavigationBar.btnCharacterContent,LocText.current.text("general/base_panel/character_tooltip"),onClickCharacter);
         _btnShop = new UiMainNavigationButton(_realContent.mainNavigationBar.btnShop,_realContent.mainNavigationBar.btnShopContent,LocText.current.text("general/base_panel/item_shop_tooltip"),onClickShop);
         _btnWork = new UiMainNavigationButton(_realContent.mainNavigationBar.btnWork,_realContent.mainNavigationBar.btnWorkContent,LocText.current.text("general/base_panel/work_tooltip"),onClickWork);
         _btnBoosters = new UiMainNavigationButton(_realContent.mainNavigationBar.btnBoosters,_realContent.mainNavigationBar.btnBoostersContent,LocText.current.text("general/base_panel/booster_tooltip"),onClickBoosters);
         _btnLeaderboard = new UiMainNavigationButton(_realContent.mainNavigationBar.btnLeaderboard,_realContent.mainNavigationBar.btnLeaderboardContent,LocText.current.text("general/base_panel/leaderboard_tooltip"),onClickLeaderboard);
         _btnMovie = new UiMainNavigationButton(_realContent.mainNavigationBar.btnMovie,_realContent.mainNavigationBar.btnMovieContent,LocText.current.text("general/base_panel/movie_tooltip"),onClickMovie);
         _btnGuild = new UiMainNavigationButton(_realContent.mainNavigationBar.btnGuild,_realContent.mainNavigationBar.btnGuildContent,LocText.current.text("general/base_panel/guild_tooltip"),onClickGuild);
         _btnBuyCurrency = new UiMainNavigationButton(_realContent.mainNavigationBar.btnBuyCurrency,_realContent.mainNavigationBar.btnBuyCurrencyContent,LocText.current.text("general/base_panel/buy_premium_tooltip"),onClickBuyCurrency);
         _btnOptions = new UiButton(_realContent.btnOptions,"",null);
         _btnMailbox = new UiButton(_realContent.btnMailbox,LocText.current.text("general/base_panel/mailbox_tooltip"),onClickMailbox);
         _btnGoals = new UiMainGoalButton(_realContent.btnGoals);
         _btnBuyPremiumCurrencyAB = new UiButton(_realContent.premiumCurrencyPanel.btnBuyPremiumCurrencyAB,LocText.current.text("general/base_panel/buy_premium_tooltip"),onClickBuyCurrency);
         _playerPanel = new UiPlayerPanel(_realContent.playerPanel);
         _gameCurrencyPanel = new UiGameCurrencyPanel(_realContent.coinsPanel);
         _premiumCurrencyPanel = new UiPremiumCurrencyPanel(_realContent.premiumCurrencyPanel);
         _storyGoalsPanel = new UiStoryGoalsPanel(_realContent.storyGoalsContainer.storyGoalsPanel,_realContent.storyGoalsIconContainer);
         if(Environment.info.isTouchScreen)
         {
            _optionsPopup = new UiOptionsDialog(_realContent.parent);
            _realContent.optionsPopup.visible = false;
            _btnOptions.onClick.add(handleOptionsInteraction);
            _btnOptions.extendClickArea(25,50);
         }
         else
         {
            _optionsPopup = new UiOptionsPopup(_realContent.optionsPopup);
            _btnOptions.onInteractionOver.add(handleOptionsInteraction);
         }
         _optionsPopup.hide();
         _btnMailbox.visible = false;
         _btnGoals.visible = false;
         _realContent.mainNavigationBar.btnQuestsContent.info.caption.text = "!";
         _realContent.mainNavigationBar.btnQuestsContent.info.visible = false;
         _realContent.mainNavigationBar.btnWorkContent.info.caption.text = "!";
         _realContent.mainNavigationBar.btnWorkContent.info.visible = false;
         _realContent.mainNavigationBar.btnGuildContent.info.caption.text = "!";
         _realContent.mainNavigationBar.btnGuildContent.info.visible = false;
         _progressUpdater = new ProgressUpdater(_btnQuests,_btnDuels,_btnWork,_btnMovie);
         _anchorContainer.add(param1.premiumCurrencyPanel,AnchorPoint.TOP_RIGHT);
         _anchorContainer.add(param1.coinsPanel,AnchorPoint.TOP_RIGHT);
         _anchorContainer.add(param1.btnGoals,AnchorPoint.TOP_RIGHT);
         _anchorContainer.add(param1.playerPanel,AnchorPoint.TOP_LEFT);
         _anchorContainer.add(param1.btnMailbox,AnchorPoint.TOP_LEFT);
         _anchorContainer.add(param1.mainNavigationBar,AnchorPoint.RIGHT_FIXED,0.5);
         _anchorContainer.add(param1.mainNavigationBar,AnchorPoint.BOTTOM_FIXED);
         _anchorContainer.add(_btnOptions,AnchorPoint.BOTTOM_RIGHT);
         _anchorContainer.add(param1.optionsPopup,AnchorPoint.BOTTOM_RIGHT);
      }
      
      public static function get isGameSyncing() : Boolean
      {
         return _gameSyncing;
      }
      
      override public function refreshPanelLocalization() : void
      {
         if(AppConfig.dungeonsEnabled)
         {
            _btnQuests.tooltip = LocText.current.text("general/base_panel/quests_and_dungeons_tooltip");
         }
         else
         {
            _btnQuests.tooltip = LocText.current.text("general/base_panel/quests_tooltip");
         }
         _btnDuels.tooltip = LocText.current.text("general/base_panel/duel_tooltip");
         _btnCharacter.tooltip = LocText.current.text("general/base_panel/character_tooltip");
         _btnShop.tooltip = LocText.current.text("general/base_panel/item_shop_tooltip");
         _btnWork.tooltip = LocText.current.text("general/base_panel/work_tooltip");
         _btnBoosters.tooltip = LocText.current.text("general/base_panel/booster_tooltip");
         _btnLeaderboard.tooltip = LocText.current.text("general/base_panel/leaderboard_tooltip");
         _btnGuild.tooltip = LocText.current.text("general/base_panel/guild_tooltip");
         _btnBuyCurrency.tooltip = LocText.current.text("general/base_panel/buy_premium_tooltip");
         _btnMailbox.tooltip = LocText.current.text("general/base_panel/mailbox_tooltip");
         _btnGoals.tooltip = LocText.current.text("general/base_panel/goals_tooltip");
         refreshMovieButtonTooltip();
         _gameCurrencyPanel.refreshLocalization();
         _premiumCurrencyPanel.refreshLocalization();
         _optionsPopup.refreshLocalization();
      }
      
      private function refreshMovieButtonTooltip() : void
      {
         var _loc1_:String = LocText.current.text("general/base_panel/movie_tooltip");
         if(!_btnMovie.buttonEnabled)
         {
            _loc1_ = _loc1_ + "\n\n";
            _loc1_ = _loc1_ + LocText.current.text("general/base_panel/movie_locked",CConstant.movie_min_level);
         }
         _btnMovie.tooltip = _loc1_;
      }
      
      override public function dispose() : void
      {
         _btnQuests.dispose();
         _btnDuels.dispose();
         _btnCharacter.dispose();
         _btnShop.dispose();
         _btnWork.dispose();
         _btnBoosters.dispose();
         _btnLeaderboard.dispose();
         _btnMovie.dispose();
         _btnGuild.dispose();
         _btnBuyCurrency.dispose();
         _btnOptions.dispose();
         _btnMailbox.dispose();
         _btnGoals.dispose();
         _btnBuyPremiumCurrencyAB.dispose();
         _playerPanel.dispose();
         _premiumCurrencyPanel.dispose();
         _optionsPopup.dispose();
         _storyGoalsPanel.dispose();
         _btnQuests = null;
         _btnDuels = null;
         _btnCharacter = null;
         _btnShop = null;
         _btnWork = null;
         _btnBoosters = null;
         _btnLeaderboard = null;
         _btnMovie = null;
         _btnGuild = null;
         _btnBuyCurrency = null;
         _btnOptions = null;
         _btnMailbox = null;
         _btnGoals = null;
         _btnBuyPremiumCurrencyAB = null;
         _playerPanel = null;
         _optionsPopup = null;
         if(_syncGameTimer != null)
         {
            _syncGameTimer.dispose();
            _syncGameTimer = null;
         }
         _storyGoalsPanel = null;
         super.dispose();
      }
      
      override public function refreshAppSize() : void
      {
         super.refreshAppSize();
         _optionsPopup.hide();
      }
      
      override public function refresh() : void
      {
         super.refresh();
         _playerPanel.refresh();
         _gameCurrencyPanel.refresh();
         _premiumCurrencyPanel.refresh();
         _optionsPopup.refresh();
         _storyGoalsPanel.refresh();
         if(_syncGameTimer == null)
         {
            _syncGameTimer = Environment.createTimer("PanelBaseUser::syncGame",60000,onSynGame);
            _syncGameTimer.start();
         }
         var _loc1_:Character = User.current.character;
         _btnBuyPremiumCurrencyAB.visible = _loc1_.hasTutorialFlag("tutorial_finished");
         _btnDuels.highlighted = _loc1_.activeDuel != null;
         _btnCharacter.highlighted = _loc1_.statPointsAvailable > 0 || _loc1_.newTitlesCount > 0;
         if(_loc1_.workProgress == 100)
         {
            _btnWork.highlighted = true;
            _realContent.mainNavigationBar.btnWorkContent.info.visible = true;
         }
         else
         {
            _btnWork.highlighted = false;
            _realContent.mainNavigationBar.btnWorkContent.info.visible = false;
         }
         if(_loc1_.activeQuest || _loc1_.activeDungeonQuest || _loc1_.activeConventionShow)
         {
            if(AppConfig.dungeonsEnabled)
            {
               _btnQuests.tooltip = LocText.current.text("general/base_panel/quests_and_dungeons_tooltip");
            }
            else
            {
               _btnQuests.tooltip = LocText.current.text("general/base_panel/quests_tooltip");
            }
         }
         else
         {
            _btnQuests.buttonEnabled = true;
            _btnWork.buttonEnabled = true;
            _btnQuests.highlighted = false;
            _btnCharacter.tooltip = LocText.current.text("general/base_panel/character_tooltip");
            if(AppConfig.dungeonsEnabled)
            {
               _btnQuests.tooltip = LocText.current.text("general/base_panel/quests_and_dungeons_tooltip");
            }
            else
            {
               _btnQuests.tooltip = LocText.current.text("general/base_panel/quests_tooltip");
            }
            _btnWork.tooltip = LocText.current.text("general/base_panel/work_tooltip");
            _btnBoosters.tooltip = LocText.current.text("general/base_panel/booster_tooltip");
            _btnShop.tooltip = LocText.current.text("general/base_panel/item_shop_tooltip");
         }
         refreshTitleBar();
         refreshSelection();
         if(_loc1_.level == 1 && !_loc1_.hasTutorialFlag("tutorial_finished"))
         {
            _btnDuels.visible = false;
            _btnWork.visible = false;
            _btnBoosters.visible = false;
            _btnShop.visible = false;
            _btnLeaderboard.visible = false;
            _btnMovie.visible = false;
            _btnGuild.visible = false;
            _btnBuyCurrency.visible = false;
            _backgroundNavigation.scaleX = 0.2;
            _progressUpdater.refresh();
         }
         else
         {
            refreshMainNavigationButtons();
         }
         if(_btnMovie.visible && _btnMovie.buttonEnabled && _loc1_.movie)
         {
            if(_loc1_.movie.activeMovieQuest || _loc1_.movie.isComplete || _loc1_.movie.hasClaimableStars)
            {
               _btnMovie.highlighted = true;
            }
            else
            {
               _btnMovie.highlighted = false;
            }
         }
         else
         {
            _btnMovie.highlighted = false;
         }
         refreshMissedDuelsBubble();
         refreshNewMessagesBubble();
         refreshBuyButtonHint();
         refreshGoalIcon();
         refreshBoosterInfoBubble();
         refreshLeaderboardInfoBubble();
      }
      
      public function refreshMissedDuelsBubble() : void
      {
         var _loc1_:Character = User.current.character;
         _btnDuels.bringToTop();
         if(User.current.autoShowMissedDuels && _loc1_.missedDuels > 0 && _loc1_.hasTutorialFlag("tutorial_finished"))
         {
            UiCounterBubble.setIntValue(_realContent.mainNavigationBar.btnDuelsContent.counterMissedDuels,_loc1_.missedDuels);
            _btnDuels.tooltip = LocText.current.text("general/base_panel/duel_hint",_loc1_.missedDuels);
         }
         else
         {
            _btnDuels.tooltip = LocText.current.text("general/base_panel/duel_tooltip");
         }
         _realContent.mainNavigationBar.btnDuelsContent.counterMissedDuels.visible = User.current.autoShowMissedDuels && _loc1_.missedDuels > 0 && _loc1_.hasTutorialFlag("tutorial_finished") && _btnDuels.visible;
      }
      
      public function refreshNewMessagesBubble() : void
      {
         if(DialogNewUserVoucher.isOpen)
         {
            return;
         }
         var _loc1_:Character = User.current.character;
         var _loc2_:int = _loc1_.totalNewMessages;
         if(_loc2_ > 0)
         {
            UiCounterBubble.setIntValue(_realContent.btnMailbox.counterUnread,_loc2_);
            _btnMailbox.tooltip = LocText.current.text("general/base_panel/mailbox_unread_tooltip",_loc2_);
         }
         else
         {
            _btnMailbox.tooltip = LocText.current.text("general/base_panel/mailbox_tooltip");
         }
         _realContent.btnMailbox.counterUnread.visible = _loc2_ > 0;
      }
      
      private function refreshBuyButtonHint() : void
      {
         var _loc1_:Character = User.current.character;
         _realContent.mainNavigationBar.btnBuyCurrencyContent.buyButtonHint.removeAllChildren();
         _btnBuyCurrency.tooltip = LocText.current.text("general/base_panel/buy_premium_tooltip");
         _btnBuyCurrency.textTooltip.positionType = 1;
         _btnBuyCurrency.textTooltip.offset = 0;
         Environment.billing.requestProducts(onRequestProductsComplete,false,DialogPaymentBase.currentPaymentLocale);
      }
      
      public function refreshGameCurrencyPanel(param1:int) : void
      {
         _gameCurrencyPanel.offset = _gameCurrencyPanel.offset + param1;
         _gameCurrencyPanel.refresh();
      }
      
      private function onRequestProductsComplete(param1:Vector.<IBillingProduct>) : void
      {
         var _loc4_:* = null;
         var _loc3_:* = null;
         if(!param1 || param1.length == 0)
         {
            return;
         }
         var _loc6_:int = 0;
         var _loc5_:* = param1;
         for each(var _loc2_ in param1)
         {
            _loc4_ = _loc2_.info as AppPremiumSpecialBillingProductInfo;
            if(_loc4_)
            {
               if(_loc4_.modifyBuyButton)
               {
                  _loc3_ = _realContent.mainNavigationBar.btnBuyCurrencyContent.buyButtonHint;
                  _btnBuyCurrency.tooltip = LocText.current.text("general/base_panel/buy_premium_tooltip_special_offers",_loc4_.timeRemainingString);
                  _btnBuyCurrency.textTooltip.positionType = 4;
                  _btnBuyCurrency.textTooltip.offset = -10;
                  _loc3_.bringToTop();
                  _loc3_.setUriSprite(_loc4_.buyButtonGraphicHintImage,50,50,true,1,null,true);
                  break;
               }
            }
         }
      }
      
      public function refreshGoalIcon(param1:Boolean = false, param2:Boolean = false) : void
      {
         if(User.current == null || User.current.character == null)
         {
            return;
         }
         if(param1)
         {
            _hideGoalExclamationMark = true;
         }
         else if(!param1 && param2)
         {
            _hideGoalExclamationMark = false;
         }
         _btnGoals.refresh(_hideGoalExclamationMark);
      }
      
      public function refreshBoosterInfoBubble(param1:Boolean = false) : void
      {
         if(User.current == null || User.current.character == null)
         {
            return;
         }
         if(param1)
         {
            _hideBoosterBubble = true;
         }
         var _loc2_:Character = User.current.character;
         _btnBoosters.bringToTop();
         if(_loc2_.missingBoosterCount > 0 && _loc2_.level >= 10)
         {
            UiCounterBubble.setStringValue(_realContent.mainNavigationBar.btnBoostersContent.info,"!");
            if(_loc2_.missingBoosterCount == 3)
            {
               _btnBoosters.tooltip = LocText.current.text("general/base_panel/booster_hint_all_missing");
            }
            else if(_loc2_.missingBoosterCount == 2)
            {
               _btnBoosters.tooltip = LocText.current.text("general/base_panel/booster_hint_two_missing");
            }
            else if(_loc2_.missingBoosterCount == 1)
            {
               _btnBoosters.tooltip = LocText.current.text("general/base_panel/booster_hint_one_missing");
            }
         }
         else
         {
            _btnBoosters.tooltip = LocText.current.text("general/base_panel/booster_tooltip");
         }
         _realContent.mainNavigationBar.btnBoostersContent.info.visible = _loc2_.missingBoosterCount > 0 && _loc2_.level >= 10 && _btnBoosters.visible && !_hideBoosterBubble;
      }
      
      private function refreshLeaderboardInfoBubble() : void
      {
         var _loc1_:Character = User.current.character;
         _btnLeaderboard.bringToTop();
         var _loc2_:int = 0;
         if(AppConfig.movieTournamentsEnabled == true)
         {
            _loc2_ = _loc2_ + _loc1_.pendingMovieTournamentRewards;
         }
         _loc2_ = _loc2_ + _loc1_.pendingSoloGuildCompetitionTournamentRewards;
         if(_loc2_ > 0)
         {
            UiCounterBubble.setIntValue(_realContent.mainNavigationBar.btnLeaderboardContent.info,_loc2_);
         }
         _realContent.mainNavigationBar.btnLeaderboardContent.info.visible = _loc2_ > 0 && _btnLeaderboard.visible;
      }
      
      public function onSynGame() : void
      {
         if(!User.current)
         {
            if(_syncGameTimer)
            {
               _syncGameTimer.stop();
            }
            return;
         }
         if(_lastSyncDate == -1)
         {
            _lastSyncDate = TimeUtil.serverDateTime.date;
         }
         var _loc1_:int = TimeUtil.serverDateTime.date;
         if(_loc1_ != _lastSyncDate)
         {
            Environment.billing.resetProducts();
         }
         _lastSyncDate = _loc1_;
         if(NetworkCore.current.serverConnection.isSocketTransportActive && SyncStates.isSyncGameDataSynced)
         {
            return;
         }
         syncGame();
      }
      
      public function syncGame() : void
      {
         if(!User.current || !Application.userController.isLoggedIn)
         {
            return;
         }
         if(_gameSyncing || _syncGamePending)
         {
            return;
         }
         _syncGamePending = true;
         §§push(new ApplicationRequest("syncGame",SyncStates.syncGameData.rawData,handleRequestSyncGame,null,null,2,false));
      }
      
      public function refreshTitleBar() : void
      {
         if(!User.current)
         {
            platform.setPageTitle(LocText.current.text("general/common_title_bar"),"");
            return;
         }
         var _loc1_:Character = User.current.character;
         if(ViewManager.instance.activePanel == "duels")
         {
            if(!_loc1_.hasAvailableFreeDuel)
            {
               platform.setActivityTime(LocText.current.text("general/free_attack_title_bar"),LocText.current.text("general/free_attack_available_title_bar"),Math.max(0,_loc1_.secondsToNextFreeDuel),1000,ViewManager.instance.titleBarPrefix);
               return;
            }
         }
         if(ViewManager.instance.activePanel == "movie_progress")
         {
            if(_loc1_.movie && !_loc1_.movie.activeMovieQuest && !_loc1_.hasEnoughEnergyForMovieQuest)
            {
               platform.setActivityTime(LocText.current.text("general/free_movie_quest_title_bar"),LocText.current.text("general/free_movie_quest_available_title_bar"),Math.max(0,_loc1_.secondsToNextMovieQuest),1000,ViewManager.instance.titleBarPrefix);
               return;
            }
         }
         if(_loc1_.activeQuest)
         {
            platform.setActivityTime(LocText.current.text("general/occupied_with_quest_title_bar"),LocText.current.text("general/completed_quest_title_bar"),Math.min(_loc1_.activeQuest.remainingSeconds,_loc1_.activeQuest.duration),1000,ViewManager.instance.titleBarPrefix);
         }
         else if(_loc1_.activeConventionShow)
         {
            platform.setActivityTime(LocText.current.text("general/occupied_with_quest_title_bar"),LocText.current.text("general/completed_quest_title_bar"),Math.min(_loc1_.activeConventionShow.remainingSeconds,_loc1_.activeConventionShow.duration),1000,ViewManager.instance.titleBarPrefix);
         }
         else if(_loc1_.currentDungeon)
         {
            platform.setActivityTime(LocText.current.text("general/active_dungeon_title_bar"),LocText.current.text("general/time_up_dungeon_title_bar"),Math.min(_loc1_.currentDungeon.remainingSeconds,_loc1_.currentDungeon.durationInSeconds),1000,ViewManager.instance.titleBarPrefix);
         }
         else
         {
            platform.setPageTitle(LocText.current.text("general/common_title_bar"),ViewManager.instance.titleBarPrefix);
         }
      }
      
      public function showTopIcons(param1:Boolean, param2:Boolean = false) : void
      {
         var _loc4_:int = 0;
         var _loc3_:int = 0;
         if(!User.current || User.current == null)
         {
            _btnMailbox.visible = false;
            _btnGoals.visible = false;
         }
         else
         {
            _loc4_ = User.current.character.canMail && param1?1:0;
            _loc3_ = User.current.character.hasTutorialFlag("tutorial_finished") && param1?1:0;
            if(param2)
            {
               _btnMailbox.killTweens();
               _btnMailbox.tweenTo(0.5,{
                  "delay":0.2,
                  "autoAlpha":_loc4_
               });
               _btnGoals.killTweens();
               _btnGoals.tweenTo(0.5,{
                  "delay":0.2,
                  "autoAlpha":_loc3_
               });
            }
            else
            {
               _btnMailbox.visible = _loc4_ == 1;
               _btnMailbox.alpha = _loc4_;
               _btnGoals.visible = _loc3_ == 1;
               _btnGoals.alpha = _loc3_;
            }
         }
      }
      
      public function showUI(param1:Boolean) : void
      {
         if(param1)
         {
            if(!_vo.visible || _vo.alpha < 1)
            {
               _vo.tweenTo(0.5,{
                  "delay":0.2,
                  "autoAlpha":1
               });
            }
         }
         else
         {
            _vo.tweenTo(0.5,{
               "delay":0.2,
               "autoAlpha":0
            });
         }
      }
      
      public function showUserBars(param1:Boolean, param2:Boolean = false, param3:Boolean = false) : void
      {
         var _loc5_:Vector.<IDisplayObject> = new Vector.<IDisplayObject>();
         _loc5_.push(_realContent.playerPanel);
         _loc5_.push(_realContent.storyGoalsIconContainer);
         _loc5_.push(_realContent.storyGoalsContainer);
         if(param2)
         {
            _loc5_.push(_realContent.coinsPanel);
            _loc5_.push(_realContent.premiumCurrencyPanel);
         }
         var _loc4_:int = !!param1?1:0;
         var _loc8_:int = 0;
         var _loc7_:* = _loc5_;
         for each(var _loc6_ in _loc5_)
         {
            if(param3)
            {
               _loc6_.killTweens();
               _loc6_.tweenTo(0.5,{
                  "delay":0.2,
                  "autoAlpha":_loc4_
               });
            }
            else
            {
               _loc6_.visible = param1;
               _loc6_.alpha = _loc4_;
            }
         }
      }
      
      override public function reset() : void
      {
         refreshMainNavigationButtons();
         _hideBoosterBubble = false;
         _hideGoalExclamationMark = false;
         _playerPanel.reset();
         _gameCurrencyPanel.reset();
         _premiumCurrencyPanel.reset();
         stopSyncGame();
      }
      
      public function stopSyncGame() : void
      {
         if(_syncGameTimer != null)
         {
            _syncGameTimer.dispose();
            _syncGameTimer = null;
         }
      }
      
      public function refreshQuestBubble() : void
      {
         var _loc1_:Character = User.current.character;
         _realContent.mainNavigationBar.btnQuestsContent.info.visible = _loc1_.activeQuest != null && _loc1_.activeQuest.isFinished || _loc1_.activeDungeonQuest != null && _loc1_.activeDungeonQuest.isFinished || _loc1_.activeConventionShow != null && _loc1_.activeConventionShow.isFinished || _loc1_.hasUnassignedEventQuest || _loc1_.eventQuest != null && _loc1_.eventQuest.isAvailable && _loc1_.eventQuest.isStarted && _loc1_.eventQuest.collectableObjectiveCount > 0 || _loc1_.herobook != null && _loc1_.level >= CConstant.herobook_min_level && (_loc1_.herobook.newObjectives || _loc1_.herobook.collectableObjectiveCount > 0);
         if(_realContent.mainNavigationBar.btnQuestsContent.info.visible)
         {
            _btnQuests.highlighted = true;
         }
      }
      
      public function refreshMainNavigationButtons() : void
      {
         if(!User.current)
         {
            return;
         }
         var _loc1_:Character = User.current.character;
         _btnQuests.buttonEnabled = _loc1_.level == 1 && !_loc1_.hasTutorialFlag("tutorial_finished") || _btnQuests.buttonEnabled && _loc1_.hasTutorialFlag("tutorial_finished");
         _btnShop.buttonEnabled = _loc1_.hasTutorialFlag("stats_spent") || _loc1_.level == 2 && !_loc1_.hasAvailableStatPoints || _loc1_.level > 2 || _loc1_.hasTutorialFlag("tutorial_finished");
         _btnCharacter.visible = true;
         _btnQuests.visible = true;
         _btnDuels.visible = _loc1_.hasTutorialFlag("first_item") || _loc1_.hasTutorialFlag("tutorial_finished");
         _btnWork.visible = _loc1_.hasTutorialFlag("tutorial_finished");
         _btnBoosters.visible = _loc1_.hasTutorialFlag("tutorial_finished");
         _btnShop.visible = _loc1_.hasTutorialFlag("mission_shown") || _loc1_.hasTutorialFlag("tutorial_finished");
         _btnLeaderboard.visible = _loc1_.hasTutorialFlag("tutorial_finished");
         _btnMovie.visible = _loc1_.hasTutorialFlag("tutorial_finished");
         _btnGuild.visible = _loc1_.hasTutorialFlag("tutorial_finished");
         _btnBuyCurrency.visible = _loc1_.hasTutorialFlag("tutorial_finished");
         if(!_loc1_.hasTutorialFlag("tutorial_finished"))
         {
            if(_loc1_.hasTutorialFlag("first_item"))
            {
               _backgroundNavigation.scaleX = 0.38;
            }
            else if(_loc1_.hasTutorialFlag("mission_shown"))
            {
               _backgroundNavigation.scaleX = 0.28;
            }
         }
         else
         {
            _backgroundNavigation.scaleX = 1;
         }
         _btnQuests.highlighted = _loc1_.hasNewConventionIds || _loc1_.hasFinishedConventionIds || PanelCitymap.unlockedStage > 0 || PanelCitymap.unlockedDungeon != "";
         _progressUpdater.refresh();
         refreshQuestBubble();
         if(_btnQuests.highlighted)
         {
            if(AppConfig.dungeonsEnabled)
            {
               _btnQuests.tooltip = LocText.current.text("general/base_panel/quests_and_dungeons_tooltip");
            }
            else
            {
               _btnQuests.tooltip = LocText.current.text("general/base_panel/quests_tooltip");
            }
         }
         _btnMovie.buttonEnabled = _loc1_.level >= CConstant.movie_min_level;
         refreshMovieButtonTooltip();
      }
      
      public function highlightGuildButton() : void
      {
         if(!User.current)
         {
            return;
         }
         if(ViewManager.instance.activePanel != "guild")
         {
            _btnGuild.highlighted = true;
         }
      }
      
      public function pendingGuildBattle() : void
      {
         if(!User.current)
         {
            return;
         }
         if(ViewManager.instance.activePanel != "guild")
         {
            _btnGuild.highlighted = true;
            _realContent.mainNavigationBar.btnGuildContent.info.visible = true;
         }
      }
      
      public function get isGuildButtonHighlighted() : Boolean
      {
         if(!User.current)
         {
            return false;
         }
         return _btnGuild.highlighted;
      }
      
      public function resetGuildButton() : void
      {
         if(!User.current)
         {
            return;
         }
         _btnGuild.highlighted = false;
         _realContent.mainNavigationBar.btnGuildContent.info.visible = false;
      }
      
      public function allowMainNavigationButtons(param1:Boolean) : void
      {
         _mainNavigationButtonsBlocked = !param1;
      }
      
      public function get areMainNavigationButtonsAllowed() : Boolean
      {
         return !_mainNavigationButtonsBlocked;
      }
      
      public function fadeOutMainNavigationButtons() : void
      {
         _mainNavigationButtonsBlocked = true;
         _realContent.mainNavigationBar.killTweens();
         var _loc1_:Number = _realContent.mainNavigationBar.alpha * 0.5;
         var _loc2_:Number = _realContent.mainNavigationBar.alpha == 1?0.2:0;
         _realContent.mainNavigationBar.tweenTo(_loc1_,{
            "delay":_loc2_,
            "autoAlpha":0
         });
      }
      
      public function fadeInMainNavigationButtons() : void
      {
         _mainNavigationButtonsBlocked = false;
         _realContent.mainNavigationBar.killTweens();
         var _loc1_:Number = 0.5 - _realContent.mainNavigationBar.alpha * 0.5;
         var _loc2_:Number = _realContent.mainNavigationBar.alpha == 0?0.2:0;
         _realContent.mainNavigationBar.tweenTo(_loc1_,{
            "delay":_loc2_,
            "autoAlpha":1
         });
      }
      
      public function refreshSelection() : void
      {
         _btnQuests.selected = ViewManager.instance.activePanel == "quests" || ViewManager.instance.activePanel == "quest_progress" || ViewManager.instance.activePanel == "dungeon" || ViewManager.instance.activePanel == "battle" && User.current.character.activeQuest != null || ViewManager.instance.activePanel == "stat_quest" && User.current.character.activeQuest != null || ViewManager.instance.activePanel == "battle" && User.current.character.activeDungeonQuest != null || ViewManager.instance.activePanel == "stat_quest" && User.current.character.activeDungeonQuest != null || ViewManager.instance.activePanel == "battle" && User.current.character.activeConventionShow != null;
         _btnDuels.selected = ViewManager.instance.activePanel == "duels" || ViewManager.instance.activePanel == "battle" && User.current.character.activeDuel != null;
         _btnWork.selected = ViewManager.instance.activePanel == "work_new";
         _btnShop.selected = ViewManager.instance.activePanel == "shop";
         _btnCharacter.selected = ViewManager.instance.activePanel == "character" || ViewManager.instance.activePanel == "character_appearance";
         _btnMovie.selected = ViewManager.instance.activePanel == "movie_offers" || ViewManager.instance.activePanel == "movie_progress";
         _btnGuild.selected = ViewManager.instance.activePanel == "guild";
      }
      
      private function onClickQuests(param1:InteractionEvent) : void
      {
         if(_mainNavigationButtonsBlocked)
         {
            return;
         }
         var _loc2_:int = User.current.character.currentLocation;
         if((User.current.character.activeQuest || User.current.character.activeConventionShow) && User.current.character.activeDungeonQuest)
         {
            if(_loc2_ == 2)
            {
               ViewManager.instance.showPanel("quest_progress");
            }
            else if(_loc2_ == 3)
            {
               ViewManager.instance.showPanel("dungeon");
            }
         }
         if(User.current.character.activeQuest || User.current.character.activeConventionShow)
         {
            ViewManager.instance.showPanel("quest_progress");
         }
         else if(User.current.character.activeDungeonQuest)
         {
            ViewManager.instance.showPanel("dungeon");
         }
         else if(PanelCitymap.unlockedStage > 0)
         {
            ViewManager.instance.showPanel("citymap");
         }
         else
         {
            switch(int(_loc2_))
            {
               case 0:
                  ViewManager.instance.showPanel("quests");
                  break;
               case 1:
               case 2:
                  ViewManager.instance.showPanel("citymap");
                  break;
               case 3:
                  PanelDungeon.visualizeEnter = true;
                  ViewManager.instance.showPanel("dungeon");
            }
         }
      }
      
      private function onClickDuels(param1:InteractionEvent) : void
      {
         if(_mainNavigationButtonsBlocked)
         {
            return;
         }
         if(User.current.character.activeDuel)
         {
            if(User.current.showDuelBattles)
            {
               PanelBattle.activeDuel = User.current.character.activeDuel;
               ViewManager.instance.showPanel("battle");
            }
            else
            {
               PanelBattle.lastViewedMode = 2;
               MessageRouter.dispatch(new Message("ViewMessage.notifyBattleFinished",null,this));
               ViewManager.instance.showPanel("duels");
            }
         }
         else
         {
            ViewManager.instance.showPanel("duels");
         }
      }
      
      private function onClickCharacter(param1:InteractionEvent) : void
      {
         if(_mainNavigationButtonsBlocked)
         {
            return;
         }
         ViewManager.instance.showPanel("character");
      }
      
      private function onClickShop(param1:InteractionEvent) : void
      {
         if(_mainNavigationButtonsBlocked)
         {
            return;
         }
         ViewManager.instance.showPanel("shop");
      }
      
      private function onClickWork(param1:InteractionEvent) : void
      {
         if(_mainNavigationButtonsBlocked)
         {
            return;
         }
         ViewManager.instance.showPanel("work_new");
      }
      
      private function onClickBoosters(param1:InteractionEvent) : void
      {
         if(_mainNavigationButtonsBlocked)
         {
            return;
         }
         ViewManager.instance.showBoosterDialog();
      }
      
      private function onClickLeaderboard(param1:InteractionEvent) : void
      {
         if(_mainNavigationButtonsBlocked)
         {
            return;
         }
         if(AppConfig.movieTournamentsEnabled == true && User.current.character.pendingMovieTournamentRewards)
         {
            Environment.application.sendActionRequest("getMovieTournamentRewards",{},handleRequests);
            return;
         }
         if(User.current.character.pendingSoloGuildCompetitionTournamentRewards > 0)
         {
            Environment.application.sendActionRequest("getSoloGuildCompetitionTournamentReward",{},handleRequests);
            return;
         }
         Environment.panelManager.showDialog(new DialogLeaderboard());
      }
      
      private function onClickMovie(param1:InteractionEvent) : void
      {
         if(_mainNavigationButtonsBlocked)
         {
            return;
         }
         if(User.current.character.hasMovie)
         {
            ViewManager.instance.showPanel("movie_progress");
         }
         else
         {
            ViewManager.instance.showPanel("movie_offers");
         }
      }
      
      private function onClickGuild(param1:InteractionEvent) : void
      {
         if(_mainNavigationButtonsBlocked)
         {
            return;
         }
         ViewManager.instance.showPanel("guild");
      }
      
      private function onClickBuyCurrency(param1:InteractionEvent) : void
      {
         if(_mainNavigationButtonsBlocked)
         {
            return;
         }
         ViewManager.instance.showBuyCurrencyDialog();
      }
      
      private function onClickMailbox(param1:InteractionEvent) : void
      {
         openMailboxDialog();
      }
      
      private function handleOptionsInteraction(param1:InteractionEvent) : void
      {
         _optionsPopup.show();
      }
      
      public function get currentMailboxDialog() : DialogMailbox
      {
         return _currentMailboxDialog;
      }
      
      public function openMailboxDialog(param1:Boolean = false) : void
      {
         _currentMailboxDialog = new DialogMailbox(param1);
         Environment.panelManager.showDialog(_currentMailboxDialog);
      }
      
      private function handleOptionsMouseOver(param1:InteractionEvent) : void
      {
         _optionsPopup.show();
      }
      
      public function resetCurrentMailboxDialog() : void
      {
         _currentMailboxDialog = null;
      }
      
      private function handleRequestSyncGame(param1:String, param2:RequestData, param3:Object, param4:String) : void
      {
         var _loc6_:* = null;
         var _loc5_:int = 0;
         var _loc8_:* = null;
         var _loc7_:* = null;
         var _loc9_:* = param1;
         if("syncGame" !== _loc9_)
         {
            throw new Error("Unsupported request action \'" + param1 + "\'!");
         }
         _loc6_ = new TypedObject(param3);
         _syncGamePending = false;
         if(param4 == "")
         {
            SyncStates.pendingSyncGame = false;
            if(!User.current)
            {
               return;
            }
            _gameSyncing = true;
            _loc5_ = User.current.character.newMessages;
            Environment.application.updateData(param3);
            if(!_hasAvailableFreeDuelLastSync && User.current.character.hasAvailableFreeDuel)
            {
               Environment.audio.playFX("duel_stamina_refill.mp3");
            }
            _hasAvailableFreeDuelLastSync = User.current.character.hasAvailableFreeDuel;
            refreshMissedDuelsBubble();
            refreshNewMessagesBubble();
            refreshBoosterInfoBubble();
            refreshLeaderboardInfoBubble();
            if(_loc5_ != User.current.character.newMessages)
            {
               Mailbox.reload = true;
            }
            if(_currentMailboxDialog != null)
            {
               _currentMailboxDialog.mailContent.loadMessages();
               _currentMailboxDialog.requestsContent.loadRequests();
            }
            if(_loc6_.hasData("character",true))
            {
               if(ViewManager.instance.activePanel == "quests")
               {
                  (ViewManager.instance.activePanelInstance as PanelQuests).checkForConventionInfo();
               }
               if(ViewManager.instance.activePanel == "quest_progress")
               {
                  (ViewManager.instance.activePanelInstance as PanelQuestProgress).checkForConventionInfo();
               }
               refreshMainNavigationButtons();
            }
            if(platform.isKongregate)
            {
               _loc8_ = PlatformConfig.kongregateUserId;
               _loc7_ = PlatformConfig.kongregateGameAuthToken;
               Environment.application.sendActionRequest("submitKongregateStatistic",{
                  "kongregate_user_id":_loc8_,
                  "kongregate_game_auth_token":_loc7_,
                  "statistic_name":"honor"
               },null,false);
            }
            _gameSyncing = false;
            if(_loc6_.hasData("sync_timestamp"))
            {
               SyncStates.updateSyncGameDataInfo(_loc6_.getInt("sync_timestamp"));
            }
         }
         else if(param4 == "errorIO" || param4 == "errorIO 0" || param4 == "errorIO 2032")
         {
            Environment.reportError("syncGameErrorIO",param2,false,true);
         }
         else
         {
            if(_syncGameTimer)
            {
               _syncGameTimer.stop();
            }
            Environment.reportError(param4,param2);
         }
      }
      
      private function handleRequests(param1:ActionRequestResponse) : void
      {
         var _loc2_:* = param1.action;
         switch(_loc2_)
         {
            case "getMovieTournamentRewards":
               if(param1.error == "")
               {
                  Environment.application.updateData(param1.data);
                  if(param1.appResponse.hasData("tournament_movie_rewards"))
                  {
                     if(param1.appResponse.tournament_movie_rewards.hasData("vote_rewards") || param1.appResponse.tournament_movie_rewards.getString("vote_rewards") == "")
                     {
                        Environment.application.sendActionRequest("claimMovieTournamentRewards",{},handleRequests,false);
                     }
                     else
                     {
                        Environment.panelManager.showDialog(new DialogMovieTournamentResult(param1.appResponse.tournament_movie_rewards));
                     }
                  }
                  else if(User.current.character.pendingSoloGuildCompetitionTournamentRewards > 0)
                  {
                     Environment.application.sendActionRequest("getSoloGuildCompetitionTournamentReward",{},handleRequests);
                  }
                  else
                  {
                     Environment.panelManager.showDialog(new DialogLeaderboard());
                  }
               }
               else if(param1.error == "errTournamentLocked")
               {
                  if(User.current.character.pendingSoloGuildCompetitionTournamentRewards > 0)
                  {
                     Environment.application.sendActionRequest("getSoloGuildCompetitionTournamentReward",{},handleRequests);
                  }
                  else
                  {
                     Environment.panelManager.showDialog(new DialogLeaderboard());
                  }
               }
               else
               {
                  Environment.reportError(param1.error,param1.request);
               }
               break;
            case "claimMovieTournamentRewards":
               if(param1.error == "")
               {
                  Environment.application.updateData(param1.data);
                  if(AppConfig.movieTournamentsEnabled == true && User.current.character.pendingMovieTournamentRewards)
                  {
                     Environment.application.sendActionRequest("getMovieTournamentRewards",{},handleRequests);
                     return;
                  }
                  Environment.panelManager.showDialog(new DialogLeaderboard());
               }
               else if(param1.error != "errClaimMovieTournamentRewardsNoRewards")
               {
                  Environment.reportError(param1.error,param1.request);
               }
               break;
            case "getSoloGuildCompetitionTournamentReward":
               if(param1.error == "")
               {
                  Environment.application.updateData(param1.data);
                  if(param1.appResponse.hasData("tournament_solo_guild_competition_reward"))
                  {
                     Environment.panelManager.showDialog(new DialogSoloGuildCompetitionReward(param1.appResponse.tournament_solo_guild_competition_reward));
                  }
                  else
                  {
                     Environment.panelManager.showDialog(new DialogLeaderboard());
                  }
               }
               else if(param1.error == "errTournamentLocked")
               {
                  Environment.panelManager.showDialog(new DialogLeaderboard());
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
   }
}
