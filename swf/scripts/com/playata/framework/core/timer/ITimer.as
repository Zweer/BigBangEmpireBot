package com.playata.framework.core.timer
{
   import com.playata.framework.core.IDisposable;
   import com.playata.framework.core.signal.ISignal;
   
   public interface ITimer extends IDisposable
   {
       
      
      function set name(param1:String) : void;
      
      function get name() : String;
      
      function set interval(param1:Number) : void;
      
      function get interval() : Number;
      
      function set repeatCount(param1:int) : void;
      
      function get repeatCount() : int;
      
      function get currentCount() : int;
      
      function get onTick() : ISignal;
      
      function get onComplete() : ISignal;
      
      function get status() : int;
      
      function get isStopped() : Boolean;
      
      function get isRunning() : Boolean;
      
      function get isPaused() : Boolean;
      
      function get isCompleted() : Boolean;
      
      function start() : void;
      
      function stop() : void;
      
      function pause() : void;
      
      function resume() : void;
   }
}
