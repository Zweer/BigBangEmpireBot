package com.playata.framework.display.ui.controls
{
   public interface ITextInputArea extends ITextInput, IScrollable
   {
       
      
      function set wordWrap(param1:Boolean) : void;
      
      function get wordWrap() : Boolean;
   }
}
