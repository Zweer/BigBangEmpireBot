package com.playata.framework.display.ui.controls
{
   import com.playata.framework.core.signal.ISignal;
   import com.playata.framework.display.ui.TextInputType;
   
   public interface ITextInput extends ITextField
   {
       
      
      function set displayAsPassword(param1:Boolean) : void;
      
      function get displayAsPassword() : Boolean;
      
      function set readOnly(param1:Boolean) : void;
      
      function get readOnly() : Boolean;
      
      function set maxChars(param1:uint) : void;
      
      function get maxChars() : uint;
      
      function set editable(param1:Boolean) : void;
      
      function get editable() : Boolean;
      
      function selectAll() : void;
      
      function selectRange(param1:int, param2:int) : void;
      
      function get onChange() : ISignal;
      
      function get onKeyDown() : ISignal;
      
      function get onSoftKeyboardActivate() : ISignal;
      
      function get onSoftKeyboardDeactivate() : ISignal;
      
      function get returnKeyLabel() : String;
      
      function set returnKeyLabel(param1:String) : void;
      
      function set inputType(param1:TextInputType) : void;
      
      function get inputType() : TextInputType;
      
      function set restrict(param1:String) : void;
      
      function get restrict() : String;
   }
}
