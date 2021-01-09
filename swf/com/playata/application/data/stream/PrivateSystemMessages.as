package com.playata.application.data.stream
{
   import com.playata.application.data.dataobject.DOPrivateSystemMessage;
   import com.playata.framework.core.collection.IntMap;
   import com.playata.framework.data.DataObjectArray;
   
   public class PrivateSystemMessages
   {
       
      
      private var _currentUnreadCount:int = -1;
      
      private var _hasNewMessages:Boolean = true;
      
      private var _messages:IntMap;
      
      public function PrivateSystemMessages()
      {
         _messages = new IntMap();
         super();
      }
      
      public function get messages() : IntMap
      {
         return _messages;
      }
      
      public function get hasNewMessages() : Boolean
      {
         return _hasNewMessages;
      }
      
      public function set hasNewMessages(param1:Boolean) : void
      {
         _hasNewMessages = param1;
      }
      
      public function decreaseUnreadCount() : void
      {
         if(_currentUnreadCount > 0)
         {
            _currentUnreadCount = Number(_currentUnreadCount) - 1;
         }
      }
      
      public function update(param1:DataObjectArray) : void
      {
         if(!param1)
         {
            return;
         }
         var _loc4_:int = 0;
         var _loc3_:* = param1;
         for each(var _loc2_ in param1)
         {
            updateMessage(_loc2_);
         }
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
            _hasNewMessages = true;
         }
         _currentUnreadCount = _loc2_;
      }
      
      public function updateMessage(param1:DOPrivateSystemMessage) : void
      {
         var _loc2_:* = null;
         if(!param1)
         {
            return;
         }
         if(_messages.exists(param1.id))
         {
            (_messages.getData(param1.id) as PrivateSystemMessage).update(param1);
         }
         else
         {
            _loc2_ = new PrivateSystemMessage(param1);
            _messages.setData(param1.id,_loc2_);
         }
      }
      
      public function deleteMessage(param1:PrivateSystemMessage) : void
      {
         if(_messages.exists(param1.id))
         {
            _messages.remove(param1.id);
         }
      }
      
      public function get unreadCount() : int
      {
         return int(Math.max(0,_currentUnreadCount));
      }
      
      public function get minMessageId() : int
      {
         var _loc1_:int = 2147483647;
         var _loc4_:int = 0;
         var _loc3_:* = _messages;
         for each(var _loc2_ in _messages)
         {
            if(_loc2_.id < _loc1_)
            {
               _loc1_ = _loc2_.id;
            }
         }
         return _loc1_;
      }
   }
}
