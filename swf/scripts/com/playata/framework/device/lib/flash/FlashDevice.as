package com.playata.framework.device.lib.flash
{
   import com.playata.framework.application.Environment;
   import com.playata.framework.core.Runtime;
   import com.playata.framework.core.logging.Logger;
   import com.playata.framework.core.signal.ISignal;
   import com.playata.framework.core.signal.Signal;
   import com.playata.framework.device.IDevice;
   import flash.events.Event;
   import flash.events.EventDispatcher;
   import flash.events.KeyboardEvent;
   import flash.utils.getDefinitionByName;
   
   public class FlashDevice implements IDevice
   {
      
      private static const ALLOW_SUSPEND_DELAY:Number = 5;
      
      private static const ON_ACTIVATE:ISignal = new Signal();
      
      private static const ON_DEACTIVATE:ISignal = new Signal();
      
      private static const ON_HARDWARE_BACK:ISignal = new Signal();
       
      
      private var _suspendStart:int;
      
      private var eventDispatcher:EventDispatcher;
      
      private var _isAir:Boolean;
      
      public function FlashDevice()
      {
         var _loc1_:* = null;
         super();
         try
         {
            _loc1_ = getDefinitionByName("flash.desktop::NativeApplication");
            eventDispatcher = _loc1_["nativeApplication"] as EventDispatcher;
            _isAir = true;
            addHardwareKeyHandler();
            if(Environment.info.isTouchScreen)
            {
               addDeactivateListener();
            }
            return;
         }
         catch(e:Error)
         {
            return;
         }
      }
      
      public function get onActivate() : ISignal
      {
         return ON_ACTIVATE;
      }
      
      public function get onDeActivate() : ISignal
      {
         return ON_DEACTIVATE;
      }
      
      public function get onHardwareBack() : ISignal
      {
         return ON_HARDWARE_BACK;
      }
      
      public function set allowSuspend(param1:Boolean) : void
      {
         if(!_isAir)
         {
            return;
         }
         try
         {
            Runtime.killDelayedFunction(setSuspend);
            if(!param1)
            {
               setSuspend(param1);
            }
            else
            {
               Runtime.delayFunction(setSuspend,5,[param1]);
            }
            return;
         }
         catch(e:Error)
         {
            return;
         }
      }
      
      private function addHardwareKeyHandler() : void
      {
         eventDispatcher.addEventListener("keyDown",keyDownHandler);
         eventDispatcher.addEventListener("keyUp",keyUpHandler);
      }
      
      private function keyUpHandler(param1:KeyboardEvent) : void
      {
         if(!(int(param1.keyCode) - 16777238))
         {
            param1.preventDefault();
         }
      }
      
      private function keyDownHandler(param1:KeyboardEvent) : void
      {
         if(!(int(param1.keyCode) - 16777238))
         {
            param1.preventDefault();
            ON_HARDWARE_BACK.dispatch();
         }
      }
      
      private function addDeactivateListener() : void
      {
         eventDispatcher.removeEventListener("activate",onActivateHandler);
         eventDispatcher.addEventListener("deactivate",onDeactivateHandler,false,0,true);
      }
      
      private function addActivateListener() : void
      {
         eventDispatcher.removeEventListener("deactivate",onDeactivateHandler);
         eventDispatcher.addEventListener("activate",onActivateHandler,false,0,true);
      }
      
      private function onActivateHandler(param1:Event) : void
      {
         var _loc2_:int = Runtime.getTimer();
         var _loc3_:int = _loc2_ - _suspendStart;
         Logger.info("[DeviceUtil] App activated suspend duration: " + _loc3_);
         addDeactivateListener();
         ON_ACTIVATE.dispatch(_loc3_);
      }
      
      private function onDeactivateHandler(param1:Event) : void
      {
         _suspendStart = Runtime.getTimer();
         Logger.info("[DeviceUtil] App deactivated");
         addActivateListener();
         ON_DEACTIVATE.dispatch();
      }
      
      private function setSuspend(param1:Boolean) : void
      {
         Logger.info("[DeviceUtil] Allow suspend",[param1]);
         eventDispatcher["systemIdleMode"] = !!param1?"normal":"keepAwake";
      }
   }
}
