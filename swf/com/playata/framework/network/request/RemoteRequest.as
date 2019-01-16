package com.playata.framework.network.request
{
   public class RemoteRequest
   {
      
      public static const SUCCESS:String = "";
      
      public static const ERROR_REQUEST_PENDING:String = "errorRequestPending";
      
      public static const ERROR_IO:String = "errorIO";
      
      public static const ERROR_SECURITY:String = "errorSecurity";
      
      public static const ERROR_INVALID_RESPONSE_FORMAT:String = "errorInvalidResponseFormat";
       
      
      protected var _uri:String = null;
      
      protected var _request:RequestData = null;
      
      protected var _requestMethod:String = "POST";
      
      protected var _maxRetryAttempts:int = 0;
      
      protected var _sendAttempt:int = 0;
      
      protected var _instantRequest:Boolean = false;
      
      public function RemoteRequest()
      {
         super();
      }
      
      protected function createRequest(param1:String, param2:RequestData, param3:String = null, param4:int = 0) : void
      {
         _uri = param1;
         _request = param2;
         addRequestParams();
         if(param3)
         {
            _requestMethod = param3;
         }
         _maxRetryAttempts = param4;
         _sendAttempt = 0;
      }
      
      protected function sendRequest(param1:ServerConnection) : void
      {
         param1.send(this);
      }
      
      public function get uri() : String
      {
         return _uri;
      }
      
      public function get request() : RequestData
      {
         return _request;
      }
      
      public function get requestName() : String
      {
         return "unknown";
      }
      
      public function get requestMethod() : String
      {
         return _requestMethod;
      }
      
      public function get maxRetryAttempts() : int
      {
         return _maxRetryAttempts;
      }
      
      public function get sendAttempt() : int
      {
         return _sendAttempt;
      }
      
      public function set sendAttempt(param1:int) : void
      {
         _sendAttempt = param1;
      }
      
      public function get isRetryAllowed() : Boolean
      {
         if(maxRetryAttempts <= 0)
         {
            return false;
         }
         return _sendAttempt < maxRetryAttempts;
      }
      
      public function onSend() : void
      {
      }
      
      public function onRequestCompleted(param1:String, param2:String, param3:int) : void
      {
      }
      
      public function get instantRequest() : Boolean
      {
         return _instantRequest;
      }
      
      protected function addRequestParams() : void
      {
      }
   }
}
