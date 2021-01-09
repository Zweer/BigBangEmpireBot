package com.playata.application.data.stream
{
   import com.playata.application.data.AppDateTime;
   import com.playata.application.data.dataobject.DOPrivateConversation;
   import com.playata.application.data.dataobject.DOPrivateConversationMessage;
   import com.playata.application.data.user.User;
   import com.playata.framework.application.Environment;
   import com.playata.framework.application.request.ActionRequestResponse;
   import com.playata.framework.core.TypedObject;
   import com.playata.framework.core.collection.IntMap;
   import com.playata.framework.core.util.StringUtil;
   import com.playata.framework.core.util.TimeUtil;
   import com.playata.framework.data.DataObjectArray;
   import com.playata.framework.display.ui.IListItem;
   
   public class PrivateConversation extends DOPrivateConversation implements IListItem
   {
      
      public static const LOAD_MORE_PREVIOUS_MESSAGE_ID:int = -1;
      
      public static var LOAD_MORE_NEXT_MESSAGE_ID:int = 2147483647;
       
      
      private var _currentUnreadCount:int = -1;
      
      private var _hasNewMessages:Boolean = true;
      
      private var _hasPendingSync:Boolean = false;
      
      private var _members:IntMap = null;
      
      private var _messages:IntMap = null;
      
      private var _onLoaded:Function = null;
      
      private var _onDeleted:Function = null;
      
      private var _onSynced:Function = null;
      
      public function PrivateConversation(param1:DOPrivateConversation)
      {
         super(param1);
         if(!isLoadingItem)
         {
            _messages = new IntMap();
            updateMembers(param1);
            if(param1.hasData("unread"))
            {
               _currentUnreadCount = param1.getInt("unread");
            }
         }
      }
      
      public function updateMembers(param1:DOPrivateConversation) : void
      {
         var _loc3_:* = undefined;
         var _loc2_:* = undefined;
         if(_members === null)
         {
            _members = new IntMap();
         }
         var _loc4_:TypedObject = param1.getTypedObject("members");
         if(_loc4_)
         {
            _loc3_ = new Vector.<int>(0);
            _loc2_ = new Vector.<int>(0);
            var _loc8_:int = 0;
            var _loc7_:* = _loc4_.keys;
            for each(var _loc5_ in _loc4_.keys)
            {
               _loc3_.push(_loc4_.getTypedObject(_loc5_).getInt("id"));
            }
            var _loc10_:int = 0;
            var _loc9_:* = _members;
            for each(var _loc6_ in _members)
            {
               if(_loc3_.indexOf(_loc6_) == -1)
               {
                  _loc2_.push(_loc6_);
               }
            }
            var _loc12_:int = 0;
            var _loc11_:* = _loc4_.keys;
            for each(_loc5_ in _loc4_.keys)
            {
               _loc6_ = int(_loc4_.getTypedObject(_loc5_).getInt("id"));
               if(!_members.exists(_loc6_))
               {
                  _members.setData(_loc6_,new PrivateConversationMember(_loc4_.getData(_loc5_)));
               }
            }
            var _loc14_:int = 0;
            var _loc13_:* = _loc2_;
            for each(_loc6_ in _loc2_)
            {
               _members.remove(_loc6_);
            }
         }
      }
      
      public function get isLoadingItem() : Boolean
      {
         return id == -1;
      }
      
      public function load(param1:Function) : void
      {
         _onLoaded = param1;
         if(!hasNewMessages)
         {
            if(_onLoaded != null)
            {
               _onLoaded();
            }
            return;
         }
         Environment.application.sendActionRequest("getStreamMessages",{
            "stream_type":"p",
            "stream_id":id,
            "start_message_id":0
         },handleRequests);
      }
      
      public function loadMorePrevious(param1:Function) : void
      {
         _onLoaded = param1;
         if(!hasUnloadedPreviousMessages)
         {
            if(_onLoaded != null)
            {
               _onLoaded();
            }
            return;
         }
         Environment.application.sendActionRequest("getStreamMessages",{
            "stream_type":"p",
            "stream_id":id,
            "start_message_id":minMessageId - 1,
            "load_type":"previous"
         },handleRequests);
      }
      
      public function loadMoreNext(param1:Function) : void
      {
         _onLoaded = param1;
         if(!hasUnloadedNextMessages)
         {
            if(_onLoaded != null)
            {
               _onLoaded();
            }
            return;
         }
         Environment.application.sendActionRequest("getStreamMessages",{
            "stream_type":"p",
            "stream_id":id,
            "start_message_id":maxMessageId + 1,
            "load_type":"next"
         },handleRequests);
      }
      
      public function deleteMessage(param1:PrivateConversationMessage, param2:Function = null) : void
      {
         _onDeleted = param2;
         if(!param1.isMyMessage || param1.isDeleted)
         {
            if(_onDeleted != null)
            {
               _onDeleted();
            }
            return;
         }
         Environment.application.sendActionRequest("deleteStreamMessage",{
            "stream_type":"p",
            "stream_id":id,
            "message_id":param1.id
         },handleRequests);
      }
      
      public function sync(param1:Function = null) : void
      {
         _onSynced = param1;
         Environment.application.sendActionRequest("syncPrivateConversation",{"private_conversation_id":id},handleRequests);
      }
      
      public function get hasUnloadedPreviousMessages() : Boolean
      {
         return minMessageId > firstMessageId;
      }
      
      public function get hasUnloadedNextMessages() : Boolean
      {
         return maxMessageId < lastMessageId;
      }
      
      public function get hasNewMessages() : Boolean
      {
         return _hasNewMessages;
      }
      
      public function markAllAsRead() : void
      {
         _hasNewMessages = false;
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
            _hasNewMessages = true;
         }
         _currentUnreadCount = _loc2_;
      }
      
      public function get unreadCount() : int
      {
         return _currentUnreadCount;
      }
      
      public function get hasPendingSync() : Boolean
      {
         return _hasPendingSync;
      }
      
      override public function get title() : String
      {
         if(isGroup)
         {
            return super.title;
         }
         return membersString;
      }
      
      public function get lastActionString() : String
      {
         return AppDateTime.getPassedDateTimeString(TimeUtil.localDateTime,tsLastAction);
      }
      
      public function get members() : IntMap
      {
         return _members;
      }
      
      public function get membersString() : String
      {
         var _loc2_:* = null;
         var _loc1_:Vector.<String> = new Vector.<String>(0);
         var _loc5_:int = 0;
         var _loc4_:* = members.keys;
         for each(var _loc3_ in members.keys)
         {
            _loc2_ = members.getData(_loc3_);
            if(!_loc2_.isMe)
            {
               _loc1_.push(_loc2_.name);
            }
         }
         return StringUtil.cutLength(_loc1_.join(", "),50);
      }
      
      public function get memberCount() : int
      {
         var _loc2_:* = null;
         var _loc1_:int = 0;
         var _loc5_:int = 0;
         var _loc4_:* = members.keys;
         for each(var _loc3_ in members.keys)
         {
            _loc2_ = members.getData(_loc3_);
            if(!_loc2_.isMe)
            {
               _loc1_++;
            }
         }
         return _loc1_;
      }
      
      public function get singleConversationMember() : PrivateConversationMember
      {
         var _loc1_:* = null;
         var _loc4_:int = 0;
         var _loc3_:* = members.keys;
         for each(var _loc2_ in members.keys)
         {
            _loc1_ = members.getData(_loc2_);
            if(!_loc1_.isMe)
            {
               return _loc1_;
            }
         }
         return null;
      }
      
      public function get messages() : IntMap
      {
         if(hasUnloadedPreviousMessages && !_messages.exists(-1))
         {
            _messages.setData(-1,new PrivateConversationMessage(this,new DOPrivateConversationMessage({"id":-1})));
         }
         else if(!hasUnloadedPreviousMessages && _messages.exists(-1))
         {
            _messages.remove(-1);
         }
         if(hasUnloadedNextMessages && !_messages.exists(LOAD_MORE_NEXT_MESSAGE_ID))
         {
            _messages.setData(LOAD_MORE_NEXT_MESSAGE_ID,new PrivateConversationMessage(this,new DOPrivateConversationMessage({"id":LOAD_MORE_NEXT_MESSAGE_ID})));
         }
         else if(!hasUnloadedNextMessages && _messages.exists(LOAD_MORE_NEXT_MESSAGE_ID))
         {
            _messages.remove(LOAD_MORE_NEXT_MESSAGE_ID);
         }
         return _messages;
      }
      
      public function udpateMessages(param1:DataObjectArray) : void
      {
         if(!param1)
         {
            return;
         }
         var _loc4_:int = 0;
         var _loc3_:* = param1;
         for each(var _loc2_ in param1)
         {
            udpateMessage(_loc2_);
         }
      }
      
      public function udpateMessage(param1:DOPrivateConversationMessage) : void
      {
         if(!param1)
         {
            return;
         }
         if(_messages.exists(param1.id))
         {
            (_messages.getData(param1.id) as PrivateConversationMessage).update(param1);
            return;
         }
         var _loc2_:PrivateConversationMessage = new PrivateConversationMessage(this,param1);
         _messages.setData(param1.id,_loc2_);
         if(_loc2_.isSystem)
         {
            _hasPendingSync = true;
         }
         if(_loc2_.id > lastMessageId)
         {
            update(new TypedObject({
               "last_message_id":_loc2_.id,
               "ts_last_action":_loc2_.tsCreation
            }));
         }
      }
      
      public function get itemId() : String
      {
         return id.toString();
      }
      
      public function get minMessageId() : int
      {
         var _loc1_:int = 2147483647;
         var _loc4_:int = 0;
         var _loc3_:* = _messages;
         for each(var _loc2_ in _messages)
         {
            if(!(_loc2_.isLoadMorePreviousMessage || _loc2_.isLoadMoreNextMessage))
            {
               if(_loc2_.id < _loc1_)
               {
                  _loc1_ = _loc2_.id;
               }
            }
         }
         return _loc1_;
      }
      
      public function get maxMessageId() : int
      {
         var _loc1_:int = 0;
         var _loc4_:int = 0;
         var _loc3_:* = _messages;
         for each(var _loc2_ in _messages)
         {
            if(!(_loc2_.isLoadMorePreviousMessage || _loc2_.isLoadMoreNextMessage))
            {
               if(_loc2_.id > _loc1_)
               {
                  _loc1_ = _loc2_.id;
               }
            }
         }
         return _loc1_;
      }
      
      private function handleRequests(param1:ActionRequestResponse) : void
      {
         var _loc2_:* = param1.action;
         switch(_loc2_)
         {
            case "getStreamMessages":
               if(param1.error == "")
               {
                  markAllAsRead();
                  User.current.character.streams.privateConversations.calculateUnreadCount();
                  Environment.application.updateData(param1.data);
                  if(hasPendingSync)
                  {
                     sync(_onLoaded);
                  }
                  else if(_onLoaded != null)
                  {
                     _onLoaded();
                  }
               }
               else if(param1.error == "errGetStreamMessagesNoPermission")
               {
                  if(_onLoaded != null)
                  {
                     _onLoaded();
                  }
               }
               else
               {
                  Environment.reportError(param1.error,param1.request);
               }
               break;
            case "deleteStreamMessage":
               if(param1.error == "")
               {
                  Environment.application.updateData(param1.data);
                  if(_onDeleted != null)
                  {
                     _onDeleted();
                  }
               }
               else if(param1.error != "errMarkAsDeletedAlreadyDeleted")
               {
                  Environment.reportError(param1.error,param1.request);
               }
               break;
            case "syncPrivateConversation":
               if(param1.error == "")
               {
                  _hasPendingSync = false;
                  Environment.application.updateData(param1.data);
                  updateMembers(param1.appResponse.private_conversation);
                  if(_onSynced != null)
                  {
                     _onSynced();
                  }
               }
               else if(param1.error != "errSyncPrivateConversationNoPermission")
               {
                  Environment.reportError(param1.error,param1.request);
               }
               break;
            default:
               throw new Error("Unsupported request action \'" + param1.action + "\'!");
         }
      }
   }
}
