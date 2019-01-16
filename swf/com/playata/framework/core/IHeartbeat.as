package com.playata.framework.core
{
   import com.playata.framework.core.signal.ISlot;
   
   public interface IHeartbeat
   {
       
      
      function get globalTime() : int;
      
      function add(param1:Function) : ISlot;
      
      function remove(param1:Function) : ISlot;
      
      function addFullSeconds(param1:Function, param2:Boolean = true) : ISlot;
      
      function removeFullSeconds(param1:Function) : ISlot;
      
      function deactivate() : void;
      
      function activate(param1:int) : void;
   }
}
