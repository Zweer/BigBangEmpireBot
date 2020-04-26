package websocket.net.gimite.websocket
{
   public interface IWebSocketWrapper
   {
       
      
      function getOrigin() : String;
      
      function getCallerHost() : String;
      
      function log(param1:String) : void;
      
      function error(param1:String) : void;
   }
}
