package com.playata.application.data.event
{
   import com.playata.application.data.dataobject.DOIngameNotification;
   import com.playata.framework.core.TypedObject;
   import com.playata.framework.core.collection.StringMap;
   import com.playata.framework.core.util.DateTime;
   
   public class IngameNotifications
   {
       
      
      private var _notifications:StringMap;
      
      public function IngameNotifications()
      {
         super();
         _notifications = new StringMap();
      }
      
      public function refresh(param1:TypedObject) : void
      {
         var _loc4_:int = 0;
         var _loc3_:* = param1.keys;
         for each(var _loc2_ in param1.keys)
         {
            refreshIngameNotification(_loc2_,new DOIngameNotification(param1.getData(_loc2_)));
         }
      }
      
      private function refreshIngameNotification(param1:String, param2:DOIngameNotification) : void
      {
         if(!_notifications.exists(param1))
         {
            _notifications.setData(param1,new IngameNotification(param1,param2));
         }
         else
         {
            (_notifications.getData(param1) as IngameNotification).update(param2);
         }
      }
      
      public function getNextIngameNotification() : IngameNotification
      {
         var _loc2_:Vector.<IngameNotification> = new Vector.<IngameNotification>(0);
         var _loc4_:int = 0;
         var _loc3_:* = _notifications;
         for each(var _loc1_ in _notifications)
         {
            _loc2_.push(_loc1_);
         }
         _loc2_.sort(sortNotifications);
         var _loc6_:int = 0;
         var _loc5_:* = _loc2_;
         for each(_loc1_ in _loc2_)
         {
            if(_loc1_.needsDisplay)
            {
               return _loc1_;
            }
         }
         return null;
      }
      
      private function sortNotifications(param1:IngameNotification, param2:IngameNotification) : int
      {
         if(param1.openPaymentDialog && !param2.openPaymentDialog)
         {
            return 1;
         }
         if(!param1.openPaymentDialog && param2.openPaymentDialog)
         {
            return -1;
         }
         var _loc3_:int = DateTime.fromStringServer(param1.availableTimeStart).timestamp;
         var _loc4_:int = DateTime.fromStringServer(param2.availableTimeStart).timestamp;
         return _loc3_ - _loc4_;
      }
   }
}
