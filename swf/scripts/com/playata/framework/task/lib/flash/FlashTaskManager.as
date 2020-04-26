package com.playata.framework.task.lib.flash
{
   import com.playata.framework.core.Runtime;
   import com.playata.framework.core.data.IByteArray;
   import com.playata.framework.core.error.Exception;
   import com.playata.framework.core.error.NotImplementedException;
   import com.playata.framework.core.lib.flash.FlashByteArray;
   import com.playata.framework.core.logging.Logger;
   import com.playata.framework.task.ITaskManager;
   import com.playata.framework.task.TaskManager;
   import flash.events.Event;
   import flash.system.MessageChannel;
   import flash.system.Worker;
   import flash.system.WorkerDomain;
   import flash.utils.ByteArray;
   
   public class FlashTaskManager implements ITaskManager
   {
       
      
      protected var _enabled:Boolean = true;
      
      protected var _sharedByteArray:ByteArray;
      
      protected var _taskCallback:Array;
      
      protected var _taskHandlerClass:Class;
      
      protected var _syncTaskHandler:FlashTaskHandler;
      
      protected var _bytes:ByteArray;
      
      protected var _asyncTaskHandler:Worker;
      
      protected var _workerToAppChannel:MessageChannel;
      
      protected var _appToWorkerChannel:MessageChannel;
      
      protected var _workerReady:Boolean = false;
      
      public function FlashTaskManager(param1:ByteArray, param2:Class)
      {
         _taskCallback = [];
         super();
         if(!isMainThread)
         {
            throw new Exception("Can only be instantiated in main thread");
         }
         _bytes = param1;
         _taskHandlerClass = param2;
         _enabled = false;
         _sharedByteArray = new ByteArray();
         _sharedByteArray.shareable = _enabled;
      }
      
      public static function get isMainThread() : Boolean
      {
         return Worker.current.isPrimordial;
      }
      
      public function dispose() : void
      {
         terminate();
      }
      
      public function startTask(param1:Class, param2:Function, param3:Function, param4:Boolean, ... rest) : int
      {
         var _loc7_:Object = {
            "onProgressFunc":param2,
            "onResultFunc":param3,
            "started":false,
            "params":rest
         };
         _taskCallback.push(_loc7_);
         var _loc6_:int = _taskCallback.length - 1;
         rest.unshift(Runtime.getClassName(param1));
         rest.unshift(_loc6_);
         rest.unshift(param4);
         if(param4 && _enabled && Worker.isSupported)
         {
            if(!_asyncTaskHandler)
            {
               createAsyncTaskHandler();
            }
            if(_asyncTaskHandler.state == "running" && _workerReady)
            {
               Runtime.callMethod(null,sendStartTask,rest);
               _loc7_.started = true;
            }
         }
         else
         {
            if(!_syncTaskHandler)
            {
               createSyncTaskHandler();
            }
            Runtime.callMethod(null,sendStartTask,rest);
            _loc7_.started = true;
         }
         return _loc6_;
      }
      
      public function terminate() : Boolean
      {
         if(_syncTaskHandler)
         {
            _syncTaskHandler.dispose();
            _syncTaskHandler = null;
         }
         if(!_asyncTaskHandler)
         {
            return true;
         }
         return _asyncTaskHandler.terminate();
      }
      
      protected function onWorkerState(param1:Event) : void
      {
         var _loc2_:int = 0;
         var _loc4_:int = 0;
         var _loc3_:* = null;
         if(TaskManager.verbose)
         {
            Logger.info("[TaskManager] onWorkerState: " + (!!_asyncTaskHandler?_asyncTaskHandler.state:"unknown"));
         }
         if(_asyncTaskHandler.state == "terminated")
         {
            _asyncTaskHandler.removeEventListener("workerState",onWorkerState);
            _workerToAppChannel.removeEventListener("channelMessage",onWorkerToAppMessage);
            _enabled = false;
            if(!_syncTaskHandler)
            {
               createSyncTaskHandler();
            }
            _loc2_ = _taskCallback.length;
            _loc4_ = 0;
            while(_loc4_ < _loc2_)
            {
               _loc3_ = _taskCallback[_loc4_];
               if(_loc3_ != null)
               {
                  Runtime.callMethod(null,sendStartTask,_loc3_.params);
                  _loc3_.started = true;
               }
               _loc4_++;
            }
         }
         else if(_asyncTaskHandler.state == "running")
         {
            startWorkerTasks();
         }
         else
         {
            Logger.error("[TaskManager] Unknown worker state: " + _asyncTaskHandler.state);
         }
      }
      
      protected function startWorkerTasks() : void
      {
         var _loc1_:int = 0;
         var _loc3_:int = 0;
         var _loc2_:* = null;
         if(_asyncTaskHandler.state == "running" && _workerReady)
         {
            _loc1_ = _taskCallback.length;
            _loc3_ = 0;
            while(_loc3_ < _loc1_)
            {
               _loc2_ = _taskCallback[_loc3_];
               if(_loc2_ != null && _loc2_.started === false)
               {
                  Runtime.callMethod(null,sendStartTask,_loc2_.params);
                  _loc2_.started = true;
               }
               _loc3_++;
            }
         }
      }
      
      protected function onWorkerToAppMessage(param1:Event) : void
      {
         if(TaskManager.verbose)
         {
            Logger.info("[TaskManager] onWorkerToAppMessage");
         }
         var _loc2_:Array = _workerToAppChannel.receive();
         Runtime.callMethod(null,handleWorkerToAppMessage,_loc2_);
      }
      
      function handleWorkerToAppMessage(param1:int, param2:int, ... rest) : void
      {
         var _loc5_:* = null;
         if(TaskManager.verbose)
         {
            Logger.info("[TaskManager] [Task: " + param2 + "] handleWorkerToAppMessage: " + param1);
         }
         if(param2 == -1 && param1 == 1)
         {
            _workerReady = true;
            startWorkerTasks();
            return;
         }
         var _loc4_:Object = _taskCallback[param2];
         if(_loc4_ != null)
         {
            if(param1 == 2)
            {
               rest.unshift(param2);
               Runtime.callMethod(null,_loc4_.onProgressFunc,rest);
            }
            else if(param1 == 3)
            {
               rest.unshift(param2);
               Runtime.callMethod(null,_loc4_.onResultFunc,rest);
               cleanUpWorkerCallback(param2);
            }
            else if(param1 == 4)
            {
               _loc5_ = new FlashByteArray();
               _loc5_.writeBytes(new FlashByteArray(_sharedByteArray));
               _loc5_.position = 0;
               rest.unshift(_loc5_);
               rest.unshift(param2);
               Runtime.callMethod(null,_loc4_.onResultFunc,rest);
               cleanUpWorkerCallback(param2);
               sendUnlockByteArray();
            }
            else
            {
               Logger.error("[TaskManager] Unknown message type: " + param1);
            }
         }
         else
         {
            Logger.error("[TaskManager] [Task: " + param2 + "] not found");
            if(param1 == 4)
            {
               sendUnlockByteArray();
            }
         }
      }
      
      protected function cleanUpWorkerCallback(param1:int) : void
      {
         var _loc3_:int = 0;
         var _loc2_:* = null;
         if(TaskManager.verbose)
         {
            Logger.info("[TaskManager] [Task: " + param1 + "] Cleaning up");
         }
         _taskCallback[param1] = null;
         _loc3_ = 0;
         while(_loc3_ < _taskCallback.length)
         {
            if(!§§pop())
            {
               if(_syncTaskHandler != null)
               {
                  _loc2_ = _taskCallback[_loc3_];
                  if(_loc2_ != null)
                  {
                     Runtime.callMethod(null,sendStartTask,_loc2_.params);
                     _loc2_.started = true;
                  }
               }
               return;
            }
            _loc3_++;
         }
         _taskCallback = [];
      }
      
      protected function sendStartTask(param1:Boolean, param2:int, param3:String, ... rest) : void
      {
         if(TaskManager.verbose)
         {
            Logger.info("[TaskManager] [Task: " + param2 + "] Starting " + param3 + (!!param1?"(async)":"(sync)"));
         }
         rest.unshift(param3);
         rest.unshift(param2);
         rest.unshift(1);
         rest.unshift(param1);
         Runtime.callMethod(null,send,rest);
      }
      
      protected function sendUnlockByteArray() : void
      {
         if(TaskManager.verbose)
         {
            Logger.info("[TaskManager] sendUnlockByteArray");
         }
         _sharedByteArray.clear();
         if(_asyncTaskHandler)
         {
            send(true,2);
         }
         if(_syncTaskHandler)
         {
            send(false,2);
         }
      }
      
      protected function send(param1:Boolean, ... rest) : void
      {
         if(TaskManager.verbose)
         {
            Logger.info("[TaskManager] Sending");
         }
         if(param1 && _enabled && Worker.isSupported)
         {
            try
            {
               _appToWorkerChannel.send(rest);
            }
            catch(e:Error)
            {
               Logger.error("[TaskManager] Error sending message: " + e.toString());
            }
         }
         else
         {
            Runtime.callMethod(null,_syncTaskHandler.handleAppToWorkerMessage,rest);
         }
      }
      
      protected function createAsyncTaskHandler() : void
      {
         if(TaskManager.verbose)
         {
            Logger.info("[TaskManager] Creating async worker");
         }
         _bytes.position = 0;
         _asyncTaskHandler = WorkerDomain.current.createWorker(_bytes,true);
         _workerToAppChannel = _asyncTaskHandler.createMessageChannel(Worker.current);
         _appToWorkerChannel = Worker.current.createMessageChannel(_asyncTaskHandler);
         _asyncTaskHandler.setSharedProperty("appToWorker",_appToWorkerChannel);
         _asyncTaskHandler.setSharedProperty("workerToApp",_workerToAppChannel);
         _asyncTaskHandler.setSharedProperty("sharedByteArray",_sharedByteArray);
         setAppSharedProperties(_asyncTaskHandler);
         _asyncTaskHandler.addEventListener("workerState",onWorkerState);
         _workerToAppChannel.addEventListener("channelMessage",onWorkerToAppMessage);
         _asyncTaskHandler.start();
      }
      
      protected function createSyncTaskHandler() : void
      {
         if(TaskManager.verbose)
         {
            Logger.info("[TaskManager] Creating sync worker");
         }
         _syncTaskHandler = new _taskHandlerClass();
         _syncTaskHandler.taskManager = this;
         _syncTaskHandler.sharedByteArray = _sharedByteArray;
      }
      
      protected function setAppSharedProperties(param1:Worker) : void
      {
         throw new NotImplementedException();
      }
   }
}
