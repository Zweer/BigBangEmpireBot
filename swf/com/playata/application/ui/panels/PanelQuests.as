package com.playata.application.ui.panels
{
   import com.playata.application.AppConfig;
   import com.playata.application.AppEnvironment;
   import com.playata.application.data.GameUtil;
   import com.playata.application.data.character.Character;
   import com.playata.application.data.constants.CConstant;
   import com.playata.application.data.constants.CDating;
   import com.playata.application.data.convention.Convention;
   import com.playata.application.data.dating.Dating;
   import com.playata.application.data.dating.DatingStep;
   import com.playata.application.data.dating.DatingUtil;
   import com.playata.application.data.event.EventQuest;
   import com.playata.application.data.fan_foto.FanFoto;
   import com.playata.application.data.herobook.Herobook;
   import com.playata.application.data.quest.Quest;
   import com.playata.application.data.story_dungeon.StoryDungeon;
   import com.playata.application.data.user.User;
   import com.playata.application.messaging.Message;
   import com.playata.application.messaging.MessageRouter;
   import com.playata.application.ui.ViewManager;
   import com.playata.application.ui.dialogs.DialogBoosterMultitasking;
   import com.playata.application.ui.dialogs.DialogBoosterSense;
   import com.playata.application.ui.dialogs.DialogConventionInfo;
   import com.playata.application.ui.dialogs.DialogDatingOutcome;
   import com.playata.application.ui.dialogs.DialogDatingStepUnlocked;
   import com.playata.application.ui.dialogs.DialogDungeonSelect;
   import com.playata.application.ui.dialogs.DialogEventQuestIntro;
   import com.playata.application.ui.dialogs.DialogEventQuestOutro;
   import com.playata.application.ui.dialogs.DialogEventQuestProgress;
   import com.playata.application.ui.dialogs.DialogHerobook;
   import com.playata.application.ui.dialogs.DialogMovieVote;
   import com.playata.application.ui.dialogs.DialogOutOfEnergy;
   import com.playata.application.ui.dialogs.DialogQuestBriefing;
   import com.playata.application.ui.dialogs.DialogRefreshQuests;
   import com.playata.application.ui.dialogs.DialogStageUnlocked;
   import com.playata.application.ui.dialogs.DialogStoryDungeonFought;
   import com.playata.application.ui.dialogs.DialogStoryDungeonUnlocked;
   import com.playata.application.ui.dialogs.DialogTutorialPopup;
   import com.playata.application.ui.dialogs.DialogUseEnergyStorage;
   import com.playata.application.ui.elements.background.UiBackgroundFader;
   import com.playata.application.ui.elements.convention.UiConventionButton;
   import com.playata.application.ui.elements.convention.UiConventionMultitaskingButton;
   import com.playata.application.ui.elements.dating.UiDatingButton;
   import com.playata.application.ui.elements.dating.UiDatingPicturesButton;
   import com.playata.application.ui.elements.dungeon.UiDungeonMultitaskingButton;
   import com.playata.application.ui.elements.event.UiEventQuestButton;
   import com.playata.application.ui.elements.fan_foto.UiFanFotoProgressBar;
   import com.playata.application.ui.elements.generic.UiHeadlineTextTooltip;
   import com.playata.application.ui.elements.generic.button.UiButton;
   import com.playata.application.ui.elements.generic.dialog.UiInfoDialog;
   import com.playata.application.ui.elements.generic.textfield.UiTextTooltip;
   import com.playata.application.ui.elements.herobook.UiHerobookButton;
   import com.playata.application.ui.elements.quest.UiEnergyStorageButton;
   import com.playata.application.ui.elements.quest.UiQuestButton;
   import com.playata.application.ui.elements.resource.UiUseResourceButton;
   import com.playata.application.ui.elements.slotmachine.UiUseSlotmachineResourceButton;
   import com.playata.application.ui.elements.story_dungeon.UiStoryDungeonButton;
   import com.playata.framework.application.Environment;
   import com.playata.framework.application.request.ActionRequestResponse;
   import com.playata.framework.core.Runtime;
   import com.playata.framework.core.collection.IntMap;
   import com.playata.framework.core.logging.Logger;
   import com.playata.framework.core.util.NumberUtil;
   import com.playata.framework.core.util.TimeUtil;
   import com.playata.framework.display.AnchorPoint;
   import com.playata.framework.display.IDisplayObject;
   import com.playata.framework.display.IDisplayObjectContainer;
   import com.playata.framework.display.IUriSprite;
   import com.playata.framework.display.Sprite;
   import com.playata.framework.display.UriSprite;
   import com.playata.framework.display.lib.flash.FlashUriSprite;
   import com.playata.framework.input.IInteractionTarget;
   import com.playata.framework.input.InteractionEvent;
   import com.playata.framework.localization.LocText;
   import flash.geom.Rectangle;
   import visuals.ui.panels.SymbolPanelQuestsGeneric;
   
   public class PanelQuests extends DefaultPanel
   {
      
      private static var _storyDungeonBattlesShown:IntMap = new IntMap();
      
      private static var _showInitAnimationForStoryDungeon:int = 0;
      
      private static var _quest1:Quest = null;
      
      private static var _quest2:Quest = null;
      
      private static var _quest3:Quest = null;
      
      private static var _quest4:Quest = null;
      
      private static var _convention:Convention = null;
      
      private static var _storyDungeon:StoryDungeon = null;
      
      private static var _datingStep:DatingStep = null;
      
      private static var _openQuestId:int = 0;
      
      private static var _openConvention:Boolean = false;
      
      private static const QUEST_BUTTON_SPACING:int = 20;
       
      
      private var _btnHelp:UiButton = null;
      
      private var _btnCitymap:UiButton = null;
      
      private var _btnQuest1:UiQuestButton = null;
      
      private var _btnQuest2:UiQuestButton = null;
      
      private var _btnQuest3:UiQuestButton = null;
      
      private var _btnQuest4:UiQuestButton = null;
      
      private var _btnConvention:UiConventionButton = null;
      
      private var _btnStoryDungeon:UiStoryDungeonButton = null;
      
      private var _btnDating:UiDatingButton = null;
      
      private var _tooltipEnergy:UiTextTooltip = null;
      
      private var _tooltipEnergyText:UiTextTooltip = null;
      
      private var _tooltipLock:UiHeadlineTextTooltip = null;
      
      private var _btnBuyEnergy:UiButton = null;
      
      private var _btnStageName:UiButton = null;
      
      private var _btnRefreshQuests:UiButton = null;
      
      private var _btnMostXPQuest:UiButton = null;
      
      private var _btnMostGameCurrencyQuest:UiButton = null;
      
      private var _btnDungeonKeyQuest:UiButton = null;
      
      private var _btnRepeatStoryDungeonKeyQuest:UiButton = null;
      
      private var _btnRepeatDatingKeyQuest:UiButton = null;
      
      private var _btnUseResource:UiUseResourceButton = null;
      
      private var _btnSenseBoosterIcon:UiButton;
      
      private var _btnDatingPictures:UiDatingPicturesButton;
      
      private var _btnEventQuest:UiEventQuestButton = null;
      
      private var _btnHerobook:UiHerobookButton = null;
      
      private var _btnStorage:UiEnergyStorageButton = null;
      
      private var _btnSlotMachine:UiUseSlotmachineResourceButton = null;
      
      private var _fanFotoProgressBar:UiFanFotoProgressBar = null;
      
      private var _questButton1Id:int = 0;
      
      private var _btnConventionMultitasking:UiConventionMultitaskingButton;
      
      private var _btnDungeonMultitasking:UiDungeonMultitaskingButton;
      
      public function PanelQuests(param1:SymbolPanelQuestsGeneric)
      {
         super(param1);
         _btnHelp = new UiButton(param1.btnHelp,LocText.current.text("general/button_help"),onClickHelp);
         _btnCitymap = new UiButton(param1.btnCitymap,LocText.current.text("screen/quest/button_citymap_tooltip"),onClickCitymap);
         _btnBuyEnergy = new UiButton(param1.btnBuyEnergy,LocText.current.text("screen/quest/button_buy_energy"),onClickBuyEnergy);
         _btnRefreshQuests = new UiButton(param1.btnRefreshQuests,LocText.current.text("screen/quest/button_refresh_quests"),onClickRefreshQuests);
         _btnMostXPQuest = new UiButton(param1.btnMostXPQuest,"",onClickMostXPQuest);
         _btnMostGameCurrencyQuest = new UiButton(param1.btnMostCoinQuest,"",onClickMostGameCurrencyQuest);
         _btnDungeonKeyQuest = new UiButton(param1.btnDungeonKeyQuest,LocText.current.text("screen/quest/dungeon_key_quest_tooltip"),onClickDungeonKeyQuest);
         _btnRepeatStoryDungeonKeyQuest = new UiButton(param1.btnRepeatStoryDungeonKeyQuest,"",onClickRepeatStoryDungeonKeyQuest);
         _btnRepeatDatingKeyQuest = new UiButton(param1.btnRepeatDatingKeyQuest,"",onClickRepeatDatingKeyQuest);
         _btnSenseBoosterIcon = new UiButton(param1.btnSenseBoosterIcon,LocText.current.text("screen/quest/button_sense_booster",GameUtil.getSenseBoosterDurationString()),onClickSenseBooster);
         _btnDatingPictures = new UiDatingPicturesButton(param1.btnDatingPictures);
         _btnEventQuest = new UiEventQuestButton(param1.btnEventQuest,onClickEventQuest);
         _btnHerobook = new UiHerobookButton(param1.btnHerobook,onClickHerobook);
         _btnConventionMultitasking = new UiConventionMultitaskingButton(param1.btnConventionMultitasking,onClickConventionMultitasking);
         _btnDungeonMultitasking = new UiDungeonMultitaskingButton(param1.btnDungeonMultitasking,onClickDungeonMultitasking);
         var _loc2_:Sprite = createCenteredTextButton(param1.txtStageName);
         _btnStageName = new UiButton(_loc2_,"",onClickStageInfo);
         _vo.addChild(_btnStageName);
         _tooltipEnergy = new UiTextTooltip(param1.iconEnergy,"");
         _tooltipEnergyText = new UiTextTooltip(param1.txtEnergyLeft,"");
         _tooltipEnergy.requestTextFunction = getQuestEnergyTooltip;
         _tooltipEnergyText.requestTextFunction = getQuestEnergyTooltip;
         _tooltipLock = new UiHeadlineTextTooltip(param1.iconLockWorldmap,LocText.current.text("screen/quest/button_citymap_locked_tooltip_title"),LocText.current.text("screen/quest/button_citymap_locked_tooltip"));
         _btnQuest1 = new UiQuestButton(param1.quest1,"",onClickQuest);
         _btnQuest2 = new UiQuestButton(param1.quest2,"",onClickQuest);
         _btnQuest3 = new UiQuestButton(param1.quest3,"",onClickQuest);
         _btnQuest4 = new UiQuestButton(param1.quest4,"",onClickQuest);
         _btnConvention = new UiConventionButton(param1.convention,LocText.current.text("screen/quest/button_convention_show_tooltip"),onClickQuest);
         _btnStoryDungeon = new UiStoryDungeonButton(param1.storyDungeon,"",onClickQuest);
         _btnDating = new UiDatingButton(param1.dating,"",onClickQuest);
         _btnUseResource = new UiUseResourceButton(param1.btnUseResource,1,false,"quest");
         _btnSlotMachine = new UiUseSlotmachineResourceButton(param1.btnSlotMachine,2,false,"unused");
         _btnStorage = new UiEnergyStorageButton(param1.btnEnergyStorage,onClickStorage);
         _fanFotoProgressBar = new UiFanFotoProgressBar(param1.fanFoto);
         _fanFotoProgressBar.visible = false;
         param1.addChild(param1.iconLockWorldmap);
         param1.questArea.visible = false;
         MessageRouter.addListener("ViewMessage.notifyBattleFinished",handleMessages);
         MessageRouter.addListener("ViewMessage.notifyStatQuestFinished",handleMessages);
         _anchorContainer.add(_btnStageName,AnchorPoint.RIGHT_FIXED,0.5);
         _anchorContainer.add(param1.txtUpcomingStage,AnchorPoint.RIGHT_FIXED,0.5);
         _anchorContainer.add(param1.questArea,AnchorPoint.RIGHT_FIXED,0.5);
         _anchorContainer.add(param1.quest1,AnchorPoint.RIGHT_FIXED,0.5);
         _anchorContainer.add(param1.quest2,AnchorPoint.RIGHT_FIXED,0.5);
         _anchorContainer.add(param1.quest3,AnchorPoint.RIGHT_FIXED,0.5);
         _anchorContainer.add(param1.quest4,AnchorPoint.RIGHT_FIXED,0.5);
         _anchorContainer.add(param1.fanFoto,AnchorPoint.RIGHT_FIXED,0.5);
         _anchorContainer.add(param1.dating,AnchorPoint.RIGHT_FIXED,0.5);
         _anchorContainer.add(param1.btnBuyEnergy,AnchorPoint.TOP_RIGHT);
         _anchorContainer.add(param1.iconEnergy,AnchorPoint.TOP_RIGHT);
         _anchorContainer.add(param1.txtEnergyLeft,AnchorPoint.TOP_RIGHT);
         _anchorContainer.add(param1.btnRefreshQuests,AnchorPoint.TOP_RIGHT);
         _anchorContainer.add(param1.btnSenseBoosterIcon,AnchorPoint.TOP_RIGHT);
         _anchorContainer.add(param1.btnMostCoinQuest,AnchorPoint.TOP_RIGHT);
         _anchorContainer.add(param1.btnMostXPQuest,AnchorPoint.TOP_RIGHT);
         _anchorContainer.add(param1.btnRepeatStoryDungeonKeyQuest,AnchorPoint.TOP_RIGHT);
         _anchorContainer.add(param1.btnRepeatDatingKeyQuest,AnchorPoint.TOP_RIGHT);
         _anchorContainer.add(param1.btnEnergyStorage,AnchorPoint.RIGHT_FIXED);
         _anchorContainer.add(param1.btnSlotMachine,AnchorPoint.RIGHT_FIXED);
         _anchorContainer.add(param1.btnUseResource,AnchorPoint.RIGHT_FIXED);
         _anchorContainer.add(param1.questArea,AnchorPoint.BOTTOM_FIXED,0.5);
         _anchorContainer.add(param1.storyDungeon,AnchorPoint.BOTTOM_FIXED,0.5);
         _anchorContainer.add(param1.storyDungeon,AnchorPoint.RIGHT_FIXED,0.5);
         _anchorContainer.add(param1.quest1,AnchorPoint.BOTTOM_FIXED,0.5);
         _anchorContainer.add(param1.quest2,AnchorPoint.BOTTOM_FIXED,0.5);
         _anchorContainer.add(param1.quest3,AnchorPoint.BOTTOM_FIXED,0.5);
         _anchorContainer.add(param1.quest4,AnchorPoint.BOTTOM_FIXED,0.5);
         _anchorContainer.add(param1.dating,AnchorPoint.BOTTOM_FIXED,0.5);
         _anchorContainer.add(param1.btnDatingPictures,AnchorPoint.BOTTOM_FIXED,0.5);
         _anchorContainer.add(param1.btnEnergyStorage,AnchorPoint.BOTTOM_FIXED);
         _anchorContainer.add(param1.btnSlotMachine,AnchorPoint.BOTTOM_FIXED);
         _anchorContainer.add(param1.btnUseResource,AnchorPoint.BOTTOM_FIXED);
      }
      
      public static function resetShownQuestBattles() : void
      {
         _storyDungeonBattlesShown = new IntMap();
      }
      
      public static function get quest1() : Quest
      {
         return _quest1;
      }
      
      public static function get quest2() : Quest
      {
         return _quest2;
      }
      
      public static function get quest3() : Quest
      {
         return _quest3;
      }
      
      public static function get quest4() : Quest
      {
         return _quest4;
      }
      
      public static function get convention() : Convention
      {
         return _convention;
      }
      
      public static function get storyDungeon() : StoryDungeon
      {
         return _storyDungeon;
      }
      
      public static function get datingStep() : DatingStep
      {
         return _datingStep;
      }
      
      public static function set showInitAnimationForStoryDungeon(param1:int) : void
      {
         _showInitAnimationForStoryDungeon = param1;
      }
      
      public static function refreshBackground(param1:IDisplayObjectContainer) : void
      {
         storyDungeonContainer = param1;
         backgroundLoaded = function(param1:IDisplayObject):void
         {
            refreshBackgroundStoryDungeonOverlay(param1,storyDungeonContainer);
         };
         var character:Character = User.current.character;
         var currentQuestStage:int = character.currentQuestStage;
         var showUSK18Background:Boolean = false;
         storyDungeonContainer.visible = false;
         if(AppEnvironment.appPlatform.isHidePantiesAllowed)
         {
            showUSK18Background = true;
            if(character.getActiveConventionByStage(currentQuestStage))
            {
               showUSK18Background = false;
            }
         }
         if(!showUSK18Background)
         {
            var _loc3_:* = currentQuestStage;
            switch(_loc3_)
            {
               case 1:
                  ViewManager.instance.setBackground(12,null,null,true,null,backgroundLoaded);
                  break;
               case 2:
                  ViewManager.instance.setBackground(13,null,null,true,null,backgroundLoaded);
                  break;
               case 3:
                  ViewManager.instance.setBackground(14,null,null,true,null,backgroundLoaded);
                  break;
               case 4:
                  ViewManager.instance.setBackground(15,null,null,true,null,backgroundLoaded);
                  break;
               case 5:
                  ViewManager.instance.setBackground(16,null,null,true,null,backgroundLoaded);
                  break;
               case 6:
                  ViewManager.instance.setBackground(17,null,null,true,null,backgroundLoaded);
                  break;
               case 7:
                  ViewManager.instance.setBackground(18,null,null,true,null,backgroundLoaded);
                  break;
               case 8:
                  ViewManager.instance.setBackground(19,null,null,true,null,backgroundLoaded);
                  break;
               case 9:
                  ViewManager.instance.setBackground(21,null,null,true,null,backgroundLoaded);
                  break;
               case 100:
                  ViewManager.instance.setBackground(20,null,null,true,null,backgroundLoaded);
                  break;
               default:
                  ViewManager.instance.setBackground(12,null,null,true,null,backgroundLoaded);
            }
         }
         else
         {
            _loc3_ = currentQuestStage;
            switch(_loc3_)
            {
               case 1:
                  ViewManager.instance.setBackground(1012,null,null,true,null,backgroundLoaded);
                  break;
               case 2:
                  ViewManager.instance.setBackground(1013,null,null,true,null,backgroundLoaded);
                  break;
               case 3:
                  ViewManager.instance.setBackground(1014,null,null,true,null,backgroundLoaded);
                  break;
               case 4:
                  ViewManager.instance.setBackground(1015,null,null,true,null,backgroundLoaded);
                  break;
               case 5:
                  ViewManager.instance.setBackground(1016,null,null,true,null,backgroundLoaded);
                  break;
               case 6:
                  ViewManager.instance.setBackground(1017,null,null,true,null,backgroundLoaded);
                  break;
               case 7:
                  ViewManager.instance.setBackground(1018,null,null,true,null,backgroundLoaded);
                  break;
               case 8:
                  ViewManager.instance.setBackground(1019,null,null,true,null,backgroundLoaded);
                  break;
               case 9:
                  ViewManager.instance.setBackground(1021,null,null,true,null,backgroundLoaded);
                  break;
               case 100:
                  ViewManager.instance.setBackground(20,null,null,true,null,backgroundLoaded);
                  break;
               default:
                  ViewManager.instance.setBackground(1012,null,null,true,null,backgroundLoaded);
            }
         }
      }
      
      private static function refreshBackgroundStoryDungeonOverlay(param1:IDisplayObject, param2:IDisplayObjectContainer) : void
      {
         var _loc10_:* = null;
         var _loc6_:* = null;
         var _loc3_:* = undefined;
         var _loc7_:* = null;
         var _loc5_:* = null;
         if(!User.current)
         {
            return;
         }
         var _loc4_:Character = User.current.character;
         var _loc8_:int = _loc4_.currentQuestStage;
         var _loc11_:IDisplayObject = null;
         try
         {
            _loc10_ = param1 as IUriSprite;
            if(_loc10_.isDownloaded)
            {
               _loc11_ = _loc10_;
               _loc6_ = _loc11_ as FlashUriSprite;
               _loc6_.realLoader.content["resetStoryDungeons"]();
               if(!_loc4_.getActiveConventionByStage(_loc8_))
               {
                  param2.removeAllChildren();
                  _loc3_ = _loc4_.completedStoryDungeons;
                  var _loc14_:int = 0;
                  var _loc13_:* = _loc3_;
                  for each(var _loc9_ in _loc3_)
                  {
                     if(StoryDungeon.hasChangesForStage(_loc9_,_loc8_))
                     {
                        if(_showInitAnimationForStoryDungeon == _loc9_)
                        {
                           _showInitAnimationForStoryDungeon = 0;
                           _loc6_.realLoader.content["showStoryDungeon"](_loc9_,UiBackgroundFader.useMovieClipAnimations);
                           _loc7_ = _loc11_["storyDungeon" + _loc9_];
                           Runtime.delayFunction(checkForNewStoryDungeon,4,[_loc7_]);
                           ViewManager.instance.fadeOutPanel(ViewManager.instance.baseUserPanel.container);
                           ViewManager.instance.fadeOutPanel(ViewManager.instance.activePanelInstance.container);
                           Environment.audio.playFX("event_dungeon_complete.mp3");
                        }
                        else
                        {
                           _loc6_.realLoader.content["showStoryDungeon"](_loc9_);
                        }
                     }
                  }
               }
            }
            return;
         }
         catch(e:Error)
         {
            _loc5_ = "Unable to reset/show storyDungeon overlay, current stage: " + _loc8_ + ", Type of StageBackground: " + Runtime.getClassName(_loc11_);
            _loc5_ = _loc5_ + ("\nThe internal error was: " + e.toString());
            return;
         }
      }
      
      private static function checkForNewStoryDungeon(param1:IDisplayObject) : void
      {
         if(!param1 || param1.visible || !param1.visible)
         {
            ViewManager.instance.fadeInPanel(ViewManager.instance.baseUserPanel.container);
            ViewManager.instance.fadeInPanel(ViewManager.instance.activePanelInstance.container);
            if(!DialogStoryDungeonUnlocked.isOpen && StoryDungeon.newStoryDungeonAvailable(User.current.character))
            {
               Environment.panelManager.showDialog(new DialogStoryDungeonUnlocked(StoryDungeon.getNewStoryDungeonIndex(User.current.character),true));
            }
         }
         else
         {
            Runtime.delayFunction(checkForNewStoryDungeon,4,[param1]);
         }
      }
      
      public static function refreshBackgroundConventionOverlay(param1:IDisplayObjectContainer) : void
      {
         var _loc2_:* = null;
         var _loc3_:Character = User.current.character;
         var _loc5_:int = _loc3_.currentQuestStage;
         var _loc4_:* = null;
         if(_loc3_.getActiveConventionByStage(_loc5_))
         {
            _loc4_ = _loc3_.getActiveConventionByStage(_loc5_);
         }
         if(!_loc4_)
         {
            var _loc8_:int = 0;
            var _loc7_:* = User.current.character.newConventionIds;
            for each(var _loc6_ in User.current.character.newConventionIds)
            {
               _loc2_ = User.current.character.getConvention(_loc6_);
               if(_loc2_.stage == _loc5_)
               {
                  _loc4_ = _loc2_;
                  break;
               }
            }
         }
         param1.removeAllChildren();
         if(_loc4_)
         {
            Logger.info("showing convention overlay: " + _loc4_.stageOverlayUrl);
            param1.addChild(UriSprite.load(_loc4_.stageOverlayUrl,1120,630,true));
         }
         else
         {
            Logger.info("no convention overlay needed");
         }
      }
      
      public static function set openQuestId(param1:int) : void
      {
         _openQuestId = param1;
      }
      
      override public function refreshPanelLocalization() : void
      {
         _btnHelp.tooltip = LocText.current.text("general/button_help");
         _tooltipLock.title = LocText.current.text("screen/quest/button_citymap_locked_tooltip_title");
         _tooltipLock.text = LocText.current.text("screen/quest/button_citymap_locked_tooltip");
         if(User.current && User.current.character && User.current.character.maxQuestStage > 1)
         {
            _btnCitymap.tooltip = LocText.current.text("screen/quest/button_citymap_tooltip");
         }
         else
         {
            _btnCitymap.tooltip = "";
         }
         _btnBuyEnergy.tooltip = LocText.current.text("screen/quest/button_buy_energy");
         _btnConvention.tooltip = LocText.current.text("screen/quest/button_convention_show_tooltip");
         _btnSenseBoosterIcon.tooltip = LocText.current.text("screen/quest/button_sense_booster",GameUtil.getSenseBoosterDurationString());
         if(_shown)
         {
            refresh();
         }
      }
      
      private function getQuestEnergyTooltip() : String
      {
         return LocText.current.text("screen/quest/energy_amount_tooltip",TimeUtil.secondsToString(User.current.character.secondsUntilQuestEnergyRefresh));
      }
      
      override public function dispose() : void
      {
         var _loc1_:SymbolPanelQuestsGeneric = _vo as SymbolPanelQuestsGeneric;
         _btnHelp.dispose();
         _btnHelp = null;
         _btnCitymap.dispose();
         _btnCitymap = null;
         _btnBuyEnergy.dispose();
         _btnBuyEnergy = null;
         _btnRefreshQuests.dispose();
         _btnRefreshQuests = null;
         _btnMostXPQuest.dispose();
         _btnMostXPQuest = null;
         _btnMostGameCurrencyQuest.dispose();
         _btnMostGameCurrencyQuest = null;
         _btnDungeonKeyQuest.dispose();
         _btnDungeonKeyQuest = null;
         _btnRepeatStoryDungeonKeyQuest.dispose();
         _btnRepeatStoryDungeonKeyQuest = null;
         _btnRepeatDatingKeyQuest.dispose();
         _btnRepeatDatingKeyQuest = null;
         _btnStageName.dispose();
         _btnStageName = null;
         _btnUseResource.dispose();
         _btnUseResource = null;
         _btnSenseBoosterIcon.dispose();
         _btnSenseBoosterIcon = null;
         _btnSlotMachine.dispose();
         _btnSlotMachine = null;
         _btnQuest1.dispose();
         _btnQuest1 = null;
         _btnQuest2.dispose();
         _btnQuest2 = null;
         _btnQuest3.dispose();
         _btnQuest3 = null;
         _btnQuest4.dispose();
         _btnQuest4 = null;
         _btnConvention.dispose();
         _btnConvention = null;
         _btnStoryDungeon.dispose();
         _btnStoryDungeon = null;
         _btnDating.dispose();
         _btnDating = null;
         _btnDatingPictures.dispose();
         _btnDatingPictures = null;
         _btnEventQuest.dispose();
         _btnEventQuest = null;
         _btnHerobook.dispose();
         _btnHerobook = null;
         _btnConventionMultitasking.dispose();
         _btnConventionMultitasking = null;
         _btnDungeonMultitasking.dispose();
         _btnDungeonMultitasking = null;
         _tooltipEnergy.dispose();
         _tooltipEnergy = null;
         _tooltipEnergyText.dispose();
         _tooltipEnergyText = null;
         _tooltipLock.dispose();
         _tooltipLock = null;
         _fanFotoProgressBar.dispose();
         _fanFotoProgressBar = null;
         super.dispose();
      }
      
      override public function refreshAppSize() : void
      {
         super.refreshAppSize();
         var _loc1_:SymbolPanelQuestsGeneric = _vo as SymbolPanelQuestsGeneric;
         UiBackgroundFader.scaleWidthCenter(_loc1_.storyDungeonOverlay);
         UiBackgroundFader.scaleWidthCenter(_loc1_.conventionOverlay);
      }
      
      override public function show(param1:* = null) : void
      {
         super.show(param1);
         var _loc2_:Character = User.current.character;
         if(_loc2_.onMap && _loc2_.maxQuestStage > 1)
         {
            ViewManager.instance.showPanel("citymap");
            return;
         }
         var _loc3_:SymbolPanelQuestsGeneric = _vo as SymbolPanelQuestsGeneric;
         refreshBackground(_loc3_.storyDungeonOverlay);
         ViewManager.instance.fadeInPanel(_vo);
         if(!_loc2_.hasTutorialFlag("mission_shown"))
         {
            Environment.panelManager.showDialog(new DialogStageUnlocked(1,false,onTutorialStageInfoDialogClosed));
            _loc2_.setTutorialFlag("mission_shown");
         }
         else if(!_loc2_.hasTutorialFlag("first_mission"))
         {
            onTutorialStageInfoDialogClosed();
         }
         if(_loc2_.hasTutorialFlag("tutorial_finished") && !_loc2_.hasTutorialFlag("story_dungeon") && _loc2_.currentQuestStage == 1 && _loc2_.currentStoryDungeon && _loc2_.currentStoryDungeon.storyDungeonIndex == 1)
         {
            ViewManager.instance.tutorialArrow.showTutorial(LocText.current.text("tutorial/story_dungeon_arrow_text"),"left_front","down",_btnStoryDungeon.content.x + 50,_btnStoryDungeon.content.y - 20);
         }
         _btnQuest1.animate(true);
         _btnQuest2.animate(true);
         _btnQuest3.animate(true);
         _btnQuest4.animate(true);
         _btnStoryDungeon.animate(true);
         _btnConvention.animate(true);
         _btnDating.animate(true);
         if(_openQuestId != 0)
         {
            openQuestBriefingDialog(_openQuestId);
            _openQuestId = 0;
         }
         else if(_openConvention)
         {
            if(_btnConvention.visible)
            {
               Environment.panelManager.showDialog(new DialogQuestBriefing(_btnConvention.tag,checkForConventionInfo));
            }
            _openConvention = false;
         }
         if(_loc2_.activeStoryDungeonBattle)
         {
            if(!_storyDungeonBattlesShown.exists(_loc2_.activeStoryDungeonBattle.id))
            {
               if(User.current.showStoryDungeonBattles)
               {
                  PanelBattle.activeStoryDungeonBattle = User.current.character.activeStoryDungeonBattle;
                  ViewManager.instance.showPanel("battle");
               }
               else
               {
                  PanelBattle.lastViewedMode = 6;
                  MessageRouter.dispatch(new Message("ViewMessage.notifyBattleFinished",null,this));
               }
            }
            else if(_loc2_.activeStoryDungeonBattle.id == _loc2_.activeStoryDungeonAttackId)
            {
               Environment.panelManager.showDialog(new DialogStoryDungeonFought(_loc2_.currentStoryDungeon));
            }
            else if(_loc2_.activeStoryDungeonBattle.id == _loc2_.activeRepeatStoryDungeonAttackId)
            {
               Environment.panelManager.showDialog(new DialogStoryDungeonFought(_loc2_.repeatStoryDungeon));
            }
         }
         else if(_loc2_.movieVotes > 0 && !DialogMovieVote._open)
         {
            Environment.panelManager.showDialog(new DialogMovieVote());
         }
         if(FanFoto.isAvailable && !_loc2_.fanFoto)
         {
            if(DatingUtil.isAvailable && _loc2_.dating.hasDatingStepCompleted(1,1) || !DatingUtil.isAvailable && _loc2_.level >= CDating.fromId(1).minLevel)
            {
               Environment.application.sendActionRequest("createFanFoto",{},handleRequests);
            }
         }
         if(_loc2_.activeQuest && _loc2_.activeQuest.stage == _loc2_.currentQuestStage)
         {
            ViewManager.instance.showPanel("quest_progress");
            return;
         }
         if(_loc2_.activeConventionShow && _loc2_.getActiveConventionByStage(_loc2_.currentQuestStage))
         {
            ViewManager.instance.showPanel("quest_progress");
            return;
         }
      }
      
      override public function hide() : void
      {
         super.hide();
         if(_btnHerobook)
         {
            _btnHerobook.stopTimer();
         }
         if(_btnQuest1)
         {
            _btnQuest1.animate(false);
            _btnQuest2.animate(false);
            _btnQuest3.animate(false);
            _btnQuest4.animate(false);
            _btnStoryDungeon.animate(false);
            _btnConvention.animate(false);
            _btnDating.animate(false);
         }
         if(_fanFotoProgressBar)
         {
            _fanFotoProgressBar.visible = false;
         }
      }
      
      private function onTutorialStageInfoDialogClosed() : void
      {
         if(!User.current.character.hasTutorialFlag("first_mission") && User.current.character.level == 1)
         {
            ViewManager.instance.tutorialArrow.showTutorial(LocText.current.text("tutorial/first_mission_arrow_text"),"left_side","left",_btnQuest2.content.x + _btnQuest2.content.width / 2,_btnQuest2.content.y,2,20);
         }
      }
      
      override public function refresh() : void
      {
         var _loc5_:* = null;
         var _loc8_:* = null;
         var _loc7_:* = null;
         var _loc9_:* = null;
         var _loc1_:* = null;
         var _loc2_:Character = User.current.character;
         if(_loc2_.onMap && _loc2_.maxQuestStage > 1)
         {
            ViewManager.instance.showPanel("citymap");
            return;
         }
         super.refresh();
         var _loc6_:SymbolPanelQuestsGeneric = _vo as SymbolPanelQuestsGeneric;
         refreshBackground(_loc6_.storyDungeonOverlay);
         refreshBackgroundConventionOverlay(_loc6_.conventionOverlay);
         var _loc3_:* = _loc2_.maxQuestStage >= CConstant.quest_max_stage;
         _btnBuyEnergy.visible = _loc2_.questEnergy <= 50 && _loc2_.hasUsedAllQuestEnergy == false && _loc2_.hasTutorialFlag("tutorial_finished");
         _btnRefreshQuests.visible = _loc2_.hasTutorialFlag("tutorial_finished");
         _btnMostXPQuest.visible = _loc2_.senseBoosterActive && _loc2_.hasTutorialFlag("tutorial_finished");
         _btnMostGameCurrencyQuest.visible = _btnMostXPQuest.visible;
         _btnDungeonKeyQuest.visible = false;
         _btnRepeatStoryDungeonKeyQuest.visible = false;
         _btnRepeatDatingKeyQuest.visible = false;
         _btnSenseBoosterIcon.visible = !_loc2_.senseBoosterActive && _loc2_.hasTutorialFlag("tutorial_finished");
         _btnEventQuest.visible = _loc2_.hasEventQuest && _loc2_.hasTutorialFlag("tutorial_finished");
         _btnHerobook.visible = _loc2_.level >= CConstant.herobook_teaser_min_level && _loc2_.hasTutorialFlag("tutorial_finished");
         _btnHerobook.buttonEnabled = _loc2_.level >= CConstant.herobook_min_level;
         _btnUseResource.visible = _loc2_.hasTutorialFlag("tutorial_finished") && AppEnvironment.appPlatform.isResourceRequestAllowed;
         _btnUseResource.refresh();
         _btnSlotMachine.visible = PanelSlotMachine.slotmachineAvailable() && _loc2_.hasTutorialFlag("tutorial_finished") && _loc2_.level >= CConstant.slotmachine_teaser_min_level;
         _btnSlotMachine.buttonEnabled = _btnSlotMachine.visible && _loc2_.level >= CConstant.slotmachine_min_level;
         _btnSlotMachine.refresh();
         _btnConventionMultitasking.visible = false;
         _btnDungeonMultitasking.visible = false;
         if(AppConfig.multitaskingBoosterEnabled)
         {
            _btnDungeonMultitasking.refresh(_loc2_);
            if(_loc2_.conventionId > 0 && !_loc2_.getActiveConventionByStage(_loc2_.currentQuestStage))
            {
               _btnConventionMultitasking.refresh(_loc2_.getConvention(_loc2_.conventionId));
            }
         }
         if(_btnMostXPQuest.visible)
         {
            _loc5_ = _loc2_.mostXPQuest;
            if(_loc5_.reward.movieVotes > 0)
            {
               _btnMostXPQuest.tooltip = LocText.current.text("screen/quest/most_xp_quest_incl_voting_tooltip",GameUtil.getXpString(_loc5_.xpRewardInclVoting),LocText.current.formatHugeNumber(Math.round(_loc5_.xpPerEnergyValue)),LocText.current.text("dialog/stage_unlocked/stage" + _loc5_.stage + "_title"));
            }
            else
            {
               _btnMostXPQuest.tooltip = LocText.current.text("screen/quest/most_xp_quest_tooltip",GameUtil.getXpString(_loc5_.xpRewardInclVoting),LocText.current.formatHugeNumber(Math.round(_loc5_.xpPerEnergyValue)),LocText.current.text("dialog/stage_unlocked/stage" + _loc5_.stage + "_title"));
            }
            _loc8_ = _loc2_.mostGameCurrencyQuest;
            if(_loc8_.hasItemReward && _loc8_.reward.movieVotes > 0)
            {
               _btnMostGameCurrencyQuest.tooltip = LocText.current.text("screen/quest/most_coin_quest_incl_item_and_voting_tooltip",GameUtil.getGameCurrencyString(_loc8_.coinRewardInclItemAndVoting),LocText.current.formatHugeNumber(Math.round(_loc8_.gameCurrencyPerEnergyValue)),LocText.current.text("dialog/stage_unlocked/stage" + _loc8_.stage + "_title"));
            }
            else if(_loc8_.reward.movieVotes > 0)
            {
               _btnMostGameCurrencyQuest.tooltip = LocText.current.text("screen/quest/most_coin_quest_incl_voting_tooltip",GameUtil.getGameCurrencyString(_loc8_.coinRewardInclItemAndVoting),LocText.current.formatHugeNumber(Math.round(_loc8_.gameCurrencyPerEnergyValue)),LocText.current.text("dialog/stage_unlocked/stage" + _loc8_.stage + "_title"));
            }
            else if(_loc8_.hasItemReward)
            {
               _btnMostGameCurrencyQuest.tooltip = LocText.current.text("screen/quest/most_coin_quest_incl_item_tooltip",GameUtil.getGameCurrencyString(_loc8_.coinRewardInclItemAndVoting),LocText.current.formatHugeNumber(Math.round(_loc8_.gameCurrencyPerEnergyValue)),LocText.current.text("dialog/stage_unlocked/stage" + _loc8_.stage + "_title"));
            }
            else
            {
               _btnMostGameCurrencyQuest.tooltip = LocText.current.text("screen/quest/most_coin_quest_tooltip",GameUtil.getGameCurrencyString(_loc8_.coinRewardInclItemAndVoting),LocText.current.formatHugeNumber(Math.round(_loc8_.gameCurrencyPerEnergyValue)),LocText.current.text("dialog/stage_unlocked/stage" + _loc8_.stage + "_title"));
            }
            _loc7_ = _loc2_.dungeonKeyQuest;
            if(_loc7_)
            {
               _btnDungeonKeyQuest.visible = true;
            }
            if(_btnDungeonKeyQuest.visible)
            {
               _loc6_.btnRepeatStoryDungeonKeyQuest.x = _loc6_.btnDungeonKeyQuest.x - 68;
            }
            else
            {
               _loc6_.btnRepeatStoryDungeonKeyQuest.x = _loc6_.btnDungeonKeyQuest.x;
            }
            _loc9_ = _loc2_.repeatStoryDungeonKeyQuest;
            if(_loc9_)
            {
               _btnRepeatStoryDungeonKeyQuest.visible = true;
               _btnRepeatStoryDungeonKeyQuest.tooltip = LocText.current.text("screen/quest/repeat_story_dungeon_key_quest_tooltip",StoryDungeon.getName(_loc9_.reward.repeatStoryDungeonIndex));
            }
            if(_btnRepeatStoryDungeonKeyQuest.visible)
            {
               _loc6_.btnRepeatDatingKeyQuest.x = _loc6_.btnRepeatStoryDungeonKeyQuest.x - 57;
            }
            else
            {
               _loc6_.btnRepeatDatingKeyQuest.x = _loc6_.btnRepeatStoryDungeonKeyQuest.x;
            }
            _loc1_ = _loc2_.repeatDatingKeyQuest;
            if(_loc1_)
            {
               _btnRepeatDatingKeyQuest.visible = true;
               _btnRepeatDatingKeyQuest.tooltip = LocText.current.text("screen/quest/repeat_dating_key_quest_tooltip",DatingUtil.getName(_loc1_.reward.repeatDatingIndex));
            }
         }
         if(_btnEventQuest.visible)
         {
            _btnEventQuest.refresh(_loc2_.eventQuest);
         }
         if(_btnHerobook.visible)
         {
            _btnHerobook.refresh(_loc2_.herobook);
            if(_btnEventQuest.visible)
            {
               _loc6_.btnHerobook.y = 230;
            }
            else
            {
               _loc6_.btnHerobook.y = 154;
            }
            if(!_loc2_.hasTutorialFlag("tutorial_herobook_shown") && _loc2_.level >= CConstant.herobook_min_level)
            {
               ViewManager.instance.tutorialArrow.showTutorial(LocText.current.text("tutorial/herobook_arrow_text"),"right_front","up",_btnHerobook.content.x,_btnHerobook.content.y + _btnHerobook.content.height / 2,0.5);
            }
         }
         if(_btnConventionMultitasking.visible)
         {
            if(_btnHerobook.visible)
            {
               _loc6_.btnConventionMultitasking.y = _loc6_.btnHerobook.y + 80;
            }
            else if(_btnEventQuest.visible)
            {
               _loc6_.btnConventionMultitasking.y = _loc6_.btnEventQuest.y + 90;
            }
            else
            {
               _loc6_.btnConventionMultitasking.y = 145;
            }
         }
         if(_btnDungeonMultitasking.visible)
         {
            if(_btnConventionMultitasking.visible)
            {
               _loc6_.btnDungeonMultitasking.y = _loc6_.btnConventionMultitasking.y + 80;
            }
            else if(_btnHerobook.visible)
            {
               _loc6_.btnDungeonMultitasking.y = _loc6_.btnHerobook.y + 70;
            }
            else if(_btnEventQuest.visible)
            {
               _loc6_.btnDungeonMultitasking.y = _loc6_.btnEventQuest.y + 80;
            }
            else
            {
               _loc6_.btnDungeonMultitasking.y = 146;
            }
         }
         if(!_loc3_ && _loc2_.currentQuestStage == _loc2_.maxQuestStage)
         {
            _loc6_.txtUpcomingStage.text = LocText.current.text("screen/quest/text_upcoming_stage",LocText.current.text("dialog/stage_unlocked/stage" + (_loc2_.currentQuestStage + 1) + "_title"),GameUtil.getQuestStageUnlockLevel(_loc2_.currentQuestStage + 1));
         }
         else
         {
            _loc6_.txtUpcomingStage.text = "";
         }
         if(_loc2_.maxQuestStage > 1)
         {
            _btnCitymap.buttonEnabled = true;
            _loc6_.iconLockWorldmap.visible = false;
            _btnCitymap.visible = true;
            _btnCitymap.tooltip = LocText.current.text("screen/quest/button_citymap_tooltip");
         }
         else
         {
            _btnCitymap.buttonEnabled = false;
            _loc6_.iconLockWorldmap.visible = _loc2_.hasTutorialFlag("tutorial_finished");
            _btnCitymap.visible = _loc2_.hasTutorialFlag("tutorial_finished");
            _btnCitymap.tooltip = "";
         }
         _loc6_.txtEnergyLeft.text = LocText.current.text("general/energy_amount",_loc2_.questEnergy,Quest.maxQuestEnergy);
         _loc6_.txtStageName.text = LocText.current.text("dialog/stage_unlocked/stage" + _loc2_.currentQuestStage + "_title");
         _convention = _loc2_.getActiveConventionByStage(_loc2_.currentQuestStage);
         var _loc4_:* = _btnConvention.tag != _convention;
         _btnConvention.refresh(_convention);
         _btnConvention.tag = _convention;
         _storyDungeon = _loc2_.getActiveStoryDungeonByStage(_loc2_.currentQuestStage);
         _btnStoryDungeon.refresh(_loc2_);
         _datingStep = _loc2_.dating.getActiveDatingStepInStage(_loc2_.currentQuestStage);
         _btnDating.refresh(_loc2_);
         _btnDating.tag = _datingStep;
         var _loc10_:Vector.<int> = _loc2_.stageQuestIds;
         if(_loc10_ != null)
         {
            if(_loc10_.length == 1)
            {
               _btnQuest2.refresh(_loc2_.getQuestById(_loc10_[0]));
            }
            else
            {
               if(_loc10_.length >= 1)
               {
                  _btnQuest1.refresh(_loc2_.getQuestById(_loc10_[0]));
               }
               else
               {
                  _btnQuest1.tag = null;
               }
               if(_loc10_.length >= 2)
               {
                  _btnQuest2.refresh(_loc2_.getQuestById(_loc10_[1]));
               }
               else
               {
                  _btnQuest2.tag = null;
               }
               if(_loc10_.length >= 3)
               {
                  _btnQuest3.refresh(_loc2_.getQuestById(_loc10_[2]));
               }
               else
               {
                  _btnQuest3.tag = null;
               }
               if(_loc10_.length >= 4)
               {
                  _btnQuest4.refresh(_loc2_.getQuestById(_loc10_[3]));
               }
               else
               {
                  _btnQuest4.tag = null;
               }
            }
            _quest1 = _btnQuest1.tag as Quest;
            _quest2 = _btnQuest2.tag as Quest;
            _quest3 = _btnQuest3.tag as Quest;
            _quest4 = _btnQuest4.tag as Quest;
            if(_loc2_.level == 1)
            {
               _btnQuest1.visible = _btnQuest1.tag != null && (_btnQuest1.tag as Quest).isTimeQuest;
               _btnQuest2.visible = _btnQuest2.tag != null && (_btnQuest2.tag as Quest).isTimeQuest;
               _btnQuest3.visible = _btnQuest3.tag != null && (_btnQuest3.tag as Quest).isTimeQuest;
               _btnQuest4.visible = _btnQuest4.tag != null && (_btnQuest4.tag as Quest).isTimeQuest;
            }
            else
            {
               _btnQuest1.visible = _btnQuest1.tag != null;
               _btnQuest2.visible = _btnQuest2.tag != null;
               _btnQuest3.visible = _btnQuest3.tag != null;
               _btnQuest4.visible = _btnQuest4.tag != null;
            }
            if(_questButton1Id != _loc10_[0] || _loc4_)
            {
               positionButtons();
               _questButton1Id = _loc10_[0];
            }
         }
         checkForConventionInfo();
         checkForEventQuests();
         checkForDating();
         _fanFotoProgressBar.refresh(_loc2_.fanFoto);
         _btnDatingPictures.refresh();
         _btnStorage.refresh();
         _loc6_.btnEnergyStorage.y = !!_btnSlotMachine.visible?_loc6_.btnSlotMachine.y - 85:Number(_loc6_.btnUseResource.y - 85);
      }
      
      public function get conventionButton() : UiConventionButton
      {
         return _btnConvention;
      }
      
      public function checkForConventionInfo() : void
      {
         if(!User.current.character.hasTutorialFlag("tutorial_finished"))
         {
            return;
         }
         if(DialogEventQuestIntro.isOpen)
         {
            return;
         }
         PanelCitymap.checkForConventionInfo();
         var _loc1_:SymbolPanelQuestsGeneric = _vo as SymbolPanelQuestsGeneric;
         refreshBackground(_loc1_.storyDungeonOverlay);
         refreshBackgroundConventionOverlay(_loc1_.conventionOverlay);
      }
      
      public function checkForEventQuests() : void
      {
         if(!User.current.character.hasTutorialFlag("tutorial_finished"))
         {
            return;
         }
         if(DialogConventionInfo.isOpen)
         {
            return;
         }
         if(DialogEventQuestIntro.isOpen)
         {
            return;
         }
         if(User.current.character.hasUnassignedEventQuest)
         {
            if(!DialogEventQuestIntro.hasBeenShown(User.current.character.unassignedEventQuest))
            {
               Environment.panelManager.showDialog(new DialogEventQuestIntro(User.current.character.unassignedEventQuest));
            }
         }
      }
      
      public function checkForDating() : void
      {
         var _loc2_:int = 0;
         var _loc5_:int = 0;
         var _loc6_:* = null;
         var _loc3_:Boolean = false;
         if(!DatingUtil.isAvailable)
         {
            return;
         }
         if(!User.current.character.hasTutorialFlag("tutorial_finished"))
         {
            return;
         }
         if(DialogConventionInfo.isOpen)
         {
            return;
         }
         if(DialogEventQuestIntro.isOpen)
         {
            return;
         }
         if(DialogDatingStepUnlocked.isOpen)
         {
            return;
         }
         if(DialogDatingOutcome.isOpen)
         {
            return;
         }
         var _loc1_:Character = User.current.character;
         var _loc4_:Dating = _loc1_.dating;
         if(_loc4_.newDatingAvailableInStage(_loc1_,_loc1_.currentQuestStage))
         {
            _loc2_ = _loc4_.getNewDatingIndexForStage(_loc1_,_loc1_.currentQuestStage);
            _loc5_ = _loc4_.getNewDatingStepIndex(_loc1_,_loc2_);
            _loc6_ = _loc4_.getLastRepeatDatingStep();
            _loc3_ = false;
            if(_loc6_ && _loc6_.repeat && _loc6_.datingIndex == _loc2_ && _loc6_.stepIndex == _loc5_ - 1)
            {
               _loc3_ = true;
            }
            Environment.panelManager.showDialog(new DialogDatingStepUnlocked(_loc2_,_loc5_,showDatingQuest,_loc3_));
         }
      }
      
      override public function reset() : void
      {
         _questButton1Id = 0;
         _showInitAnimationForStoryDungeon = 0;
         _btnQuest1.tag = null;
         _btnQuest2.tag = null;
         _btnQuest3.tag = null;
         _btnQuest4.tag = null;
         _btnConvention.tag = null;
      }
      
      private function positionButtons() : void
      {
         var _loc4_:SymbolPanelQuestsGeneric = _vo as SymbolPanelQuestsGeneric;
         var _loc3_:Vector.<UiButton> = new Vector.<UiButton>(0);
         if(_btnQuest1.visible)
         {
            _loc3_.push(_btnQuest1);
         }
         if(_btnQuest2.visible)
         {
            _loc3_.push(_btnQuest2);
         }
         if(_btnQuest3.visible)
         {
            _loc3_.push(_btnQuest3);
         }
         if(_btnQuest4.visible)
         {
            _loc3_.push(_btnQuest4);
         }
         if(_btnConvention.visible)
         {
            _loc3_.splice(NumberUtil.randomInt(0,_loc3_.length),0,_btnConvention);
         }
         var _loc2_:Rectangle = new Rectangle();
         _loc2_.y = _loc4_.questArea.y;
         _loc2_.height = _loc4_.questArea.height;
         if(_loc3_.length == 1)
         {
            _loc2_.x = _loc4_.questArea.x + (_loc4_.questArea.width - 100) * 0.5;
            _loc2_.width = 100;
            _loc2_.y = _loc2_.y + 50;
            _loc2_.height = _loc2_.height - 100;
            positionButton(_loc3_[0],_loc2_);
         }
         else
         {
            _loc2_.width = (_loc4_.questArea.width - (_loc3_.length - 1) * 20) / _loc3_.length;
            _loc2_.x = _loc4_.questArea.x;
            var _loc6_:int = 0;
            var _loc5_:* = _loc3_;
            for each(var _loc1_ in _loc3_)
            {
               positionButton(_loc1_,_loc2_);
               _loc2_.x = _loc2_.x + (20 + _loc2_.width);
            }
         }
      }
      
      private function positionButton(param1:UiButton, param2:Rectangle) : void
      {
         var _loc3_:Number = param2.x + Math.random() * (param2.width - param1.content.width) + param1.content.width / 2;
         var _loc4_:Number = param2.y + Math.random() * (param2.height - param1.content.height) + param1.content.height / 2;
         param1.content.x = Math.floor(_loc3_);
         param1.content.y = Math.floor(_loc4_);
      }
      
      private function onClickBuyEnergy(param1:InteractionEvent) : void
      {
         panelManager.showDialog(new DialogOutOfEnergy(null,true));
      }
      
      private function onClickRefreshQuests(param1:InteractionEvent) : void
      {
         panelManager.showDialog(new DialogRefreshQuests());
      }
      
      private function onClickStageInfo(param1:InteractionEvent) : void
      {
         panelManager.showDialog(new DialogStageUnlocked(User.current.character.currentQuestStage,true));
      }
      
      private function onClickMostXPQuest(param1:InteractionEvent) : void
      {
         var _loc2_:Quest = User.current.character.mostXPQuest;
         openQuest(_loc2_);
      }
      
      private function onClickMostGameCurrencyQuest(param1:InteractionEvent) : void
      {
         var _loc2_:Quest = User.current.character.mostGameCurrencyQuest;
         openQuest(_loc2_);
      }
      
      private function onClickDungeonKeyQuest(param1:InteractionEvent) : void
      {
         var _loc2_:Quest = User.current.character.dungeonKeyQuest;
         if(_loc2_)
         {
            openQuest(_loc2_);
         }
      }
      
      private function onClickRepeatStoryDungeonKeyQuest(param1:InteractionEvent) : void
      {
         var _loc2_:Quest = ViewManager.instance.user.character.repeatStoryDungeonKeyQuest;
         if(_loc2_)
         {
            openQuest(_loc2_);
         }
      }
      
      private function onClickRepeatDatingKeyQuest(param1:InteractionEvent) : void
      {
         var _loc2_:Quest = ViewManager.instance.user.character.repeatDatingKeyQuest;
         if(_loc2_)
         {
            openQuest(_loc2_);
         }
      }
      
      private function openQuestBriefingDialog(param1:int) : void
      {
         if(_btnQuest1.quest)
         {
            if(_btnQuest1.quest.id == param1)
            {
               clickQuest(_btnQuest1);
               return;
            }
         }
         if(_btnQuest2.quest)
         {
            if(_btnQuest2.quest.id == param1)
            {
               clickQuest(_btnQuest2);
               return;
            }
         }
         if(_btnQuest3.quest)
         {
            if(_btnQuest3.quest.id == param1)
            {
               clickQuest(_btnQuest3);
               return;
            }
         }
         if(_btnQuest4.quest)
         {
            if(_btnQuest4.quest.id == param1)
            {
               clickQuest(_btnQuest4);
               return;
            }
         }
      }
      
      private function onClickEventQuest(param1:InteractionEvent) : void
      {
         var _loc2_:* = null;
         if(User.current.character.hasEventQuest)
         {
            _loc2_ = User.current.character.eventQuest;
            if(_loc2_.isCompleted(true) || _loc2_.isAborted || _loc2_.isAbortedButFinished)
            {
               Environment.panelManager.showDialog(new DialogEventQuestOutro(_loc2_));
            }
            else
            {
               Environment.panelManager.showDialog(new DialogEventQuestProgress(_loc2_));
            }
         }
      }
      
      private function onClickHerobook(param1:InteractionEvent) : void
      {
         ViewManager.instance.tutorialArrow.hide();
         var _loc2_:Herobook = User.current.character.herobook;
         _loc2_.newObjectives = false;
         _btnHerobook.refresh(_loc2_);
         Environment.panelManager.showDialog(new DialogHerobook(_loc2_));
      }
      
      private function onClickConventionMultitasking(param1:InteractionEvent) : void
      {
         ViewManager.instance.tutorialArrow.hide();
         var _loc2_:Character = User.current.character;
         if(_loc2_.multitaskingBoosterActive || !_loc2_.activeDungeonQuest && !_loc2_.activeQuest)
         {
            if(_loc2_.activeConventionShow)
            {
               Environment.application.sendActionRequest("setCharacterStage",{
                  "stage":_loc2_.getConvention(_loc2_.conventionId).stage,
                  "on_map":false
               },handleRequests);
               return;
            }
            if(_loc2_.fansTotal == 0)
            {
               if(_loc2_.hasMovie)
               {
                  Environment.panelManager.showDialog(new UiInfoDialog(LocText.current.text("dialog/convention_no_fans/caption"),LocText.current.text("dialog/convention_no_fans/text_movie_started"),LocText.current.text("general/button_ok"),onClickMovie,false,true));
               }
               else
               {
                  Environment.panelManager.showDialog(new UiInfoDialog(LocText.current.text("dialog/convention_no_fans/caption"),LocText.current.text("dialog/convention_no_fans/text_no_movie"),LocText.current.text("general/button_ok"),onClickMovie,false,true));
               }
               return;
            }
            _openConvention = true;
            Environment.application.sendActionRequest("setCharacterStage",{
               "stage":_loc2_.getConvention(_loc2_.conventionId).stage,
               "on_map":false
            },handleRequests);
         }
         else
         {
            Environment.panelManager.showDialog(new DialogBoosterMultitasking(onClickConventionMultitasking));
         }
      }
      
      private function onClickDungeonMultitasking(param1:InteractionEvent) : void
      {
         ViewManager.instance.tutorialArrow.hide();
         var _loc2_:Character = User.current.character;
         if(_loc2_.multitaskingBoosterActive || !_loc2_.activeConventionShow && !_loc2_.activeQuest)
         {
            if(_loc2_.currentDungeon)
            {
               Environment.application.sendActionRequest("setCharacterLocation",{"location":3},handleRequests);
            }
            else if(TimeUtil.serverDateTime.isToday(_loc2_.tsLastDungeonStarted))
            {
               Environment.panelManager.showDialog(new UiInfoDialog(LocText.current.text("dialog/dungeon_cooldown/title"),LocText.current.text("dialog/dungeon_cooldown/text"),LocText.current.text("general/button_ok")));
            }
            else
            {
               Environment.panelManager.showDialog(new DialogDungeonSelect());
            }
         }
         else
         {
            Environment.panelManager.showDialog(new DialogBoosterMultitasking(onClickDungeonMultitasking));
         }
      }
      
      private function onClickSenseBooster(param1:InteractionEvent) : void
      {
         Environment.panelManager.showDialog(new DialogBoosterSense());
      }
      
      private function onClickHelp(param1:InteractionEvent) : void
      {
         showTutorialDialog();
      }
      
      private function onClickQuest(param1:InteractionEvent) : void
      {
         clickQuest(param1.target);
      }
      
      private function clickQuest(param1:IInteractionTarget) : void
      {
         var _loc2_:UiButton = param1 as UiButton;
         if(_loc2_.tag == null)
         {
            return;
         }
         if(_loc2_ == _btnConvention && User.current.character.fansTotal == 0)
         {
            if(User.current.character.hasMovie)
            {
               Environment.panelManager.showDialog(new UiInfoDialog(LocText.current.text("dialog/convention_no_fans/caption"),LocText.current.text("dialog/convention_no_fans/text_movie_started"),LocText.current.text("general/button_ok"),onClickMovie,false,true));
            }
            else
            {
               Environment.panelManager.showDialog(new UiInfoDialog(LocText.current.text("dialog/convention_no_fans/caption"),LocText.current.text("dialog/convention_no_fans/text_no_movie"),LocText.current.text("general/button_ok"),onClickMovie,false,true));
            }
            return;
         }
         if(_loc2_ == _btnStoryDungeon)
         {
            User.current.character.setTutorialFlag("story_dungeon");
         }
         if(_loc2_ == _btnDating && _datingStep && (_datingStep.isFinished || _datingStep.allPointsCollected() && !_datingStep.isLastStep))
         {
            Environment.panelManager.showDialog(new DialogDatingOutcome(_datingStep,showDatingQuest));
            return;
         }
         ViewManager.instance.tutorialArrow.hide();
         Environment.panelManager.showDialog(new DialogQuestBriefing(_loc2_.tag,checkForConventionInfo));
      }
      
      public function showDatingQuest() : void
      {
         if(_btnDating.visible)
         {
            clickQuest(_btnDating);
         }
      }
      
      private function onClickMovie() : void
      {
         if(User.current.character.hasMovie)
         {
            ViewManager.instance.showPanel("movie_progress");
         }
         else
         {
            ViewManager.instance.showPanel("movie_offers");
         }
      }
      
      private function onClickCitymap(param1:InteractionEvent) : void
      {
         Environment.application.sendActionRequest("setCharacterLocation",{"location":1},handleRequests);
      }
      
      private function onClickPreviousStage(param1:InteractionEvent) : void
      {
         setStage(User.current.character.currentQuestStage - 1);
      }
      
      private function onClickNextStage(param1:InteractionEvent) : void
      {
         setStage(User.current.character.currentQuestStage + 1);
      }
      
      private function setStage(param1:int) : void
      {
         Environment.application.sendActionRequest("setCharacterStage",{
            "stage":param1,
            "on_map":false
         },handleRequests);
      }
      
      private function onClickStorage(param1:InteractionEvent) : void
      {
         if(User.current.character.currentEnergyStorage <= 0)
         {
            return;
         }
         Environment.panelManager.showDialog(new DialogUseEnergyStorage());
      }
      
      public function openQuest(param1:Quest) : void
      {
         if(User.current.character.currentQuestStage == param1.stage)
         {
            openQuestBriefingDialog(param1.id);
         }
         else
         {
            _openQuestId = param1.id;
            setStage(param1.stage);
         }
      }
      
      private function showTutorialDialog() : void
      {
         Environment.panelManager.showDialog(new DialogTutorialPopup(LocText.current.text("dialog/tutorial/quest/title"),LocText.current.text("dialog/tutorial/quest/text"),onTutorialDialogClosed));
      }
      
      private function onTutorialDialogClosed() : void
      {
         User.current.character.setTutorialFlag("quests");
      }
      
      private function handleMessages(param1:Message) : void
      {
         var _loc2_:* = param1.type;
         switch(_loc2_)
         {
            case "ViewMessage.notifyBattleFinished":
               if(PanelBattle.lastViewedMode != 6)
               {
                  return;
               }
               if(User.current.character.activeStoryDungeonBattle)
               {
                  if(ViewManager.instance.user.character.activeStoryDungeonBattle.id == ViewManager.instance.user.character.activeStoryDungeonAttackId)
                  {
                     Environment.panelManager.showDialog(new DialogStoryDungeonFought(ViewManager.instance.user.character.currentStoryDungeon));
                  }
                  else if(ViewManager.instance.user.character.activeStoryDungeonBattle.id == ViewManager.instance.user.character.activeRepeatStoryDungeonAttackId)
                  {
                     Environment.panelManager.showDialog(new DialogStoryDungeonFought(ViewManager.instance.user.character.repeatStoryDungeon));
                  }
                  if(!_storyDungeonBattlesShown.exists(User.current.character.activeStoryDungeonBattle.id))
                  {
                     _storyDungeonBattlesShown.setData(User.current.character.activeStoryDungeonBattle.id,true);
                  }
               }
               break;
            case "ViewMessage.notifyStatQuestFinished":
               if(PanelStatQuest.lastViewedMode != 7)
               {
                  return;
               }
               if(_datingStep)
               {
                  Environment.panelManager.showDialog(new DialogDatingOutcome(_datingStep,showDatingQuest));
               }
               break;
            default:
               throw new Error("Encountered unknown message type! type=" + param1.type);
         }
      }
      
      private function handleRequests(param1:ActionRequestResponse) : void
      {
         var _loc2_:* = param1.action;
         switch(_loc2_)
         {
            case "setCharacterStage":
               if(param1.error == "")
               {
                  Environment.application.updateData(param1.data);
                  if(_openQuestId != 0)
                  {
                     openQuestBriefingDialog(_openQuestId);
                     _openQuestId = 0;
                  }
                  else if(_openConvention)
                  {
                     if(_btnConvention.visible)
                     {
                        Environment.panelManager.showDialog(new DialogQuestBriefing(_btnConvention.tag,checkForConventionInfo));
                     }
                     _openConvention = false;
                  }
                  else if(User.current.character.activeConventionShow && User.current.character.currentQuestStage == User.current.character.getConvention(User.current.character.conventionId).stage)
                  {
                     ViewManager.instance.showPanel("quest_progress");
                  }
               }
               else if(param1.error != "errSetCharacterStageInvalidQuestStage")
               {
                  Environment.reportError(param1.error,param1.request);
               }
               break;
            case "setCharacterLocation":
               if(param1.error == "")
               {
                  Environment.application.updateData(param1.data);
                  if(User.current.character.currentLocation == 3)
                  {
                     PanelCitymap.lastAction = 2;
                     PanelDungeon.visualizeEnter = true;
                     ViewManager.instance.showPanel("dungeon");
                  }
               }
               else
               {
                  Environment.reportError(param1.error,param1.request);
               }
               break;
            case "createFanFoto":
               if(param1.error == "")
               {
                  Environment.application.updateData(param1.data);
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
