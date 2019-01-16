package com.playata.application.ui.panels
{
   import com.playata.application.AppConfig;
   import com.playata.application.AppEnvironment;
   import com.playata.application.data.AppDateTime;
   import com.playata.application.data.character.Character;
   import com.playata.application.data.constants.CConstant;
   import com.playata.application.data.convention.ConventionShow;
   import com.playata.application.data.event.EventQuest;
   import com.playata.application.data.herobook.Herobook;
   import com.playata.application.data.quest.IDurationEvent;
   import com.playata.application.data.quest.Quest;
   import com.playata.application.data.user.User;
   import com.playata.application.messaging.Message;
   import com.playata.application.messaging.MessageRouter;
   import com.playata.application.ui.ViewManager;
   import com.playata.application.ui.dialogs.DialogBoosterMultitasking;
   import com.playata.application.ui.dialogs.DialogConventionInfo;
   import com.playata.application.ui.dialogs.DialogConventionShowComplete;
   import com.playata.application.ui.dialogs.DialogDungeonSelect;
   import com.playata.application.ui.dialogs.DialogEventQuestIntro;
   import com.playata.application.ui.dialogs.DialogEventQuestOutro;
   import com.playata.application.ui.dialogs.DialogEventQuestProgress;
   import com.playata.application.ui.dialogs.DialogHerobook;
   import com.playata.application.ui.dialogs.DialogQuestBriefing;
   import com.playata.application.ui.dialogs.DialogQuestComplete;
   import com.playata.application.ui.elements.advertisement.UiVideoAdvertismentButton;
   import com.playata.application.ui.elements.application.UiLetterbox;
   import com.playata.application.ui.elements.background.UiBackgroundFader;
   import com.playata.application.ui.elements.convention.UiConventionMultitaskingButton;
   import com.playata.application.ui.elements.dungeon.UiDungeonMultitaskingButton;
   import com.playata.application.ui.elements.event.UiEventQuestButton;
   import com.playata.application.ui.elements.generic.button.UiPremiumButton;
   import com.playata.application.ui.elements.generic.button.UiTextButton;
   import com.playata.application.ui.elements.generic.dialog.UiInfoDialog;
   import com.playata.application.ui.elements.generic.progressbar.UiTimeBar;
   import com.playata.application.ui.elements.generic.textfield.UiTextTooltip;
   import com.playata.application.ui.elements.herobook.UiHerobookButton;
   import com.playata.application.ui.elements.hud.UiGameTip;
   import com.playata.application.ui.elements.quest.UiQuestMultitaskingButton;
   import com.playata.application.ui.elements.resource.UiUseResourceButton;
   import com.playata.framework.application.Environment;
   import com.playata.framework.application.request.ActionRequestResponse;
   import com.playata.framework.core.Runtime;
   import com.playata.framework.core.collection.IntMap;
   import com.playata.framework.core.timer.ITimer;
   import com.playata.framework.core.util.TimeUtil;
   import com.playata.framework.display.AnchorPoint;
   import com.playata.framework.input.InteractionEvent;
   import com.playata.framework.localization.LocText;
   import visuals.ui.panels.SymbolPanelQuestProgressGeneric;
   
   public class PanelQuestProgress extends DefaultPanel
   {
      
      private static var _shownDurationEventBattles:IntMap = new IntMap();
      
      private static var _shownStatQuests:IntMap = new IntMap();
       
      
      private var _btnInstantFinish:UiPremiumButton = null;
      
      private var _btnCancel:UiTextButton = null;
      
      private var _durationEvent:IDurationEvent = null;
      
      private var _currentDuration:int = 0;
      
      private var _timer:ITimer = null;
      
      private var _timeBar:UiTimeBar = null;
      
      private var _checkForCompleteFired:Boolean = false;
      
      private var _finishFired:Boolean = false;
      
      private var _battleShown:Boolean = false;
      
      private var _statQuestShown:Boolean = false;
      
      private var _gameTip:UiGameTip = null;
      
      private var _tooltipEnergy:UiTextTooltip = null;
      
      private var _tooltipEnergyText:UiTextTooltip = null;
      
      private var _tooltipTimeBar:UiTextTooltip = null;
      
      private var _tooltipTime:UiTextTooltip = null;
      
      private var _clientAbort:Boolean = false;
      
      private var _btnVideoAdvertisment:UiVideoAdvertismentButton = null;
      
      private var _btnUseResource:UiUseResourceButton = null;
      
      private var _btnEventQuest:UiEventQuestButton = null;
      
      private var _btnHerobook:UiHerobookButton = null;
      
      private var _btnConventionMultitasking:UiConventionMultitaskingButton;
      
      private var _btnDungeonMultitasking:UiDungeonMultitaskingButton;
      
      private var _btnQuestMultitasking:UiQuestMultitaskingButton;
      
      private var _letterBox:UiLetterbox = null;
      
      public function PanelQuestProgress(param1:SymbolPanelQuestProgressGeneric)
      {
         addExcludedFontScalingTextfield(param1.content.txtTimeLeft);
         super(param1);
         _btnCancel = new UiTextButton(param1.content.btnCancel,LocText.current.text("screen/quest_progress/button_cancel"),"",onClickCancel);
         _btnInstantFinish = new UiPremiumButton(param1.content.btnInstantFinish,0,"",LocText.current.text("screen/quest_progress/button_instant_finish"),"",LocText.current.text("screen/quest_progress/button_instant_finish_tooltip"),onClickInstantFinish);
         _btnInstantFinish.premium = true;
         _tooltipEnergy = new UiTextTooltip(param1.iconEnergy,"",getQuestEnergyTooltip);
         _tooltipEnergyText = new UiTextTooltip(param1.txtEnergyLeft,"",getQuestEnergyTooltip);
         _btnVideoAdvertisment = new UiVideoAdvertismentButton(param1.btnShowVideoAdvertisment);
         param1.addChild(_btnVideoAdvertisment);
         _btnUseResource = new UiUseResourceButton(param1.btnUseResource,1,true,"quest");
         _btnEventQuest = new UiEventQuestButton(param1.btnEventQuest,onClickEventQuest);
         _btnHerobook = new UiHerobookButton(param1.btnHerobook,onClickHerobook);
         _btnConventionMultitasking = new UiConventionMultitaskingButton(param1.btnConventionMultitasking,onClickConventionMultitasking);
         _btnDungeonMultitasking = new UiDungeonMultitaskingButton(param1.btnDungeonMultitasking,onClickDungeonMultitasking);
         _btnQuestMultitasking = new UiQuestMultitaskingButton(param1.btnQuestMultitasking,onClickQuestMultitasking);
         _timer = Environment.createTimer("PanelQuestProgress::timer",1000,onTimerEvent);
         _timeBar = new UiTimeBar(param1.content.timeBar);
         _gameTip = new UiGameTip(param1.gameTip);
         _tooltipTimeBar = new UiTextTooltip(param1.content.timeBar,"",getQuestEndTimeTooltip);
         _tooltipTime = new UiTextTooltip(param1.content.txtTimeLeft,"",getQuestEndTimeTooltip);
         MessageRouter.addListener("ViewMessage.notifyBattleFinished",handleMessages);
         MessageRouter.addListener("ViewMessage.notifyVideoAdvertismentFinished",handleMessages);
         MessageRouter.addListener("ViewMessage.notifyStatQuestFinished",handleMessages);
         _letterBox = new UiLetterbox(param1.letterbox);
         _anchorContainer.add(param1.letterbox.top,AnchorPoint.LEFT_RIGHT);
         _anchorContainer.add(param1.letterbox.bottom,AnchorPoint.LEFT_RIGHT);
         _anchorContainer.add(param1.letterbox.bottom,AnchorPoint.BOTTOM_FIXED);
         _anchorContainer.add(param1.gameTip,AnchorPoint.RIGHT_FIXED,0.5);
         _anchorContainer.add(param1.content,AnchorPoint.RIGHT_FIXED,0.5);
         _anchorContainer.add(param1.iconEnergy,AnchorPoint.TOP_RIGHT);
         _anchorContainer.add(param1.txtEnergyLeft,AnchorPoint.TOP_RIGHT);
         _anchorContainer.add(param1.btnShowVideoAdvertisment,AnchorPoint.RIGHT_FIXED);
         _anchorContainer.add(param1.btnUseResource,AnchorPoint.RIGHT_FIXED);
         _anchorContainer.add(param1.content,AnchorPoint.BOTTOM_FIXED,0.5);
         _anchorContainer.add(param1.btnShowVideoAdvertisment,AnchorPoint.BOTTOM_FIXED);
         _anchorContainer.add(param1.btnUseResource,AnchorPoint.BOTTOM_FIXED);
      }
      
      public static function resetShownDurationEventBattles() : void
      {
         _shownDurationEventBattles = new IntMap();
         _shownStatQuests = new IntMap();
      }
      
      override public function refreshPanelLocalization() : void
      {
         _btnCancel.caption = LocText.current.text("screen/quest_progress/button_cancel");
         _btnInstantFinish.premiumCaption = LocText.current.text("screen/quest_progress/button_instant_finish");
         _btnInstantFinish.premiumTooltip = LocText.current.text("screen/quest_progress/button_instant_finish_tooltip");
         if(_shown)
         {
            refresh();
         }
      }
      
      override public function dispose() : void
      {
         _vo.removeChild(_btnVideoAdvertisment);
         super.dispose();
         _btnInstantFinish.dispose();
         _btnCancel.dispose();
         _btnVideoAdvertisment.dispose();
         _btnUseResource.dispose();
         _btnEventQuest.dispose();
         _btnHerobook.dispose();
         _btnConventionMultitasking.dispose();
         _btnDungeonMultitasking.dispose();
         _btnQuestMultitasking.dispose();
         _btnInstantFinish = null;
         _btnCancel = null;
         _btnVideoAdvertisment = null;
         _btnUseResource = null;
         _btnEventQuest = null;
         _btnHerobook = null;
         _btnConventionMultitasking = null;
         _btnDungeonMultitasking = null;
         _btnQuestMultitasking = null;
         _timer.dispose();
         _timer = null;
         _timeBar.dispose();
         _timeBar = null;
         _gameTip.dispose();
         _gameTip = null;
         _tooltipEnergy.dispose();
         _tooltipEnergy = null;
         _tooltipEnergyText.dispose();
         _tooltipEnergyText = null;
         _tooltipTimeBar.dispose();
         _tooltipTimeBar = null;
         _tooltipTime.dispose();
         _tooltipTime = null;
         MessageRouter.removeAllListeners(handleMessages);
      }
      
      override public function refreshAppSize() : void
      {
         super.refreshAppSize();
         var _loc1_:SymbolPanelQuestProgressGeneric = _vo as SymbolPanelQuestProgressGeneric;
         UiBackgroundFader.scaleWidthCenter(_loc1_.storyDungeonOverlay);
         UiBackgroundFader.scaleWidthCenter(_loc1_.conventionOverlay);
      }
      
      private function getQuestEndTimeTooltip() : String
      {
         return LocText.current.text("screen/quest_progress/end_time_tooltip",AppDateTime.timestampToLocalString(TimeUtil.now + _durationEvent.remainingSeconds,AppDateTime.timeFormatHM,true));
      }
      
      private function getQuestEnergyTooltip() : String
      {
         return LocText.current.text("screen/quest/energy_amount_tooltip",TimeUtil.secondsToString(User.current.character.secondsUntilQuestEnergyRefresh));
      }
      
      public function get durationEvent() : IDurationEvent
      {
         return _durationEvent;
      }
      
      override public function reset() : void
      {
         _durationEvent = null;
         _checkForCompleteFired = false;
         _finishFired = false;
         _battleShown = false;
         _statQuestShown = false;
      }
      
      private function onTimerEvent() : void
      {
         try
         {
            if(!User.current)
            {
               if(_timer)
               {
                  _timer.stop();
               }
               return;
            }
            if(_durationEvent && _durationEvent.remainingSeconds <= 0)
            {
               performFinish();
               if(_timer)
               {
                  _timer.stop();
               }
            }
            if(!_shown)
            {
               if(_timer)
               {
                  _timer.stop();
               }
               return;
            }
            refreshProgressText();
            return;
         }
         catch(e:Error)
         {
            if(_timer)
            {
               _timer.stop();
            }
            return;
         }
      }
      
      private function onClickInstantFinish(param1:InteractionEvent) : void
      {
         _btnInstantFinish.buttonEnabled = false;
         _btnCancel.buttonEnabled = false;
         if(_durationEvent.isConventionShow)
         {
            Environment.application.sendActionRequest("instantFinishConventionShow",{},handleRequests);
         }
         else
         {
            Environment.application.sendActionRequest("instantFinishQuest",{},handleRequests);
         }
      }
      
      private function onClickCancel(param1:InteractionEvent) : void
      {
         _timer.stop();
         _clientAbort = true;
         _btnInstantFinish.buttonEnabled = false;
         _btnCancel.buttonEnabled = false;
         if(_durationEvent.isConventionShow)
         {
            Environment.application.sendActionRequest("abortConventionShow",{},handleRequests);
         }
         else
         {
            Environment.application.sendActionRequest("abortQuest",{},handleRequests);
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
         var _loc2_:Herobook = User.current.character.herobook;
         _loc2_.newObjectives = false;
         _btnHerobook.refresh(_loc2_);
         Environment.panelManager.showDialog(new DialogHerobook(_loc2_));
      }
      
      override public function show(param1:* = null) : void
      {
         _durationEvent = null;
         _btnVideoAdvertisment.visible = true;
         _btnUseResource.visible = false;
         if(User.current.character.activeConventionShow && User.current.character.activeQuest)
         {
            if(User.current.character.currentQuestStage == User.current.character.activeQuest.stage)
            {
               _durationEvent = User.current.character.activeQuest;
               _btnVideoAdvertisment.reset();
               _btnVideoAdvertisment.refresh(LocText.current.text("screen/quest_progress/button_video_advertisment_quest_tooltip",CConstant.video_advertisment_bonus_quest * 100),1,_durationEvent.remainingSeconds > _durationEvent.duration / 2?_durationEvent.id:0);
               _btnUseResource.featureFlag = "quest";
            }
            else
            {
               _durationEvent = User.current.character.activeConventionShow;
               _btnVideoAdvertisment.reset();
               _btnVideoAdvertisment.refresh(LocText.current.text("screen/quest_progress/button_video_advertisment_convention_show_tooltip",CConstant.video_advertisment_bonus_convention_show * 100),2,_durationEvent.remainingSeconds > _durationEvent.duration / 2?_durationEvent.id:0);
               _btnUseResource.featureFlag = "convention";
            }
         }
         else if(User.current.character.activeQuest)
         {
            _durationEvent = User.current.character.activeQuest;
            _btnVideoAdvertisment.reset();
            _btnVideoAdvertisment.refresh(LocText.current.text("screen/quest_progress/button_video_advertisment_quest_tooltip",CConstant.video_advertisment_bonus_quest * 100),1,_durationEvent.remainingSeconds > _durationEvent.duration / 2?_durationEvent.id:0);
            _btnUseResource.featureFlag = "quest";
         }
         else if(User.current.character.activeConventionShow)
         {
            _durationEvent = User.current.character.activeConventionShow;
            _btnVideoAdvertisment.reset();
            _btnVideoAdvertisment.refresh(LocText.current.text("screen/quest_progress/button_video_advertisment_convention_show_tooltip",CConstant.video_advertisment_bonus_convention_show * 100),2,_durationEvent.remainingSeconds > _durationEvent.duration / 2?_durationEvent.id:0);
            _btnUseResource.featureFlag = "convention";
         }
         _clientAbort = false;
         _currentDuration = _durationEvent.duration;
         var _loc2_:SymbolPanelQuestProgressGeneric = _vo as SymbolPanelQuestProgressGeneric;
         PanelQuests.refreshBackground(_loc2_.storyDungeonOverlay);
         PanelQuests.refreshBackgroundConventionOverlay(_loc2_.conventionOverlay);
         ViewManager.instance.fadeInPanel(_vo);
         _loc2_.content.txtDescription.text = _durationEvent.progressText;
         _loc2_.content.txtDescription.autoFontSize = true;
         _loc2_.txtEnergyLeft.text = LocText.current.text("general/energy_amount",User.current.character.questEnergy,Quest.maxQuestEnergy);
         _timeBar.reset();
         super.show(param1);
         if(_durationEvent.remainingSeconds > 0)
         {
            _gameTip.show();
            _letterBox.fadeIn();
            _timeBar.value = _durationEvent.progress;
            _timeBar.startAnimation(_durationEvent.remainingSeconds);
            _timer.start();
         }
         else
         {
            performFinish();
         }
      }
      
      override public function hide() : void
      {
         super.hide();
         if(_timeBar)
         {
            _timeBar.stopAnimation();
         }
         _checkForCompleteFired = false;
         if(_btnHerobook)
         {
            _btnHerobook.stopTimer();
         }
      }
      
      public function performFinish() : void
      {
         var vo:SymbolPanelQuestProgressGeneric = _vo as SymbolPanelQuestProgressGeneric;
         _letterBox.fadeOut();
         _gameTip.hide();
         ViewManager.instance.tutorialArrow.hide();
         if(_durationEvent.isStarted)
         {
            if(_checkForCompleteFired)
            {
               return;
            }
            _checkForCompleteFired = true;
            _btnInstantFinish.visible = false;
            _btnCancel.visible = false;
            _btnVideoAdvertisment.visible = false;
            _btnUseResource.visible = false;
            if(_durationEvent.isTimeQuest)
            {
               Environment.audio.playFX("event_quest_complete.mp3");
            }
            else if(_durationEvent.isConventionShow)
            {
               Environment.audio.playFX("event_convention_show_complete.mp3");
            }
            var completeCallback:Function = function():void
            {
               ViewManager.instance.baseUserPanel.allowMainNavigationButtons(true);
               if(_durationEvent.isConventionShow)
               {
                  Environment.application.sendActionRequest("checkForConventionShowComplete",{},handleRequests);
               }
               else
               {
                  Environment.application.sendActionRequest("checkForQuestComplete",{"check_event":true},handleRequests);
               }
            };
            ViewManager.instance.baseUserPanel.allowMainNavigationButtons(false);
            Runtime.delayFunction(completeCallback,2);
         }
         else if(_durationEvent.isFinished)
         {
            if(_durationEvent.isTimeQuest)
            {
               if(_finishFired == false)
               {
                  _finishFired = true;
                  Environment.panelManager.showDialog(new DialogQuestComplete(_durationEvent as Quest,onDurationEventCompleted));
               }
            }
            else if(_durationEvent.isStatQuest)
            {
               if(_statQuestShown == false && !_shownStatQuests.exists(_durationEvent.id))
               {
                  PanelStatQuest.movieMode = false;
                  PanelStatQuest.datingStep = null;
                  ViewManager.instance.showPanel("stat_quest");
               }
               else if(_finishFired == false && (_statQuestShown == true || _shownStatQuests.exists(_durationEvent.id)))
               {
                  _finishFired = true;
                  Environment.panelManager.showDialog(new DialogQuestComplete(_durationEvent as Quest,onDurationEventCompleted));
               }
            }
            else if(_durationEvent.isFightQuest)
            {
               if(_battleShown == false && !_shownDurationEventBattles.exists(_durationEvent.id))
               {
                  PanelBattle.activeQuest = User.current.character.activeQuest;
                  if(User.current.showFightMissionBattles)
                  {
                     ViewManager.instance.showPanel("battle");
                  }
                  else
                  {
                     onBattleFinished();
                  }
               }
               else if(_finishFired == false && (_battleShown == true || _shownDurationEventBattles.exists(_durationEvent.id)))
               {
                  _finishFired = true;
                  Environment.panelManager.showDialog(new DialogQuestComplete(_durationEvent as Quest,onDurationEventCompleted));
               }
            }
            else if(_durationEvent.isConventionShow)
            {
               if(_finishFired == false)
               {
                  _finishFired = true;
                  finishConventionShow();
               }
            }
         }
      }
      
      private function finishConventionShow() : void
      {
         if(DialogConventionShowComplete.isOpen)
         {
            return;
         }
         var _loc1_:int = 0;
         if(_durationEvent is ConventionShow)
         {
            _loc1_ = (_durationEvent as ConventionShow).conventionId;
         }
         Environment.application.sendActionRequest("finishConventionShow",{"convention_id":_loc1_},handleRequests);
      }
      
      private function onDurationEventCompleted() : void
      {
         _btnInstantFinish.buttonEnabled = true;
         _btnCancel.buttonEnabled = true;
         _checkForCompleteFired = false;
         _finishFired = false;
         _battleShown = false;
         _statQuestShown = false;
         _timer.stop();
      }
      
      public function get videoAdvertismentButton() : UiVideoAdvertismentButton
      {
         return _btnVideoAdvertisment;
      }
      
      override public function refresh() : void
      {
         if(!_durationEvent)
         {
            return;
         }
         super.refresh();
         var _loc1_:Character = User.current.character;
         if(_durationEvent is ConventionShow && !_clientAbort && !_finishFired)
         {
            if(!_loc1_.activeConventionShow)
            {
               if(User.current.character.activeQuest)
               {
                  Environment.application.sendActionRequest("setCharacterStage",{
                     "stage":User.current.character.activeQuest.stage,
                     "on_map":false
                  },handleRequests);
               }
               else
               {
                  ViewManager.instance.showPanel("quests");
               }
               finishConventionShow();
               return;
            }
         }
         if(_loc1_.onMap && _loc1_.maxQuestStage > 1)
         {
            ViewManager.instance.showPanel("citymap");
            return;
         }
         checkForConventionInfo();
         if(_currentDuration != _durationEvent.duration)
         {
            _timeBar.value = _durationEvent.progress;
            _timeBar.startAnimation(_durationEvent.remainingSeconds);
            _timer.start();
         }
         var _loc2_:SymbolPanelQuestProgressGeneric = _vo as SymbolPanelQuestProgressGeneric;
         _btnInstantFinish.premiumAmount = _durationEvent.instantFinishPremiumAmount;
         _btnInstantFinish.visible = _checkForCompleteFired == false && _durationEvent.isStarted;
         _btnCancel.visible = _checkForCompleteFired == false && _loc1_.level != 1 && _durationEvent.isStarted;
         _btnVideoAdvertisment.visible = _checkForCompleteFired == false && _durationEvent.isStarted && _loc1_.hasTutorialFlag("tutorial_finished");
         _btnUseResource.visible = _checkForCompleteFired == false && _durationEvent.isStarted && _loc1_.hasTutorialFlag("tutorial_finished") && AppEnvironment.appPlatform.isResourceRequestAllowed;
         _btnUseResource.refresh();
         _btnEventQuest.visible = _loc1_.hasEventQuest && _loc1_.hasTutorialFlag("tutorial_finished");
         if(_btnEventQuest.visible)
         {
            _btnEventQuest.refresh(_loc1_.eventQuest);
         }
         _btnHerobook.visible = _loc1_.level >= CConstant.herobook_teaser_min_level && _loc1_.hasTutorialFlag("tutorial_finished");
         _btnHerobook.buttonEnabled = _loc1_.level >= CConstant.herobook_min_level;
         if(_btnHerobook.visible)
         {
            _btnHerobook.refresh(_loc1_.herobook);
            if(_btnEventQuest.visible)
            {
               _loc2_.btnHerobook.y = 250;
            }
            else
            {
               _loc2_.btnHerobook.y = 164;
            }
         }
         _btnConventionMultitasking.visible = false;
         _btnDungeonMultitasking.visible = false;
         _btnQuestMultitasking.visible = false;
         if(AppConfig.multitaskingBoosterEnabled)
         {
            _btnDungeonMultitasking.refresh(_loc1_);
            if(_durationEvent is ConventionShow)
            {
               _btnQuestMultitasking.refresh(_loc1_);
            }
            else if(_loc1_.conventionId > 0 && !_loc1_.getActiveConventionByStage(_loc1_.currentQuestStage))
            {
               _btnConventionMultitasking.refresh(_loc1_.getConvention(_loc1_.conventionId));
            }
         }
         if(_btnConventionMultitasking.visible)
         {
            if(_btnHerobook.visible)
            {
               _loc2_.btnConventionMultitasking.y = _loc2_.btnHerobook.y + 80;
            }
            else if(_btnEventQuest.visible)
            {
               _loc2_.btnConventionMultitasking.y = _loc2_.btnEventQuest.y + 90;
            }
            else
            {
               _loc2_.btnConventionMultitasking.y = 155;
            }
         }
         if(_btnQuestMultitasking.visible)
         {
            if(_btnHerobook.visible)
            {
               _loc2_.btnQuestMultitasking.y = _loc2_.btnHerobook.y + 60;
            }
            else if(_btnEventQuest.visible)
            {
               _loc2_.btnQuestMultitasking.y = _loc2_.btnEventQuest.y + 70;
            }
            else
            {
               _loc2_.btnQuestMultitasking.y = 140;
            }
         }
         if(_btnDungeonMultitasking.visible)
         {
            if(_btnConventionMultitasking.visible)
            {
               _loc2_.btnDungeonMultitasking.y = _loc2_.btnConventionMultitasking.y + 80;
            }
            else if(_btnQuestMultitasking.visible)
            {
               _loc2_.btnDungeonMultitasking.y = _loc2_.btnQuestMultitasking.y + 100;
            }
            else if(_btnHerobook.visible)
            {
               _loc2_.btnDungeonMultitasking.y = _loc2_.btnHerobook.y + 70;
            }
            else if(_btnEventQuest.visible)
            {
               _loc2_.btnDungeonMultitasking.y = _loc2_.btnEventQuest.y + 80;
            }
            else
            {
               _loc2_.btnDungeonMultitasking.y = 156;
            }
         }
         refreshProgressText();
      }
      
      private function refreshProgressText() : void
      {
         var _loc2_:int = 0;
         var _loc1_:SymbolPanelQuestProgressGeneric = _vo as SymbolPanelQuestProgressGeneric;
         if(_durationEvent.remainingSeconds > 0)
         {
            _loc1_.content.txtTimeLeft.visible = true;
            _loc2_ = Math.min(_durationEvent.remainingSeconds,_durationEvent.duration);
            platform.setActivityTimeTitle(_loc2_,LocText.current.text("general/occupied_with_quest_title_bar"),ViewManager.instance.titleBarPrefix);
            if(User.current.character.questBoosterActive)
            {
               _loc1_.content.txtTimeLeft.text = LocText.current.text("screen/quest_progress/wait_boosted",TimeUtil.secondsToString(_loc2_),User.current.character.activeQuestBoosterAmount);
            }
            else
            {
               _loc1_.content.txtTimeLeft.text = LocText.current.text("screen/quest_progress/wait",TimeUtil.secondsToString(_loc2_));
            }
         }
         else
         {
            platform.setPageTitle(LocText.current.text("general/completed_quest_title_bar"),ViewManager.instance.titleBarPrefix);
            _loc1_.content.txtTimeLeft.text = LocText.current.text("screen/quest_progress/finished");
            _loc1_.content.txtTimeLeft.visible = _durationEvent.isTimeQuest;
            _timeBar.value = 100;
            performFinish();
         }
      }
      
      private function handleMessages(param1:Message) : void
      {
         var _loc2_:* = param1.type;
         switch(_loc2_)
         {
            case "ViewMessage.notifyBattleFinished":
               if(PanelBattle.lastViewedMode != 1)
               {
                  return;
               }
               if(User.current.character.activeQuest && User.current.character.activeQuest.isFinished)
               {
                  onBattleFinished();
               }
               break;
            case "ViewMessage.notifyStatQuestFinished":
               if(PanelStatQuest.lastViewedMode != 1)
               {
                  return;
               }
               if(User.current.character.activeQuest && User.current.character.activeQuest.isFinished)
               {
                  if(User.current.character.activeQuest.isWon)
                  {
                     Environment.audio.playFX("event_quest_complete.mp3");
                  }
                  else
                  {
                     Environment.audio.playFX("event_quest_lost.mp3");
                  }
                  _statQuestShown = true;
                  if(!_shownStatQuests.exists(User.current.character.activeQuest.id))
                  {
                     _shownStatQuests.setData(User.current.character.activeQuest.id,true);
                  }
                  performFinish();
               }
               break;
            case "ViewMessage.notifyVideoAdvertismentFinished":
               if(param1.data.type != 1 && param1.data.type != 2)
               {
                  return;
               }
               if(param1.data.reference_id != _durationEvent.id)
               {
                  return;
               }
               _timeBar.value = _durationEvent.progress;
               _timeBar.startAnimation(_durationEvent.remainingSeconds);
               _timer.start();
               break;
            default:
               throw new Error("Encountered unknown message type! type=" + param1.type);
         }
      }
      
      private function onBattleFinished() : void
      {
         if(User.current.character.activeQuest.isWon)
         {
            Environment.audio.playFX("event_quest_complete.mp3");
         }
         else
         {
            Environment.audio.playFX("event_quest_lost.mp3");
         }
         _battleShown = true;
         if(!_shownDurationEventBattles.exists(User.current.character.activeQuest.id))
         {
            _shownDurationEventBattles.setData(User.current.character.activeQuest.id,true);
         }
         performFinish();
      }
      
      private function onClickConventionMultitasking(param1:InteractionEvent) : void
      {
         ViewManager.instance.tutorialArrow.hide();
         if(User.current.character.multitaskingBoosterActive)
         {
            if(User.current.character.activeConventionShow)
            {
               Environment.application.sendActionRequest("setCharacterStage",{
                  "stage":User.current.character.getConvention(User.current.character.conventionId).stage,
                  "on_map":false
               },handleRequests);
               return;
            }
            if(User.current.character.fansTotal == 0)
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
            Environment.panelManager.showDialog(new DialogQuestBriefing(User.current.character.getConvention(User.current.character.conventionId),checkForConventionInfo));
         }
         else
         {
            Environment.panelManager.showDialog(new DialogBoosterMultitasking(onClickConventionMultitasking));
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
         var _loc1_:SymbolPanelQuestProgressGeneric = _vo as SymbolPanelQuestProgressGeneric;
         PanelCitymap.checkForConventionInfo();
         PanelQuests.refreshBackground(_loc1_.storyDungeonOverlay);
         PanelQuests.refreshBackgroundConventionOverlay(_loc1_.conventionOverlay);
      }
      
      private function onClickDungeonMultitasking(param1:InteractionEvent) : void
      {
         ViewManager.instance.tutorialArrow.hide();
         if(User.current.character.multitaskingBoosterActive)
         {
            if(User.current.character.currentDungeon)
            {
               Environment.application.sendActionRequest("setCharacterLocation",{"location":3},handleRequests);
            }
            else if(TimeUtil.serverDateTime.isToday(User.current.character.tsLastDungeonStarted))
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
      
      private function onClickQuestMultitasking(param1:InteractionEvent) : void
      {
         if(User.current.character.multitaskingBoosterActive)
         {
            if(User.current.character.activeQuest)
            {
               Environment.application.sendActionRequest("setCharacterStage",{
                  "stage":User.current.character.activeQuest.stage,
                  "on_map":false
               },handleRequests);
            }
            else
            {
               Environment.application.sendActionRequest("setCharacterLocation",{"location":1},handleRequests);
            }
         }
         else
         {
            Environment.panelManager.showDialog(new DialogBoosterMultitasking(onClickQuestMultitasking));
         }
      }
      
      private function handleRequests(param1:ActionRequestResponse) : void
      {
         response = param1;
         var _loc3_:* = response.action;
         switch(_loc3_)
         {
            case "abortQuest":
               if(response.error == "")
               {
                  Environment.panelManager.showDialog(new UiInfoDialog(LocText.current.text("screen/quest_progress/abort_title"),LocText.current.text("screen/quest_progress/abort_text"),LocText.current.text("general/button_ok")));
                  Environment.application.updateData(response.data);
                  ViewManager.instance.showPanel("quests");
                  _btnInstantFinish.buttonEnabled = true;
                  _btnCancel.buttonEnabled = true;
               }
               else if(response.error != "errAbortAlreadyFinished")
               {
                  Environment.reportError(response.error,response.request);
               }
               break;
            case "instantFinishQuest":
               if(response.error == "")
               {
                  Environment.application.updateData(response.data);
               }
               else if(response.error == "errRemovePremiumCurrencyNotEnough")
               {
                  _btnInstantFinish.buttonEnabled = true;
                  _btnCancel.buttonEnabled = true;
                  ViewManager.instance.showNotEnoughPremiumDialog(_durationEvent.instantFinishPremiumAmount);
               }
               else
               {
                  Environment.reportError(response.error,response.request);
               }
               break;
            case "checkForQuestComplete":
               if(response.error == "")
               {
                  Environment.application.updateData(response.data);
               }
               else if(response.error == "errFinishNotYetCompleted" || response.error == "errorIO" || response.error == "errorIO 2032" || response.error == "errorIO 0")
               {
                  var completeCallback:Function = function():void
                  {
                     Environment.application.sendActionRequest("checkForQuestComplete",{"check_event":true},handleRequests);
                  };
                  Runtime.delayFunction(completeCallback,1);
               }
               else if(response.error == "errFinishInvalidStatus")
               {
                  _checkForCompleteFired = false;
               }
               else
               {
                  _checkForCompleteFired = false;
                  Environment.reportError(response.error,response.request);
               }
               break;
            case "abortConventionShow":
               if(response.error == "")
               {
                  Environment.panelManager.showDialog(new UiInfoDialog(LocText.current.text("screen/quest_progress/abort_title"),LocText.current.text("screen/quest_progress/abort_text"),LocText.current.text("general/button_ok")));
                  Environment.application.updateData(response.data);
                  if(User.current.character.activeQuest)
                  {
                     Environment.application.sendActionRequest("setCharacterStage",{
                        "stage":User.current.character.activeQuest.stage,
                        "on_map":false
                     },handleRequests);
                  }
                  else
                  {
                     ViewManager.instance.showPanel("quests");
                  }
                  _btnInstantFinish.buttonEnabled = true;
                  _btnCancel.buttonEnabled = true;
               }
               else if(response.error == "errAbortConventionShowNoActiveConventionShow")
               {
                  finishConventionShow();
               }
               else
               {
                  Environment.reportError(response.error,response.request);
               }
               break;
            case "instantFinishConventionShow":
               if(response.error == "")
               {
                  Environment.application.updateData(response.data);
               }
               else if(response.error == "errRemovePremiumCurrencyNotEnough")
               {
                  _btnInstantFinish.buttonEnabled = true;
                  _btnCancel.buttonEnabled = true;
                  ViewManager.instance.showNotEnoughPremiumDialog(_durationEvent.instantFinishPremiumAmount);
               }
               else if(response.error == "errInstantFinishConventionShowNoActiveConvention")
               {
                  finishConventionShow();
               }
               else
               {
                  Environment.reportError(response.error,response.request);
               }
               break;
            case "checkForConventionShowComplete":
               if(response.error == "")
               {
                  ViewManager.instance.baseUserPanel.refreshGameCurrencyPanel(User.current.character.activeConventionShow.rewardValue);
                  Environment.application.updateData(response.data);
               }
               else if(response.error == "errFinishNotYetCompleted" || response.error == "errorIO" || response.error == "errorIO 2032" || response.error == "errorIO 0")
               {
                  var completeCallbackConventionShow:Function = function():void
                  {
                     Environment.application.sendActionRequest("checkForConventionShowComplete",{},handleRequests);
                  };
                  Runtime.delayFunction(completeCallbackConventionShow,1);
               }
               else if(response.error == "errFinishInvalidStatus")
               {
                  _checkForCompleteFired = false;
               }
               else if(response.error == "errPerformConventionShowInvalidStatus")
               {
                  finishConventionShow();
               }
               else if(response.error == "errCheckForConventionShowCompleteNoActiveConventionShow")
               {
                  finishConventionShow();
               }
               else
               {
                  Environment.reportError(response.error,response.request);
               }
               break;
            case "finishConventionShow":
               if(response.error == "")
               {
                  Environment.application.updateData(response.data);
                  var conventionShow:ConventionShow = _durationEvent as ConventionShow;
                  if(conventionShow.convention.isRunning)
                  {
                     Environment.panelManager.showDialog(new DialogConventionShowComplete(conventionShow));
                  }
                  else if(conventionShow.convention.isFinished)
                  {
                     if(!DialogConventionInfo.hasBeenShown(conventionShow.convention))
                     {
                        Environment.panelManager.showDialog(new DialogConventionInfo(conventionShow.convention));
                     }
                  }
                  else if(conventionShow.convention.isPending)
                  {
                     if(AppConfig.multitaskingBoosterEnabled && User.current.character.activeQuest)
                     {
                        Environment.application.sendActionRequest("setCharacterStage",{
                           "stage":User.current.character.activeQuest.stage,
                           "on_map":false
                        },handleRequests);
                     }
                     else
                     {
                        ViewManager.instance.showPanel("quests");
                     }
                     if(!DialogConventionInfo.hasBeenShown(conventionShow.convention))
                     {
                        Environment.panelManager.showDialog(new DialogConventionInfo(conventionShow.convention));
                     }
                  }
                  onDurationEventCompleted();
               }
               else
               {
                  Environment.reportError(response.error,response.request);
               }
               break;
            case "setCharacterLocation":
               if(response.error == "")
               {
                  Environment.application.updateData(response.data);
                  if(User.current.character.currentLocation == 3)
                  {
                     PanelCitymap.lastAction = 2;
                     PanelDungeon.visualizeEnter = true;
                     ViewManager.instance.showPanel("dungeon");
                  }
               }
               else
               {
                  Environment.reportError(response.error,response.request);
               }
               break;
            case "setCharacterStage":
               if(response.error == "")
               {
                  Environment.application.updateData(response.data);
                  ViewManager.instance.showPanel("quests");
               }
               else if(response.error != "errSetCharacterStageInvalidQuestStage")
               {
                  Environment.reportError(response.error,response.request);
               }
               break;
            default:
               throw new Error("Unsupported request action \'" + response.action + "\'!");
         }
      }
   }
}
