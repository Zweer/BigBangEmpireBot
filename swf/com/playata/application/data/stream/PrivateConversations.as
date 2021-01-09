package com.playata.application.data.stream
{
   import com.playata.application.data.dataobject.DOPrivateConversation;
   import com.playata.application.data.dataobject.DOPrivateConversationMessage;
   import com.playata.framework.core.TypedObject;
   import com.playata.framework.core.collection.IntMap;
   import com.playata.framework.data.DataObjectArray;
   
   public class PrivateConversations
   {
       
      
      private var _currentUnreadCount:int = -1;
      
      private var _hasNewPrivateConversations:Boolean = true;
      
      private var _hasUpdates:Boolean = true;
      
      private var _privateConversationStreams:TypedObject = null;
      
      private var _privateConversations:IntMap;
      
      public function PrivateConversations()
      {
         _privateConversations = new IntMap();
         super();
      }
      
      public static function sortByLastAction(param1:PrivateConversation, param2:PrivateConversation) : int
      {
         if(param1.isLoadingItem)
         {
            return 1;
         }
         if(param2.isLoadingItem)
         {
            return -1;
         }
         if(param1.tsLastAction < param2.tsLastAction)
         {
            return 1;
         }
         if(param1.tsLastAction > param2.tsLastAction)
         {
            return -1;
         }
         return 0;
      }
      
      public static function sortByScore(param1:PrivateConversation, param2:PrivateConversation) : int
      {
         if(param1.isLoadingItem)
         {
            return 1;
         }
         if(param2.isLoadingItem)
         {
            return -1;
         }
         if(!param1.unreadCount && param2.unreadCount)
         {
            return 1;
         }
         if(param1.unreadCount && !param2.unreadCount)
         {
            return -1;
         }
         if(param1.tsLastAction < param2.tsLastAction)
         {
            return 1;
         }
         if(param1.tsLastAction > param2.tsLastAction)
         {
            return -1;
         }
         if(param1.id < param2.id)
         {
            return 1;
         }
         if(param1.id > param2.id)
         {
            return -1;
         }
         return 0;
      }
      
      public function get privateConversations() : IntMap
      {
         return _privateConversations;
      }
      
      public function get hasUpdates() : Boolean
      {
         return _hasUpdates;
      }
      
      public function set hasUpdates(param1:Boolean) : void
      {
         _hasUpdates = param1;
      }
      
      public function get hasNewPrivateConversations() : Boolean
      {
         return _hasNewPrivateConversations;
      }
      
      public function set hasNewPrivateConversations(param1:Boolean) : void
      {
         _hasNewPrivateConversations = param1;
      }
      
      public function get oldestStreamId() : int
      {
         var _loc2_:Vector.<PrivateConversation> = new Vector.<PrivateConversation>(0);
         var _loc4_:int = 0;
         var _loc3_:* = _privateConversations;
         for each(var _loc1_ in _privateConversations)
         {
            if(!_loc1_.isLoadingItem)
            {
               _loc2_.push(_loc1_);
               _loc2_.sort(sortByScore);
            }
         }
         if(_loc2_.length == 0)
         {
            return 0;
         }
         return _loc2_[_loc2_.length - 1].id;
      }
      
      public function updateStreams(param1:Object) : void
      {
         var _loc2_:int = 0;
         if(!param1)
         {
            return;
         }
         _privateConversationStreams = new TypedObject(param1);
         var _loc5_:int = 0;
         var _loc4_:* = _privateConversationStreams.keys;
         for each(var _loc3_ in _privateConversationStreams.keys)
         {
            _loc2_ = _privateConversationStreams.getTypedObject(_loc3_).getInt("id");
            if(!_privateConversations.exists(_loc2_))
            {
               _hasNewPrivateConversations = true;
            }
            else
            {
               _privateConversations.getData(_loc2_).updateStream(_privateConversationStreams.getData(_loc3_));
            }
         }
         _hasUpdates = true;
         calculateUnreadCount();
      }
      
      public function calculateUnreadCount() : void
      {
         var _loc2_:int = 0;
         if(_privateConversationStreams != null)
         {
            var _loc4_:int = 0;
            var _loc3_:* = _privateConversationStreams.rawData;
            for each(var _loc1_ in _privateConversationStreams.rawData)
            {
               if(!_privateConversations.exists(_loc1_.id))
               {
                  _loc2_ = _loc2_ + (_loc1_.unread as int);
               }
               else
               {
                  _loc2_ = _loc2_ + (_privateConversations.getData(_loc1_.id) as PrivateConversation).unreadCount;
               }
            }
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
            updatePrivateConversation(_loc2_);
         }
      }
      
      public function updatePrivateConversation(param1:DOPrivateConversation) : void
      {
         var _loc2_:* = null;
         if(!param1)
         {
            return;
         }
         if(_privateConversations.exists(param1.id))
         {
            (_privateConversations.getData(param1.id) as PrivateConversation).update(param1);
         }
         else
         {
            _loc2_ = new PrivateConversation(param1);
            _privateConversations.setData(_loc2_.id,_loc2_);
         }
         _hasUpdates = true;
         calculateUnreadCount();
      }
      
      public function updatePrivateConversationMessages(param1:DataObjectArray, param2:int) : void
      {
         if(!param1 || !param2)
         {
            return;
         }
         var _loc3_:PrivateConversation = getPrivateConversation(param2);
         if(!_loc3_)
         {
            return;
         }
         _loc3_.udpateMessages(param1);
      }
      
      public function updatePrivateConversationMessage(param1:DOPrivateConversationMessage, param2:int) : void
      {
         if(!param1 || !param2)
         {
            return;
         }
         var _loc3_:PrivateConversation = getPrivateConversation(param2);
         if(!_loc3_)
         {
            return;
         }
         _loc3_.udpateMessage(param1);
      }
      
      public function getPrivateConversation(param1:int) : PrivateConversation
      {
         if(_privateConversations.exists(param1))
         {
            return _privateConversations.getData(param1);
         }
         return null;
      }
      
      public function addPrivateConversationMessage(param1:DOPrivateConversationMessage) : void
      {
         if(!param1)
         {
            return;
         }
         var _loc2_:PrivateConversation = getPrivateConversation(param1.privateConversationId);
         if(!_loc2_)
         {
            return;
         }
         _hasUpdates = true;
         _loc2_.udpateMessage(param1);
         calculateUnreadCount();
      }
      
      public function removePrivateConversation(param1:int) : void
      {
         if(!_privateConversations.exists(param1))
         {
            return;
         }
         _hasUpdates = true;
         _privateConversations.remove(param1);
      }
      
      public function get unreadCount() : int
      {
         return int(Math.max(0,_currentUnreadCount));
      }
   }
}
