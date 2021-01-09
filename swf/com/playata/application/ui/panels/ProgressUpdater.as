package com.playata.application.ui.panels
{
   import com.playata.application.AppConfig;
   import com.playata.application.data.character.Character;
   import com.playata.application.data.constants.CConstant;
   import com.playata.application.data.movie.MovieQuest;
   import com.playata.application.data.quest.IDurationEvent;
   import com.playata.application.data.user.User;
   import com.playata.application.ui.elements.hud.UiMainNavigationButton;
   import com.playata.framework.application.Environment;
   import com.playata.framework.core.timer.ITimer;
   import com.playata.framework.core.util.TimeUtil;
   
   public class ProgressUpdater
   {
       
      
      private var _btnQuests:UiMainNavigationButton;
      
      private var _btnDuels:UiMainNavigationButton;
      
      private var _btnWork:UiMainNavigationButton;
      
      private var _btnMovie:UiMainNavigationButton;
      
      private var _questOrConvention:IDurationEvent;
      
      private var _updateMovieTimer:Boolean;
      
      private var _lowestMovieQuestEnergy:int = 0;
      
      private var _highestMovieQuestEnergy:int = 0;
      
      private var _timer:ITimer;
      
      public function ProgressUpdater(param1:UiMainNavigationButton, param2:UiMainNavigationButton, param3:UiMainNavigationButton, param4:UiMainNavigationButton)
      {
         super();
         _btnQuests = param1;
         _btnDuels = param2;
         _btnWork = param3;
         _btnMovie = param4;
         _timer = Environment.createTimer("PanelBaseUser::progressUpdater",1000,onTimer);
      }
      
      private function onTimer() : void
      {
         var _loc5_:Number = NaN;
         var _loc8_:int = 0;
         var _loc6_:Number = NaN;
         var _loc7_:int = 0;
         var _loc4_:int = 0;
         if(!User.current || !User.current.character)
         {
            if(_timer)
            {
               _timer.stop();
            }
            return;
         }
         if(!Environment.isActive && _timer.currentCount > 0)
         {
            return;
         }
         var _loc1_:Character = User.current.character;
         var _loc2_:Boolean = false;
         _btnQuests.progress = _questOrConvention != null?_questOrConvention.progress:100;
         if(AppConfig.streamingEnabled)
         {
            if(_loc1_.streaming && _loc1_.streaming.getNextFinishedStreamingShow())
            {
               _loc5_ = _loc1_.streaming.getNextFinishedStreamingShow().progress;
               if(_loc5_ < 100)
               {
                  _btnWork.progress = _loc5_ * 0.9;
               }
               else
               {
                  _btnWork.progress = 100;
               }
            }
            else
            {
               _btnWork.progress = 100;
            }
         }
         else
         {
            _btnWork.progress = _loc1_.workProgress;
         }
         _btnDuels.progress = !!_loc1_.hasAvailableFreeDuel?100:Number(_loc1_.duelStamina / _loc1_.duelStaminaCost * 100);
         var _loc3_:* = 100;
         if(_updateMovieTimer)
         {
            _loc8_ = CConstant.movie_cooldown;
            _loc3_ = Number((_loc8_ - _loc1_.remainingSecondsUntilNewMovieOffers) / _loc8_ * 100);
         }
         _btnMovie.progress = _loc3_;
         if(!_updateMovieTimer)
         {
            if(_loc1_.hasMovie && _loc1_.movie && !_btnMovie.highlighted)
            {
               _loc6_ = _loc1_.movieEnergy;
               if(!_loc1_.hasEnoughEnergyForMovieQuest)
               {
                  _loc7_ = _loc1_.tsLastMovieEnergyChange;
                  _loc4_ = TimeUtil.now - _loc7_;
                  _loc6_ = _loc6_ + _loc4_ % 60 / 60;
                  _btnMovie.progress = _loc6_ / _lowestMovieQuestEnergy * 100;
               }
               else
               {
                  _btnMovie.progress = 100;
               }
               if(User.current.highlightMovieButton && _loc6_ >= _highestMovieQuestEnergy)
               {
                  if(!_btnMovie.highlighted)
                  {
                     _loc2_ = true;
                  }
                  _btnMovie.highlighted = true;
               }
               else
               {
                  _btnMovie.highlighted = false;
               }
            }
         }
         if(_loc2_)
         {
            stopTimer();
         }
      }
      
      public function refresh() : void
      {
         if(_timer.isRunning)
         {
            stopTimer();
         }
         else
         {
            startTimer();
         }
         onTimer();
      }
      
      private function startTimer() : void
      {
         if(activeProgress())
         {
            _timer.start();
         }
      }
      
      private function stopTimer() : void
      {
         if(!activeProgress())
         {
            _timer.stop();
         }
      }
      
      private function activeProgress() : Boolean
      {
         var _loc1_:Character = User.current.character;
         if(_loc1_.activeQuest && _loc1_.activeConventionShow)
         {
            _questOrConvention = _loc1_.activeQuest.remainingSeconds < _loc1_.activeConventionShow.remainingSeconds?_loc1_.activeQuest:_loc1_.activeConventionShow;
         }
         else
         {
            _questOrConvention = _loc1_.activeQuest == null?_loc1_.activeConventionShow:_loc1_.activeQuest;
         }
         _updateMovieTimer = !_loc1_.hasMovie && _loc1_.remainingSecondsUntilNewMovieOffers > 0;
         if(_loc1_.hasMovie)
         {
            _lowestMovieQuestEnergy = 0;
            _highestMovieQuestEnergy = 0;
            var _loc4_:int = 0;
            var _loc3_:* = _loc1_.movie.movieQuests;
            for each(var _loc2_ in _loc1_.movie.movieQuests)
            {
               if(_lowestMovieQuestEnergy == 0 || _loc2_.energyCost < _lowestMovieQuestEnergy)
               {
                  _lowestMovieQuestEnergy = _loc2_.energyCost;
               }
               if(_loc2_.energyCost > _highestMovieQuestEnergy)
               {
                  _highestMovieQuestEnergy = _loc2_.energyCost;
               }
            }
         }
         if(_questOrConvention != null || _updateMovieTimer || _loc1_.workProgress < 100 || !_loc1_.hasAvailableFreeDuel)
         {
            return true;
         }
         if(_loc1_.hasMovie)
         {
            if(!_btnMovie.highlighted)
            {
               if(User.current.highlightMovieButton && !_loc1_.hasEnoughEnergyForAllMovieQuests)
               {
                  return true;
               }
               if(!User.current.highlightMovieButton && !_loc1_.hasEnoughEnergyForMovieQuest)
               {
                  return true;
               }
            }
         }
         if(AppConfig.streamingEnabled && _loc1_.streaming && _loc1_.streaming.getNextFinishedStreamingShow())
         {
            return true;
         }
         return false;
      }
   }
}
