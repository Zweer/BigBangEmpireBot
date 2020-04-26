package com.playata.framework.core.signal
{
   public interface ISlot
   {
       
      
      function get listener() : Function;
      
      function set listener(param1:Function) : void;
      
      function get once() : Boolean;
      
      function get priority() : int;
      
      function get enabled() : Boolean;
      
      function set enabled(param1:Boolean) : void;
      
      function remove() : void;
   }
}
