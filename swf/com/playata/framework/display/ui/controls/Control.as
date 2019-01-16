package com.playata.framework.display.ui.controls
{
   import com.playata.framework.display.IDisplayObject;
   import com.playata.framework.display.InteractiveDisplayObject;
   import com.playata.framework.display.InteractiveDisplayObjectState;
   
   public class Control extends InteractiveDisplayObject implements IControl
   {
       
      
      protected var _enabled:Boolean;
      
      protected var _tabEnabled:Boolean;
      
      protected var _tabIndex:int;
      
      protected var _tooltip:Tooltip = null;
      
      public function Control(param1:IDisplayObject)
      {
         super(param1);
         _enabled = true;
         _tabEnabled = false;
         _tabIndex = 0;
      }
      
      public function get enabled() : Boolean
      {
         return _enabled;
      }
      
      public function set enabled(param1:Boolean) : void
      {
         if(_enabled != param1)
         {
            _enabled = param1;
            state = !!param1?InteractiveDisplayObjectState.UP:InteractiveDisplayObjectState.DISABLED;
         }
      }
      
      override public function set state(param1:InteractiveDisplayObjectState) : void
      {
         .super.state = param1;
         onStateChanged(param1);
      }
      
      override public function dispose() : void
      {
         if(_tooltip)
         {
            _tooltip.dispose();
            _tooltip = null;
         }
         super.dispose();
      }
      
      public function get tabEnabled() : Boolean
      {
         return _tabEnabled;
      }
      
      public function set tabEnabled(param1:Boolean) : void
      {
         _tabEnabled = param1;
      }
      
      public function get tabIndex() : int
      {
         return _tabIndex;
      }
      
      public function set tabIndex(param1:int) : void
      {
         _tabIndex = param1;
      }
      
      public function assignTooltip(param1:Tooltip, param2:Boolean = true) : void
      {
         if(_tooltip != null)
         {
            if(param2)
            {
               _tooltip.dispose();
            }
            _tooltip = null;
         }
         _tooltip = param1;
      }
      
      protected function onStateChanged(param1:InteractiveDisplayObjectState) : void
      {
      }
   }
}
