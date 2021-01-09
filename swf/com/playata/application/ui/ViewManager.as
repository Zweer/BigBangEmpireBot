package com.playata.application.ui
{
   import com.playata.application.AppConfig;
   import com.playata.application.AppEnvironment;
   import com.playata.application.advertisment.AppVideoAdvertisment;
   import com.playata.application.data.GameUtil;
   import com.playata.application.data.bonus.BonusInfo;
   import com.playata.application.data.character.Character;
   import com.playata.application.data.event.IngameNotification;
   import com.playata.application.data.guild.Guild;
   import com.playata.application.data.inventory.Inventory;
   import com.playata.application.data.item_pattern.ItemPatterns;
   import com.playata.application.data.optical_changes.OpticalChangeAnimation;
   import com.playata.application.data.optical_changes.OpticalChanges;
   import com.playata.application.data.server.SyncStates;
   import com.playata.application.data.story_dungeon.StoryDungeon;
   import com.playata.application.data.user.User;
   import com.playata.application.messaging.Message;
   import com.playata.application.messaging.MessageRouter;
   import com.playata.application.platform.ServerInfo;
   import com.playata.application.ui.dialogs.DialogAppRating;
   import com.playata.application.ui.dialogs.DialogBonusInfoNotification;
   import com.playata.application.ui.dialogs.DialogBoosters;
   import com.playata.application.ui.dialogs.DialogBuyPaymentOffers;
   import com.playata.application.ui.dialogs.DialogConventionInfo;
   import com.playata.application.ui.dialogs.DialogCustomizeItemResult;
   import com.playata.application.ui.dialogs.DialogEventQuestIntro;
   import com.playata.application.ui.dialogs.DialogFriendInvite;
   import com.playata.application.ui.dialogs.DialogGuildDonation;
   import com.playata.application.ui.dialogs.DialogGuildSearch;
   import com.playata.application.ui.dialogs.DialogIngameNotification;
   import com.playata.application.ui.dialogs.DialogLeaderboard;
   import com.playata.application.ui.dialogs.DialogLevelUp;
   import com.playata.application.ui.dialogs.DialogOptInMarketing;
   import com.playata.application.ui.dialogs.DialogStageUnlocked;
   import com.playata.application.ui.dialogs.DialogStoryDungeonUnlocked;
   import com.playata.application.ui.dialogs.DialogTutorialPopup;
   import com.playata.application.ui.dialogs.DialogUserStory;
   import com.playata.application.ui.effects.EffectsLayer;
   import com.playata.application.ui.elements.avatar.Avatar;
   import com.playata.application.ui.elements.avatar.AvatarAnimation;
   import com.playata.application.ui.elements.background.UiBackgroundFader;
   import com.playata.application.ui.elements.fullscreen.UiFullscreenBackground;
   import com.playata.application.ui.elements.generic.button.UiButton;
   import com.playata.application.ui.elements.generic.dialog.UiInfoDialog;
   import com.playata.application.ui.elements.generic.dialog.UiTwoChoiceDialog;
   import com.playata.application.ui.elements.guild.UiGuildChatTab;
   import com.playata.application.ui.elements.item.UiItemSlot;
   import com.playata.application.ui.elements.streaming.UiStreamingActor;
   import com.playata.application.ui.elements.tutorial.UiTutorialArrow;
   import com.playata.application.ui.panels.DefaultPanel;
   import com.playata.application.ui.panels.PanelBaseNoUser;
   import com.playata.application.ui.panels.PanelBaseUser;
   import com.playata.application.ui.panels.PanelBattle;
   import com.playata.application.ui.panels.PanelCharacter;
   import com.playata.application.ui.panels.PanelCharacterAppearance;
   import com.playata.application.ui.panels.PanelCharacterAppearancePhotographer;
   import com.playata.application.ui.panels.PanelCitymap;
   import com.playata.application.ui.panels.PanelCreateCharacter;
   import com.playata.application.ui.panels.PanelDuels;
   import com.playata.application.ui.panels.PanelDungeon;
   import com.playata.application.ui.panels.PanelGuild;
   import com.playata.application.ui.panels.PanelMovieOffers;
   import com.playata.application.ui.panels.PanelMovieProgress;
   import com.playata.application.ui.panels.PanelQuestProgress;
   import com.playata.application.ui.panels.PanelQuests;
   import com.playata.application.ui.panels.PanelShop;
   import com.playata.application.ui.panels.PanelSlotMachine;
   import com.playata.application.ui.panels.PanelStatQuest;
   import com.playata.application.ui.panels.PanelStreaming;
   import com.playata.application.ui.panels.PanelWorkNew;
   import com.playata.framework.application.Environment;
   import com.playata.framework.application.request.ActionRequestResponse;
   import com.playata.framework.core.collection.StringMap;
   import com.playata.framework.core.logging.Logger;
   import com.playata.framework.core.util.StringUtil;
   import com.playata.framework.display.AnchorContainer;
   import com.playata.framework.display.AnchorPoint;
   import com.playata.framework.display.DisplayCoreConfig;
   import com.playata.framework.display.IDisplayObjectContainer;
   import com.playata.framework.display.layout.LayoutUtil;
   import com.playata.framework.localization.LocText;
   import com.playata.framework.platform.PlatformConfig;
   import flash.geom.Point;
   import flash.geom.Rectangle;
   import visuals.ui.base.SymbolApplicationGeneric;
   import visuals.ui.panels.SymbolPanelsGeneric;
   
   public class ViewManager
   {
      
      private static var _instance:ViewManager = null;
       
      
      private var _anchorContainer:AnchorContainer;
      
      private var _panelsVo:SymbolPanelsGeneric = null;
      
      private var _fullscreenBackground:UiFullscreenBackground = null;
      
      private var _tutorialArrow:UiTutorialArrow = null;
      
      private var _panels:StringMap = null;
      
      private var _activePanel:String = "";
      
      private var _basePanel:String = "";
      
      private var _backgroundFader:UiBackgroundFader = null;
      
      private var _loggedIn:Boolean = false;
      
      private var _lockPanelRefresh:Boolean = false;
      
      private var _user:User = null;
      
      private var _lastNeededGameCurrency:int = 0;
      
      private var _lastNeededPremiumCurrency:int = 0;
      
      private var _onLoadedCharacter:Function = null;
      
      private var _onLoadedGuild:Function = null;
      
      public function ViewManager(param1:SymbolApplicationGeneric, param2:User)
      {
         var _loc3_:* = null;
         super();
         Logger.debug("[Application] Initializing view manager...");
         if(_instance != null)
         {
            throw new Error("ViewManager can only have a single instance!");
         }
         _instance = this;
         _panelsVo = param1.panels;
         _backgroundFader = new UiBackgroundFader(_panelsVo.backgroundFader);
         _tutorialArrow = new UiTutorialArrow(param1.panels.tutorial,param1.panels,Environment.display.displayContext.stage);
         _tutorialArrow.hide(true);
         _fullscreenBackground = new UiFullscreenBackground(param1.fullscreenBackground);
         MessageRouter.addListener("CharacterMessage.notifyLevelUp",handleMessages);
         MessageRouter.addListener("CharacterMessage.notifyStageUp",handleMessages);
         MessageRouter.addListener("CharacterMessage.notifyInitialStatPointsSpend",handleMessages);
         MessageRouter.addListener("CharacterMessage.notifyInventoryBag2Unlock",handleMessages);
         MessageRouter.addListener("CharacterMessage.notifyInventoryBag3Unlock",handleMessages);
         initPanels();
         _anchorContainer = new AnchorContainer(new Rectangle(0,0,DisplayCoreConfig.layout.appDefaultWidth,DisplayCoreConfig.layout.appDefaultHeight));
         _anchorContainer.add(_panelsVo.tutorial.lady,AnchorPoint.BOTTOM_FIXED);
         _anchorContainer.add(param1.infoMessage,AnchorPoint.RIGHT_FIXED,0.5);
         _anchorContainer.add(param1.infoMessage,AnchorPoint.BOTTOM_FIXED,0.5);
         _anchorContainer.add(_panelsVo.panelStatQuest,AnchorPoint.RIGHT_FIXED,0.5);
         _anchorContainer.add(_panelsVo.panelStatQuest,AnchorPoint.TOP_FIXED,0);
         if(Environment.layout.allowResize)
         {
            _loc3_ = LayoutUtil.deviceAdjustedAppSize;
            Environment.layout.appWidth = int(_loc3_.width);
            Environment.layout.appHeight = int(_loc3_.height);
            Environment.panelManager.refreshAppSize();
            refreshAppSize();
         }
         setUser(param2,true);
      }
      
      public static function get instance() : ViewManager
      {
         return _instance;
      }
      
      public function dispose() : void
      {
         Logger.debug("[Application] Destroying view manager...");
         destroyPanels();
         MessageRouter.removeAllListeners(handleMessages);
         _panelsVo = null;
         _user = null;
         _instance = null;
         _fullscreenBackground.dispose();
         _fullscreenBackground = null;
      }
      
      public function get lockPanelRefresh() : Boolean
      {
         return _lockPanelRefresh;
      }
      
      public function set lockPanelRefresh(param1:Boolean) : void
      {
         _lockPanelRefresh = param1;
      }
      
      public function setUser(param1:User, param2:Boolean = false) : void
      {
         Logger.debug("[Application] New user assigned to view manager...");
         _user = param1;
         if(_user == null)
         {
            _loggedIn = false;
         }
         else if(_user.character != null)
         {
            showIngameNotifications();
            showBonusInfoNotifications();
            if(AppConfig.battleSkillsEnabled)
            {
               showPendingItemCustomizations();
            }
            if(_loggedIn == false)
            {
               _loggedIn = true;
               if(_user.character.activeQuest && _user.character.activeQuest.stage == _user.character.currentQuestStage)
               {
                  showPanel("quest_progress");
               }
               else if(_user.character.activeConventionShow && _user.character.getActiveConventionByStage(_user.character.currentQuestStage))
               {
                  showPanel("quest_progress");
               }
               else if(_user.character.activeStoryDungeonBattle)
               {
                  showPanel("quests");
               }
               else if(_user.character.activeDuel)
               {
                  PanelBattle.activeDuel = _user.character.activeDuel;
                  showPanel("battle");
               }
               else if(_user.character.activeDungeonQuest)
               {
                  showPanel("dungeon");
               }
               else if(_user.character.movie && _user.character.movie.activeMovieQuest)
               {
                  showPanel("movie_progress");
               }
               else
               {
                  showPanel("character");
               }
            }
            else if(_activePanel != "quests" && _activePanel != "quest_progress" && _activePanel != "citymap" && _activePanel != "duels" && _activePanel != "battle" && _activePanel != "stat_quest" && _activePanel != "character" && _activePanel != "character_appearance" && _activePanel != "character_appearance_photographer" && _activePanel != "shop" && _activePanel != "work_new" && _activePanel != "streaming" && _activePanel != "dungeons" && _activePanel != "dungeon" && _activePanel != "movie_offers" && _activePanel != "movie_progress" && _activePanel != "slotmachine" && _activePanel != "guild")
            {
               showPanel("character");
            }
         }
         else
         {
            showPanel("create_character");
         }
         showBasePanels();
      }
      
      public function showIngameNotifications() : void
      {
         if(!_user.character.hasTutorialFlag("tutorial_finished"))
         {
            return;
         }
         var _loc1_:IngameNotification = _user.character.ingameNotifications.getNextIngameNotification();
         if(_loc1_ && !DialogIngameNotification.isOpen)
         {
            if(_loc1_.openOfferwallDialog && !Environment.platform.isOfferwallAllowed)
            {
               return;
            }
            Environment.panelManager.showDialog(new DialogIngameNotification(_loc1_));
         }
      }
      
      public function showBonusInfoNotifications() : void
      {
         if(!_user || !_user.character)
         {
            return;
         }
         if(!_user.character.hasTutorialFlag("tutorial_finished"))
         {
            return;
         }
         if(BonusInfo.needsDisplay && !DialogBonusInfoNotification.isOpen)
         {
            Environment.panelManager.showDialog(new DialogBonusInfoNotification());
         }
      }
      
      private function showPendingItemCustomizations() : void
      {
         if(_user.character.hasPendingItemCustomization && !DialogCustomizeItemResult.isOpen)
         {
            Environment.panelManager.showDialog(new DialogCustomizeItemResult(!_loggedIn));
         }
      }
      
      public function showPanel(param1:String, param2:Character = null, param3:Guild = null) : void
      {
         Logger.debug("[Application] Showing panel \'" + param1 + "\'...");
         ViewManager.instance.tutorialArrow.hide(true);
         if(param1 != _activePanel || param1 == "character" && characterPanel.customCharacter != null || param1 == "guild" && guildPanel.customGuild != null || param1 == "duels" && User.current.character.missedDuels > 0)
         {
            if(param1 != "create_character")
            {
               baseUserPanel.showUI(true);
            }
            AppEnvironment.appPlatform.trackPageView("/panel/" + param1);
            if(param1 == "character")
            {
               PanelCharacter._fadeIn = _activePanel != "character";
            }
            if(_activePanel != "")
            {
               activePanelInstance.hide();
               _panelsVo.removeChild(activePanelInstance.ui);
               _activePanel = "";
            }
            characterPanel.customCharacter = param2;
            guildPanel.customGuild = param3;
            _activePanel = param1;
            _panelsVo.addChildAt(activePanelInstance.ui,1);
            activePanelInstance.show();
            if(_basePanel == "base_user")
            {
               if(_activePanel == "battle" || _activePanel == "stat_quest" || _activePanel == "character_appearance")
               {
                  baseUserPanel.showTopIcons(false);
               }
               else
               {
                  baseUserPanel.showTopIcons(true);
               }
               if(param1 != "character_appearance")
               {
                  baseUserPanel.showUserBars(characterPanel.customCharacter == null);
               }
               baseUserPanel.refreshTitleBar();
               baseUserPanel.refreshSelection();
            }
         }
      }
      
      public function showCharacter(param1:Character) : void
      {
         if(_activePanel == "character")
         {
            characterPanel.customCharacter = param1;
         }
         else
         {
            showPanel("character",param1);
         }
         if(User.current.character.hasFriend(param1.userId))
         {
            AppEnvironment.friendBar.syncFriendBarCharacter(param1);
         }
      }
      
      public function showGuild(param1:Guild) : void
      {
         showPanel("guild",null,param1);
         guildPanel.customGuild = param1;
      }
      
      public function setBackground(param1:int, param2:Point = null, param3:Point = null, param4:Boolean = true, param5:Function = null, param6:Function = null) : void
      {
         _backgroundFader.setBackground(param1,param2,param3,param4,param5,param6);
      }
      
      public function get currentBackgroundType() : int
      {
         return _backgroundFader.currentBackgroundType;
      }
      
      public function fadeInPanel(param1:IDisplayObjectContainer) : void
      {
         param1.alpha = 0;
         param1.tweenTo(0.5,{
            "delay":0.2,
            "alpha":1
         });
      }
      
      public function fadeOutPanel(param1:IDisplayObjectContainer) : void
      {
         param1.alpha = 1;
         param1.tweenTo(0.5,{
            "delay":0.2,
            "alpha":0,
            "visible":false
         });
      }
      
      public function get backgroundFader() : UiBackgroundFader
      {
         return _backgroundFader;
      }
      
      public function get titleBarPrefix() : String
      {
         if(!_user || !_user.character)
         {
            return "";
         }
         var _loc1_:int = _user.character.streams.unreadCount;
         if(_loc1_ == 0)
         {
            return "";
         }
         return LocText.current.text("general/new_messages_title_bar",_loc1_);
      }
      
      private function showBasePanels() : void
      {
         var _loc1_:String = "base_no_user";
         if(_user != null && _user.character != null)
         {
            _loc1_ = "base_user";
         }
         if(_basePanel != _loc1_)
         {
            if(_basePanel != "")
            {
               basePanelInstance.hide();
            }
            _basePanel = _loc1_;
            basePanelInstance.show();
            if(_basePanel == "base_user")
            {
               if(_activePanel == "battle" || _activePanel == "stat_quest")
               {
                  baseUserPanel.showTopIcons(false);
               }
               else
               {
                  baseUserPanel.showTopIcons(true);
               }
            }
         }
      }
      
      public function refresh() : void
      {
         if(_lockPanelRefresh)
         {
            return;
         }
         basePanelInstance.refresh();
         if(_activePanel != "")
         {
            activePanelInstance.refresh();
         }
      }
      
      public function refreshPanelLocalization() : void
      {
         var _loc3_:int = 0;
         var _loc2_:* = _panels;
         for each(var _loc1_ in _panels)
         {
            _loc1_.refreshPanelLocalization();
         }
         AppEnvironment.friendBar.refreshLocalization();
      }
      
      public function refreshAppSize() : void
      {
         _anchorContainer.setSize(new Rectangle(0,0,DisplayCoreConfig.layout.appWidth,DisplayCoreConfig.layout.appHeight));
         var _loc3_:int = 0;
         var _loc2_:* = _panels;
         for each(var _loc1_ in _panels)
         {
            _loc1_.refreshAppSize();
         }
         _backgroundFader.refreshAppSize();
      }
      
      private function initPanels() : void
      {
         _panels = new StringMap();
         _panels.setData("base_user",new PanelBaseUser(_panelsVo.panelBaseUser));
         _panels.setData("base_no_user",new PanelBaseNoUser(_panelsVo.panelBaseNoUser));
         _panels.setData("create_character",new PanelCreateCharacter(_panelsVo.panelCreateCharacter));
         _panels.setData("quests",new PanelQuests(_panelsVo.panelQuests));
         _panels.setData("quest_progress",new PanelQuestProgress(_panelsVo.panelQuestProgress));
         _panels.setData("citymap",new PanelCitymap(_panelsVo.panelCitymap));
         _panels.setData("duels",new PanelDuels(_panelsVo.panelDuels));
         _panels.setData("battle",new PanelBattle(_panelsVo.panelBattle));
         _panels.setData("stat_quest",new PanelStatQuest(_panelsVo.panelStatQuest));
         _panels.setData("character",new PanelCharacter(_panelsVo.panelCharacter));
         _panels.setData("character_appearance_photographer",new PanelCharacterAppearancePhotographer(_panelsVo.panelCharacterAppearancePhotographer));
         _panels.setData("character_appearance",new PanelCharacterAppearance(_panelsVo.panelCharacterAppearance));
         _panels.setData("shop",new PanelShop(_panelsVo.panelShop));
         if(AppConfig.streamingEnabled)
         {
            _panelsVo.panelWorkNew.visible = false;
            _panels.setData("streaming",new PanelStreaming(_panelsVo.panelStreaming));
         }
         else
         {
            _panelsVo.panelStreaming.visible = false;
            _panels.setData("work_new",new PanelWorkNew(_panelsVo.panelWorkNew));
         }
         _panels.setData("dungeon",new PanelDungeon(_panelsVo.panelDungeon));
         _panels.setData("movie_offers",new PanelMovieOffers(_panelsVo.panelMovieOffers));
         _panels.setData("movie_progress",new PanelMovieProgress(_panelsVo.panelMovieProgress));
         _panels.setData("guild",new PanelGuild(_panelsVo.panelGuild));
         _panels.setData("slotmachine",new PanelSlotMachine(_panelsVo.panelSlotMachine));
      }
      
      public function reset() : void
      {
         if(_panels == null)
         {
            return;
         }
         var _loc3_:int = 0;
         var _loc2_:* = _panels;
         for each(var _loc1_ in _panels)
         {
            _loc1_.reset();
         }
         DialogLeaderboard.reset();
         DialogGuildSearch.reset();
         DialogConventionInfo.reset();
         DialogEventQuestIntro.reset();
         DialogUserStory.reset();
         PanelQuestProgress.resetShownDurationEventBattles();
         PanelQuests.resetShownQuestBattles();
         AppVideoAdvertisment.resetShownAdvertisments();
         Guild.resetGuildBattleData();
         Guild.resestReceivedLogIds();
         UiGuildChatTab.resetProcessedLogIds();
         Inventory.reset();
         AppEnvironment.friendBar.reset();
         SyncStates.reset();
         ViewManager.instance.tutorialArrow.hide();
         OpticalChanges.instance.reset();
         setClientAnimationQuality(3);
      }
      
      private function destroyPanels() : void
      {
         var _loc3_:int = 0;
         var _loc2_:* = _panels;
         for(var _loc1_ in _panels)
         {
            getPanel(_loc1_).dispose();
            _panels.remove(_loc1_);
         }
         _panels = null;
         _activePanel = "";
      }
      
      public function get user() : User
      {
         return _user;
      }
      
      public function get activePanel() : String
      {
         return _activePanel;
      }
      
      public function get activePanelInstance() : DefaultPanel
      {
         return getPanel(_activePanel);
      }
      
      public function get basePanelInstance() : DefaultPanel
      {
         return getPanel(_basePanel);
      }
      
      public function get baseUserPanel() : PanelBaseUser
      {
         return getPanel("base_user") as PanelBaseUser;
      }
      
      public function get characterPanel() : PanelCharacter
      {
         return getPanel("character") as PanelCharacter;
      }
      
      public function get guildPanel() : PanelGuild
      {
         return getPanel("guild") as PanelGuild;
      }
      
      public function getPanel(param1:String) : DefaultPanel
      {
         return _panels.getData(param1);
      }
      
      public function get tutorialArrow() : UiTutorialArrow
      {
         return _tutorialArrow;
      }
      
      public function showBuyCurrencyDialog(param1:String = null) : void
      {
         var _loc2_:* = null;
         var _loc3_:String = null;
         var _loc4_:String = null;
         if(AppEnvironment.appPlatform.isDraugas)
         {
            _loc3_ = AppConfig.urlPublic;
            _loc3_ = StringUtil.replace(_loc3_,"index.php","");
            _loc4_ = _loc3_ + "draugas/payment.php";
            _loc2_ = PlatformConfig.draugiemUserSessionIdHash;
            _loc4_ = _loc4_ + ("?user_sessid_hash=" + _loc2_);
            AppEnvironment.appPlatform.buyCurrency(_loc4_,null);
         }
         else if(AppEnvironment.appPlatform.isGamgos)
         {
            _loc3_ = AppConfig.urlPublic;
            _loc3_ = StringUtil.replace(_loc3_,"index.php","");
            _loc4_ = _loc3_ + "payment/mena.php";
            _loc4_ = _loc4_ + ("?userId=" + User.current.id.toString());
            AppEnvironment.appPlatform.buyCurrency(_loc4_,null);
         }
         else
         {
            Environment.panelManager.showDialog(new DialogBuyPaymentOffers(param1));
         }
      }
      
      public function showBoosterDialog() : void
      {
         Environment.panelManager.showDialog(new DialogBoosters(onCloseBoosterDialog));
      }
      
      private function onCloseBoosterDialog() : void
      {
         baseUserPanel.refreshBoosterInfoBubble(true);
      }
      
      public function showNotEnoughPremiumDialog(param1:int, param2:Boolean = false) : void
      {
         var _loc3_:* = int(param1 - user.premiumCurrency);
         if(param2)
         {
            _loc3_ = param1;
         }
         showBuyCurrencyDialog(LocText.current.text("dialog/buy_premium_currency/premium_currency_needed",_loc3_));
      }
      
      public function showNotEnoughGameCurrencyDialog(param1:int) : void
      {
         var _loc2_:int = param1 - user.character.gameCurrency;
         Environment.panelManager.showDialog(new UiInfoDialog(LocText.current.text("dialog/not_enough_coins/title"),LocText.current.text("dialog/not_enough_coins/text",LocText.current.formatHugeNumber(_loc2_)),LocText.current.text("general/button_ok")));
      }
      
      public function showGuildNotEnoughGameCurrencyPremiumCurrencyDialog(param1:int, param2:int, param3:Function = null) : void
      {
         var _loc6_:int = param1 - user.character.guild.gameCurrency;
         var _loc4_:int = param2 - user.character.guild.premiumCurrency;
         var _loc5_:String = "";
         if(_loc6_ > 0 && _loc4_ > 0)
         {
            _loc5_ = LocText.current.text("dialog/guild_not_enough_coins_premium_currency/coins_and_premium_currency",GameUtil.getGameCurrencyString(_loc6_),GameUtil.getPremiumCurrencyString(_loc4_));
         }
         else if(_loc6_ > 0)
         {
            _loc5_ = GameUtil.getGameCurrencyString(_loc6_);
         }
         else if(_loc4_ > 0)
         {
            _loc5_ = GameUtil.getPremiumCurrencyString(_loc4_);
         }
         _lastNeededGameCurrency = _loc6_;
         _lastNeededPremiumCurrency = _loc4_;
         Environment.panelManager.showDialog(new UiTwoChoiceDialog(LocText.current.text("dialog/guild_not_enough_coins_premium_currency/title"),LocText.current.text("dialog/guild_not_enough_coins_premium_currency/text",_loc5_),LocText.current.text("dialog/guild_not_enough_coins_premium_currency/button_donate"),LocText.current.text("dialog/guild_not_enough_coins_premium_currency/button_cancel"),openGuildDonationDialog,param3));
      }
      
      public function showFriendInvitationDialog() : void
      {
         if(!User.current)
         {
            return;
         }
         var _loc1_:String = null;
         if(AppEnvironment.appPlatform.isFriendInviteAllowed && AppEnvironment.appPlatform.isFacebook)
         {
            _loc1_ = ServerInfo.serverId + "_" + User.current.id.toString() + ";invite";
            AppEnvironment.appPlatform.inviteFriends(LocText.current.text("friend_invite/facebook/title"),LocText.current.text("friend_invite/facebook/message"),null,_loc1_);
         }
         else if(AppEnvironment.appPlatform.isFriendInviteAllowed && AppEnvironment.appPlatform.isNutaku)
         {
            _loc1_ = ServerInfo.serverId + "_" + User.current.id.toString() + ";invite";
            AppEnvironment.appPlatform.inviteFriends("unused","unused",null,_loc1_);
         }
         else if(AppEnvironment.appPlatform.isFriendInviteAllowed)
         {
            if(!DialogFriendInvite.isOpen)
            {
               Environment.panelManager.showDialog(new DialogFriendInvite());
            }
         }
         else if(!DialogLeaderboard.isOpen)
         {
            Environment.panelManager.showDialog(new DialogLeaderboard());
         }
      }
      
      private function openGuildDonationDialog() : void
      {
         Environment.panelManager.showDialog(new DialogGuildDonation(_lastNeededGameCurrency,_lastNeededPremiumCurrency,true));
      }
      
      public function loadCharacter(param1:int, param2:Function, param3:String = "") : void
      {
         if(param1 == -1)
         {
            return;
         }
         _onLoadedCharacter = param2;
         if(param1 == user.character.id && (param3 == "" || param3 == user.character.serverId))
         {
            ViewManager.instance.showPanel("character");
            if(_onLoadedCharacter != null)
            {
               _onLoadedCharacter();
            }
            return;
         }
         Environment.application.sendActionRequest("getCharacter",{
            "character_id":param1,
            "server_id":param3
         },handleRequests);
      }
      
      public function loadCharacterByName(param1:String, param2:Function) : void
      {
         _onLoadedCharacter = param2;
         if(param1 == user.character.name)
         {
            ViewManager.instance.showPanel("character");
            if(_onLoadedCharacter != null)
            {
               _onLoadedCharacter();
            }
            return;
         }
         Environment.application.sendActionRequest("getCharacter",{
            "character_id":0,
            "character_name":param1
         },handleRequests);
      }
      
      public function loadGuild(param1:int, param2:Function, param3:String = "") : void
      {
         _onLoadedGuild = param2;
         if(param1 == 0)
         {
            return;
         }
         if(param1 == user.character.guildId && (param3 == "" || param3 == user.character.serverId))
         {
            ViewManager.instance.showPanel("guild");
            if(_onLoadedGuild != null)
            {
               _onLoadedGuild();
            }
            return;
         }
         Environment.application.sendActionRequest("getGuild",{
            "guild_id":param1,
            "server_id":param3
         },handleRequests);
      }
      
      public function setClientAnimationQuality(param1:int) : void
      {
         switch(int(param1) - 1)
         {
            case 0:
               UiBackgroundFader.useMovieClipAnimations = false;
               UiButton.defaultInteractionOverMode = "grow";
               if(EffectsLayer.instance)
               {
                  EffectsLayer.instance.enabled = false;
               }
               Avatar.enableAnimations = false;
               AvatarAnimation.enableAnimations = false;
               UiStreamingActor.enableAnimations = false;
               OpticalChangeAnimation.enableAnimations = false;
               UiItemSlot.enableAnimations = false;
               break;
            case 1:
               UiBackgroundFader.useMovieClipAnimations = true;
               UiButton.defaultInteractionOverMode = "growTweened";
               if(EffectsLayer.instance)
               {
                  EffectsLayer.instance.enabled = true;
               }
               Avatar.enableAnimations = false;
               AvatarAnimation.enableAnimations = false;
               UiStreamingActor.enableAnimations = false;
               OpticalChangeAnimation.enableAnimations = false;
               UiItemSlot.enableAnimations = true;
               break;
            case 2:
               UiBackgroundFader.useMovieClipAnimations = true;
               UiButton.defaultInteractionOverMode = "growTweened";
               if(EffectsLayer.instance)
               {
                  EffectsLayer.instance.enabled = true;
               }
               Avatar.enableAnimations = true;
               AvatarAnimation.enableAnimations = true;
               UiStreamingActor.enableAnimations = true;
               OpticalChangeAnimation.enableAnimations = true;
               UiItemSlot.enableAnimations = true;
         }
      }
      
      private function handleRequests(param1:ActionRequestResponse) : void
      {
         var _loc2_:* = null;
         var _loc3_:* = null;
         var _loc4_:* = param1.action;
         switch(_loc4_)
         {
            case "getCharacter":
               if(param1.error == "")
               {
                  _lockPanelRefresh = true;
                  Environment.application.updateData(param1.data);
                  _lockPanelRefresh = false;
                  _loc2_ = Character.fromData(param1.data);
                  ViewManager.instance.showCharacter(_loc2_);
                  if(_onLoadedCharacter != null)
                  {
                     _onLoadedCharacter();
                  }
               }
               else if(param1.error == "errGetCharacterInvalidCharacter")
               {
                  if(_onLoadedCharacter != null)
                  {
                     _onLoadedCharacter();
                  }
               }
               else
               {
                  Environment.reportError(param1.error,param1.request);
               }
               break;
            case "getGuild":
               if(param1.error == "")
               {
                  _lockPanelRefresh = true;
                  Environment.application.updateData(param1.data);
                  _lockPanelRefresh = false;
                  _loc3_ = Guild.fromData(param1.data);
                  ViewManager.instance.showGuild(_loc3_);
                  if(_onLoadedGuild != null)
                  {
                     _onLoadedGuild();
                  }
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
      
      private function handleMessages(param1:Message) : void
      {
         message = param1;
         var _loc3_:* = message.type;
         switch(_loc3_)
         {
            case "CharacterMessage.notifyLevelUp":
               var newLevel:int = message.dataAsInt;
               if(newLevel == 2)
               {
                  Environment.panelManager.showDialog(new DialogTutorialPopup(LocText.current.text("tutorial/mission_finished/title"),LocText.current.text("tutorial/mission_finished/text")));
               }
               Environment.panelManager.showDialog(new DialogLevelUp(newLevel));
               var character:Character = user.character;
               if(StoryDungeon.newStoryDungeonAvailable(character,newLevel))
               {
                  Environment.panelManager.showDialog(new DialogStoryDungeonUnlocked(StoryDungeon.getNewStoryDungeonIndex(_user.character,newLevel)));
               }
               if(DialogAppRating.allowedToShowRating)
               {
                  if(Environment.info.isNativeMobile && Environment.appRating != null)
                  {
                     Environment.appRating.rateNow();
                  }
                  else
                  {
                     Environment.panelManager.showDialog(new DialogAppRating());
                  }
               }
               ItemPatterns.instance.sortPattern();
               if(newLevel >= 11 && !User.current.hasMarketingEmail && !User.current.character.hasTutorialFlag("marketing_optin"))
               {
                  User.current.character.setTutorialFlag("marketing_optin");
                  Environment.panelManager.showDialog(new DialogOptInMarketing());
               }
               break;
            case "CharacterMessage.notifyStageUp":
               var unlockedStage:int = message.dataAsInt;
               PanelCitymap.unlockedStage = unlockedStage;
               Environment.panelManager.showDialog(new DialogStageUnlocked(unlockedStage));
               if(unlockedStage == 2)
               {
                  Environment.panelManager.showDialog(new UiInfoDialog(LocText.current.text("dialog/missiles_unlocked/title"),LocText.current.text("dialog/missiles_unlocked/text"),LocText.current.text("general/button_ok"),null,true));
               }
               break;
            case "CharacterMessage.notifyInitialStatPointsSpend":
               tutorialArrow.hide();
               var completeCallback:Function = function():void
               {
                  tutorialArrow.showTutorial(LocText.current.text("tutorial/shop_arrow_text"),"right_back","down",281 + LayoutUtil.deviceAdjustedWidthCorrection / 2,535 + LayoutUtil.deviceAdjustedHeightCorrection);
               };
               Environment.panelManager.showDialog(new DialogTutorialPopup(LocText.current.text("tutorial/stats_improved/title"),LocText.current.text("tutorial/stats_improved/text"),completeCallback));
               break;
            case "CharacterMessage.notifyInventoryBag2Unlock":
               Environment.panelManager.showDialog(new DialogTutorialPopup(LocText.current.text("dialog/inventory_bag2_unlocked/title"),LocText.current.text("dialog/inventory_bag2_unlocked/text")));
               break;
            case "CharacterMessage.notifyInventoryBag3Unlock":
               Environment.panelManager.showDialog(new DialogTutorialPopup(LocText.current.text("dialog/inventory_bag2_unlocked/title"),LocText.current.text("dialog/inventory_bag2_unlocked/text")));
               break;
            default:
               throw new Error("Encountered unknown message type! type=" + message.type);
         }
      }
   }
}
