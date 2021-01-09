package com.playata.framework.services.pushnotifications.lib.web
{
   import com.playata.framework.core.Runtime;
   import com.playata.framework.core.logging.Logger;
   import com.playata.framework.core.util.JsonUtil;
   import com.playata.framework.services.pushnotifications.IPushNotificationHandler;
   import com.playata.framework.services.pushnotifications.IPushNotificationManager;
   import com.playata.framework.services.pushnotifications.PushNotificationType;
   
   public class WebPushNotificationManager implements IPushNotificationManager
   {
       
      
      private var _isInitialized:Boolean = false;
      
      private var _enabled:Boolean = false;
      
      private var _deviceNotificationId:String = null;
      
      private var _handler:IPushNotificationHandler = null;
      
      private var _callbackRegisterOnComplete:Function = null;
      
      private var _callbackUnregisterOnComplete:Function = null;
      
      public function WebPushNotificationManager()
      {
         super();
      }
      
      public function set pushNotificationHandler(param1:IPushNotificationHandler) : void
      {
         _handler = param1;
      }
      
      public function register(param1:Function) : void
      {
         _callbackRegisterOnComplete = param1;
         if(!init())
         {
            if(_callbackRegisterOnComplete)
            {
               _callbackRegisterOnComplete(false,null);
            }
            return;
         }
         Runtime.callJavaScript("registerWebPushNotifications");
      }
      
      public function unregister(param1:Function) : void
      {
         _callbackUnregisterOnComplete = param1;
         if(!init())
         {
            if(_callbackUnregisterOnComplete)
            {
               _callbackUnregisterOnComplete();
            }
            return;
         }
         Runtime.callJavaScript("unregisterWebPushNotifications");
      }
      
      public function init() : Boolean
      {
         if(_isInitialized)
         {
            return true;
         }
         Runtime.addJavaScriptCallback("callbackRegisterWebPushNotifications",callbackRegisterWebPushNotifications);
         Runtime.addJavaScriptCallback("callbackUnregisterWebPushNotifications",callbackUnregisterWebPushNotifications);
         Runtime.addJavaScriptCallback("callbackWebPushNotificationReceived",callbackWebPushNotificationReceived);
         _isInitialized = true;
         return true;
      }
      
      public function dispose() : void
      {
         Runtime.addJavaScriptCallback("callbackRegisterWebPushNotifications",null);
         Runtime.addJavaScriptCallback("callbackUnregisterWebPushNotifications",null);
         Runtime.addJavaScriptCallback("callbackWebPushNotificationReceived",null);
         _isInitialized = false;
         _enabled = false;
      }
      
      public function get isEnabled() : Boolean
      {
         if(!_isInitialized)
         {
            return false;
         }
         return _enabled;
      }
      
      public function get deviceNotificationId() : String
      {
         if(!isEnabled)
         {
            return null;
         }
         return _deviceNotificationId;
      }
      
      public function get deviceType() : int
      {
         return 4;
      }
      
      private function callbackRegisterWebPushNotifications(param1:Boolean, param2:String) : void
      {
         _deviceNotificationId = param2;
         Logger.warn("[WebPush] callbackRegisterWebPushNotifications: ",[param1,_deviceNotificationId]);
         _enabled = param1;
         if(_callbackRegisterOnComplete)
         {
            _callbackRegisterOnComplete(param1,_deviceNotificationId);
         }
      }
      
      private function callbackUnregisterWebPushNotifications(param1:Boolean) : void
      {
         _deviceNotificationId = null;
         Logger.warn("[WebPush] callbackUnregisterWebPushNotifications",[param1]);
         _enabled = false;
         if(_callbackUnregisterOnComplete)
         {
            _callbackUnregisterOnComplete();
         }
      }
      
      private function callbackWebPushNotificationReceived(param1:Object) : void
      {
         Logger.warn("[WebPush] callbackWebPushNotificationReceived",[param1]);
         if(_handler)
         {
            _handler.handle(JsonUtil.encode(param1),PushNotificationType.NORMAL);
         }
      }
   }
}
