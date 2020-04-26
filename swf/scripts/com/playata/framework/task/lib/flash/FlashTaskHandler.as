package com.playata.framework.task.lib.flash
{
   import com.playata.framework.core.IDisposable;
   import com.playata.framework.core.Runtime;
   import com.playata.framework.core.data.IByteArray;
   import com.playata.framework.core.lib.flash.FlashByteArray;
   import com.playata.framework.core.lib.flash.FlashCore;
   import com.playata.framework.core.logging.Logger;
   import com.playata.framework.task.Task;
   import com.playata.framework.task.TaskManager;
   import flash.events.Event;
   import flash.system.MessageChannel;
   import flash.system.Worker;
   import flash.utils.ByteArray;
   
   public class FlashTaskHandler implements IDisposable
   {
      
      protected static var STARTUP_TIMEOUT:int = 10000;
       
      
      protected var _tasks:Vector.<Task>;
      
      protected var _appToWorkerChannel:MessageChannel;
      
      protected var _workerToAppChannel:MessageChannel;
      
      protected var _sharedByteArray:ByteArray;
      
      protected var _byteArrayQueue:Array;
      
      protected var _startUpTime:int;
      
      protected var _taskManager:FlashTaskManager;
      
      public function FlashTaskHandler()
      {
         _tasks = new Vector.<Task>();
         _byteArrayQueue = [];
         super();
         new FlashCore(null);
         init();
      }
      
      public function dispose() : void
      {
      }
      
      public function set taskManager(param1:FlashTaskManager) : void
      {
         _taskManager = param1;
      }
      
      public function set sharedByteArray(param1:ByteArray) : void
      {
         _sharedByteArray = param1;
      }
      
      public function get sharedByteArray() : ByteArray
      {
         return _sharedByteArray;
      }
      
      protected function init() : void
      {
         if(!TaskManager.isMainThread)
         {
            if(TaskManager.verbose)
            {
               Logger.info("[ApplicationTaskHandler] init as async");
            }
            _appToWorkerChannel = Worker.current.getSharedProperty("appToWorker") as MessageChannel;
            _workerToAppChannel = Worker.current.getSharedProperty("workerToApp") as MessageChannel;
            _sharedByteArray = Worker.current.getSharedProperty("sharedByteArray");
            _appToWorkerChannel.addEventListener("channelMessage",onAppToWorkerMessage);
            _startUpTime = Runtime.getTimer();
            sendWorkerReady();
         }
      }
      
      protected function sendWorkerReady() : void
      {
         var _loc1_:* = null;
         if(Runtime.getTimer() - _startUpTime > STARTUP_TIMEOUT)
         {
            if(!TaskManager.isMainThread)
            {
               Worker.current.terminate();
               return;
            }
         }
         if(isReady)
         {
            if(TaskManager.verbose)
            {
               Logger.info("[TaskHandler] Sending \'worker Ready\'");
            }
            _loc1_ = [];
            _loc1_.unshift(-1);
            _loc1_.unshift(1);
            if(TaskManager.isMainThread)
            {
               Runtime.callMethod(null,_taskManager.handleWorkerToAppMessage,_loc1_);
            }
            else
            {
               _workerToAppChannel.send(_loc1_);
            }
         }
         else
         {
            Runtime.delayFunction(sendWorkerReady,0.1);
         }
      }
      
      protected function get isReady() : Boolean
      {
         return true;
      }
      
      protected function createTaskClass(param1:int, param2:String) : Task
      {
         if(TaskManager.verbose)
         {
            Logger.info("[TaskHandler] [Task: " + param1 + "] Creating task: " + param2);
         }
         var _loc4_:Class = Runtime.getClass(param2);
         var _loc3_:Task = new _loc4_(param1,sendProgress,sendResult,sendResultByteArray);
         return _loc3_;
      }
      
      protected function sendProgress(param1:int, ... rest) : void
      {
         if(TaskManager.verbose)
         {
            Logger.info("[TaskHandler] [Task: " + param1 + "] Sending progress");
         }
         rest.unshift(param1);
         rest.unshift(2);
         if(TaskManager.isMainThread)
         {
            Runtime.callMethod(null,_taskManager.handleWorkerToAppMessage,rest);
         }
         else
         {
            _workerToAppChannel.send(rest);
         }
      }
      
      protected function sendResult(param1:int, ... rest) : void
      {
         if(TaskManager.verbose)
         {
            Logger.info("[TaskHandler] [Task: " + param1 + "] Sending result");
         }
         rest.unshift(param1);
         rest.unshift(3);
         if(TaskManager.isMainThread)
         {
            Runtime.callMethod(null,_taskManager.handleWorkerToAppMessage,rest);
         }
         else
         {
            _workerToAppChannel.send(rest);
         }
         removeTask(param1);
      }
      
      protected function sendResultByteArray(param1:int, param2:IByteArray, ... rest) : void
      {
         if(TaskManager.verbose)
         {
            Logger.info("[TaskHandler] [Task: " + param1 + "] Sending result (byte array)");
         }
         rest.unshift(param1);
         rest.unshift(4);
         rest.unshift(param2);
         _byteArrayQueue.push(rest);
         sendNextByteArray();
      }
      
      protected function onAppToWorkerMessage(param1:Event) : void
      {
         if(TaskManager.verbose)
         {
            Logger.info("[TaskHandler] onAppToWorkerMessage",[param1]);
         }
         var _loc2_:Array = _appToWorkerChannel.receive();
         Runtime.callMethod(null,handleAppToWorkerMessage,_loc2_);
      }
      
      function handleAppToWorkerMessage(param1:int, ... rest) : void
      {
         var _loc5_:int = 0;
         var _loc4_:* = null;
         var _loc3_:* = null;
         if(TaskManager.verbose)
         {
            Logger.info("[TaskHandler] handleAppToWorkerMessage",[param1]);
         }
         if(param1 == 1)
         {
            _loc5_ = rest.shift();
            try
            {
               _loc4_ = rest.shift();
               _loc3_ = createTaskClass(_loc5_,_loc4_);
               if(_loc3_)
               {
                  if(TaskManager.verbose)
                  {
                     Logger.info("[TaskHandler] [Task: " + _loc5_ + "] Starting task");
                  }
                  Runtime.callMethod(null,_loc3_.start,rest);
                  _tasks.push(_loc3_);
               }
               else
               {
                  Logger.error("[TaskHandler] [Task: " + _loc5_ + "] Couldn\'t create task!");
               }
            }
            catch(e:Error)
            {
               Logger.error("[TaskHandler] [Task: " + _loc5_ + "] Error in handleAppToWorkerMessage: " + e.getStackTrace());
               reportError(e);
            }
         }
         else if(param1 == 2)
         {
            Logger.debug("[TaskHandler] handleAppToWorkerMessage: (UnlockByteArray)");
            sendNextByteArray();
         }
         else
         {
            Logger.error("[TaskHandler] handleAppToWorkerMessage: (Unknown)");
         }
      }
      
      protected function sendNextByteArray() : void
      {
         var _loc3_:* = null;
         var _loc1_:* = null;
         var _loc2_:int = 0;
         if(_byteArrayQueue.length > 0 && _sharedByteArray.length == 0)
         {
            _loc3_ = _byteArrayQueue.shift();
            _loc1_ = _loc3_.shift();
            _sharedByteArray.position = 0;
            _sharedByteArray.writeBytes(FlashByteArray(_loc1_).flashByteArray);
            _loc1_.clear();
            _loc1_ = null;
            _loc2_ = _loc3_[1];
            if(TaskManager.isMainThread)
            {
               Runtime.callMethod(null,_taskManager.handleWorkerToAppMessage,_loc3_);
            }
            else
            {
               _workerToAppChannel.send(_loc3_);
            }
            removeTask(_loc2_);
         }
      }
      
      protected function removeTask(param1:int) : void
      {
         var _loc2_:int = 0;
         _loc2_ = 0;
         while(_loc2_ < _tasks.length)
         {
            if(_tasks[_loc2_].id == param1)
            {
               _tasks[_loc2_].dispose();
               _tasks.splice(_loc2_,1);
               break;
            }
            _loc2_++;
         }
      }
      
      protected function reportError(param1:Error) : void
      {
      }
   }
}
