package com.playata.framework.display.ui.dialogs
{
   import com.playata.framework.core.signal.ISignal;
   import com.playata.framework.core.signal.Signal;
   import com.playata.framework.display.DisplayCore;
   import com.playata.framework.display.IDisplayObject;
   import com.playata.framework.display.InteractiveDisplayObject;
   import com.playata.framework.display.ui.IFocusContainer;
   import com.playata.framework.display.ui.controls.Button;
   import com.playata.framework.display.ui.controls.IControl;
   
   public class Dialog extends InteractiveDisplayObject implements IFocusContainer
   {
       
      
      protected var _queued:Boolean;
      
      protected var _destroyed:Boolean;
      
      protected var _hiding:ISignal = null;
      
      protected var _hidden:ISignal = null;
      
      protected var _closed:ISignal = null;
      
      protected var _isHiding:Boolean;
      
      protected var _tabObjects:Vector.<IControl>;
      
      public function Dialog(param1:IDisplayObject, param2:Boolean = true)
      {
         _tabObjects = new Vector.<IControl>();
         super(param1);
         _queued = param2;
         _hiding = new Signal();
         _hidden = new Signal();
         _closed = new Signal();
      }
      
      public static function set focus(param1:Object) : void
      {
         DisplayCore.current.focus = param1;
      }
      
      override public function dispose() : void
      {
         _destroyed = true;
         _hiding.removeAll();
         _hiding = null;
         _hidden.removeAll();
         _hidden = null;
         _closed.removeAll();
         _closed = null;
         super.dispose();
      }
      
      public function onShow() : void
      {
      }
      
      public function onClose(param1:Function = null) : void
      {
         if(_closed != null)
         {
            _closed.dispatch();
         }
         if(hidden != null)
         {
            hidden.dispatch(this);
         }
         if(param1 !== null)
         {
            param1();
         }
      }
      
      public function close(param1:Function = null) : void
      {
         if(_isHiding || _destroyed)
         {
            return;
         }
         _hiding.dispatch(this);
         onClose(param1);
      }
      
      public function get isQueued() : Boolean
      {
         return _queued;
      }
      
      public function set queued(param1:Boolean) : void
      {
         _queued = param1;
      }
      
      public function get hiding() : ISignal
      {
         return _hiding;
      }
      
      public function get hidden() : ISignal
      {
         return _hidden;
      }
      
      public function get closed() : ISignal
      {
         return _closed;
      }
      
      public function get defaultButton() : Button
      {
         return null;
      }
      
      public function get tabObjects() : Vector.<IControl>
      {
         return _tabObjects;
      }
      
      public function onEscape() : void
      {
      }
   }
}
