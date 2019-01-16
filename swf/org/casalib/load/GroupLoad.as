package org.casalib.load
{
   import flash.events.IOErrorEvent;
   import flash.net.URLRequest;
   import flash.utils.Dictionary;
   import org.casalib.errors.ArguementTypeError;
   import org.casalib.events.LoadEvent;
   import org.casalib.events.ProcessEvent;
   import org.casalib.math.Percent;
   import org.casalib.process.Process;
   import org.casalib.process.ProcessGroup;
   import org.casalib.util.ArrayUtil;
   
   public class GroupLoad extends ProcessGroup
   {
      
      protected static var _instanceMap:Dictionary;
       
      
      protected var _Bps:int;
      
      protected var _id:String;
      
      protected var _percentMap:Dictionary;
      
      protected var _preventCache:Boolean;
      
      protected var _preventCacheSet:Boolean;
      
      protected var _progress:Percent;
      
      public function GroupLoad(param1:String = null)
      {
         super();
         if(param1 != null && GroupLoad.getGroupLoadById(param1) != null)
         {
            throw new Error("The identifier provided is not unique.");
         }
         this._id = param1;
         this._percentMap = new Dictionary();
         this._progress = new Percent();
         GroupLoad._instanceMap = GroupLoad._instanceMap || new Dictionary();
         GroupLoad._instanceMap[param1 || this] = this;
      }
      
      public static function getGroupLoadById(param1:String) : GroupLoad
      {
         if(GroupLoad._instanceMap == null)
         {
            return null;
         }
         return GroupLoad._instanceMap[param1];
      }
      
      public static function getGroupLoadByAsset(param1:*) : GroupLoad
      {
         var _loc2_:GroupLoad = null;
         if(GroupLoad._instanceMap != null)
         {
            for each(_loc2_ in GroupLoad._instanceMap)
            {
               if(_loc2_.hasAsset(param1,false))
               {
                  return _loc2_;
               }
            }
         }
         return null;
      }
      
      public function addLoad(param1:*, param2:Percent = null) : void
      {
         if(!(param1 is LoadItem) && !(param1 is GroupLoad))
         {
            throw new ArguementTypeError("load");
         }
         if(param1 == this)
         {
            throw new Error("You cannot add the same GroupLoad to itself.");
         }
         super.addProcess(param1);
         if(this._preventCacheSet)
         {
            param1.preventCache = this.preventCache;
         }
         this._percentMap[param1] = param2 == null || param2.decimalPercentage == 0?new Percent(0.01):param2.clone();
         if(this.autoStart && !this.completed && this.running)
         {
            this._checkTotalPercentValidity();
         }
      }
      
      public function removeLoad(param1:*) : void
      {
         if(!(param1 is LoadItem) && !(param1 is GroupLoad))
         {
            throw new ArguementTypeError("load");
         }
         this._percentMap[param1] = null;
         delete this._percentMap[param1];
         super.removeProcess(param1);
         if(this.running)
         {
            this._checkTotalPercentValidity();
         }
      }
      
      public function hasLoad(param1:*, param2:Boolean = true) : Boolean
      {
         if(!(param1 is LoadItem) && !(param1 is GroupLoad))
         {
            throw new ArguementTypeError("load");
         }
         return this.hasProcess(param1,param2);
      }
      
      public function getLoad(param1:*) : LoadItem
      {
         var _loc5_:* = undefined;
         var _loc2_:String = this._getFileUrl(param1);
         var _loc3_:Array = this.loads;
         var _loc4_:uint = _loc3_.length;
         while(_loc4_--)
         {
            _loc5_ = _loc3_[_loc4_];
            if(_loc5_ is GroupLoad)
            {
               _loc5_ = _loc5_.getLoad(param1);
               if(_loc5_ != null)
               {
                  return _loc5_;
               }
            }
            else if(_loc5_.url == _loc2_)
            {
               return _loc5_;
            }
         }
         return null;
      }
      
      public function hasAsset(param1:*, param2:Boolean = true) : Boolean
      {
         var _loc6_:* = undefined;
         var _loc3_:String = this._getFileUrl(param1);
         if(!param2)
         {
            return ArrayUtil.getItemByKey(this.loads,"url",_loc3_) != null;
         }
         var _loc4_:Array = this.loads;
         var _loc5_:uint = _loc4_.length;
         while(_loc5_--)
         {
            _loc6_ = _loc4_[_loc5_];
            if(_loc6_ is GroupLoad)
            {
               if(_loc6_.hasAsset(param1,true))
               {
                  return true;
               }
            }
            else if(_loc6_.url == _loc3_)
            {
               return true;
            }
         }
         return false;
      }
      
      public function get id() : String
      {
         return this._id;
      }
      
      public function get loads() : Array
      {
         return this.processes;
      }
      
      public function get queuedLoads() : Array
      {
         return this.queuedProcesses;
      }
      
      public function get loadingLoads() : Array
      {
         return this.runningProcesses;
      }
      
      public function get incompletedLoads() : Array
      {
         return this.incompletedProcesses;
      }
      
      public function get erroredLoads() : Array
      {
         return ArrayUtil.getItemsByKey(this.processes,"errored",true);
      }
      
      public function get loadingAndCompletedLoads() : Array
      {
         return this.loadingLoads.concat(this.completedLoads);
      }
      
      public function get completedLoads() : Array
      {
         return this.completedProcesses;
      }
      
      public function get preventCache() : Boolean
      {
         return this._preventCache;
      }
      
      public function set preventCache(param1:Boolean) : void
      {
         this._preventCacheSet = true;
         this._preventCache = param1;
         var _loc2_:Array = this.loads;
         var _loc3_:uint = _loc2_.length;
         while(_loc3_--)
         {
            _loc2_[_loc3_].preventCache = this.preventCache;
         }
      }
      
      public function get progress() : Percent
      {
         return this._progress.clone();
      }
      
      public function get loading() : Boolean
      {
         return this.running;
      }
      
      public function get loaded() : Boolean
      {
         return this.completed;
      }
      
      public function get errored() : Boolean
      {
         return this.erroredLoads.length > 0;
      }
      
      public function get Bps() : int
      {
         return this._Bps;
      }
      
      public function get bytesLoaded() : Number
      {
         return ArrayUtil.sum(ArrayUtil.getValuesByKey(this.loadingAndCompletedLoads,"bytesLoaded"));
      }
      
      public function get bytesTotal() : Number
      {
         var _loc1_:uint = this.loads.length;
         var _loc2_:Array = this.loadingAndCompletedLoads;
         if(_loc1_ == _loc2_.length && _loc1_ != 0)
         {
            return ArrayUtil.sum(ArrayUtil.getValuesByKey(_loc2_,"bytesTotal"));
         }
         return Number.POSITIVE_INFINITY;
      }
      
      override public function start() : void
      {
         this._checkTotalPercentValidity();
         super.start();
      }
      
      override public function addProcess(param1:Process) : void
      {
         this.addLoad(param1);
      }
      
      override public function removeProcess(param1:Process) : void
      {
         if(param1 is LoadItem || param1 is GroupLoad)
         {
            this.removeLoad(param1);
         }
      }
      
      override public function destroyProcesses(param1:Boolean = true) : void
      {
         this._percentMap = new Dictionary();
         super.destroyProcesses(param1);
      }
      
      public function destroyLoads(param1:Boolean = true) : void
      {
         this.destroyProcesses(param1);
      }
      
      override public function destroy() : void
      {
         this._percentMap = null;
         this._progress = null;
         this._Bps = -1;
         GroupLoad._instanceMap[this.id || this] = null;
         delete GroupLoad._instanceMap[this.id || this];
         super.destroy();
      }
      
      protected function _checkTotalPercentValidity() : void
      {
         var _loc2_:* = null;
         var _loc1_:* = 0;
         for(_loc2_ in this._percentMap)
         {
            _loc1_ = Number(_loc1_ + this._percentMap[_loc2_].decimalPercentage);
         }
         if(_loc1_ != 1)
         {
            for(_loc2_ in this._percentMap)
            {
               this._percentMap[_loc2_].decimalPercentage = this._percentMap[_loc2_].decimalPercentage / _loc1_;
            }
         }
      }
      
      override protected function _addProcessListeners(param1:Process) : void
      {
         param1.addEventListener(LoadEvent.PROGRESS,this._onProgress,false,0,true);
         param1.addEventListener(ProcessEvent.STOP,this._onProcessStopped,false,0,true);
         param1.addEventListener(IOErrorEvent.IO_ERROR,this._onLoadError,false,0,true);
         param1.addEventListener(LoadEvent.COMPLETE,this._onLoadCompleted,false,0,true);
      }
      
      override protected function _removeProcessListeners(param1:Process) : void
      {
         param1.removeEventListener(LoadEvent.PROGRESS,this._onProgress);
         param1.removeEventListener(ProcessEvent.STOP,this._onProcessStopped);
         param1.removeEventListener(IOErrorEvent.IO_ERROR,this._onLoadError);
         param1.removeEventListener(LoadEvent.COMPLETE,this._onLoadCompleted);
      }
      
      protected function _onProgress(param1:LoadEvent) : void
      {
         var _loc6_:* = undefined;
         var _loc2_:Array = new Array();
         var _loc3_:* = 0;
         var _loc4_:Array = this.processes;
         var _loc5_:uint = _loc4_.length;
         while(_loc5_--)
         {
            _loc6_ = _loc4_[_loc5_];
            if(_loc6_.loading)
            {
               _loc2_.push(_loc6_.Bps);
               _loc3_ = Number(_loc3_ + this._percentMap[_loc6_].decimalPercentage * _loc6_.progress.decimalPercentage);
            }
            else if(_loc6_.loaded)
            {
               _loc2_.push(_loc6_.Bps);
               _loc3_ = Number(_loc3_ + this._percentMap[_loc6_].decimalPercentage);
            }
         }
         var _loc7_:int = int(ArrayUtil.average(_loc2_));
         if(this._Bps != _loc7_ || this._progress.decimalPercentage != _loc3_)
         {
            this._Bps = _loc7_;
            this._progress.decimalPercentage = _loc3_;
            this.dispatchEvent(this._createDefinedLoadEvent(LoadEvent.PROGRESS));
         }
      }
      
      protected function _onLoadError(param1:IOErrorEvent) : void
      {
         this.dispatchEvent(param1);
         this._checkThreads();
      }
      
      protected function _onLoadCompleted(param1:LoadEvent) : void
      {
         this._checkThreads();
      }
      
      override protected function _complete() : void
      {
         if(this.erroredLoads.length > 0)
         {
            return;
         }
         super._complete();
         if(this._progress.decimalPercentage != 1)
         {
            this._progress.decimalPercentage = 1;
            this.dispatchEvent(this._createDefinedLoadEvent(LoadEvent.PROGRESS));
         }
         this.dispatchEvent(this._createDefinedLoadEvent(LoadEvent.COMPLETE));
      }
      
      protected function _getFileUrl(param1:*) : String
      {
         var _loc2_:String = null;
         if(param1 is String)
         {
            _loc2_ = param1;
         }
         else if(param1 is URLRequest)
         {
            _loc2_ = param1.url;
         }
         else
         {
            throw new ArguementTypeError("request");
         }
         return _loc2_;
      }
      
      protected function _createDefinedLoadEvent(param1:String) : LoadEvent
      {
         var _loc2_:LoadEvent = new LoadEvent(param1);
         _loc2_.bytesLoaded = this.bytesLoaded;
         _loc2_.bytesTotal = this.bytesTotal;
         _loc2_.progress = this.progress;
         _loc2_.Bps = this.Bps;
         return _loc2_;
      }
   }
}
