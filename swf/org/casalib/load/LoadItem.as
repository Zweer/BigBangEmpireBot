package org.casalib.load
{
   import flash.errors.IOError;
   import flash.events.Event;
   import flash.events.HTTPStatusEvent;
   import flash.events.IEventDispatcher;
   import flash.events.IOErrorEvent;
   import flash.events.ProgressEvent;
   import flash.net.URLRequest;
   import flash.utils.getTimer;
   import org.casalib.errors.ArguementTypeError;
   import org.casalib.events.LoadEvent;
   import org.casalib.events.RetryEvent;
   import org.casalib.math.Percent;
   import org.casalib.process.Process;
   import org.casalib.util.LoadUtil;
   import org.casalib.util.StringUtil;
   
   public class LoadItem extends Process
   {
       
      
      protected var _attempts:uint;
      
      protected var _Bps:int;
      
      protected var _dispatcher:IEventDispatcher;
      
      protected var _errrored:Boolean;
      
      protected var _httpStatus:uint;
      
      protected var _latency:uint;
      
      protected var _loaded:Boolean;
      
      protected var _loadItem;
      
      protected var _preventCache:Boolean;
      
      protected var _progress:Percent;
      
      protected var _request:URLRequest;
      
      protected var _retries:uint;
      
      protected var _startTime:uint;
      
      protected var _time:uint;
      
      protected var _url:String;
      
      public function LoadItem(param1:*, param2:*)
      {
         super();
         this._createRequest(param2);
         this._loadItem = param1;
         this._retries = 2;
         this._Bps = -1;
         this._progress = new Percent();
      }
      
      override public function start() : void
      {
         var _loc1_:String = null;
         if(this.loading)
         {
            return;
         }
         super.start();
         this._loaded = false;
         this._errrored = false;
         this._startTime = getTimer();
         this._attempts = 0;
         this._progress = new Percent();
         this._Bps = -1;
         this._time = 0;
         if(this._preventCache)
         {
            _loc1_ = "casaCache=" + int(1000 * Math.random());
            this._request.url = this._request.url.indexOf("?") == -1?this._request.url + "?" + _loc1_:this._request.url + "&" + _loc1_;
         }
         this._load();
         this.dispatchEvent(this._createDefinedLoadEvent(LoadEvent.START));
      }
      
      override public function stop() : void
      {
         if(!this.loading || this.loaded)
         {
            return;
         }
         if(this.bytesTotal == this.bytesLoaded && this.bytesLoaded > 0)
         {
            return;
         }
         super.stop();
         try
         {
            this._loadItem.close();
         }
         catch(error:IOError)
         {
         }
         this.dispatchEvent(this._createDefinedLoadEvent(LoadEvent.STOP));
      }
      
      public function get preventCache() : Boolean
      {
         return this._preventCache;
      }
      
      public function set preventCache(param1:Boolean) : void
      {
         this._preventCache = param1;
      }
      
      public function get bytesTotal() : Number
      {
         return this._loadItem.bytesTotal == 0 && this.bytesLoaded != 0?Number(Number.POSITIVE_INFINITY):Number(this._loadItem.bytesTotal);
      }
      
      public function get bytesLoaded() : uint
      {
         return this._loadItem.bytesLoaded;
      }
      
      public function get progress() : Percent
      {
         return this._progress.clone();
      }
      
      public function get attempts() : uint
      {
         return this._attempts;
      }
      
      public function get retries() : uint
      {
         return this._retries;
      }
      
      public function set retries(param1:uint) : void
      {
         this._retries = param1;
      }
      
      public function get urlRequest() : URLRequest
      {
         return this._request;
      }
      
      public function get url() : String
      {
         return this._url;
      }
      
      public function get loading() : Boolean
      {
         return this.running;
      }
      
      public function get loaded() : Boolean
      {
         return this._loaded;
      }
      
      public function get errored() : Boolean
      {
         return this._errrored;
      }
      
      public function get Bps() : int
      {
         return this._Bps;
      }
      
      public function get time() : uint
      {
         return this._time;
      }
      
      public function get latency() : uint
      {
         return this._latency;
      }
      
      public function get httpStatus() : uint
      {
         return this._httpStatus;
      }
      
      override public function destroy() : void
      {
         this._dispatcher.removeEventListener(Event.COMPLETE,this._onComplete);
         this._dispatcher.removeEventListener(Event.OPEN,this._onOpen);
         this._dispatcher.removeEventListener(IOErrorEvent.IO_ERROR,this._onLoadError);
         this._dispatcher.removeEventListener(ProgressEvent.PROGRESS,this._onProgress);
         super.destroy();
      }
      
      protected function _initListeners(param1:IEventDispatcher) : void
      {
         this._dispatcher = param1;
         this._dispatcher.addEventListener(Event.COMPLETE,this._onComplete,false,0,true);
         this._dispatcher.addEventListener(Event.OPEN,this._onOpen,false,0,true);
         this._dispatcher.addEventListener(IOErrorEvent.IO_ERROR,this._onLoadError,false,0,true);
         this._dispatcher.addEventListener(ProgressEvent.PROGRESS,this._onProgress,false,0,true);
      }
      
      protected function _load() : void
      {
         this._loadItem.load(this._request);
      }
      
      protected function _createRequest(param1:*) : void
      {
         if(param1 is String)
         {
            param1 = StringUtil.trim(param1);
            if(param1 == "")
            {
               throw new Error("Cannot load an empty reference/String");
            }
            param1 = new URLRequest(param1);
         }
         else if(!(param1 is URLRequest))
         {
            throw new ArguementTypeError("request");
         }
         this._request = param1;
         this._url = this._request.url;
      }
      
      protected function _onLoadError(param1:Event) : void
      {
         var _loc2_:RetryEvent = null;
         if(++this._attempts <= this._retries)
         {
            _loc2_ = new RetryEvent(RetryEvent.RETRY);
            _loc2_.attempts = this._attempts;
            this.dispatchEvent(_loc2_);
            this._load();
         }
         else
         {
            this._errrored = true;
            super._complete();
            this.dispatchEvent(param1);
         }
      }
      
      protected function _onOpen(param1:Event) : void
      {
         this._latency = getTimer() - this._startTime;
         this.dispatchEvent(param1);
      }
      
      protected function _onHttpStatus(param1:HTTPStatusEvent) : void
      {
         this._httpStatus = param1.status;
         this.dispatchEvent(param1);
      }
      
      protected function _onProgress(param1:ProgressEvent) : void
      {
         this._calculateLoadProgress();
      }
      
      protected function _calculateLoadProgress() : void
      {
         var _loc1_:int = getTimer();
         this._Bps = LoadUtil.calculateBps(this.bytesLoaded,this._startTime,_loc1_);
         this._time = _loc1_ - this._startTime;
         this._progress.decimalPercentage = Math.min(this.bytesLoaded / this.bytesTotal,1);
         this.dispatchEvent(this._createDefinedLoadEvent(LoadEvent.PROGRESS));
      }
      
      protected function _onComplete(param1:Event = null) : void
      {
         this._complete();
         this.dispatchEvent(this._createDefinedLoadEvent(LoadEvent.COMPLETE));
      }
      
      protected function _createDefinedLoadEvent(param1:String) : LoadEvent
      {
         var _loc2_:LoadEvent = new LoadEvent(param1);
         _loc2_.attempts = this.attempts;
         _loc2_.Bps = this.Bps;
         _loc2_.bytesLoaded = this.bytesLoaded;
         _loc2_.bytesTotal = this.bytesTotal;
         _loc2_.latency = this.latency;
         _loc2_.progress = this.progress;
         _loc2_.retries = this.retries;
         _loc2_.time = this.time;
         return _loc2_;
      }
      
      override protected function _complete() : void
      {
         var _loc1_:int = getTimer();
         this._Bps = LoadUtil.calculateBps(this.bytesTotal,this._startTime,_loc1_);
         this._time = _loc1_ - this._startTime;
         this._loaded = true;
         this._progress.decimalPercentage = 1;
         super._complete();
      }
   }
}
