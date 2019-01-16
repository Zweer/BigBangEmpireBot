package com.playata.framework.application.request
{
   import com.playata.framework.application.Environment;
   
   public class ActionRequestResponseHandler
   {
       
      
      private var _errorHandler:IActionRequestResponseErrorHandler = null;
      
      private var _onSuccess:Function = null;
      
      private var _onFailed:Function = null;
      
      public function ActionRequestResponseHandler(param1:IActionRequestResponseErrorHandler, param2:Function, param3:Function)
      {
         super();
         _errorHandler = param1;
         _onSuccess = param2;
         _onFailed = param3;
      }
      
      public function handle(param1:ActionRequestResponse) : void
      {
         Environment.application.updateData(param1.data);
         if(param1.hasError)
         {
            if(_onFailed != null)
            {
               _onFailed(param1.error);
            }
            _onSuccess = null;
            _onFailed = null;
         }
         if(!param1.hasError)
         {
            if(_onSuccess != null)
            {
               _onSuccess();
            }
            _onSuccess = null;
            _onFailed = null;
         }
         else if(_errorHandler != null && !_errorHandler.handleResponseError(param1))
         {
            Environment.reportError(param1.error,param1.request);
         }
      }
   }
}
