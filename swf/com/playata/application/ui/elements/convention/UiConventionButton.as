package com.playata.application.ui.elements.convention
{
   import com.playata.application.data.constants.CConstant;
   import com.playata.application.data.convention.Convention;
   import com.playata.application.data.user.User;
   import com.playata.application.ui.effects.ScaleInOutEffect;
   import com.playata.application.ui.elements.generic.button.UiButton;
   import com.playata.framework.application.Environment;
   import com.playata.framework.core.timer.ITimer;
   import com.playata.framework.core.util.TimeUtil;
   import com.playata.framework.localization.LocText;
   import visuals.ui.elements.conventions.SymbolButtonConventionGeneric;
   
   public class UiConventionButton extends UiButton
   {
       
      
      private var _button:SymbolButtonConventionGeneric = null;
      
      private var _convention:Convention = null;
      
      private var _fansBar:UiConventionFansProgressBarSmall = null;
      
      private var _timer:ITimer = null;
      
      private var _scaleInOut:ScaleInOutEffect = null;
      
      public function UiConventionButton(param1:SymbolButtonConventionGeneric, param2:String, param3:Function)
      {
         super(param1,param2,param3);
         _button = param1;
         _fansBar = new UiConventionFansProgressBarSmall(_button.progress);
         _button.graphic.npcIcon.removeAllChildren();
         _timer = Environment.createTimer("UiConventionButton::timer",1000,onTimerEvent);
         _scaleInOut = new ScaleInOutEffect(_button.graphic,1,0.8);
      }
      
      override public function dispose() : void
      {
         super.dispose();
         _scaleInOut.dispose();
         _timer.dispose();
         _timer = null;
         _fansBar.dispose();
         _fansBar = null;
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
      
      public function refresh(param1:Convention) : void
      {
         _convention = param1;
         visible = _convention != null;
         if(_convention == null)
         {
            return;
         }
         if(!_convention.isRunning || User.current.character.level < CConstant.movie_min_level)
         {
            _timer.stop();
            visible = false;
            _convention = null;
            return;
         }
         _timer.start();
         onTimerEvent();
         refreshFans();
         _button.graphic.npcIcon.setUriSprite(_convention.questButtonImageUrl,80,78,true);
         if(User.current.character.fansTotal == 0)
         {
            tooltip = LocText.current.text("screen/quest/button_convention_show_tooltip_no_fans");
         }
         else
         {
            tooltip = LocText.current.text("screen/quest/button_convention_show_tooltip");
         }
      }
      
      public function refreshFans() : void
      {
         if(_convention == null)
         {
            return;
         }
         if(!_convention.isRunning)
         {
            return;
         }
         _fansBar.refresh(_convention.fansTotal,_convention.fansCurrent);
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
         if(_convention == null)
         {
            return;
         }
         _button.txtTimeLeft.text = TimeUtil.secondsToStringFormat(_convention.remainingSeconds,"H:m:s");
         if(_convention.remainingSeconds <= 0)
         {
            refresh(null);
         }
      }
   }
}
