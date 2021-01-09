package org.casalib.process
{
   import org.casalib.control.IRunnable;
   import org.casalib.events.ProcessEvent;
   import org.casalib.events.RemovableEventDispatcher;
   
   public class Process extends RemovableEventDispatcher implements IRunnable
   {
      
      public static var NORM_PRIORITY:int = 0;
       
      
      protected var _priority:uint;
      
      protected var _isRunning:Boolean;
      
      protected var _hasCompleted:Boolean;
      
      public function Process()
      {
         super();
         this.priority = Process.NORM_PRIORITY;
      }
      
      public function start() : void
      {
         this._isRunning = true;
         this._hasCompleted = false;
         this.dispatchEvent(new ProcessEvent(ProcessEvent.START));
      }
      
      public function stop() : void
      {
         this._isRunning = false;
         this.dispatchEvent(new ProcessEvent(ProcessEvent.STOP));
      }
      
      public function get running() : Boolean
      {
         return this._isRunning;
      }
      
      public function get completed() : Boolean
      {
         return this._hasCompleted;
      }
      
      public function get priority() : int
      {
         return this._priority;
      }
      
      public function set priority(param1:int) : void
      {
         this._priority = param1;
      }
      
      override public function destroy() : void
      {
         if(this.running)
         {
            this.stop();
         }
         super.destroy();
      }
      
      protected function _complete() : void
      {
         this._isRunning = false;
         this._hasCompleted = true;
         this.dispatchEvent(new ProcessEvent(ProcessEvent.COMPLETE));
      }
   }
}
