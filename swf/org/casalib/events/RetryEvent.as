package org.casalib.events
{
   import flash.events.Event;
   
   public class RetryEvent extends Event
   {
      
      public static const RETRY:String = "retry";
       
      
      protected var _attempts:int;
      
      public function RetryEvent(param1:String, param2:Boolean = false, param3:Boolean = false)
      {
         super(param1,param2,param3);
      }
      
      public function get attempts() : int
      {
         return this._attempts;
      }
      
      public function set attempts(param1:int) : void
      {
         this._attempts = param1;
      }
      
      override public function toString() : String
      {
         return formatToString("RetryEvent","type","bubbles","cancelable","attempts");
      }
      
      override public function clone() : Event
      {
         var _loc1_:RetryEvent = new RetryEvent(this.type,this.bubbles,this.cancelable);
         _loc1_.attempts = this.attempts;
         return _loc1_;
      }
   }
}
