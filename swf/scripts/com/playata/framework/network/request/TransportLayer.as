package com.playata.framework.network.request
{
   import com.playata.framework.core.logging.Logger;
   
   public class TransportLayer
   {
      
      public static var verbose:Boolean = true;
      
      protected static var _requestQueue:Vector.<RemoteRequest> = new Vector.<RemoteRequest>();
       
      
      public function TransportLayer()
      {
         super();
      }
      
      public function send(param1:RemoteRequest) : void
      {
      }
      
      public function get isUsable() : Boolean
      {
         return true;
      }
      
      public function addRequest(param1:RemoteRequest) : void
      {
         if(param1.instantRequest)
         {
            Logger.debug("[Request:" + param1.requestName + "] Sending instant request");
            send(param1);
            return;
         }
         _requestQueue.push(param1);
         Logger.debug("[Request:" + param1.requestName + "] Adding request to queue. New queue length: " + _requestQueue.length);
         if(_requestQueue.length == 1)
         {
            send(_requestQueue[0]);
         }
      }
      
      protected function endRequest(param1:RemoteRequest) : RemoteRequest
      {
         if(param1.instantRequest)
         {
            Logger.debug("[Request:" + param1.requestName + "] Instant Request complete");
            return null;
         }
         _requestQueue.shift();
         Logger.debug("[Request:" + param1.requestName + "] Removed request from queue. New queue length: " + _requestQueue.length);
         if(_requestQueue.length > 0)
         {
            send(_requestQueue[0]);
            return _requestQueue[0];
         }
         return null;
      }
   }
}
