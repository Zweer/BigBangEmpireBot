package org.casalib.events
{
   import flash.events.Event;
   
   public class ProcessEvent extends Event
   {
      
      public static const COMPLETE:String = "processComplete";
      
      public static const START:String = "processStart";
      
      public static const STOP:String = "processStop";
       
      
      public function ProcessEvent(param1:String, param2:Boolean = false, param3:Boolean = false)
      {
         super(param1,param2,param3);
      }
      
      override public function toString() : String
      {
         return formatToString("ProcessEvent","type","bubbles","cancelable");
      }
      
      override public function clone() : Event
      {
         var _loc1_:ProcessEvent = new ProcessEvent(this.type,this.bubbles,this.cancelable);
         return _loc1_;
      }
   }
}
