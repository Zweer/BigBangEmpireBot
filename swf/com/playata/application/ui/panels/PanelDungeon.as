package com.playata.application.ui.panels
{
   import com.greensock.easing.Quad;
   import com.playata.application.AppConfig;
   import com.playata.application.data.character.Character;
   import com.playata.application.data.dungeon.Dungeon;
   import com.playata.application.data.dungeon.DungeonQuest;
   import com.playata.application.data.server.SyncStates;
   import com.playata.application.data.user.User;
   import com.playata.application.messaging.Message;
   import com.playata.application.messaging.MessageRouter;
   import com.playata.application.ui.ViewManager;
   import com.playata.application.ui.dialogs.DialogBoosterMultitasking;
   import com.playata.application.ui.dialogs.DialogDungeonExtendTime;
   import com.playata.application.ui.dialogs.DialogDungeonLevelUnlock;
   import com.playata.application.ui.dialogs.DialogDungeonOutro;
   import com.playata.application.ui.dialogs.DialogDungeonQuestBriefing;
   import com.playata.application.ui.dialogs.DialogDungeonQuestComplete;
   import com.playata.application.ui.dialogs.DialogDungeonStatus;
   import com.playata.application.ui.dialogs.DialogQuestBriefing;
   import com.playata.application.ui.dialogs.DialogTutorialPopup;
   import com.playata.application.ui.elements.background.UiBackgroundMetrics;
   import com.playata.application.ui.elements.convention.UiConventionMultitaskingButton;
   import com.playata.application.ui.elements.dungeon.UiDungeonPath;
   import com.playata.application.ui.elements.dungeon.UiDungeonPointButton;
   import com.playata.application.ui.elements.dungeon.UiDungeonStatusButton;
   import com.playata.application.ui.elements.generic.button.UiButton;
   import com.playata.application.ui.elements.generic.dialog.UiInfoDialog;
   import com.playata.application.ui.elements.quest.UiQuestMultitaskingButton;
   import com.playata.framework.application.Environment;
   import com.playata.framework.application.request.ActionRequestResponse;
   import com.playata.framework.core.logging.Logger;
   import com.playata.framework.core.timer.ITimer;
   import com.playata.framework.core.util.NumberUtil;
   import com.playata.framework.core.util.TimeUtil;
   import com.playata.framework.display.AnchorPoint;
   import com.playata.framework.display.UriSprite;
   import com.playata.framework.input.InteractionEvent;
   import com.playata.framework.localization.LocText;
   import flash.geom.Point;
   import visuals.ui.panels.SymbolPanelDungeonGeneric;
   
   public class PanelDungeon extends DefaultPanel
   {
      
      private static var _visualizeProgress:Boolean = false;
      
      private static var _visualizeEnter:Boolean = false;
      
      private static var _visualizeEnd:Boolean = false;
      
      private static var _instance:PanelDungeon = null;
       
      
      private var _btnHelp:UiButton = null;
      
      private var _btnCurrentDungeonPoint:UiDungeonPointButton = null;
      
      private var _btnCitymap:UiButton = null;
      
      private var _btnStatus:UiDungeonStatusButton;
      
      private var _path:UiDungeonPath = null;
      
      private var _currentDungeonPointButtonTweenSettings:Object = null;
      
      private var _pathLayerTweenSettings:Object = null;
      
      private var _timer:ITimer;
      
      private var _btnConventionMultitasking:UiConventionMultitaskingButton;
      
      private var _btnQuestMultitasking:UiQuestMultitaskingButton;
      
      public function PanelDungeon(param1:SymbolPanelDungeonGeneric)
      {
         super(param1);
         _instance = this;
         _btnHelp = new UiButton(param1.btnHelp,LocText.current.text("general/button_help"),onClickHelp);
         _btnCurrentDungeonPoint = new UiDungeonPointButton(param1.dungeonContent.btnCurrentDungeonQuest,onClickCurrentDungeonPoint);
         _btnCitymap = new UiButton(param1.btnCitymap,LocText.current.text("screen/dungeon/button_back_tooltip"),onClickCitymap);
         _btnStatus = new UiDungeonStatusButton(param1.btnDungeonStatus,onClickStatus);
         _btnConventionMultitasking = new UiConventionMultitaskingButton(param1.btnConventionMultitasking,onClickConventionMultitasking);
         _btnQuestMultitasking = new UiQuestMultitaskingButton(param1.btnQuestMultitasking,onClickCitymap);
         _path = new UiDungeonPath(param1.dungeonContent.path);
         MessageRouter.addListener("ViewMessage.notifyBattleFinished",handleMessages);
         MessageRouter.addListener("ViewMessage.notifyStatQuestFinished",handleMessages);
         _timer = Environment.createTimer("PanelDungeon::timer",1000,onTimerEvent);
         _anchorContainer.add(param1.txtName,AnchorPoint.RIGHT_FIXED,0.5);
         _anchorContainer.add(param1.txtProgress,AnchorPoint.RIGHT_FIXED,0.5);
         _anchorContainer.add(param1.timeLeft,AnchorPoint.RIGHT_FIXED);
         _anchorContainer.add(param1.btnDungeonStatus,AnchorPoint.RIGHT_FIXED);
      }
      
      public static function set visualizeProgress(param1:Boolean) : void
      {
         _visualizeProgress = param1;
      }
      
      public static function set visualizeEnter(param1:Boolean) : void
      {
         _visualizeEnter = param1;
      }
      
      public static function set visualizeEnd(param1:Boolean) : void
      {
         _visualizeEnd = param1;
      }
      
      public static function get instance() : PanelDungeon
      {
         return _instance;
      }
      
      override public function refreshAppSize() : void
      {
         super.refreshAppSize();
         var _loc3_:SymbolPanelDungeonGeneric = _vo as SymbolPanelDungeonGeneric;
         var _loc2_:Number = Environment.layout.appHeight / Environment.layout.appDefaultHeight;
         var _loc1_:Number = Environment.layout.appWidth / Environment.layout.appDefaultWidth;
         var _loc4_:* = _loc2_;
         if(_loc2_ > _loc1_)
         {
            _loc4_ = _loc1_;
         }
         _loc3_.dungeonContent.scale = _loc4_;
      }
      
      private function onTimerEvent() : void
      {
         if(!User.current)
         {
            stopTimer();
            return;
         }
         if(!dungeon)
         {
            stopTimer();
            return;
         }
         var _loc1_:SymbolPanelDungeonGeneric = _vo as SymbolPanelDungeonGeneric;
         var _loc2_:int = dungeon.remainingSeconds;
         _loc1_.timeLeft.txtTimeLeft.text = TimeUtil.secondsToStringFormat(_loc2_,"H:m:s");
         if(dungeon.remainingSeconds <= 0)
         {
            platform.setPageTitle(LocText.current.text("general/time_up_dungeon_title_bar"),ViewManager.instance.titleBarPrefix);
            SyncStates.pendingSyncGame = true;
            ViewManager.instance.baseUserPanel.onSynGame();
            stopTimer();
         }
         else
         {
            platform.setActivityTimeTitle(_loc2_,LocText.current.text("general/active_dungeon_title_bar"),ViewManager.instance.titleBarPrefix);
         }
      }
      
      private function stopTimer() : void
      {
         if(!_timer)
         {
            return;
         }
         _timer.stop();
      }
      
      override public function refreshPanelLocalization() : void
      {
         _btnCitymap.tooltip = LocText.current.text("screen/dungeon/button_back_tooltip");
         _btnStatus.tooltip = LocText.current.text("screen/dungeon/button_status_tooltip");
      }
      
      override public function dispose() : void
      {
         super.dispose();
         _btnHelp.dispose();
         _btnHelp = null;
         _btnCurrentDungeonPoint.dispose();
         _btnCurrentDungeonPoint = null;
         _btnCitymap.dispose();
         _btnCitymap = null;
         _btnStatus.dispose();
         _btnStatus = null;
         _path.dispose();
         _path = null;
         _btnConventionMultitasking.dispose();
         _btnConventionMultitasking = null;
         _btnQuestMultitasking.dispose();
         _btnQuestMultitasking = null;
      }
      
      override public function show(param1:* = null) : void
      {
         super.show(param1);
         if(!User.current.character.hasTutorialFlag("dungeon"))
         {
            showTutorialDialog();
         }
         refreshBackground();
         ViewManager.instance.fadeInPanel(_vo);
         if(activeDungeonQuest)
         {
            if(activeDungeonQuest.isFought && !activeDungeonQuest.isFinished)
            {
               if(activeDungeonQuest.isFightQuest)
               {
                  if(User.current.showDungeonBattles)
                  {
                     PanelBattle.activeDungeonQuest = User.current.character.activeDungeonQuest;
                     ViewManager.instance.showPanel("battle");
                  }
                  else
                  {
                     PanelBattle.lastViewedMode = 3;
                     MessageRouter.dispatch(new Message("ViewMessage.notifyBattleFinished",null,this));
                  }
                  return;
               }
               if(activeDungeonQuest.isStatQuest)
               {
                  PanelStatQuest.movieMode = false;
                  PanelStatQuest.datingStep = null;
                  ViewManager.instance.showPanel("stat_quest");
                  return;
               }
            }
            else if(activeDungeonQuest.isFinished)
            {
               showCompleteDialog();
            }
         }
         else if(dungeon.currentDungeonQuest)
         {
            UriSprite.load(dungeon.currentDungeonQuest.npcImageUrl,350,510,true,1,null,true);
         }
         checkDungeonStatus();
         onTimerEvent();
         _timer.start();
      }
      
      override public function hide() : void
      {
         super.hide();
         stopTimer();
      }
      
      override public function refresh() : void
      {
         var _loc1_:* = null;
         if(!_shown)
         {
            return;
         }
         super.refresh();
         if(!dungeon)
         {
            if(!DialogDungeonOutro.isOpen)
            {
               if(User.current.character.onMap)
               {
                  ViewManager.instance.showPanel("citymap");
               }
               else
               {
                  ViewManager.instance.showPanel("quests");
               }
            }
            stopTimer();
            return;
         }
         var _loc2_:SymbolPanelDungeonGeneric = _vo as SymbolPanelDungeonGeneric;
         _loc2_.txtName.text = dungeon.name;
         _loc2_.txtProgress.text = LocText.current.text("screen/dungeon/progress",dungeon.numQuestsCompleted,dungeon.numQuestsTotal);
         _btnConventionMultitasking.visible = false;
         _btnQuestMultitasking.visible = false;
         if(AppConfig.multitaskingBoosterEnabled)
         {
            _loc1_ = User.current.character;
            if(_loc1_.conventionId > 0)
            {
               _btnConventionMultitasking.refresh(_loc1_.getConvention(_loc1_.conventionId));
            }
            if(_loc1_.activeQuest)
            {
               _btnQuestMultitasking.refresh(_loc1_);
               _btnCitymap.visible = false;
            }
            else
            {
               _btnCitymap.visible = true;
            }
         }
         if(_btnQuestMultitasking.visible)
         {
            if(_btnConventionMultitasking.visible)
            {
               _loc2_.btnQuestMultitasking.y = _loc2_.btnConventionMultitasking.y + 90;
            }
            else
            {
               _loc2_.btnQuestMultitasking.y = 220;
            }
         }
         checkDungeonStatus();
         PanelCitymap.checkForConventionInfo();
      }
      
      public function checkDungeonStatus() : void
      {
         if(!DialogDungeonOutro.isOpen && !DialogDungeonQuestBriefing.isOpen && !DialogDungeonLevelUnlock.isOpen && !DialogDungeonExtendTime.isOpen && !DialogDungeonQuestComplete.isOpen && dungeon)
         {
            if(dungeon.isFinished)
            {
               showDungeonCompleteDialog();
            }
            else if(dungeon.isTimeUp || dungeon.remainingSeconds <= 0)
            {
               Environment.panelManager.showDialog(new DialogDungeonExtendTime(dungeonTimeExtended,showDungeonCompleteDialog));
               stopTimer();
            }
         }
      }
      
      private function showDungeonCompleteDialog() : void
      {
         stopTimer();
         Environment.panelManager.showDialog(new DialogDungeonOutro(dungeon));
      }
      
      private function dungeonTimeExtended() : void
      {
         _timer.start();
      }
      
      public function showCompleteDialog() : void
      {
         if(User.current.character.activeDungeonQuest.isWon)
         {
            Environment.audio.playFX("event_dungeon_battle_won.mp3");
         }
         else
         {
            Environment.audio.playFX("event_dungeon_battle_lost.mp3");
         }
         Environment.panelManager.showDialog(new DialogDungeonQuestComplete(activeDungeonQuest));
      }
      
      public function get activeDungeonQuest() : DungeonQuest
      {
         return User.current.character.activeDungeonQuest;
      }
      
      public function get dungeon() : Dungeon
      {
         if(User.current.character.currentDungeon)
         {
            return User.current.character.currentDungeon;
         }
         return null;
      }
      
      private function onClickStatus(param1:InteractionEvent) : void
      {
         Environment.panelManager.showDialog(new DialogDungeonStatus(dungeon));
      }
      
      private function onClickHelp(param1:InteractionEvent) : void
      {
         showTutorialDialog();
      }
      
      private function showTutorialDialog() : void
      {
         Environment.panelManager.showDialog(new DialogTutorialPopup(LocText.current.text("dialog/tutorial/dungeon/title"),LocText.current.text("dialog/tutorial/dungeon/text"),onTutorialDialogClosed));
      }
      
      private function onTutorialDialogClosed() : void
      {
         User.current.character.setTutorialFlag("dungeon");
      }
      
      private function onClickCurrentDungeonPoint(param1:InteractionEvent) : void
      {
         if(dungeon.currentLevel.isFinished)
         {
            Environment.panelManager.showDialog(new DialogDungeonLevelUnlock(dungeon.nextLevel,refreshBackground));
         }
         else
         {
            Environment.panelManager.showDialog(new DialogDungeonQuestBriefing(dungeon.currentDungeonQuest));
         }
      }
      
      private function onClickCitymap(param1:InteractionEvent) : void
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
      
      public function refreshBackground() : void
      {
         var _loc5_:Number = NaN;
         var _loc2_:Number = NaN;
         _btnStatus.refresh(dungeon);
         var _loc1_:UiBackgroundMetrics = ViewManager.instance.backgroundFader.getBackgroundMetrics(dungeon.currentBackgroundType);
         var _loc6_:* = _loc1_.width > 1120;
         var _loc4_:* = _loc1_.height > 630;
         var _loc9_:Point = null;
         var _loc7_:Point = null;
         var _loc3_:* = 0;
         var _loc8_:* = 0;
         if(_visualizeProgress)
         {
            _path.refresh(dungeon,true,onPathCompleted);
            _loc7_ = _path.previousButtonCoordinates;
            _loc3_ = Number(!!_loc6_?NumberUtil.clampf(560 - _loc7_.x,_loc1_.minX,0):0);
            _loc8_ = Number(!!_loc4_?NumberUtil.clampf(315 - _loc7_.y,_loc1_.minY,0):0);
            _btnCurrentDungeonPoint.visible = true;
            _btnCurrentDungeonPoint.content.visible = false;
            ViewManager.instance.setBackground(dungeon.currentBackgroundType,new Point(_loc3_,_loc8_),null,false);
            _visualizeProgress = false;
         }
         else if(_visualizeEnter)
         {
            _path.refresh(dungeon,false);
            _loc9_ = _path.currentButtonCoordinates;
            _loc7_ = _path.previousButtonCoordinates;
            _loc3_ = Number(!!_loc6_?NumberUtil.clampf(560 - _loc9_.x,_loc1_.minX,0):0);
            _loc8_ = Number(!!_loc6_?NumberUtil.clampf(315 - _loc9_.y,_loc1_.minY,0):0);
            _loc5_ = !!_loc6_?Math.max(_loc1_.minX,Math.min(0,560 - _loc7_.x)):0;
            _loc2_ = !!_loc4_?Math.max(_loc1_.minY,Math.min(0,315 - _loc7_.y)):0;
            _path.pathLayer.x = _loc3_;
            _path.pathLayer.y = _loc8_;
            if(!dungeon.isFinished)
            {
               _btnCurrentDungeonPoint.content.x = _loc9_.x + _loc3_;
               _btnCurrentDungeonPoint.content.y = _loc9_.y + _loc8_;
               _btnCurrentDungeonPoint.refresh(dungeon);
               _btnCurrentDungeonPoint.visible = true;
               _btnCurrentDungeonPoint.content.visible = true;
            }
            if(_loc3_ != 0 || _loc8_ != 0 || _loc5_ != 0 || _loc2_ != 0)
            {
               _currentDungeonPointButtonTweenSettings = {
                  "x":_loc9_.x + _loc5_,
                  "y":_loc9_.y + _loc2_,
                  "ease":Quad.easeInOut
               };
               _pathLayerTweenSettings = {
                  "x":_loc5_,
                  "y":_loc2_,
                  "ease":Quad.easeInOut
               };
               ViewManager.instance.setBackground(dungeon.currentBackgroundType,new Point(_loc3_,_loc8_),new Point(_loc5_,_loc2_),true,backgroundTweenStarted);
            }
            else
            {
               ViewManager.instance.setBackground(dungeon.currentBackgroundType,new Point(_loc3_,_loc8_),null,false);
            }
            _visualizeEnter = false;
         }
         else if(_visualizeEnd)
         {
            _path.refresh(dungeon,true,null,true);
            _loc3_ = Number(!!_loc6_?_loc1_.minY:0);
            _loc8_ = Number(!!_loc4_?0:0);
            _path.pathLayer.x = _loc3_;
            _path.pathLayer.y = _loc8_;
            _btnCurrentDungeonPoint.visible = false;
            ViewManager.instance.setBackground(dungeon.currentBackgroundType,new Point(_loc3_,_loc8_),null,false);
            _visualizeEnd = false;
         }
         else
         {
            _path.refresh(dungeon,false);
            _loc9_ = _path.currentButtonCoordinates;
            _loc3_ = Number(!!_loc6_?NumberUtil.clampf(560 - _loc9_.x,_loc1_.minX,0):0);
            _loc8_ = Number(!!_loc6_?NumberUtil.clampf(315 - _loc9_.y,_loc1_.minY,0):0);
            _path.pathLayer.x = _loc3_;
            _path.pathLayer.y = _loc8_;
            _btnCurrentDungeonPoint.content.x = _loc9_.x + _loc3_;
            _btnCurrentDungeonPoint.content.y = _loc9_.y + _loc8_;
            _btnCurrentDungeonPoint.refresh(dungeon);
            _btnCurrentDungeonPoint.visible = true;
            _btnCurrentDungeonPoint.content.visible = true;
            ViewManager.instance.setBackground(dungeon.currentBackgroundType,new Point(_loc3_,_loc8_),null,false);
         }
      }
      
      public function backgroundTweenStarted() : void
      {
         _btnCurrentDungeonPoint.content.tweenFrom(1,_currentDungeonPointButtonTweenSettings);
         _path.pathLayer.tweenFrom(1,_pathLayerTweenSettings);
      }
      
      public function onPathCompleted() : void
      {
         var _loc4_:* = NaN;
         Logger.debug("[PanelDungeon] onPathCompleted");
         ViewManager.instance.baseUserPanel.allowMainNavigationButtons(true);
         if(dungeon == null || !_shown)
         {
            return;
         }
         var _loc1_:UiBackgroundMetrics = ViewManager.instance.backgroundFader.getBackgroundMetrics(dungeon.currentBackgroundType);
         var _loc7_:* = _loc1_.width > 1120;
         var _loc5_:* = _loc1_.height > 630;
         _btnCurrentDungeonPoint.content.visible = true;
         var _loc10_:Point = _path.currentButtonCoordinates;
         var _loc8_:Point = _path.previousButtonCoordinates;
         var _loc3_:Number = !!_loc7_?NumberUtil.clampf(560 - _loc10_.x,_loc1_.minX,0):0;
         var _loc9_:Number = !!_loc7_?NumberUtil.clampf(315 - _loc10_.y,_loc1_.minY,0):0;
         var _loc6_:Number = !!_loc7_?Math.max(_loc1_.minX,Math.min(0,560 - _loc8_.x)):0;
         var _loc2_:Number = !!_loc5_?Math.max(_loc1_.minY,Math.min(0,315 - _loc8_.y)):0;
         _path.pathLayer.x = _loc3_;
         _path.pathLayer.y = _loc9_;
         _btnCurrentDungeonPoint.content.x = _loc10_.x + _loc3_;
         _btnCurrentDungeonPoint.content.y = _loc10_.y + _loc9_;
         _btnCurrentDungeonPoint.refresh(dungeon);
         if(_loc3_ != 0 || _loc9_ != 0 || _loc6_ != 0 || _loc2_ != 0)
         {
            _loc4_ = 0.2;
            if(ViewManager.instance.currentBackgroundType == dungeon.currentBackgroundType)
            {
               _loc4_ = 0;
            }
            _btnCurrentDungeonPoint.content.alpha = 1;
            _btnCurrentDungeonPoint.content.tweenFrom(1,{
               "delay":_loc4_,
               "alpha":0,
               "x":_loc10_.x + _loc6_,
               "y":_loc10_.y + _loc2_,
               "ease":Quad.easeInOut
            });
            _path.pathLayer.tweenFrom(1,{
               "delay":_loc4_,
               "x":_loc6_,
               "y":_loc2_,
               "ease":Quad.easeInOut
            });
            ViewManager.instance.backgroundFader.setPosition(new Point(_loc3_,_loc9_),new Point(_loc6_,_loc2_),true);
         }
         else
         {
            _btnCurrentDungeonPoint.content.alpha = 1;
            _btnCurrentDungeonPoint.content.tweenFrom(1,{
               "alpha":0,
               "ease":Quad.easeInOut
            });
            ViewManager.instance.backgroundFader.setPosition(new Point(_loc3_,_loc9_),null,false);
         }
      }
      
      private function handleMessages(param1:Message) : void
      {
         var _loc2_:* = param1.type;
         switch(_loc2_)
         {
            case "ViewMessage.notifyBattleFinished":
               if(PanelBattle.lastViewedMode != 3)
               {
                  return;
               }
               if(User.current.character.activeDungeonQuest && !User.current.character.activeDungeonQuest.isFinished)
               {
                  Environment.application.sendActionRequest("finishDungeonQuest",{},handleRequests);
               }
               break;
            case "ViewMessage.notifyStatQuestFinished":
               if(PanelStatQuest.lastViewedMode != 3)
               {
                  return;
               }
               if(User.current.character.activeDungeonQuest && !User.current.character.activeDungeonQuest.isFinished)
               {
                  Environment.application.sendActionRequest("finishDungeonQuest",{},handleRequests);
               }
               break;
            default:
               throw new Error("Encountered unknown message type! type=" + param1.type);
         }
      }
      
      private function onClickConventionMultitasking(param1:InteractionEvent) : void
      {
         var _loc2_:Character = User.current.character;
         if(User.current.character.multitaskingBoosterActive || !_loc2_.activeDungeonQuest && !_loc2_.activeQuest)
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
            if(_loc2_.activeQuest)
            {
               Environment.panelManager.showDialog(new DialogQuestBriefing(User.current.character.getConvention(User.current.character.conventionId),PanelCitymap.checkForConventionInfo));
            }
            else
            {
               Environment.application.sendActionRequest("setCharacterStage",{
                  "stage":User.current.character.getConvention(User.current.character.conventionId).stage,
                  "on_map":false
               },handleRequests);
            }
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
      
      private function handleRequests(param1:ActionRequestResponse) : void
      {
         var _loc2_:* = param1.action;
         switch(_loc2_)
         {
            case "finishDungeonQuest":
               if(param1.error == "")
               {
                  Environment.application.updateData(param1.data);
                  showCompleteDialog();
               }
               else
               {
                  Environment.reportError(param1.error,param1.request);
               }
               break;
            case "setCharacterLocation":
               if(param1.error == "")
               {
                  Environment.application.updateData(param1.data);
                  ViewManager.instance.showPanel("citymap");
               }
               else
               {
                  Environment.reportError(param1.error,param1.request);
               }
               break;
            case "setCharacterStage":
               if(param1.error == "")
               {
                  Environment.application.updateData(param1.data);
                  ViewManager.instance.showPanel("quests");
               }
               else if(param1.error != "errSetCharacterStageInvalidQuestStage")
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
