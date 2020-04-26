package com.playata.framework.core.logging.publisher
{
   import com.playata.framework.core.logging.LogEntry;
   
   public interface IPublisher
   {
       
      
      function publish(param1:LogEntry) : void;
      
      function dispose() : void;
      
      function set enabled(param1:Boolean) : void;
      
      function get enabled() : Boolean;
   }
}
