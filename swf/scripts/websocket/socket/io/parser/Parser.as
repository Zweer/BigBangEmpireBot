package websocket.socket.io.parser
{
   public class Parser
   {
      
      public static const TYPES:Vector.<String> = new Vector.<String>(["CONNECT","DISCONNECT","EVENT","BINARY_EVENT","ACK","BINARY_ACK","ERROR"]);
      
      public static const CONNECT:int = 0;
      
      public static const DISCONNECT:int = 1;
      
      public static const EVENT:int = 2;
      
      public static const ACK:int = 3;
      
      public static const ERROR:int = 4;
      
      public static const BINARY_EVENT:int = 5;
      
      public static const BINARY_ACK:int = 6;
       
      
      public function Parser()
      {
         super();
      }
   }
}
