package com.playata.framework.application
{
   import com.playata.framework.core.TypedObject;
   import com.playata.framework.device.IDeviceInfo;
   import flash.display.LoaderInfo;
   import flash.events.UncaughtErrorEvent;
   
   public class ErrorReporting
   {
      
      public static var deviceInfo:IDeviceInfo = null;
       
      
      public function ErrorReporting()
      {
         super();
      }
      
      public static function addUncaughtErrorHandler(param1:LoaderInfo) : void
      {
         param1.uncaughtErrorEvents.addEventListener("uncaughtError",uncaughtErrorHandler);
      }
      
      public static function uncaughtErrorHandler(param1:UncaughtErrorEvent) : void
      {
         var _loc2_:* = undefined;
         try
         {
            if(!Environment.info.isTestMode)
            {
               param1.preventDefault();
            }
            _loc2_ = param1.error;
            Environment.reportError("Uncaught Exception",new TypedObject({"error":param1.error.message}),true,true,_loc2_);
            return;
         }
         catch(e:Error)
         {
            return;
         }
      }
   }
}
