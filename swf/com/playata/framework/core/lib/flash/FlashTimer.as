package com.playata.framework.core.lib.flash
{
   import com.playata.framework.core.signal.ISignal;
   import com.playata.framework.core.signal.Signal;
   import com.playata.framework.core.timer.ITimer;
   import flash.events.TimerEvent;
   import flash.utils.Timer;
   
   public class FlashTimer implements ITimer
   {
       
      
      private var _name:String = null;
      
      private var _status:int = 0;
      
      private var _timer:Timer = null;
      
      private var _onTick:ISignal = null;
      
      private var _onComplete:ISignal = null;
      
      public function FlashTimer(param1:String, param2:int, param3:Function, param4:Function = null, param5:int = 0, param6:Boolean = false)
      {
         super();
         _name = param1;
         _timer = new Timer(param2,param5);
         _timer.addEventListener("timerComplete",handleTimerComplete);
         if(param3 != null)
         {
            this.onTick.add(param3);
         }
         if(param4 != null)
         {
            this.onComplete.add(param4);
         }
         _status = 0;
         if(param6)
         {
            this.start();
         }
      }
      
      public function dispose() : void
      {
         if(_onTick != null)
         {
            _timer.removeEventListener("timer",handleTimer);
            _onTick.removeAll();
            _onTick = null;
         }
         if(_onComplete != null)
         {
            _onComplete.removeAll();
            _onComplete = null;
         }
         if(_timer)
         {
            _timer.removeEventListener("timerComplete",handleTimerComplete);
            _timer.stop();
            _timer = null;
         }
         _status = 4;
      }
      
      public function set name(param1:String) : void
      {
         _name = param1;
      }
      
      public function get name() : String
      {
         return _name;
      }
      
      public function set interval(param1:Number) : void
      {
         _timer.delay = param1;
      }
      
      public function get interval() : Number
      {
         return _timer.delay;
      }
      
      public function set repeatCount(param1:int) : void
      {
         _timer.repeatCount = param1;
      }
      
      public function get repeatCount() : int
      {
         return _timer.repeatCount;
      }
      
      public function get currentCount() : int
      {
         return _timer.currentCount;
      }
      
      public function get status() : int
      {
         if(!_timer)
         {
            _status = 4;
            return _status;
         }
         return _status;
      }
      
      public function get isStopped() : Boolean
      {
         return this.status == 0;
      }
      
      public function get isRunning() : Boolean
      {
         return this.status == 1;
      }
      
      public function get isPaused() : Boolean
      {
         return this.status == 2;
      }
      
      public function get isCompleted() : Boolean
      {
         return this.status == 3;
      }
      
      public function get onTick() : ISignal
      {
         if(_onTick == null)
         {
            _onTick = new Signal();
            _timer.addEventListener("timer",handleTimer);
         }
         return _onTick;
      }
      
      public function get onComplete() : ISignal
      {
         if(_onComplete == null)
         {
            _onComplete = new Signal();
         }
         return _onComplete;
      }
      
      public function start() : void
      {
         if(isCompleted)
         {
            return;
         }
         _status = 1;
         _timer.start();
      }
      
      public function stop() : void
      {
         _status = 0;
         _timer.reset();
      }
      
      public function pause() : void
      {
         if(!isRunning)
         {
            return;
         }
         _status = 2;
         _timer.stop();
      }
      
      public function resume() : void
      {
         if(!isPaused)
         {
            return;
         }
         _status = 1;
         _timer.start();
      }
      
      private function handleTimer(param1:TimerEvent) : void
      {
         if(_name != null)
         {
            trace("[Timer] " + _name + "::onTick");
         }
         if(_onTick != null)
         {
            _onTick.dispatch();
         }
      }
      
      private function handleTimerComplete(param1:TimerEvent) : void
      {
         _status = 3;
         if(_onComplete != null)
         {
            _onComplete.dispatch();
         }
      }
   }
}
