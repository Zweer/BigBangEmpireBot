package com.playata.application.data.stream
{
   public class UserVouchers
   {
       
      
      private var _currentUnreadCount:int = -1;
      
      private var _hasNewUserVouchers:Boolean = true;
      
      public function UserVouchers()
      {
         super();
      }
      
      public function get hasNewUserVouchers() : Boolean
      {
         return _hasNewUserVouchers;
      }
      
      public function markAllAsRead() : void
      {
         _hasNewUserVouchers = false;
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
            _hasNewUserVouchers = true;
         }
         _currentUnreadCount = _loc2_;
      }
      
      public function get unreadCount() : int
      {
         return int(Math.max(0,_currentUnreadCount));
      }
   }
}
