package com.playata.application.ui.elements.story_dungeon
{
   import com.playata.application.data.character.Character;
   import com.playata.application.data.constants.CStoryDungeon;
   import com.playata.application.data.story_dungeon.StoryDungeon;
   import com.playata.application.data.user.User;
   import com.playata.application.ui.effects.ScaleInOutEffect;
   import com.playata.application.ui.elements.generic.button.UiButton;
   import com.playata.framework.application.Environment;
   import com.playata.framework.core.timer.ITimer;
   import com.playata.framework.core.util.TimeUtil;
   import com.playata.framework.localization.LocText;
   import visuals.ui.elements.story_dungeon.SymbolButtonStoryDungeonGeneric;
   
   public class UiStoryDungeonButton extends UiButton
   {
       
      
      private var _button:SymbolButtonStoryDungeonGeneric = null;
      
      private var _storyDungeon:StoryDungeon = null;
      
      private var _timer:ITimer = null;
      
      private var _progressBar:UiStoryDungeonProgressBar = null;
      
      private var _status:String = null;
      
      private var _scaleInOut:ScaleInOutEffect = null;
      
      public function UiStoryDungeonButton(param1:SymbolButtonStoryDungeonGeneric, param2:String, param3:Function)
      {
         super(param1,param2,param3);
         _button = param1;
         _timer = Environment.createTimer("UiStoryDungeonButton::timer",1000,onTimerEvent);
         _progressBar = new UiStoryDungeonProgressBar(_button.progressBar);
         _scaleInOut = new ScaleInOutEffect(_button.questGraphic,1,0.8);
      }
      
      override public function dispose() : void
      {
         super.dispose();
         _scaleInOut.dispose();
         _timer.dispose();
         _timer = null;
         if(_progressBar)
         {
            _progressBar.dispose();
            _progressBar = null;
         }
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
         var _loc2_:* = null;
         _storyDungeon = param1.getActiveStoryDungeonByStage(param1.currentQuestStage);
         tag = _storyDungeon;
         if(_storyDungeon == null || _storyDungeon.isRewardProcessed)
         {
            visible = false;
            if(_storyDungeon && !StoryDungeon.newStoryDungeonAvailable(param1) && StoryDungeon.getStoryDungeonTemplate(StoryDungeon.getNextStoryDungeonIndex(param1)))
            {
               _loc2_ = StoryDungeon.getStoryDungeonTemplate(StoryDungeon.getNextStoryDungeonIndex(param1));
               if(_loc2_.stage == param1.currentQuestStage)
               {
                  setVisibility("locked");
                  _progressBar.value = param1.level / _loc2_.minLevel * 100;
                  _button.txtProgress.text = LocText.current.text("screen/quest/story_dungeon_locked",_loc2_.minLevel);
                  tooltip = LocText.current.text("screen/quest/button_story_dungeon_locked_tooltip",_loc2_.minLevel);
                  visible = true;
                  buttonEnabled = false;
               }
            }
            return;
         }
         if(_storyDungeon.stage != param1.currentQuestStage)
         {
            visible = false;
            return;
         }
         if(!_storyDungeon.isStarted && !_storyDungeon.isFinished)
         {
            _timer.stop();
            visible = false;
            _storyDungeon = null;
            return;
         }
         visible = true;
         buttonEnabled = true;
         _timer.stop();
         if(_storyDungeon.allPointsCollected())
         {
            setVisibility("collected");
            tooltip = LocText.current.text("screen/quest/button_story_dungeon_collected_tooltip");
            _timer.start();
            onTimerEvent();
         }
         else
         {
            setVisibility("collect");
            tooltip = LocText.current.text("screen/quest/button_story_dungeon_tooltip/" + _storyDungeon.storyDungeonIndex);
            _progressBar.value = _storyDungeon.progress;
            _button.txtProgress.text = _storyDungeon.progressText;
            _button.txtProgress.autoFontSize = true;
         }
         _button.questGraphic.npcIcon.setUriSprite(_storyDungeon.questButtonImageUrl,80,78,true);
      }
      
      private function setVisibility(param1:String) : void
      {
         _status = param1;
         if(param1 == "locked")
         {
            _button.progressBar.visible = true;
            _button.questGraphic.visible = false;
            _button.timerBg.visible = false;
            _button.txtProgress.visible = true;
            _button.txtTimer.visible = false;
            _button.iconLock.visible = true;
            _button.exclamationMark.visible = false;
         }
         else if(param1 == "collect")
         {
            _button.progressBar.visible = true;
            _button.questGraphic.visible = true;
            _button.timerBg.visible = false;
            _button.txtProgress.visible = true;
            _button.txtTimer.visible = false;
            _button.iconLock.visible = false;
            _button.exclamationMark.visible = false;
         }
         else if(param1 == "collected")
         {
            _button.progressBar.visible = false;
            _button.questGraphic.visible = true;
            _button.timerBg.visible = true;
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
         if(_storyDungeon == null)
         {
            return;
         }
         if(!_storyDungeon.hasFreeAttack)
         {
            _button.txtTimer.text = TimeUtil.secondsToStringFormat(_storyDungeon.secondsUntilFreeAttack,"m:s");
         }
         else
         {
            _button.txtTimer.visible = false;
            _button.timerBg.visible = false;
            _timer.stop();
         }
      }
      
      public function get status() : String
      {
         return _status;
      }
   }
}
