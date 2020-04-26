package com.playata.framework.input
{
   import com.playata.framework.core.IDisposable;
   import com.playata.framework.core.signal.ISignal;
   
   public interface IKeyboard extends IDisposable
   {
       
      
      function get onKeyDown() : ISignal;
      
      function get onKeyUp() : ISignal;
      
      function get isAltPressed() : Boolean;
      
      function get isShiftPressed() : Boolean;
      
      function get isCtrlPressed() : Boolean;
   }
}
