package com.playata.framework.display.ui.controls
{
   import com.playata.framework.core.TypedObject;
   import com.playata.framework.core.signal.ISignal;
   
   public interface IRichTextField extends ITextField
   {
       
      
      function registerElement(param1:String, param2:Function, param3:TypedObject = null) : void;
      
      function set showElements(param1:Boolean) : void;
      
      function get showElements() : Boolean;
      
      function get onElementUp() : ISignal;
      
      function get onElementDown() : ISignal;
      
      function get onElementMove() : ISignal;
      
      function get onElementOut() : ISignal;
      
      function get onElementOver() : ISignal;
      
      function get onElementClick() : ISignal;
      
      function get onElementDoubleClick() : ISignal;
   }
}
