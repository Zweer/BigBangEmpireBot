package com.playata.framework.network.lib.flash
{
   import com.playata.framework.core.data.IByteArray;
   import com.playata.framework.core.error.CancelException;
   import com.playata.framework.core.error.IOException;
   import com.playata.framework.core.error.SecurityException;
   import com.playata.framework.core.lib.flash.FlashByteArray;
   import com.playata.framework.core.signal.ISignal;
   import com.playata.framework.core.signal.Signal;
   import com.playata.framework.network.DataProgress;
   import com.playata.framework.network.IUriData;
   import com.playata.framework.network.UriDataType;
   import com.playata.framework.network.request.RequestData;
   import flash.events.Event;
   import flash.events.IOErrorEvent;
   import flash.events.ProgressEvent;
   import flash.events.SecurityErrorEvent;
   import flash.net.URLLoader;
   import flash.net.URLRequest;
   
   public class FlashUriData implements IUriData
   {
       
      
      protected var _uri:String = null;
      
      protected var _dataType:UriDataType = null;
      
      protected var _requestMethod:String = null;
      
      protected var _requestData:RequestData = null;
      
      protected var _urlLoader:URLLoader = null;
      
      protected var _onProgress:ISignal = null;
      
      protected var _onComplete:ISignal = null;
      
      protected var _onError:ISignal = null;
      
      protected var _data = null;
      
      public function FlashUriData(param1:String, param2:UriDataType)
      {
         super();
         _uri = param1;
         _dataType = param2;
      }
      
      public function dispose() : void
      {
         disposeUrlLoader();
         if(!§§pop())
         {
            _onProgress.removeAll();
         }
         if(!§§pop())
         {
            _onComplete.removeAll();
         }
         if(!§§pop())
         {
            _onError.removeAll();
         }
      }
      
      public function get onProgress() : ISignal
      {
         if(_onProgress === null)
         {
            _onProgress = new Signal();
         }
         return _onProgress;
      }
      
      public function get onComplete() : ISignal
      {
         if(_onComplete === null)
         {
            _onComplete = new Signal();
         }
         return _onComplete;
      }
      
      public function get onError() : ISignal
      {
         if(_onError === null)
         {
            _onError = new Signal();
         }
         return _onError;
      }
      
      public function get isLoaded() : Boolean
      {
         return _data !== null;
      }
      
      public function get dataAsBytes() : IByteArray
      {
         if(_data === null)
         {
            return null;
         }
         return new FlashByteArray(_data);
      }
      
      public function get dataAsString() : String
      {
         if(_data === null)
         {
            return null;
         }
         return _data as String;
      }
      
      public function set requestMethod(param1:String) : void
      {
         _requestMethod = param1;
      }
      
      public function get requestMethod() : String
      {
         return _requestMethod;
      }
      
      public function set requestData(param1:RequestData) : void
      {
         _requestData = param1;
      }
      
      public function get requestData() : RequestData
      {
         return _requestData;
      }
      
      public function load(param1:Function = null, param2:Function = null, param3:Function = null) : void
      {
         if(param1 !== null)
         {
            this.onError.add(param1);
         }
         if(param2 !== null)
         {
            this.onComplete.add(param2);
         }
         if(param3 !== null)
         {
            this.onProgress.add(param3);
         }
         var _loc4_:URLRequest = new URLRequest(_uri);
         if(_requestMethod != null)
         {
            _loc4_.method = _requestMethod;
         }
         if(_requestData != null)
         {
            _loc4_.data = _requestData.asURLVariables;
         }
         _urlLoader = new URLLoader();
         _urlLoader.dataFormat = _dataType == UriDataType.BINARY?"binary":"text";
         _urlLoader.addEventListener("ioError",handleIoError);
         _urlLoader.addEventListener("securityError",handleSecurityError);
         _urlLoader.addEventListener("progress",handleProgress);
         _urlLoader.addEventListener("complete",handleComplete);
         _urlLoader.load(_loc4_);
      }
      
      public function cancel() : void
      {
         _onComplete = null;
         _data = null;
         disposeUrlLoader();
         if(!§§pop())
         {
            _onError.dispatch(new CancelException("UriLoader cancelled"));
         }
      }
      
      private function handleIoError(param1:IOErrorEvent) : void
      {
         if(!§§pop())
         {
            _onError.dispatch(new IOException(param1.text,param1.errorID));
         }
      }
      
      private function handleSecurityError(param1:SecurityErrorEvent) : void
      {
         if(!§§pop())
         {
            _onError.dispatch(new SecurityException(param1.text,param1.errorID));
         }
      }
      
      private function handleProgress(param1:ProgressEvent) : void
      {
         if(!§§pop())
         {
            _onProgress.dispatch(new DataProgress(param1.bytesLoaded,param1.bytesTotal));
         }
      }
      
      private function handleComplete(param1:Event) : void
      {
         _data = _urlLoader.data;
         disposeUrlLoader();
         if(!§§pop())
         {
            _onComplete.dispatch();
         }
      }
      
      private function disposeUrlLoader() : void
      {
         if(_urlLoader != null)
         {
            _urlLoader.removeEventListener("ioError",handleIoError);
            _urlLoader.removeEventListener("securityError",handleSecurityError);
            _urlLoader.removeEventListener("progress",handleProgress);
            _urlLoader.removeEventListener("complete",handleComplete);
            _urlLoader.data = null;
            try
            {
               _urlLoader.close();
            }
            catch(e:Error)
            {
            }
            _urlLoader = null;
         }
      }
   }
}
