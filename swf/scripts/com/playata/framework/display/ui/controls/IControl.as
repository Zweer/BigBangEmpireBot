package com.playata.framework.display.ui.controls
{
   import com.playata.framework.display.IInteractiveDisplayObject;
   
   public interface IControl extends IInteractiveDisplayObject
   {
       
      
      function get tabEnabled() : Boolean;
      
      function set tabEnabled(param1:Boolean) : void;
      
      function get tabIndex() : int;
      
      function set tabIndex(param1:int) : void;
      
      function get enabled() : Boolean;
      
      function set enabled(param1:Boolean) : void;
   }
}
