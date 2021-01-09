package com.playata.framework.input
{
   import com.playata.framework.core.IDisposable;
   import com.playata.framework.core.signal.ISignal;
   
   public interface IMouse extends IDisposable
   {
       
      
      function get onMove() : ISignal;
      
      function get mouseX() : Number;
      
      function get mouseY() : Number;
   }
}
