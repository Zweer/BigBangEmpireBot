package com.playata.framework.network
{
   import com.playata.framework.core.signal.ISignal;
   import com.playata.framework.core.signal.Signal;
   
   public class NetworkInfoBasic
   {
       
      
      protected var _debugOnline:Boolean;
      
      protected var _onNetworkStatusChanged:ISignal = null;
      
      public function NetworkInfoBasic()
      {
         super();
         _debugOnline = true;
         _onNetworkStatusChanged = new Signal();
      }
      
      public function get debugOnline() : Boolean
      {
         return _debugOnline;
      }
      
      public function set debugOnline(param1:Boolean) : void
      {
         _debugOnline = param1;
      }
      
      public function get onNetworkStatusChanged() : ISignal
      {
         return _onNetworkStatusChanged;
      }
   }
}
