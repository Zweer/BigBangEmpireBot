package com.playata.application.ui.panels
{
   import com.playata.application.data.AppDateTime;
   import com.playata.application.data.GameUtil;
   import com.playata.application.data.character.Character;
   import com.playata.application.data.dataobject.DOWorkData;
   import com.playata.application.data.user.User;
   import com.playata.application.ui.ViewManager;
   import com.playata.application.ui.dialogs.DialogBoostersWork;
   import com.playata.application.ui.dialogs.DialogTutorialPopup;
   import com.playata.application.ui.dialogs.DialogWorkCompleteNew;
   import com.playata.application.ui.elements.generic.button.UiButton;
   import com.playata.application.ui.elements.generic.button.UiTextButton;
   import com.playata.application.ui.elements.generic.progressbar.UiTimeBar;
   import com.playata.application.ui.elements.generic.textfield.UiTextTooltip;
   import com.playata.framework.application.Environment;
   import com.playata.framework.application.request.ActionRequestResponse;
   import com.playata.framework.core.Runtime;
   import com.playata.framework.core.timer.ITimer;
   import com.playata.framework.core.util.TimeUtil;
   import com.playata.framework.display.AnchorPoint;
   import com.playata.framework.input.InteractionEvent;
   import com.playata.framework.localization.LocText;
   import visuals.ui.elements.work.SymbolWorkContentGeneric;
   import visuals.ui.panels.SymbolPanelWorkNewGeneric;
   
   public class PanelWorkNew extends DefaultPanel
   {
       
      
      private var _btnHelp:UiButton;
      
      private var _btnCollectWork:UiTextButton;
      
      private var _btnBooster:UiButton;
      
      private var _timer:ITimer;
      
      private var _timeBar:UiTimeBar;
      
      private var _tooltipNextLevel:UiTextTooltip;
      
      public function PanelWorkNew(param1:SymbolPanelWorkNewGeneric)
      {
         _timer = Environment.createTimer("PanelWorkNew::timer",1000,onTimerEvent);
         super(param1);
         _btnHelp = new UiButton(param1.btnHelp,LocText.current.text("general/button_help"),onClickHelp);
         _btnCollectWork = new UiTextButton(param1.content.btnCollectWork,LocText.current.text("screen/work/button_collect"),"",onClickCollectWork);
         _btnBooster = new UiButton(param1.btnBooster,LocText.current.text("screen/work/button_booster"),onClickBooster);
         _timeBar = new UiTimeBar(param1.content.timeBar);
         param1.btnBooster.info.caption.text = "!";
         param1.btnBooster.info.visible = false;
         _tooltipNextLevel = new UiTextTooltip(param1.content.txtCoinsPerHour,"");
         _anchorContainer.add(param1.btnBooster,AnchorPoint.RIGHT_FIXED);
         _anchorContainer.add(param1.content,AnchorPoint.RIGHT_FIXED,0.5);
         _anchorContainer.add(param1.content,AnchorPoint.BOTTOM_FIXED,0.5);
      }
      
      override public function dispose() : void
      {
         super.dispose();
         _btnHelp.dispose();
         _btnHelp = null;
         _btnCollectWork.dispose();
         _btnCollectWork = null;
         _btnBooster.dispose();
         _btnBooster = null;
         _tooltipNextLevel.dispose();
         _tooltipNextLevel = null;
      }
      
      override public function refreshPanelLocalization() : void
      {
         var _loc1_:SymbolPanelWorkNewGeneric = _vo as SymbolPanelWorkNewGeneric;
         _btnHelp.tooltip = LocText.current.text("general/button_help");
         _btnCollectWork.tooltip = LocText.current.text("screen/work/button_collect");
         _btnBooster.tooltip = LocText.current.text("screen/work/button_booster");
      }
      
      private function onClickBooster(param1:InteractionEvent) : void
      {
         Environment.panelManager.showDialog(new DialogBoostersWork());
      }
      
      private function onClickHelp(param1:InteractionEvent) : void
      {
         showTutorialDialog();
      }
      
      private function onClickCollectWork(param1:InteractionEvent) : void
      {
         _timer.stop();
         Environment.application.sendActionRequest("collectWork",{},handleRequests);
      }
      
      private function onTimerEvent() : void
      {
         if(!User.current)
         {
            return;
         }
         if(_shown)
         {
            refreshUI();
         }
      }
      
      private function refreshUI() : void
      {
         var _loc4_:* = null;
         var _loc2_:Character = User.current.character;
         _btnCollectWork.buttonEnabled = _loc2_.currentWorkDuration > 0 && _loc2_.currentWorkReward > 0;
         _timeBar.value = _loc2_.workProgress;
         var _loc3_:SymbolWorkContentGeneric = (_vo as SymbolPanelWorkNewGeneric).content;
         var _loc1_:int = _loc2_.maxWorkDuration - _loc2_.currentWorkDurationRaw;
         if(_loc1_ > 0)
         {
            _loc4_ = "";
            if(TimeUtil.serverDateTime.isToday(TimeUtil.now + _loc1_))
            {
               _loc4_ = LocText.current.text("screen/work/info_full_today",AppDateTime.getFormattedTimestampHM(TimeUtil.now + _loc1_));
            }
            else
            {
               _loc4_ = LocText.current.text("screen/work/info_full_tomorrow",AppDateTime.getFormattedTimestampHM(TimeUtil.now + _loc1_));
            }
            _loc3_.txtTimeRemaining.text = LocText.current.text("screen/work/duration_remaining",TimeUtil.secondsToString(_loc1_),_loc4_);
            _loc3_.txtCountdown.text = LocText.current.text("screen/work/info_next",TimeUtil.secondsToString(_loc2_.secondsToNextWorkStep));
            _loc3_.txtCountdown.visible = true;
         }
         else
         {
            _loc3_.txtTimeRemaining.text = LocText.current.text("screen/work_progress/finished");
            _loc3_.txtCountdown.visible = false;
         }
         _loc3_.txtCurrentReward.text = LocText.current.formatHugeNumber(_loc2_.currentWorkReward) + "/" + LocText.current.formatHugeNumber(_loc2_.maxWorkReward);
         _loc3_.iconCoins.x = Math.round(_loc3_.txtCurrentReward.x + _loc3_.txtCurrentReward.width * 0.5 - _loc3_.txtCurrentReward.textWidth * 0.5 - 36);
      }
      
      override public function refresh() : void
      {
         super.refresh();
         var _loc1_:Character = User.current.character;
         var _loc4_:SymbolWorkContentGeneric = (_vo as SymbolPanelWorkNewGeneric).content;
         var _loc5_:String = _loc1_.currentWorkOfferId;
         _loc4_.txtWorkTitle.text = LocText.current.text("work/" + _loc5_ + "/title");
         _loc4_.txtWorkDescription.text = LocText.current.text("work/" + _loc5_ + "/description");
         _loc4_.txtWorkDescription.autoFontSize = true;
         var _loc3_:Number = _loc4_.txtWorkTitle.textHeight + 10 + _loc4_.txtWorkDescription.textHeight;
         var _loc2_:Number = (_loc4_.textContainer.height - _loc3_) / 2;
         _loc4_.txtWorkTitle.y = _loc4_.textContainer.y + _loc2_ - 2;
         _loc4_.txtWorkDescription.y = _loc4_.txtWorkTitle.y + _loc4_.txtWorkTitle.textHeight + 10;
         _loc4_.txtCoinsPerHour.text = LocText.current.text("screen/work/game_currency_per_hour",GameUtil.getGameCurrencyString(GameUtil.getWorkGameCurrencyRewardNew(_loc1_.level,_loc1_.activeWorkBoosterAmount / 100,3600,_loc1_.guildBonusQuestWorkGameCurrencyRewardFactor)));
         _tooltipNextLevel.text = LocText.current.text("screen/work/game_currency_per_hour_next_level",_loc1_.level + 1,GameUtil.getGameCurrencyString(GameUtil.getWorkGameCurrencyRewardNew(_loc1_.level + 1,_loc1_.activeWorkBoosterAmount / 100,3600,_loc1_.guildBonusQuestWorkGameCurrencyRewardFactor)));
         refreshUI();
         (_vo as SymbolPanelWorkNewGeneric).btnBooster.info.visible = !_loc1_.workBoosterActive;
      }
      
      override public function hide() : void
      {
         super.hide();
         _timer.stop();
      }
      
      override public function show(param1:* = null) : void
      {
         super.show(param1);
         ViewManager.instance.setBackground(4);
         ViewManager.instance.fadeInPanel(_vo);
         if(!User.current.character.hasTutorialFlag("work_new"))
         {
            showTutorialDialog();
         }
         _timer.start();
      }
      
      private function handleRequests(param1:ActionRequestResponse) : void
      {
         response = param1;
         var _loc3_:* = response.action;
         if("collectWork" !== _loc3_)
         {
            throw new Error("Unsupported request action \'" + response.action + "\'!");
         }
         if(response.error == "")
         {
            var workData:DOWorkData = response.appResponse.collected_work;
            ViewManager.instance.baseUserPanel.refreshGameCurrencyPanel(workData.gameCurrencyReward);
            Environment.application.updateData(response.data);
            Environment.panelManager.showDialog(new DialogWorkCompleteNew(workData.offer,workData.gameCurrencyReward,workData.duration,onRewardCollected));
         }
         else if(response.error == "errCollectWorkNotWorkedLongEnough")
         {
            var completeCallbackConventionShow:Function = function():void
            {
               Environment.application.sendActionRequest("collectWork",{},handleRequests);
            };
            Runtime.delayFunction(completeCallbackConventionShow,1);
         }
         else
         {
            Environment.reportError(response.error,response.request);
         }
      }
      
      private function onRewardCollected() : void
      {
         if(_shown)
         {
            refresh();
            _timer.start();
         }
      }
      
      private function showTutorialDialog() : void
      {
         Environment.panelManager.showDialog(new DialogTutorialPopup(LocText.current.text("dialog/tutorial/work/title"),LocText.current.text("dialog/tutorial/work/text"),onTutorialDialogClosed));
      }
      
      private function onTutorialDialogClosed() : void
      {
         User.current.character.setTutorialFlag("work_new");
      }
   }
}
