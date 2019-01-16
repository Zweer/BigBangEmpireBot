package com.playata.framework.network
{
   import com.playata.framework.core.signal.ISignal;
   
   public interface INetworkInfo
   {
       
      
      function set debugOnline(param1:Boolean) : void;
      
      function get debugOnline() : Boolean;
      
      function get online() : Boolean;
      
      function get onNetworkStatusChanged() : ISignal;
   }
}
