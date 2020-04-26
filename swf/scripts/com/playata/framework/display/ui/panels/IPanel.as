package com.playata.framework.display.ui.panels
{
   import com.playata.framework.core.signal.ISignal;
   import com.playata.framework.display.IDisplayObjectContainer;
   
   public interface IPanel
   {
       
      
      function firstDisplay() : void;
      
      function show(param1:* = null) : void;
      
      function get onShowPrepareProgress() : ISignal;
      
      function get onShown() : ISignal;
      
      function set visible(param1:Boolean) : void;
      
      function hidden() : void;
      
      function refreshAppSize() : void;
      
      function refreshLocale() : void;
      
      function get ui() : IDisplayObjectContainer;
   }
}
