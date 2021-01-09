package com.playata.framework.network
{
   import com.playata.framework.core.IDisposable;
   import com.playata.framework.core.data.IByteArray;
   import com.playata.framework.core.signal.ISignal;
   import com.playata.framework.network.request.RequestData;
   
   public interface IUriData extends IDisposable
   {
       
      
      function get onProgress() : ISignal;
      
      function get onComplete() : ISignal;
      
      function get onError() : ISignal;
      
      function get isLoaded() : Boolean;
      
      function get dataAsBytes() : IByteArray;
      
      function get dataAsString() : String;
      
      function set requestMethod(param1:String) : void;
      
      function get requestMethod() : String;
      
      function set requestData(param1:RequestData) : void;
      
      function get requestData() : RequestData;
      
      function load(param1:Function = null, param2:Function = null, param3:Function = null) : void;
      
      function cancel() : void;
   }
}
