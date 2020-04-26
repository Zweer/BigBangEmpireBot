package com.playata.application.ui.elements.dating
{
   import com.playata.application.data.character.Character;
   import com.playata.application.data.dating.DatingStep;
   import com.playata.application.data.dating.DatingUtil;
   import com.playata.application.data.user.User;
   import com.playata.application.ui.effects.ScaleInOutEffect;
   import com.playata.application.ui.elements.generic.button.UiButton;
   import com.playata.framework.application.Environment;
   import com.playata.framework.core.timer.ITimer;
   import com.playata.framework.core.util.TimeUtil;
   import com.playata.framework.localization.LocText;
   import visuals.ui.elements.dating.SymbolButtonDatingGeneric;
   import visuals.ui.elements.dating.SymbolDatingDialogMessageBubbleSmallGeneric;
   
   public class UiDatingButton extends UiButton
   {
       
      
      private var _button:SymbolButtonDatingGeneric = null;
      
      private var _timer:ITimer = null;
      
      private var _bubbleTimer:ITimer;
      
      private var _status:String = null;
      
      private var _datingStep:DatingStep = null;
      
      private var _scaleInOut:ScaleInOutEffect = null;
      
      private var _bubbleBaseY:Number;
      
      public function UiDatingButton(param1:SymbolButtonDatingGeneric, param2:String, param3:Function)
      {
         super(param1,param2,param3);
         _button = param1;
         _timer = Environment.createTimer("UiDatingButton::timer",1000,onTimerEvent);
         _bubbleTimer = Environment.createTimer("UiDatingButton::bubbleTimer",1000,toggleBalloon,null,1);
         _bubbleBaseY = param1.balloon.caption.y;
         _scaleInOut = new ScaleInOutEffect(_button.questGraphic,1,0.8);
      }
      
      override public function dispose() : void
      {
         super.dispose();
         _scaleInOut.dispose();
         _timer.dispose();
         _timer = null;
         _bubbleTimer.dispose();
         _bubbleTimer = null;
      }
      
      public function animate(param1:Boolean) : void
      {
         if(param1)
         {
            _scaleInOut.play();
         }
         else
         {
            _scaleInOut.stop();
         }
      }
      
      public function refresh(param1:Character) : void
      {
         if(!DatingUtil.isAvailable)
         {
            visible = false;
            return;
         }
         _datingStep = param1.dating.getActiveDatingStepInStage(param1.currentQuestStage);
         if(_datingStep == null || _datingStep.isRewardProcessed)
         {
            visible = false;
            return;
         }
         if(!_datingStep.isStarted && !_datingStep.isFinished)
         {
            _timer.stop();
            visible = false;
            _datingStep = null;
            return;
         }
         visible = true;
         buttonEnabled = true;
         _timer.stop();
         if(_datingStep.allPointsCollected())
         {
            setVisibility("collected");
            if(_datingStep.stepIndex == 5)
            {
               tooltip = _datingStep.tooltipText;
            }
            else
            {
               tooltip = LocText.current.text("screen/quest/button_dating_collected_tooltip");
            }
            _timer.start();
            onTimerEvent();
         }
         else
         {
            setVisibility("collect");
            tooltip = _datingStep.tooltipText;
            _button.progress.scaleX = _datingStep.progress / 100;
            _button.txtProgress.text = LocText.current.text("screen/quest/button_dating_collected_progress",Math.floor(_datingStep.progress));
            _button.txtProgress.autoFontSize = true;
         }
         var _loc2_:SymbolDatingDialogMessageBubbleSmallGeneric = _button.balloon;
         _loc2_.caption.text = DatingUtil.getBalloonWorldmapText(_datingStep.datingIndex,_datingStep.stepIndex);
         _loc2_.caption.y = _bubbleBaseY + (_loc2_.caption.height - _loc2_.caption.textHeight >> 1);
         if(_loc2_.visible)
         {
            _bubbleTimer.interval = 5000 + Math.random() * 5000;
         }
         else
         {
            _bubbleTimer.interval = 10000 + Math.random() * 5000;
         }
         _bubbleTimer.stop();
         _bubbleTimer.start();
         _button.questGraphic.npcIcon.setUriSprite(_datingStep.questButtonImageUrl,80,78,true);
      }
      
      private function toggleBalloon() : void
      {
         if(!User.current || !visible)
         {
            if(_bubbleTimer)
            {
               _bubbleTimer.stop();
            }
            return;
         }
         _button.balloon.visible = !_button.balloon.visible;
         if(_button.balloon.visible)
         {
            _bubbleTimer.interval = 5000 + Math.random() * 5000;
         }
         else
         {
            _bubbleTimer.interval = 10000 + Math.random() * 5000;
         }
         _bubbleTimer.start();
      }
      
      private function setVisibility(param1:String) : void
      {
         _status = param1;
         if(param1 == "locked")
         {
            _button.progress.visible = true;
            _button.questGraphic.visible = false;
            _button.bg.visible = true;
            _button.txtProgress.visible = true;
            _button.txtTimer.visible = false;
            _button.iconLock.visible = true;
            _button.exclamationMark.visible = false;
         }
         else if(param1 == "collect")
         {
            _button.progress.visible = true;
            _button.questGraphic.visible = true;
            _button.bg.visible = true;
            _button.txtProgress.visible = true;
            _button.txtTimer.visible = false;
            _button.iconLock.visible = false;
            _button.exclamationMark.visible = false;
         }
         else if(param1 == "collected")
         {
            _button.progress.visible = false;
            _button.questGraphic.visible = true;
            _button.bg.visible = true;
            _button.txtProgress.visible = false;
            _button.txtTimer.visible = true;
            _button.iconLock.visible = false;
            _button.exclamationMark.visible = true;
         }
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
            if(_timer)
            {
               _timer.stop();
            }
            return;
         }
         if(!_datingStep.hasFreeAttack && !_datingStep.isFinished)
         {
            _button.txtTimer.text = TimeUtil.secondsToStringFormat(_datingStep.secondsUntilFreeAttack,"m:s");
         }
         else
         {
            _button.txtTimer.visible = false;
            _button.bg.visible = false;
            _timer.stop();
         }
      }
      
      public function get status() : String
      {
         return _status;
      }
   }
}
