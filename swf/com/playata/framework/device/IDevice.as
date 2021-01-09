package com.playata.framework.device
{
   import com.playata.framework.core.signal.ISignal;
   
   public interface IDevice
   {
       
      
      function get onActivate() : ISignal;
      
      function get onDeActivate() : ISignal;
      
      function get onHardwareBack() : ISignal;
      
      function set allowSuspend(param1:Boolean) : void;
   }
}
