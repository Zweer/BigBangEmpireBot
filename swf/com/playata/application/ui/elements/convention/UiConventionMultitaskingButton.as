package com.playata.application.ui.elements.convention
{
   import com.playata.application.AppConfig;
   import com.playata.application.data.character.Character;
   import com.playata.application.data.constants.CConstant;
   import com.playata.application.data.convention.Convention;
   import com.playata.application.data.convention.ConventionShow;
   import com.playata.application.data.user.User;
   import com.playata.application.ui.elements.booster.UiBoosterIcon;
   import com.playata.application.ui.elements.generic.button.UiButton;
   import com.playata.framework.application.Environment;
   import com.playata.framework.core.timer.ITimer;
   import com.playata.framework.core.util.TimeUtil;
   import com.playata.framework.localization.LocText;
   import visuals.ui.elements.conventions.SymbolButtonConventionMultitaskingGeneric;
   
   public class UiConventionMultitaskingButton extends UiButton
   {
       
      
      private var _button:SymbolButtonConventionMultitaskingGeneric = null;
      
      private var _convention:Convention = null;
      
      private var _timer:ITimer = null;
      
      public function UiConventionMultitaskingButton(param1:SymbolButtonConventionMultitaskingGeneric, param2:Function)
      {
         super(param1,"",param2);
         _button = param1;
         _button.graphic.npcIcon.removeAllChildren();
         _timer = Environment.createTimer("UiConventionMultitaskingButton::timer",1000,onTimerEvent);
      }
      
      override public function dispose() : void
      {
         super.dispose();
         _timer.dispose();
         _timer = null;
      }
      
      public function refresh(param1:Convention) : void
      {
         _convention = param1;
         var _loc2_:Character = User.current.character;
         visible = _convention != null && AppConfig.multitaskingBoosterEnabled && _loc2_.level >= CConstant.booster_multitasking_unlock_level;
         if(!visible)
         {
            return;
         }
         updateTooltip(_loc2_);
         if(!_convention.isRunning || _loc2_.level < CConstant.movie_min_level)
         {
            _timer.stop();
            visible = false;
            _convention = null;
            return;
         }
         _timer.start();
         onTimerEvent();
         _button.graphic.npcIcon.setUriSprite(_convention.questButtonImageUrl,80,78,true);
      }
      
      private function updateTooltip(param1:Character) : void
      {
         var _loc3_:* = null;
         var _loc4_:* = null;
         var _loc2_:int = 0;
         if(param1.fansTotal == 0)
         {
            tooltip = LocText.current.text("screen/quest/button_convention_show_tooltip_no_fans");
         }
         else
         {
            _loc3_ = "";
            if(param1.multitaskingBoosterActive)
            {
               _loc4_ = UiBoosterIcon.getExpirationDateTime(param1.tsActiveMultitaskingBoostExpires);
               _loc2_ = param1.tsActiveMultitaskingBoostExpires - TimeUtil.now - 5;
               _loc3_ = "\n\n" + LocText.current.text("screen/quest/multitasking_active",TimeUtil.secondsToString(_loc2_),_loc4_);
            }
            else if(param1.activeQuest)
            {
               _loc3_ = "\n\n" + LocText.current.text("screen/quest/multitasking_not_active");
            }
            tooltip = LocText.current.text("screen/quest/btn_multitasking_active_convention_tooltip",_convention.name) + _loc3_;
         }
      }
      
      private function onTimerEvent() : void
      {
         var _loc1_:* = null;
         if(!User.current)
         {
            if(_timer)
            {
               _timer.stop();
            }
            return;
         }
         if(_convention == null)
         {
            return;
         }
         _button.timer.txtTimer.text = TimeUtil.secondsToStringFormat(_convention.remainingSeconds,"H:m:s");
         if(_convention.remainingSeconds <= 0)
         {
            refresh(null);
         }
         else
         {
            _loc1_ = User.current.character.activeConventionShow;
            if(!_loc1_ || _loc1_.remainingSeconds <= 0)
            {
               highlight();
            }
            else
            {
               unhighlight();
            }
         }
      }
      
      private function highlight() : void
      {
      }
      
      private function unhighlight() : void
      {
      }
   }
}
