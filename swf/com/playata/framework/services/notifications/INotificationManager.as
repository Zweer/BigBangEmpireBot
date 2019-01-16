package com.playata.framework.services.notifications
{
   import com.playata.framework.core.IDisposable;
   
   public interface INotificationManager extends IDisposable
   {
       
      
      function register() : void;
      
      function unregister() : void;
      
      function notify(param1:int, param2:String, param3:String, param4:int = 0, param5:Boolean = false) : void;
      
      function cancel(param1:int) : void;
      
      function cancelAll() : void;
      
      function get isEnabled() : Boolean;
   }
}
