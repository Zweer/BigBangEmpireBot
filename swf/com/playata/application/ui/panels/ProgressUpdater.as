package com.playata.application.ui.panels
{
   import com.playata.application.data.character.Character;
   import com.playata.application.data.constants.CConstant;
   import com.playata.application.data.quest.IDurationEvent;
   import com.playata.application.data.user.User;
   import com.playata.application.ui.elements.hud.UiMainNavigationButton;
   import com.playata.framework.application.Environment;
   import com.playata.framework.core.timer.ITimer;
   
   public class ProgressUpdater
   {
       
      
      private var _btnQuests:UiMainNavigationButton;
      
      private var _btnDuels:UiMainNavigationButton;
      
      private var _btnWork:UiMainNavigationButton;
      
      private var _btnMovie:UiMainNavigationButton;
      
      private var _questOrConvention:IDurationEvent;
      
      private var _updateMovieTimer:Boolean;
      
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
         var _loc3_:int = 0;
         if(!User.current)
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
         _btnQuests.progress = _questOrConvention != null?_questOrConvention.progress:100;
         _btnWork.progress = _loc1_.workProgress;
         _btnDuels.progress = !!_loc1_.hasAvailableFreeDuel?100:Number(_loc1_.duelStamina / _loc1_.duelStaminaCost * 100);
         var _loc2_:* = 100;
         if(_updateMovieTimer)
         {
            _loc3_ = CConstant.movie_cooldown;
            _loc2_ = Number((_loc3_ - _loc1_.remainingSecondsUntilNewMovieOffers) / _loc3_ * 100);
         }
         _btnMovie.progress = _loc2_;
      }
      
      public function refresh() : void
      {
         _timer.stop();
         var _loc1_:Character = User.current.character;
         if(_loc1_.activeQuest && _loc1_.activeConventionShow)
         {
            _questOrConvention = _loc1_.activeQuest.remainingSeconds < _loc1_.activeConventionShow.remainingSeconds?_loc1_.activeQuest:_loc1_.activeConventionShow;
         }
         else
         {
            _questOrConvention = _loc1_.activeQuest == null?_loc1_.activeConventionShow:_loc1_.activeQuest;
         }
         _updateMovieTimer = !_loc1_.hasMovie;
         if(_questOrConvention != null || _updateMovieTimer || _loc1_.workProgress < 100 || !_loc1_.hasAvailableFreeDuel)
         {
            _timer.start();
         }
         onTimer();
      }
   }
}
