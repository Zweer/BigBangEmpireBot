package com.playata.framework.display.ui
{
   import com.playata.framework.display.ui.controls.Button;
   import com.playata.framework.display.ui.controls.IControl;
   
   public interface IFocusContainer
   {
       
      
      function get tabObjects() : Vector.<IControl>;
      
      function get defaultButton() : Button;
      
      function onEscape() : void;
   }
}
