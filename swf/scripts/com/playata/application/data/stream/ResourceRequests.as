package com.playata.application.data.stream
{
   public class ResourceRequests
   {
       
      
      private var _currentUnreadCount:int = -1;
      
      private var _hasNewResourceRequests:Boolean = true;
      
      public function ResourceRequests()
      {
         super();
      }
      
      public function get hasNewResourceRequests() : Boolean
      {
         return _hasNewResourceRequests;
      }
      
      public function markAllAsRead() : void
      {
         _hasNewResourceRequests = false;
         _currentUnreadCount = 0;
      }
      
      public function updateStream(param1:Object) : void
      {
         if(!param1)
         {
            return;
         }
         var _loc2_:int = param1.unread as int;
         if(_loc2_ > _currentUnreadCount)
         {
            _hasNewResourceRequests = true;
         }
         _currentUnreadCount = _loc2_;
      }
      
      public function get unreadCount() : int
      {
         return int(Math.max(0,_currentUnreadCount));
      }
   }
}
