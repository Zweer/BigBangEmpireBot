package com.playata.framework.advertisement
{
   import com.playata.framework.core.signal.ISignal;
   
   public interface IVideoAd
   {
       
      
      function get id() : int;
      
      function prepare(param1:int, param2:int) : void;
      
      function error(param1:String) : void;
      
      function init(param1:Function, param2:Function) : void;
      
      function completed(param1:Boolean, param2:String = null) : void;
      
      function get onError() : ISignal;
      
      function get onRewarded() : ISignal;
   }
}
