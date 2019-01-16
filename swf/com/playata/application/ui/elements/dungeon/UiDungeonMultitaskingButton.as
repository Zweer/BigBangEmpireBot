package com.playata.application.ui.elements.dungeon
{
   import com.playata.application.AppConfig;
   import com.playata.application.data.character.Character;
   import com.playata.application.data.constants.CConstant;
   import com.playata.application.data.dungeon.Dungeon;
   import com.playata.application.data.user.User;
   import com.playata.application.ui.elements.booster.UiBoosterIcon;
   import com.playata.application.ui.elements.generic.button.UiButton;
   import com.playata.framework.application.Environment;
   import com.playata.framework.core.timer.ITimer;
   import com.playata.framework.core.util.TimeUtil;
   import com.playata.framework.localization.LocText;
   import visuals.ui.elements.dungeon.SymbolButtonDungeonMultitaskingGeneric;
   
   public class UiDungeonMultitaskingButton extends UiButton
   {
       
      
      private var _button:SymbolButtonDungeonMultitaskingGeneric = null;
      
      private var _dungeon:Dungeon = null;
      
      private var _timer:ITimer = null;
      
      public function UiDungeonMultitaskingButton(param1:SymbolButtonDungeonMultitaskingGeneric, param2:Function)
      {
         super(param1,"",param2);
         _button = param1;
         _timer = Environment.createTimer("UiDungeonMultitaskingButton::timer",1000,onTimerEvent);
      }
      
      override public function dispose() : void
      {
         super.dispose();
         _timer.dispose();
         _timer = null;
      }
      
      public function refresh(param1:Character) : void
      {
         visible = param1 != null && AppConfig.multitaskingBoosterEnabled && param1.level >= CConstant.booster_multitasking_unlock_level;
         if(!visible)
         {
            return;
         }
         _dungeon = param1.currentDungeon;
         updateTooltip(param1);
         if(_dungeon && (_dungeon.isTimeUp || _dungeon.remainingSeconds <= 0))
         {
            _timer.stop();
            _button.timer.visible = false;
            highlight();
            return;
         }
         if(!_dungeon && !param1.hasDungeonKey)
         {
            _timer.stop();
            _button.timer.visible = false;
            noKey();
            return;
         }
         _timer.start();
         onTimerEvent();
      }
      
      private function updateTooltip(param1:Character) : void
      {
         var _loc4_:* = null;
         var _loc2_:int = 0;
         var _loc3_:String = "";
         if(param1.multitaskingBoosterActive)
         {
            _loc4_ = UiBoosterIcon.getExpirationDateTime(param1.tsActiveMultitaskingBoostExpires);
            _loc2_ = param1.tsActiveMultitaskingBoostExpires - TimeUtil.now - 5;
            _loc3_ = "\n\n" + LocText.current.text("screen/quest/multitasking_active",TimeUtil.secondsToString(_loc2_),_loc4_);
         }
         else if(param1.activeConventionShow || param1.activeQuest)
         {
            _loc3_ = "\n\n" + LocText.current.text("screen/quest/multitasking_not_active");
         }
         if(_dungeon)
         {
            tooltip = LocText.current.text("screen/citymap/btn_dungeon_key_active_tooltip",param1.currentDungeon.name) + _loc3_;
         }
         else if(param1.hasDungeonKey)
         {
            tooltip = LocText.current.text("screen/citymap/btn_dungeon_key_available_tooltip",TimeUtil.secondsToString(param1.dungeonKeyEndTimestamp - TimeUtil.now)) + _loc3_;
         }
         else if(TimeUtil.serverDateTime.isToday(param1.tsLastDungeonStarted))
         {
            tooltip = LocText.current.text("screen/citymap/btn_dungeon_key_on_cooldown_tooltip");
         }
         else
         {
            tooltip = LocText.current.text("screen/citymap/btn_dungeon_key_missing_tooltip") + _loc3_;
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
            unhighlight();
            return;
         }
         var _loc1_:Character = User.current.character;
         if(_dungeon == null && !_loc1_.hasDungeonKey)
         {
            _timer.stop();
            unhighlight();
            refresh(_loc1_);
            return;
         }
         _button.timer.visible = true;
         if(_dungeon)
         {
            _button.timer.txtTimer.text = TimeUtil.secondsToStringFormat(_dungeon.remainingSeconds,"H:m:s");
            if(_dungeon.remainingSeconds <= 0)
            {
               refresh(_loc1_);
            }
            else if(_loc1_.secondsToNextDungeonQuest > 0)
            {
               unhighlight();
            }
            else
            {
               highlight();
            }
         }
         else if(_loc1_.hasDungeonKey)
         {
            _button.timer.txtTimer.text = TimeUtil.secondsToStringFormat(_loc1_.dungeonKeyEndTimestamp - TimeUtil.now,"H:m:s");
            highlight();
            updateTooltip(_loc1_);
         }
         else
         {
            _button.timer.visible = false;
            refresh(_loc1_);
         }
      }
      
      private function highlight() : void
      {
         _button.iconTicket.alpha = 1;
         _button.iconDelete.visible = false;
      }
      
      private function unhighlight() : void
      {
         _button.iconTicket.alpha = 1;
         _button.iconDelete.visible = false;
      }
      
      private function noKey() : void
      {
         _button.iconTicket.alpha = 0.8;
         _button.iconDelete.visible = true;
      }
   }
}
