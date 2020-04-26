package com.playata.framework.application.request
{
   import com.playata.application.request.AppRequestResponseData;
   import com.playata.framework.core.TypedObject;
   import com.playata.framework.network.request.RequestData;
   
   public class ActionRequestResponse
   {
       
      
      public var _appResponse:AppRequestResponseData = null;
      
      public var action:String;
      
      public var request:RequestData;
      
      public var data:Object;
      
      public var error:String;
      
      public function ActionRequestResponse()
      {
         super();
      }
      
      public function get hasError() : Boolean
      {
         return error != "";
      }
      
      public function get typedData() : TypedObject
      {
         return new TypedObject(data);
      }
      
      public function get appResponse() : AppRequestResponseData
      {
         if(!_appResponse)
         {
            _appResponse = new AppRequestResponseData(data);
         }
         return _appResponse;
      }
   }
}
