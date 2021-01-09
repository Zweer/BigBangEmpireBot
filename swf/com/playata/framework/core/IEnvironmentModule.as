package com.playata.framework.core
{
   public interface IEnvironmentModule extends IDisposable
   {
       
      
      function get isActive() : Boolean;
      
      function onActivate(param1:int) : void;
      
      function onDeactivate() : void;
   }
}
