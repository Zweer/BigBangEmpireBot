package org.casalib.events
{
   import flash.events.Event;
   import org.casalib.math.Percent;
   
   public class LoadEvent extends Event
   {
      
      public static const COMPLETE:String = "complete";
      
      public static const PROGRESS:String = "progress";
      
      public static const START:String = "start";
      
      public static const STOP:String = "stop";
       
      
      protected var _progress:Percent;
      
      protected var _Bps:int;
      
      protected var _bytesLoaded:Number;
      
      protected var _bytesTotal:Number;
      
      protected var _time:uint;
      
      protected var _httpStatus:uint;
      
      protected var _attempts:uint;
      
      protected var _retries:uint;
      
      protected var _latency:uint;
      
      public function LoadEvent(param1:String, param2:Boolean = false, param3:Boolean = false)
      {
         super(param1,param2,param3);
      }
      
      public function get progress() : Percent
      {
         return this._progress.clone();
      }
      
      public function set progress(param1:Percent) : void
      {
         this._progress = param1.clone();
      }
      
      public function get attempts() : uint
      {
         return this._attempts;
      }
      
      public function set attempts(param1:uint) : void
      {
         this._attempts = param1;
      }
      
      public function get retries() : uint
      {
         return this._retries;
      }
      
      public function set retries(param1:uint) : void
      {
         this._retries = param1;
      }
      
      public function get Bps() : int
      {
         return this._Bps;
      }
      
      public function set Bps(param1:int) : void
      {
         this._Bps = param1;
      }
      
      public function get bytesLoaded() : Number
      {
         return this._bytesLoaded;
      }
      
      public function set bytesLoaded(param1:Number) : void
      {
         this._bytesLoaded = param1;
      }
      
      public function get bytesTotal() : Number
      {
         return this._bytesTotal;
      }
      
      public function set bytesTotal(param1:Number) : void
      {
         this._bytesTotal = param1;
      }
      
      public function get time() : uint
      {
         return this._time;
      }
      
      public function set time(param1:uint) : void
      {
         this._time = param1;
      }
      
      public function get latency() : uint
      {
         return this._latency;
      }
      
      public function set latency(param1:uint) : void
      {
         this._latency = param1;
      }
      
      public function get httpStatus() : uint
      {
         return this._httpStatus;
      }
      
      public function set httpStatus(param1:uint) : void
      {
         this._httpStatus = param1;
      }
      
      override public function toString() : String
      {
         return this.formatToString("LoadEvent","type","bubbles","cancelable","attempts","Bps","bytesLoaded","bytesTotal","httpStatus","latency","progress","retries","time");
      }
      
      override public function clone() : Event
      {
         var _loc1_:LoadEvent = new LoadEvent(this.type,this.bubbles,this.cancelable);
         _loc1_.attempts = this.attempts;
         _loc1_.Bps = this.Bps;
         _loc1_.bytesLoaded = this.bytesLoaded;
         _loc1_.bytesTotal = this.bytesTotal;
         _loc1_.httpStatus = this.httpStatus;
         _loc1_.latency = this.latency;
         _loc1_.progress = this.progress;
         _loc1_.retries = this.retries;
         _loc1_.time = this.time;
         return _loc1_;
      }
   }
}
