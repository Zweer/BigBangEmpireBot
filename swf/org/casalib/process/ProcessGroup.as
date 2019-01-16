package org.casalib.process
{
   import org.casalib.events.ProcessEvent;
   import org.casalib.util.ArrayUtil;
   
   public class ProcessGroup extends Process
   {
      
      public static var NORM_THREADS:uint = 1;
      
      public static const MAX_THREADS:uint = uint.MAX_VALUE;
       
      
      protected var _threads:uint;
      
      protected var _processes:Array;
      
      protected var _autoStart:Boolean;
      
      public function ProcessGroup()
      {
         super();
         this.threads = ProcessGroup.NORM_THREADS;
         this._processes = new Array();
      }
      
      override public function start() : void
      {
         super.start();
         this._checkThreads();
      }
      
      override public function stop() : void
      {
         this._isRunning = false;
         var _loc1_:uint = this._processes.length;
         while(_loc1_--)
         {
            if(this._processes[_loc1_].running)
            {
               this._processes[_loc1_].stop();
               return;
            }
         }
         super.stop();
      }
      
      public function get autoStart() : Boolean
      {
         return this._autoStart;
      }
      
      public function set autoStart(param1:Boolean) : void
      {
         this._autoStart = param1;
         if(!this.completed && !this.running)
         {
            this.start();
         }
      }
      
      public function addProcess(param1:Process) : void
      {
         var _loc2_:int = 0;
         var _loc3_:int = 0;
         var _loc4_:Boolean = false;
         var _loc5_:Process = null;
         if(param1 == this)
         {
            throw new Error("You cannot add the same Process to itself.");
         }
         this.removeProcess(param1);
         this._addProcessListeners(param1);
         this._hasCompleted = param1.completed;
         if(this._processes.length == 0)
         {
            this._processes.push(param1);
         }
         else
         {
            _loc2_ = -1;
            _loc3_ = this._processes.length - 1;
            while(++_loc2_ < this._processes.length)
            {
               _loc5_ = this._processes[_loc2_];
               if(!_loc5_.completed)
               {
                  this._hasCompleted = false;
                  if(_loc4_)
                  {
                  }
                  break;
               }
               if(!_loc4_)
               {
                  if(param1.priority > _loc5_.priority)
                  {
                     this._processes.splice(_loc2_,0,param1);
                     _loc4_ = true;
                  }
                  else if(_loc2_ == _loc3_)
                  {
                     this._processes.push(param1);
                     _loc4_ = true;
                  }
                  if(!(_loc4_ && !this._hasCompleted))
                  {
                     continue;
                  }
                  break;
               }
            }
         }
         if(this.autoStart && !this.completed)
         {
            if(this.running)
            {
               this._checkThreads();
            }
            else
            {
               this.start();
            }
         }
      }
      
      public function removeProcess(param1:Process) : void
      {
         this._removeProcessListeners(param1);
         this._hasCompleted = true;
         var _loc2_:uint = this._processes.length;
         while(_loc2_--)
         {
            if(this._processes[_loc2_] == param1)
            {
               this._processes.splice(_loc2_,1);
            }
            else if(!this._processes[_loc2_].completed)
            {
               this._hasCompleted = false;
            }
         }
      }
      
      public function hasProcess(param1:Process, param2:Boolean = true) : Boolean
      {
         var _loc5_:Process = null;
         var _loc6_:ProcessGroup = null;
         var _loc3_:* = this._processes.indexOf(param1) > -1;
         if(!param2)
         {
            return _loc3_;
         }
         if(_loc3_)
         {
            return true;
         }
         var _loc4_:uint = this._processes.length;
         while(_loc4_--)
         {
            _loc5_ = this._processes[_loc4_];
            if(_loc5_ is ProcessGroup)
            {
               _loc6_ = _loc5_ as ProcessGroup;
               if(_loc6_.hasProcess(param1,true))
               {
                  return true;
               }
            }
         }
         return false;
      }
      
      public function get processes() : Array
      {
         return this._processes.concat();
      }
      
      public function get queuedProcesses() : Array
      {
         return ArrayUtil.getItemsByKey(this.incompletedProcesses,"running",false);
      }
      
      public function get runningProcesses() : Array
      {
         return ArrayUtil.getItemsByKey(this.processes,"running",true);
      }
      
      public function get incompletedProcesses() : Array
      {
         return ArrayUtil.getItemsByKey(this.processes,"completed",false);
      }
      
      public function get completedProcesses() : Array
      {
         return ArrayUtil.getItemsByKey(this.processes,"completed",true);
      }
      
      public function get threads() : uint
      {
         return this._threads;
      }
      
      public function set threads(param1:uint) : void
      {
         this._threads = param1;
      }
      
      public function destroyProcesses(param1:Boolean = true) : void
      {
         var _loc3_:Process = null;
         var _loc4_:ProcessGroup = null;
         this.stop();
         var _loc2_:uint = this._processes.length;
         if(param1)
         {
            while(_loc2_--)
            {
               _loc3_ = this._processes[_loc2_];
               if(_loc3_ is ProcessGroup)
               {
                  _loc4_ = _loc3_ as ProcessGroup;
                  _loc4_.destroyProcesses(true);
               }
               else
               {
                  _loc3_.destroy();
               }
            }
         }
         else
         {
            while(_loc2_--)
            {
               this._processes[_loc2_].destroy();
            }
         }
         this._processes = new Array();
      }
      
      override public function destroy() : void
      {
         var _loc1_:uint = this._processes.length;
         while(_loc1_--)
         {
            this._removeProcessListeners(this._processes[_loc1_]);
         }
         this._processes = new Array();
         super.destroy();
      }
      
      protected function _checkThreads() : void
      {
         var _loc3_:Process = null;
         var _loc1_:uint = this.threads;
         var _loc2_:int = -1;
         while(++_loc2_ < this._processes.length)
         {
            if(_loc1_ == 0)
            {
               return;
            }
            _loc3_ = this._processes[_loc2_];
            if(_loc3_.running)
            {
               _loc1_--;
            }
            else if(!_loc3_.completed && this.running)
            {
               _loc3_.start();
               _loc1_--;
            }
         }
         if(_loc1_ == this.threads && this.running)
         {
            this._complete();
         }
      }
      
      protected function _onProcessStopped(param1:ProcessEvent) : void
      {
         this._checkThreads();
      }
      
      protected function _onProcessCompleted(param1:ProcessEvent) : void
      {
         this._checkThreads();
      }
      
      protected function _addProcessListeners(param1:Process) : void
      {
         param1.addEventListener(ProcessEvent.STOP,this._onProcessStopped,false,0,true);
         param1.addEventListener(ProcessEvent.COMPLETE,this._onProcessCompleted,false,0,true);
      }
      
      protected function _removeProcessListeners(param1:Process) : void
      {
         param1.removeEventListener(ProcessEvent.STOP,this._onProcessStopped);
         param1.removeEventListener(ProcessEvent.COMPLETE,this._onProcessCompleted);
      }
   }
}
