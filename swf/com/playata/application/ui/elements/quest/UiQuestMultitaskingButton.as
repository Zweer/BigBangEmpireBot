package com.playata.application.ui.elements.quest
{
   import com.playata.application.AppConfig;
   import com.playata.application.data.character.Character;
   import com.playata.application.data.constants.CConstant;
   import com.playata.application.data.quest.Quest;
   import com.playata.application.data.user.User;
   import com.playata.application.ui.elements.booster.UiBoosterIcon;
   import com.playata.application.ui.elements.generic.button.UiButton;
   import com.playata.framework.application.Environment;
   import com.playata.framework.core.timer.ITimer;
   import com.playata.framework.core.util.TimeUtil;
   import com.playata.framework.display.IDisplayObject;
   import com.playata.framework.display.IDisplayObjectContainer;
   import com.playata.framework.localization.LocText;
   import visuals.ui.elements.buttons.SymbolButtonQuestMultitaskingGeneric;
   
   public class UiQuestMultitaskingButton extends UiButton
   {
       
      
      private var _button:SymbolButtonQuestMultitaskingGeneric = null;
      
      private var _quest:Quest = null;
      
      private var _timer:ITimer = null;
      
      public function UiQuestMultitaskingButton(param1:SymbolButtonQuestMultitaskingGeneric, param2:Function)
      {
         super(param1,"",param2);
         _button = param1;
         _button.fightQuest.graphic.effect.visible = false;
         _button.timeQuest.graphic.effect.visible = false;
         _button.statQuest.graphic.effect.visible = false;
         _timer = Environment.createTimer("UiQuestMultitaskingButton::timer",1000,onTimerEvent);
      }
      
      override public function dispose() : void
      {
         super.dispose();
         _timer.dispose();
         _timer = null;
      }
      
      public function refresh(param1:Character) : void
      {
         var _loc2_:* = null;
         var _loc3_:int = 0;
         var _loc4_:* = null;
         visible = param1 != null && AppConfig.multitaskingBoosterEnabled && param1.level >= CConstant.booster_multitasking_unlock_level;
         if(!visible)
         {
            return;
         }
         _quest = param1.activeQuest;
         _button.citymap.visible = _quest == null;
         _button.timeQuest.visible = _quest != null && _quest.isTimeQuest;
         _button.fightQuest.visible = _quest != null && _quest.isFightQuest;
         _button.statQuest.visible = _quest != null && _quest.isStatQuest;
         if(_button.statQuest.visible)
         {
            _loc2_ = _button.statQuest.graphic.animation;
            _loc3_ = 1;
            while(_loc3_ < 5)
            {
               _loc4_ = _loc2_.getChildByName("stat" + _loc3_);
               _loc4_.visible = _loc3_ == _quest.statQuestStat;
               _loc3_++;
            }
         }
         updateTooltip(param1);
         if(_quest && _quest.remainingSeconds <= 0)
         {
            _timer.stop();
            _button.timer.visible = false;
            highlight();
            return;
         }
         if(_quest)
         {
            _timer.start();
            onTimerEvent();
         }
         else
         {
            _button.timer.visible = false;
         }
         unhighlight();
      }
      
      private function updateTooltip(param1:Character) : void
      {
         var _loc5_:* = null;
         var _loc3_:int = 0;
         var _loc2_:* = null;
         var _loc4_:String = "";
         if(param1.multitaskingBoosterActive)
         {
            _loc5_ = UiBoosterIcon.getExpirationDateTime(param1.tsActiveMultitaskingBoostExpires);
            _loc3_ = param1.tsActiveMultitaskingBoostExpires - TimeUtil.now - 5;
            _loc4_ = "\n\n" + LocText.current.text("screen/quest/multitasking_active",TimeUtil.secondsToString(_loc3_),_loc5_);
         }
         else if(param1.activeConventionShow)
         {
            _loc4_ = "\n\n" + LocText.current.text("screen/quest/multitasking_not_active");
         }
         if(_quest)
         {
            _loc2_ = null;
            if(_quest.isTimeQuest)
            {
               _loc2_ = LocText.current.text("screen/quest/button_time_quest_tooltip");
            }
            else if(_quest.isFightQuest)
            {
               _loc2_ = LocText.current.text("screen/quest/button_fight_quest_tooltip");
            }
            else
            {
               _loc2_ = LocText.current.text("screen/quest/button_stat_quest_tooltip");
            }
            tooltip = LocText.current.text("screen/quest/btn_multitasking_active_quest_tooltip",_loc2_) + _loc4_;
         }
         else
         {
            tooltip = LocText.current.text("screen/quest/button_citymap_tooltip") + _loc4_;
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
         if(_quest == null)
         {
            return;
         }
         _button.timer.txtTimer.text = TimeUtil.secondsToStringFormat(_quest.remainingSeconds,"H:m:s");
         _button.timer.visible = true;
         if(_quest.remainingSeconds <= 0)
         {
            refresh(User.current.character);
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
