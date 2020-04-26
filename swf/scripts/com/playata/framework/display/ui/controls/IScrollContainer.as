package com.playata.framework.display.ui.controls
{
   import com.playata.framework.display.IDisplayObject;
   
   public interface IScrollContainer extends IControl, IScrollable
   {
       
      
      function addElement(param1:IDisplayObject, param2:int = -1) : IDisplayObject;
      
      function updateElement(param1:IDisplayObject) : IDisplayObject;
      
      function removeElement(param1:IDisplayObject, param2:Boolean = false) : IDisplayObject;
      
      function removeAllElements() : void;
      
      function set checkVisibility(param1:Boolean) : void;
      
      function get checkVisibility() : Boolean;
      
      function get contentEnabled() : Boolean;
      
      function set contentEnabled(param1:Boolean) : void;
   }
}
