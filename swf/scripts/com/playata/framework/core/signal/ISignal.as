package com.playata.framework.core.signal
{
   public interface ISignal
   {
       
      
      function add(param1:Function) : ISlot;
      
      function get numListeners() : uint;
      
      function addOnce(param1:Function) : ISlot;
      
      function dispatch(... rest) : void;
      
      function remove(param1:Function) : ISlot;
      
      function removeAll() : void;
   }
}
