package com.playata.application.ui.elements.herobook
{
   import com.playata.application.data.herobook.HerobookObjective;
   import com.playata.framework.application.Environment;
   import com.playata.framework.core.timer.ITimer;
   import visuals.ui.elements.herobook.SymbolHerobookTimerGeneric;
   
   public class UiHerobookTimer
   {
       
      
      private var _content:SymbolHerobookTimerGeneric = null;
      
      private var _timer:ITimer = null;
      
      private var _herobookObjective:HerobookObjective = null;
      
      private var _finishCallback:Function = null;
      
      private var _autoHide:Boolean = false;
      
      public function UiHerobookTimer(param1:SymbolHerobookTimerGeneric, param2:Function = null, param3:Boolean = true)
      {
         super();
         _content = param1;
         _finishCallback = param2;
         _autoHide = param3;
         _timer = Environment.createTimer("UiHerobookTimer::timer",1000,onTimerEvent);
      }
      
      public function dispose() : void
      {
         _timer.dispose();
         _timer = null;
         _herobookObjective = null;
         _content = null;
      }
      
      public function refresh(param1:HerobookObjective) : void
      {
         if(param1 == null)
         {
            hide();
            return;
         }
         show();
         _herobookObjective = param1;
         startTimer();
      }
      
      private function startTimer() : void
      {
         if(_herobookObjective)
         {
            _timer.start();
            onTimerEvent();
         }
      }
      
      public function stopTimer() : void
      {
         _timer.stop();
      }
      
      private function onTimerEvent() : void
      {
         if(_herobookObjective.remainingSeconds <= 0)
         {
            if(_finishCallback != null)
            {
               _finishCallback();
            }
            if(_autoHide)
            {
               hide();
               return;
            }
         }
         _content.txtTimer.text = _herobookObjective.timeRemainingString;
      }
      
      public function show() : void
      {
         _content.visible = true;
      }
      
      public function hide() : void
      {
         _content.visible = false;
         stopTimer();
      }
   }
}
