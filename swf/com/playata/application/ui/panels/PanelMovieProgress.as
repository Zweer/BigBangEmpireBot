package com.playata.application.ui.panels
{
   import com.playata.application.data.GameUtil;
   import com.playata.application.data.character.Character;
   import com.playata.application.data.constants.CConstant;
   import com.playata.application.data.movie.Movie;
   import com.playata.application.data.movie.MovieQuest;
   import com.playata.application.data.server.SyncStates;
   import com.playata.application.data.user.User;
   import com.playata.application.messaging.Message;
   import com.playata.application.messaging.MessageRouter;
   import com.playata.application.ui.ViewManager;
   import com.playata.application.ui.dialogs.DialogClaimMovieStar;
   import com.playata.application.ui.dialogs.DialogCustomMovieTitle;
   import com.playata.application.ui.dialogs.DialogMovieCompleteNew;
   import com.playata.application.ui.dialogs.DialogMovieCover;
   import com.playata.application.ui.dialogs.DialogMovieExtendTime;
   import com.playata.application.ui.dialogs.DialogMovieQuestBriefing;
   import com.playata.application.ui.dialogs.DialogMovieQuestComplete;
   import com.playata.application.ui.dialogs.DialogMovieTitle;
   import com.playata.application.ui.dialogs.DialogOutOfMovieEnergy;
   import com.playata.application.ui.dialogs.DialogTutorialPopup;
   import com.playata.application.ui.elements.avatar.UiAvatar;
   import com.playata.application.ui.elements.background.UiBackgroundFader;
   import com.playata.application.ui.elements.generic.button.UiButton;
   import com.playata.application.ui.elements.generic.button.UiTextButton;
   import com.playata.application.ui.elements.generic.textfield.UiTextTooltip;
   import com.playata.application.ui.elements.movie.UiMovieCover;
   import com.playata.application.ui.elements.movie.UiMovieProgressBar;
   import com.playata.application.ui.elements.movie.UiMovieQuestIconButton;
   import com.playata.application.ui.elements.movie.UiSelectMovieButton;
   import com.playata.framework.application.Environment;
   import com.playata.framework.core.timer.ITimer;
   import com.playata.framework.core.util.NumberUtil;
   import com.playata.framework.core.util.TimeUtil;
   import com.playata.framework.display.AnchorPoint;
   import com.playata.framework.display.UriSprite;
   import com.playata.framework.display.ui.Align;
   import com.playata.framework.display.ui.dialogs.Dialog;
   import com.playata.framework.input.InteractionEvent;
   import com.playata.framework.localization.LocText;
   import flash.geom.Rectangle;
   import visuals.ui.panels.SymbolPanelMovieProgressGeneric;
   
   public class PanelMovieProgress extends DefaultPanel
   {
      
      private static const QUEST_BUTTON_SPACING:int = 20;
      
      private static const AVATAR_POSITIONS:Object = {
         "left":{
            "x":371,
            "y":148
         },
         "right":{
            "x":688,
            "y":144
         }
      };
       
      
      private var _btnHelp:UiButton;
      
      private var _btnBuyEnergy:UiButton;
      
      private var _btnQuest1:UiMovieQuestIconButton;
      
      private var _btnQuest2:UiMovieQuestIconButton;
      
      private var _btnQuest3:UiMovieQuestIconButton;
      
      private var _btnChangeTitle:UiTextButton;
      
      private var _btnChangeCover:UiTextButton;
      
      private var _questButton1Id:int;
      
      private var _timer:ITimer;
      
      private var _cover:UiMovieCover;
      
      private var _tooltipTitle:UiTextTooltip;
      
      private var _tooltipCover:UiTextTooltip;
      
      private var _tooltipTournament:UiTextTooltip;
      
      private var _tooltipProgress:UiTextTooltip;
      
      private var _avatar:UiAvatar;
      
      private var _tooltipEnergy:UiTextTooltip;
      
      private var _tooltipDuration:UiTextTooltip;
      
      private var _movieProgress:UiMovieProgressBar;
      
      private var _btnMovieVote:UiSelectMovieButton;
      
      public function PanelMovieProgress(param1:SymbolPanelMovieProgressGeneric)
      {
         super(param1);
         _btnHelp = new UiButton(param1.btnHelp,LocText.current.text("general/button_help"),onClickHelp);
         _btnBuyEnergy = new UiButton(param1.energy.btnBuyEnergy,LocText.current.text("screen/movie_progress/button_buy_movie_energy"),onClickBuyEnergy);
         _btnQuest1 = new UiMovieQuestIconButton(param1.quest1,"",onClickQuest);
         _btnQuest2 = new UiMovieQuestIconButton(param1.quest2,"",onClickQuest);
         _btnQuest3 = new UiMovieQuestIconButton(param1.quest3,"",onClickQuest);
         _btnChangeTitle = new UiTextButton(param1.progressInfo.btnTitle,LocText.current.text("screen/movie_progress/button_title"),LocText.current.text("screen/movie_progress/button_title_tooltip"),onClickTitle);
         _btnChangeCover = new UiTextButton(param1.progressInfo.btnCover,LocText.current.text("screen/movie_progress/button_cover"),LocText.current.text("screen/movie_progress/button_cover_tooltip"),onClickCover);
         _btnMovieVote = new UiSelectMovieButton(param1.btnSelectMovie);
         param1.energy.addChild(_btnBuyEnergy);
         param1.addChild(param1.progressInfo.lockTitle);
         param1.addChild(param1.progressInfo.lockCover);
         param1.questArea.visible = false;
         _cover = new UiMovieCover(param1.progressInfo.cover);
         MessageRouter.addListener("ViewMessage.notifyBattleFinished",handleMessages);
         MessageRouter.addListener("ViewMessage.notifyStatQuestFinished",handleMessages);
         _timer = Environment.createTimer("PanelMovieProgress::timer",1000,onTimerEvent);
         _tooltipEnergy = new UiTextTooltip(param1.energy,"");
         _tooltipTitle = new UiTextTooltip(param1.progressInfo.lockTitle,LocText.current.text("screen/movie_progress/tooltip_locked_title"));
         _tooltipCover = new UiTextTooltip(param1.progressInfo.lockCover,LocText.current.text("screen/movie_progress/tooltip_locked_cover"));
         _tooltipTournament = new UiTextTooltip(param1.progressInfo.lockTournament,LocText.current.text("screen/movie_progress/tooltip_locked_tournament"));
         _tooltipProgress = new UiTextTooltip(param1.progressInfo.progress.tooltipArea,LocText.current.text(""));
         _tooltipDuration = new UiTextTooltip(param1.progressInfo.progress.txtTimeLeft,LocText.current.text(""));
         param1.progressInfo.txtTournamentInfo.text = LocText.current.text("screen/movie_progress/tournament_info");
         param1.progressInfo.txtTournamentInfo.autoFontSize = true;
         param1.progressInfo.txtMovieTitle.autoFontSize = true;
         _movieProgress = new UiMovieProgressBar(param1.progressInfo.progress);
         _avatar = new UiAvatar(param1.avatar,true);
         _anchorContainer.add(param1.energy,AnchorPoint.RIGHT_FIXED);
         _anchorContainer.add(param1.questArea,AnchorPoint.RIGHT_FIXED,0.5);
         _anchorContainer.add(param1.quest1,AnchorPoint.RIGHT_FIXED,0.5);
         _anchorContainer.add(param1.quest2,AnchorPoint.RIGHT_FIXED,0.5);
         _anchorContainer.add(param1.quest3,AnchorPoint.RIGHT_FIXED,0.5);
         _anchorContainer.add(param1.questArea,AnchorPoint.BOTTOM_FIXED,0.5);
         _anchorContainer.add(param1.quest1,AnchorPoint.BOTTOM_FIXED,0.5);
         _anchorContainer.add(param1.quest2,AnchorPoint.BOTTOM_FIXED,0.5);
         _anchorContainer.add(param1.quest3,AnchorPoint.BOTTOM_FIXED,0.5);
         _anchorContainer.add(param1.progressInfo,AnchorPoint.BOTTOM_FIXED,0.5);
      }
      
      override public function refreshAppSize() : void
      {
         super.refreshAppSize();
         var _loc1_:SymbolPanelMovieProgressGeneric = _vo as SymbolPanelMovieProgressGeneric;
         UiBackgroundFader.scaleWidthCenter(_loc1_.background,0,-1,Align.RIGHT);
      }
      
      override public function refreshPanelLocalization() : void
      {
         _tooltipTitle.text = LocText.current.text("screen/movie_progress/tooltip_locked_title");
         _tooltipCover.text = LocText.current.text("screen/movie_progress/tooltip_locked_cover");
         _tooltipTournament.text = LocText.current.text("screen/movie_progress/tooltip_locked_tournament");
         var _loc1_:SymbolPanelMovieProgressGeneric = _vo as SymbolPanelMovieProgressGeneric;
         _loc1_.progressInfo.txtTournamentInfo.text = LocText.current.text("screen/movie_progress/tournament_info");
         _loc1_.progressInfo.txtTournamentInfo.autoFontSize = true;
      }
      
      private function onTimerEvent() : void
      {
         if(!User.current)
         {
            _tooltipDuration.text = "";
            stopTimer();
            return;
         }
         refreshEnergyInfo();
         var _loc1_:Movie = User.current.character.movie;
         if(!_loc1_)
         {
            _tooltipDuration.text = "";
            stopTimer();
            return;
         }
         _movieProgress.remainingTime = _loc1_.remainingSeconds;
         _tooltipDuration.text = LocText.current.text("screen/movie_progress/tooltip_duration",TimeUtil.secondsToString(_loc1_.remainingSeconds));
         if(_loc1_.remainingSeconds <= 0)
         {
            SyncStates.pendingSyncGame = true;
            ViewManager.instance.baseUserPanel.onSynGame();
            stopTimer();
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
      
      override public function dispose() : void
      {
         super.dispose();
      }
      
      private function onClickQuest(param1:InteractionEvent) : void
      {
         var _loc2_:Dialog = panelManager.dialogManager.getVisibleDialog(DialogMovieQuestBriefing);
         var _loc3_:MovieQuest = (param1.target as UiButton).tag as MovieQuest;
         if(!_loc2_ && _loc3_.status == 1)
         {
            Environment.panelManager.showDialog(new DialogMovieQuestBriefing(_loc3_));
         }
      }
      
      private function onClickBuyEnergy(param1:InteractionEvent) : void
      {
         Environment.panelManager.showDialog(new DialogOutOfMovieEnergy(null));
      }
      
      private function onClickTitle(param1:InteractionEvent) : void
      {
         Environment.panelManager.showDialog(new DialogMovieTitle());
      }
      
      private function onClickCover(param1:InteractionEvent) : void
      {
         Environment.panelManager.showDialog(new DialogMovieCover());
      }
      
      override public function refresh() : void
      {
         var _loc3_:* = null;
         super.refresh();
         var _loc4_:SymbolPanelMovieProgressGeneric = _vo as SymbolPanelMovieProgressGeneric;
         var _loc1_:Character = User.current.character;
         var _loc2_:Movie = _loc1_.movie;
         if(!_loc2_)
         {
            return;
         }
         if(_loc2_.hasMovieQuests)
         {
            _btnQuest1.visible = true;
            _btnQuest2.visible = true;
            _btnQuest3.visible = true;
            _loc3_ = _loc2_.movieQuestIds;
            _btnQuest1.refresh(_loc2_.movieQuests.getData(_loc3_[0]));
            _btnQuest2.refresh(_loc2_.movieQuests.getData(_loc3_[1]));
            _btnQuest3.refresh(_loc2_.movieQuests.getData(_loc3_[2]));
            if(_loc3_[0] != _questButton1Id)
            {
               positionButtons();
               _questButton1Id = _loc3_[0];
            }
         }
         else
         {
            _btnQuest1.visible = false;
            _btnQuest2.visible = false;
            _btnQuest3.visible = false;
         }
         checkMovieStatus();
         refreshEnergyInfo();
         onTimerEvent();
         _btnBuyEnergy.visible = _loc1_.movieEnergy <= _loc1_.maxMovieEnergy - CConstant.movie_energy_refill_amount;
         _btnChangeTitle.buttonEnabled = _loc2_.claimedStars >= 1;
         _btnChangeTitle.tooltip = !!_btnChangeTitle.buttonEnabled?LocText.current.text("screen/movie_progress/button_title_tooltip"):LocText.current.text("screen/movie_progress/tooltip_locked_title");
         _btnChangeCover.buttonEnabled = _loc2_.claimedStars >= 2;
         _btnChangeCover.tooltip = !!_btnChangeCover.buttonEnabled?LocText.current.text("screen/movie_progress/button_cover_tooltip"):LocText.current.text("screen/movie_progress/tooltip_locked_cover");
         _loc4_.progressInfo.txtMovieTitle.text = _loc2_.title;
         _loc4_.progressInfo.lockTitle.visible = !_btnChangeTitle.buttonEnabled;
         _loc4_.progressInfo.lockCover.visible = !_btnChangeCover.buttonEnabled;
         _cover.showWithSettings(_loc2_.coverSettings);
         _loc4_.progressInfo.lockTournament.visible = _loc2_.progressValue < 100;
         _movieProgress.value = _loc2_.progressValue;
         var _loc5_:String = LocText.current.text("screen/movie_progress/progress",LocText.current.formatHugeNumber(_loc2_.energy),LocText.current.formatHugeNumber(_loc2_.neededEnergy),GameUtil.getMovieProgressString(_loc2_.neededEnergy));
         if(_loc2_.claimedStars == 0)
         {
            _loc5_ = _loc5_ + ("\n\n" + LocText.current.text("screen/movie_progress/progress_until_title",GameUtil.getMovieEnergyString(_loc2_.getRemainingEnergyForNextStar)));
         }
         else if(_loc2_.claimedStars == 1)
         {
            _loc5_ = _loc5_ + ("\n\n" + LocText.current.text("screen/movie_progress/progress_until_cover",GameUtil.getMovieEnergyString(_loc2_.getRemainingEnergyForNextStar)));
         }
         _tooltipProgress.text = _loc5_;
         _btnMovieVote.refresh();
      }
      
      private function refreshEnergyInfo() : void
      {
         var _loc3_:SymbolPanelMovieProgressGeneric = _vo as SymbolPanelMovieProgressGeneric;
         var _loc1_:Character = User.current.character;
         _loc3_.energy.txtEnergyLeft.text = LocText.current.text("general/energy_amount",_loc1_.movieEnergy,User.current.character.maxMovieEnergy);
         var _loc2_:String = TimeUtil.secondsToString(_loc1_.secondsToNextMovieEnergyRefill);
         if(_loc1_.movieEnergy < User.current.character.maxMovieEnergy)
         {
            _loc3_.energy.txtEnergyTimer.visible = true;
            _loc3_.energy.txtEnergyTimer.text = LocText.current.text("screen/duel/duel_stamina_refill_time",1,_loc2_);
            _loc3_.energy.txtEnergyLeft.y = -20;
         }
         else
         {
            _loc3_.energy.txtEnergyTimer.visible = false;
            _loc3_.energy.txtEnergyLeft.y = -15;
         }
         if(User.current.character.movieEnergy < User.current.character.maxMovieEnergy)
         {
            _tooltipEnergy.text = LocText.current.text("screen/movie_progress/movie_energy_tooltip",_loc2_,CConstant.movie_energy_refresh_amount_per_minute);
         }
         else
         {
            _tooltipEnergy.text = LocText.current.text("screen/movie_progress/movie_energy_tooltip_full");
         }
      }
      
      override public function hide() : void
      {
         super.hide();
         if(_btnQuest1)
         {
            _btnQuest1.animate(false);
            _btnQuest2.animate(false);
            _btnQuest3.animate(false);
         }
         if(_avatar)
         {
            _avatar.stopAnimation();
         }
         stopTimer();
      }
      
      override public function show(param1:* = null) : void
      {
         super.show(param1);
         loadBackgrounds();
         ViewManager.instance.setBackground(5);
         ViewManager.instance.fadeInPanel(_vo);
         var _loc2_:MovieQuest = User.current.character.movie.activeMovieQuest;
         if(_loc2_)
         {
            if(_loc2_.isFightQuest)
            {
               if(User.current.showMovieBattles)
               {
                  PanelBattle.activeMovieQuest = _loc2_;
                  ViewManager.instance.showPanel("battle");
               }
               else
               {
                  PanelBattle.lastViewedMode = 4;
                  MessageRouter.dispatch(new Message("ViewMessage.notifyBattleFinished",null,this));
               }
            }
            else if(_loc2_.isStatQuest)
            {
               PanelStatQuest.movieMode = true;
               PanelStatQuest.datingStep = null;
               ViewManager.instance.showPanel("stat_quest");
            }
            else
            {
               Environment.panelManager.showDialog(new DialogMovieQuestComplete(_loc2_));
            }
         }
         _btnQuest1.animate(true);
         _btnQuest2.animate(true);
         _btnQuest3.animate(true);
         onTimerEvent();
         _timer.start();
      }
      
      private function checkMovieStatus() : void
      {
         var _loc2_:* = null;
         var _loc1_:Movie = User.current.character.movie;
         if(_loc1_.hasClaimableStars && !DialogClaimMovieStar.isOpen)
         {
            Environment.panelManager.showDialog(new DialogClaimMovieStar(_loc1_,checkMovieStatus));
         }
         else if(_loc1_.isComplete && !DialogMovieCompleteNew.isOpen && !DialogMovieQuestComplete.isOpen)
         {
            if(DialogMovieQuestBriefing.isOpen)
            {
               _loc2_ = panelManager.dialogManager.getVisibleDialog(DialogMovieQuestBriefing);
               if(_loc2_)
               {
                  _loc2_.close();
               }
            }
            stopTimer();
            if(_loc1_.claimedStars < 3)
            {
               if(!DialogMovieExtendTime.isOpen)
               {
                  Environment.panelManager.showDialog(new DialogMovieExtendTime(_loc1_,movieTimeExtended,showMovieCompleteDialog));
               }
            }
            else
            {
               showMovieCompleteDialog();
            }
         }
      }
      
      private function showMovieCompleteDialog() : void
      {
         stopTimer();
         var _loc2_:Dialog = panelManager.dialogManager.getVisibleDialog(DialogMovieCover);
         if(_loc2_)
         {
            _loc2_.close();
         }
         _loc2_ = panelManager.dialogManager.getVisibleDialog(DialogMovieTitle);
         if(_loc2_)
         {
            _loc2_.close();
         }
         _loc2_ = panelManager.dialogManager.getVisibleDialog(DialogCustomMovieTitle);
         if(_loc2_)
         {
            _loc2_.close();
         }
         _loc2_ = panelManager.dialogManager.getVisibleDialog(DialogOutOfMovieEnergy);
         if(_loc2_)
         {
            _loc2_.close();
         }
         var _loc1_:Movie = User.current.character.movie;
         Environment.panelManager.showDialog(new DialogMovieCompleteNew(_loc1_));
      }
      
      private function movieTimeExtended() : void
      {
         _timer.start();
      }
      
      private function positionButtons() : void
      {
         var _loc4_:SymbolPanelMovieProgressGeneric = _vo as SymbolPanelMovieProgressGeneric;
         var _loc3_:Vector.<UiButton> = new <UiButton>[_btnQuest1,_btnQuest2,_btnQuest3];
         _loc3_.sort(shuffle);
         var _loc2_:Rectangle = new Rectangle();
         _loc2_.y = _loc4_.questArea.y;
         _loc2_.height = _loc4_.questArea.height;
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
      
      private function shuffle(param1:UiButton, param2:UiButton) : int
      {
         return !!NumberUtil.randomBool?1:-1;
      }
      
      private function positionButton(param1:UiButton, param2:Rectangle) : void
      {
         var _loc3_:Number = param2.x + Math.random() * (param2.width - param1.content.width) + param1.content.width / 2;
         var _loc4_:Number = param2.y + Math.random() * (param2.height - param1.content.height) + param1.content.height / 2;
         param1.content.x = Math.floor(_loc3_);
         param1.content.y = Math.floor(_loc4_);
      }
      
      private function loadBackgrounds() : void
      {
         var _loc3_:int = 0;
         var _loc6_:* = null;
         var _loc4_:* = null;
         var _loc2_:SymbolPanelMovieProgressGeneric = _vo as SymbolPanelMovieProgressGeneric;
         _loc2_.background.removeAllChildren();
         var _loc1_:Character = User.current.character;
         _loc2_.avatar.visible = false;
         var _loc5_:Vector.<String> = _loc1_.movie.backgroundLayerMovieUrls;
         _loc3_ = 0;
         while(_loc3_ < _loc5_.length)
         {
            _loc6_ = _loc5_[_loc3_];
            if(_loc6_.indexOf("PLAYER_F") != -1 && _loc1_.gender == "f" || _loc6_.indexOf("PLAYER_M") != -1 && _loc1_.gender == "m")
            {
               _avatar.update(_loc1_.getCurrentSettings(8),true);
               _loc4_ = AVATAR_POSITIONS[_loc6_.split("|")[1].split(".")[0]];
               _loc2_.avatar.x = _loc4_.x;
               _loc2_.avatar.y = _loc4_.y;
               _loc3_++;
               _loc2_.background.addChild(_loc2_.avatar);
               _loc2_.avatar.visible = true;
            }
            else if(_loc6_.indexOf("PLAYER_F") == -1 && _loc6_.indexOf("PLAYER_M") == -1)
            {
               _loc2_.background.addChild(UriSprite.load(_loc6_,1120,630,true));
            }
            _loc3_++;
         }
      }
      
      private function onClickHelp(param1:InteractionEvent) : void
      {
         showTutorialDialog();
      }
      
      private function showTutorialDialog() : void
      {
         Environment.panelManager.showDialog(new DialogTutorialPopup(LocText.current.text("dialog/tutorial/movie_new/title"),LocText.current.text("dialog/tutorial/movie_new/text"),onTutorialDialogClosed));
      }
      
      private function onTutorialDialogClosed() : void
      {
         User.current.character.setTutorialFlag("movie_new");
      }
      
      private function handleMessages(param1:Message) : void
      {
         var _loc2_:* = param1.type;
         switch(_loc2_)
         {
            case "ViewMessage.notifyBattleFinished":
               if(PanelBattle.lastViewedMode != 4)
               {
                  return;
               }
               Environment.panelManager.showDialog(new DialogMovieQuestComplete(User.current.character.movie.activeMovieQuest));
               break;
            case "ViewMessage.notifyStatQuestFinished":
               if(PanelStatQuest.lastViewedMode != 4)
               {
                  return;
               }
               Environment.panelManager.showDialog(new DialogMovieQuestComplete(User.current.character.movie.activeMovieQuest));
               break;
            default:
               throw new Error("Encountered unknown message type! type=" + param1.type);
         }
      }
   }
}
