package com.playata.framework.core.signal
{
   public class Signal implements ISignal
   {
       
      
      private var _osFlashSignal:org.osflash.signals.Signal = null;
      
      public function Signal()
      {
         super();
         _osFlashSignal = new org.osflash.signals.Signal();
      }
      
      public function add(param1:Function) : ISlot
      {
         return new Slot(_osFlashSignal.add(param1));
      }
      
      public function get numListeners() : uint
      {
         return _osFlashSignal.numListeners;
      }
      
      public function addOnce(param1:Function) : ISlot
      {
         return new Slot(_osFlashSignal.addOnce(param1));
      }
      
      public function dispatch(... rest) : void
      {
         _osFlashSignal.dispatch.apply(null,rest);
      }
      
      public function remove(param1:Function) : ISlot
      {
         return new Slot(_osFlashSignal.remove(param1));
      }
      
      public function removeAll() : void
      {
         _osFlashSignal.removeAll();
      }
   }
}
