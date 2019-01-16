package websocket.hurlant.crypto.tls
{
   import flash.events.Event;
   import websocket.hurlant.crypto.cert.X509Certificate;
   
   public class TLSSocketEvent extends Event
   {
      
      public static const PROMPT_ACCEPT_CERT:String = "promptAcceptCert";
       
      
      public var cert:X509Certificate;
      
      public function TLSSocketEvent(param1:X509Certificate = null)
      {
         super("promptAcceptCert",false,false);
         this.cert = param1;
      }
   }
}
