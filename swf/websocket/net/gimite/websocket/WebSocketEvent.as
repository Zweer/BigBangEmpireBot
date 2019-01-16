package websocket.net.gimite.websocket
{
   import flash.events.Event;
   
   public class WebSocketEvent extends Event
   {
      
      public static const OPEN:String = "open";
      
      public static const CLOSE:String = "close";
      
      public static const MESSAGE:String = "message";
      
      public static const ERROR:String = "error";
       
      
      public var message:String;
      
      public var wasClean:Boolean;
      
      public var code:int;
      
      public var reason:String;
      
      public function WebSocketEvent(param1:String, param2:String = null, param3:Boolean = false, param4:Boolean = false)
      {
         super(param1,param3,param4);
         this.message = param2;
      }
      
      override public function clone() : Event
      {
         var _loc1_:WebSocketEvent = new WebSocketEvent(this.type,this.message,this.bubbles,this.cancelable);
         _loc1_.wasClean = wasClean;
         _loc1_.code = code;
         _loc1_.reason = reason;
         return _loc1_;
      }
      
      override public function toString() : String
      {
         return "WebSocketEvent: " + this.type + ": " + this.message;
      }
   }
}
