package com.playata.application.notification
{
   import com.playata.framework.application.Environment;
   import com.playata.framework.core.TypedObject;
   
   public class LocalNotificationHandler
   {
       
      
      private var _notificationSettings:TypedObject = null;
      
      public function LocalNotificationHandler()
      {
         super();
      }
      
      public function update(param1:TypedObject) : void
      {
         _notificationSettings = param1;
      }
      
      public function notify(param1:String, param2:int) : void
      {
         if(!_notificationSettings)
         {
            return;
         }
         if(!_notificationSettings.hasData(param1))
         {
            return;
         }
         var _loc3_:TypedObject = _notificationSettings.getTypedObject(param1);
         if(!_loc3_.getBoolean("active"))
         {
            return;
         }
         var _loc5_:int = _loc3_.getInt("id");
         var _loc6_:String = _loc3_.getString("title");
         var _loc7_:String = _loc3_.getString("body");
         var _loc4_:Boolean = _loc3_.getBoolean("vibrate");
         if(Environment.notificationManager != null)
         {
            Environment.notificationManager.notify(_loc5_,_loc6_,_loc7_,param2,_loc4_);
         }
      }
      
      public function cancel(param1:String) : void
      {
         if(!_notificationSettings)
         {
            return;
         }
         if(!_notificationSettings.hasData(param1))
         {
            return;
         }
         var _loc2_:TypedObject = _notificationSettings.getTypedObject(param1);
         if(!_loc2_.getBoolean("active"))
         {
            return;
         }
         var _loc3_:int = _loc2_.getInt("id");
         if(Environment.notificationManager != null)
         {
            Environment.notificationManager.cancel(_loc3_);
         }
      }
   }
}
