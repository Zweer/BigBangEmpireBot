package com.playata.framework.services.pushnotifications
{
   import com.playata.framework.core.IDisposable;
   
   public interface IPushNotificationManager extends IDisposable
   {
       
      
      function set pushNotificationHandler(param1:IPushNotificationHandler) : void;
      
      function register(param1:Function) : void;
      
      function unregister(param1:Function) : void;
      
      function get deviceNotificationId() : String;
      
      function get isEnabled() : Boolean;
   }
}
