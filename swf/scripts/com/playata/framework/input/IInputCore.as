package com.playata.framework.input
{
   import com.playata.framework.core.IEnvironmentModule;
   
   public interface IInputCore extends IEnvironmentModule
   {
       
      
      function get keyboard() : IKeyboard;
      
      function get mouse() : IMouse;
   }
}
