package com.playata.framework.network.request.http
{
   import com.playata.framework.core.logging.Logger;
   import com.playata.framework.network.request.RemoteRequest;
   import com.playata.framework.network.request.TransportLayer;
   
   public class HTTPTransportLayer extends TransportLayer
   {
       
      
      public function HTTPTransportLayer()
      {
         super();
      }
      
      override public function send(param1:RemoteRequest) : void
      {
         if(TransportLayer.verbose)
         {
            Logger.debug("[Request:" + param1.requestName + "] HTTPTransportLayer::send:" + param1.request.asJsonString);
         }
         var _loc2_:HTTPTransportPackage = new HTTPTransportPackage();
         _loc2_.create(param1,onResponse);
         _loc2_.send();
         param1.sendAttempt = 1;
         param1.onSend();
      }
      
      private function onResponse(param1:HTTPTransportPackage) : void
      {
         if(TransportLayer.verbose)
         {
            Logger.debug("[Request:" + param1.remoteRequest.requestName + "] HTTPTransportLayer::onResponse: \'" + param1.state + "\'");
            if(param1.state == "")
            {
               Logger.debug("[Request:" + param1.remoteRequest.requestName + "] " + param1.responseData);
            }
         }
         if((param1.state == "errorIO" || param1.state.indexOf("errorIO ") != -1) && param1.remoteRequest.isRetryAllowed)
         {
            param1.remoteRequest.sendAttempt++;
            param1.send();
            return;
         }
         param1.remoteRequest.onRequestCompleted(param1.state,param1.responseData,param1.errorId);
         endRequest(param1.remoteRequest);
         param1.dispose();
      }
   }
}
