package com.playata.application.data.stream
{
   import com.playata.application.Application;
   import com.playata.application.data.dataobject.DOServerSystemMessage;
   import com.playata.framework.core.collection.IntMap;
   import com.playata.framework.data.DataObjectArray;
   
   public class ServerSystemMessages
   {
       
      
      private var _currentUnreadCount:int = -1;
      
      private var _hasNewMessages:Boolean = true;
      
      private var _messages:IntMap;
      
      public function ServerSystemMessages()
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
         _currentUnreadCount = 0;
      }
      
      public function updateStream(param1:Object) : void
      {
         if(!param1)
         {
            return;
         }
         var _loc2_:int = unreadCount;
         if(_loc2_ > _currentUnreadCount)
         {
            _hasNewMessages = true;
         }
         _currentUnreadCount = _loc2_;
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
      
      public function updateMessage(param1:DOServerSystemMessage) : void
      {
         var _loc2_:* = null;
         if(!param1)
         {
            return;
         }
         if(_messages.exists(param1.id))
         {
            (_messages.getData(param1.id) as ServerSystemMessage).update(param1);
         }
         else
         {
            _loc2_ = new ServerSystemMessage(param1);
            _messages.setData(param1.id,_loc2_);
         }
      }
      
      public function get unreadCount() : int
      {
         return int(Math.max(0,Application.userController.appUser.character.unreadMassSystemMessages));
      }
   }
}
