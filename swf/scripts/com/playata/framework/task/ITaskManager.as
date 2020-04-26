package com.playata.framework.task
{
   import com.playata.framework.core.IDisposable;
   
   public interface ITaskManager extends IDisposable
   {
       
      
      function startTask(param1:Class, param2:Function, param3:Function, param4:Boolean, ... rest) : int;
      
      function terminate() : Boolean;
   }
}
