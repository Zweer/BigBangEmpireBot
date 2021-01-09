package com.playata.application.ui.elements.dating
{
   import com.playata.application.data.dating.DatingStep;
   import com.playata.application.data.dating.DatingUtil;
   import com.playata.application.data.user.User;
   import com.playata.application.messaging.Message;
   import com.playata.application.messaging.MessageRouter;
   import com.playata.application.ui.ViewManager;
   import com.playata.application.ui.dialogs.DialogDatingOutcome;
   import com.playata.application.ui.dialogs.DialogInstantFinish;
   import com.playata.application.ui.elements.generic.button.UiButton;
   import com.playata.application.ui.elements.generic.button.UiPremiumButton;
   import com.playata.application.ui.elements.generic.dialog.UiInfoDialog;
   import com.playata.application.ui.panels.PanelStatQuest;
   import com.playata.framework.application.Environment;
   import com.playata.framework.application.request.ActionRequestResponse;
   import com.playata.framework.core.timer.ITimer;
   import com.playata.framework.core.util.TimeUtil;
   import com.playata.framework.display.IMovieClip;
   import com.playata.framework.input.InteractionEvent;
   import com.playata.framework.localization.LocText;
   import visuals.ui.elements.dating.SymbolDatingBriefingContentGeneric;
   
   public class UiDatingBriefingContent
   {
       
      
      private var _content:SymbolDatingBriefingContentGeneric = null;
      
      private var _datingStep:DatingStep = null;
      
      private var _reward:UiDatingStepReward = null;
      
      private var _progressBar:UiDatingProgressBar;
      
      private var _refreshCallback:Function = null;
      
      private var _closeCallback:Function;
      
      private var _timer:ITimer;
      
      private var _btnInstantFinish:UiButton;
      
      private var _btnInstantFinishBattle:UiPremiumButton;
      
      private var _girl:UiDatingGirl;
      
      private var _bubbleBaseY:Number;
      
      public function UiDatingBriefingContent(param1:SymbolDatingBriefingContentGeneric, param2:Function, param3:Function)
      {
         super();
         _content = param1;
         _refreshCallback = param2;
         _closeCallback = param3;
         _reward = new UiDatingStepReward(_content.reward);
         _progressBar = new UiDatingProgressBar(_content.progressBar);
         _btnInstantFinish = new UiButton(_content.btnInstantFinish,"",onClickInstantFinish);
         _btnInstantFinishBattle = new UiPremiumButton(_content.btnInstantFinishBattle,0,"",LocText.current.text("dialog/dating_briefing/finish_battle"),"","",onClickInstantFinishBattle);
         _btnInstantFinishBattle.premium = true;
         _btnInstantFinishBattle.visible = false;
         _girl = new UiDatingGirl(_content.girl);
         _bubbleBaseY = param1.balloon.caption.y;
         _timer = Environment.createTimer("UiDatingBriefingContent::timer",1000,onTimerEvent);
      }
      
      private function onClickInstantFinish(param1:InteractionEvent) : void
      {
         if(_datingStep)
         {
            Environment.panelManager.showDialog(new DialogInstantFinish(LocText.current.text("dialog/instant_finish_objective/title"),LocText.current.text("dialog/instant_finish_objective/text",_datingStep.instantFinishCost),LocText.current.text("dialog/instant_finish_objective/button_yes"),LocText.current.text("dialog/instant_finish_objective/button_no"),_datingStep.instantFinishCost,instantFinish));
         }
      }
      
      private function onClickInstantFinishBattle(param1:InteractionEvent) : void
      {
         if(_datingStep)
         {
            instantFinish();
         }
      }
      
      private function instantFinish() : void
      {
         if(_datingStep)
         {
            Environment.application.sendActionRequest("instantFinishDatingStep",{
               "dating_index":_datingStep.datingIndex,
               "step_index":_datingStep.stepIndex
            },handleRequests);
            _btnInstantFinish.buttonEnabled = false;
            _btnInstantFinishBattle.buttonEnabled = false;
         }
      }
      
      public function dispose() : void
      {
         _content = null;
         _datingStep = null;
         _btnInstantFinish.dispose();
         _btnInstantFinish = null;
         _btnInstantFinishBattle.dispose();
         _btnInstantFinishBattle = null;
         _reward.dispose();
         _reward = null;
         _girl.dispose();
         _girl = null;
         _timer.dispose();
         _timer = null;
      }
      
      public function get content() : SymbolDatingBriefingContentGeneric
      {
         return _content;
      }
      
      public function refresh(param1:DatingStep) : void
      {
         var _loc2_:int = 0;
         _datingStep = param1;
         if(_datingStep == null)
         {
            return;
         }
         _reward.refresh(_datingStep.datingIndex,_datingStep.stepIndex,_datingStep.repeat);
         _girl.refresh(_datingStep.datingIndex,_datingStep.stepIndex);
         _loc2_ = 1;
         while(_loc2_ <= 5)
         {
            if(_datingStep.stepIndex > _loc2_)
            {
               (_content.getChildByName("hearth" + _loc2_) as IMovieClip).gotoAndStop(2);
            }
            else
            {
               (_content.getChildByName("hearth" + _loc2_) as IMovieClip).gotoAndStop(1);
            }
            _loc2_++;
         }
         _content.balloon.caption.text = DatingUtil.getBalloonText(_datingStep.datingIndex,_datingStep.stepIndex);
         _content.balloon.caption.y = _bubbleBaseY + (_content.balloon.caption.height - _content.balloon.caption.textHeight >> 1);
         _content.balloon.alpha = 0;
         _content.balloon.tweenTo(0.5,{
            "delay":2.5,
            "alpha":1
         });
         _timer.stop();
         _content.txtCooldown.visible = false;
         _btnInstantFinish.visible = false;
         _btnInstantFinishBattle.visible = false;
         if(_datingStep.allPointsCollected())
         {
            _content.txtProgressCaption.visible = false;
            _content.txtProgress.visible = false;
            _content.progressBar.visible = false;
            if(_datingStep.isLastStep)
            {
               _btnInstantFinishBattle.premiumAmount = _datingStep.instantFinishCost;
               _btnInstantFinishBattle.visible = true;
               _content.txtDescription.text = DatingUtil.getBriefingText(_datingStep.datingIndex,_datingStep.stepIndex);
               _content.txtDescription.autoFontSize = true;
               if(!_datingStep.hasFreeAttack)
               {
                  _timer.start();
                  onTimerEvent();
               }
            }
            else
            {
               _content.txtDescription.text = DatingUtil.getOutroText(_datingStep.datingIndex,_datingStep.stepIndex);
            }
         }
         else
         {
            _btnInstantFinish.visible = true;
            _content.txtProgressCaption.visible = true;
            _content.txtProgress.visible = true;
            _content.progressBar.visible = true;
            _progressBar.value = _datingStep.progress;
            _content.txtProgress.text = _datingStep.progressText;
            _content.txtProgress.autoFontSize = true;
            _content.txtProgressCaption.text = LocText.current.text("dialog/dating_briefing/progress_caption");
            _content.txtDescription.text = DatingUtil.getBriefingText(_datingStep.datingIndex,_datingStep.stepIndex);
            _content.txtDescription.autoFontSize = true;
            _btnInstantFinish.tooltip = LocText.current.text("dialog/dating_briefing/instant_finish_tooltip",_datingStep.instantFinishCost);
         }
         _content.txtDescription.autoFontSize = true;
      }
      
      private function onTimerEvent() : void
      {
         if(!User.current)
         {
            if(_timer)
            {
               _timer.stop();
            }
            return;
         }
         if(_datingStep == null)
         {
            _timer.stop();
            return;
         }
         if(!_datingStep.hasFreeAttack)
         {
            _content.txtCooldown.visible = true;
            _content.txtCooldown.text = LocText.current.text("dialog/dating_briefing/cooldown",TimeUtil.secondsToString(_datingStep.secondsUntilFreeAttack));
         }
         else
         {
            _content.txtCooldown.visible = false;
            _timer.stop();
            _refreshCallback();
         }
      }
      
      private function handleRequests(param1:ActionRequestResponse) : void
      {
         var _loc2_:* = param1.action;
         if("instantFinishDatingStep" !== _loc2_)
         {
            throw new Error("Unsupported request action \'" + param1.action + "\'!");
         }
         if(param1.error == "")
         {
            Environment.application.updateData(param1.data);
            _closeCallback();
            if(_datingStep.isLastStep)
            {
               PanelStatQuest.movieMode = false;
               PanelStatQuest.datingStep = _datingStep;
               if(User.current.showDatingStatAnimation)
               {
                  ViewManager.instance.showPanel("stat_quest");
               }
               else
               {
                  PanelStatQuest.lastViewedMode = 7;
                  MessageRouter.dispatch(new Message("ViewMessage.notifyStatQuestFinished",null,this));
               }
            }
            else
            {
               Environment.panelManager.showDialog(new DialogDatingOutcome(_datingStep));
            }
         }
         else if(param1.error == "errInstantFinishDatingStepInvalidStep")
         {
            Environment.panelManager.showDialog(new UiInfoDialog(LocText.current.text("dialog/start_dating_invalid_dating_step/title"),LocText.current.text("dialog/start_dating_invalid_dating_step/text"),LocText.current.text("general/button_ok")));
         }
         else if(param1.error == "errInstantFinishDatingStepInvalidStatus")
         {
            Environment.panelManager.showDialog(new UiInfoDialog(LocText.current.text("dialog/start_dating_invalid_dating_step/title"),LocText.current.text("dialog/start_dating_invalid_dating_step/text"),LocText.current.text("general/button_ok")));
         }
         else if(param1.error == "errRemovePremiumCurrencyNotEnough")
         {
            ViewManager.instance.showNotEnoughPremiumDialog(_datingStep.instantFinishCost);
         }
         else if(param1.error != "errStartQuestActiveQuestFound")
         {
            Environment.reportError(param1.error,param1.request);
         }
      }
   }
}
