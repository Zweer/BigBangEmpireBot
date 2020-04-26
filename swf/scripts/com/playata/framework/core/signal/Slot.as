package com.playata.framework.core.signal
{
   public class Slot implements com.playata.framework.core.signal.ISlot
   {
       
      
      private var _osFlashSlot:org.osflash.signals.ISlot = null;
      
      public function Slot(param1:org.osflash.signals.ISlot)
      {
         super();
         _osFlashSlot = param1;
      }
      
      public function get listener() : Function
      {
         return _osFlashSlot.listener;
      }
      
      public function set listener(param1:Function) : void
      {
         _osFlashSlot.listener = param1;
      }
      
      public function get once() : Boolean
      {
         return _osFlashSlot.once;
      }
      
      public function get priority() : int
      {
         return _osFlashSlot.priority;
      }
      
      public function get enabled() : Boolean
      {
         return _osFlashSlot.enabled;
      }
      
      public function set enabled(param1:Boolean) : void
      {
         _osFlashSlot.enabled = param1;
      }
      
      public function remove() : void
      {
         _osFlashSlot.remove();
      }
   }
}
