package com.playata.framework.network
{
   import com.playata.framework.core.IDisposable;
   import com.playata.framework.core.signal.ISignal;
   
   public interface IDownload extends IDisposable
   {
       
      
      function get url() : String;
      
      function get isActive() : Boolean;
      
      function get totalBytesLoaded() : int;
      
      function start() : void;
      
      function pause() : void;
      
      function resume() : void;
      
      function get onComplete() : ISignal;
      
      function get onProgress() : ISignal;
      
      function get onError() : ISignal;
   }
}
