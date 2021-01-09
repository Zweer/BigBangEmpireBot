package com.playata.framework.network.request.http
{
   import com.playata.framework.core.error.Exception;
   import com.playata.framework.core.error.SecurityException;
   import com.playata.framework.network.IUriData;
   import com.playata.framework.network.NetworkCore;
   import com.playata.framework.network.UriDataType;
   import com.playata.framework.network.request.RemoteRequest;
   
   public class HTTPTransportPackage
   {
       
      
      private var _state:String = null;
      
      private var _errorId:int = 0;
      
      private var _remoteRequest:RemoteRequest = null;
      
      private var _onResponse:Function = null;
      
      private var _responseData:String = null;
      
      private var _uriData:IUriData = null;
      
      public function HTTPTransportPackage()
      {
         super();
      }
      
      public function create(param1:RemoteRequest, param2:Function) : void
      {
         _remoteRequest = param1;
         _onResponse = param2;
         _state = "errorRequestPending";
      }
      
      public function send() : void
      {
         _uriData = NetworkCore.current.createUriData(_remoteRequest.uri,UriDataType.STRING);
         _uriData.requestMethod = _remoteRequest.requestMethod;
         _uriData.requestData = _remoteRequest.request;
         _uriData.load(errorHandler,completeHandler);
      }
      
      public function dispose() : void
      {
         _uriData.dispose();
      }
      
      public function get remoteRequest() : RemoteRequest
      {
         return _remoteRequest;
      }
      
      public function get responseData() : String
      {
         return _responseData;
      }
      
      public function get state() : String
      {
         return _state;
      }
      
      public function get errorId() : int
      {
         return _errorId;
      }
      
      private function completeHandler() : void
      {
         _responseData = _uriData.dataAsString;
         _state = "";
      }
      
      private function errorHandler(param1:Exception) : void
      {
         if(param1 is SecurityException)
         {
            _state = "errorSecurity";
         }
         else
         {
            _state = "errorIO";
         }
         _errorId = param1.errorID;
      }
   }
}
