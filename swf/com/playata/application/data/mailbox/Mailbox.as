package com.playata.application.data.mailbox
{
   import com.playata.application.data.dataobject.DOMessage;
   import com.playata.framework.core.TypedObject;
   import com.playata.framework.core.collection.IntMap;
   import com.playata.framework.data.DataObjectArray;
   import com.playata.framework.localization.LocText;
   
   public class Mailbox
   {
      
      private static var _reload:Boolean = true;
      
      private static var _messagesCharacterInfo:IntMap = new IntMap();
      
      private static var _messagesRead:IntMap = new IntMap();
      
      private static var _messagesDeleted:IntMap = new IntMap();
      
      private static var _receivedMessages:Vector.<Message> = new Vector.<Message>();
      
      private static var _sentMessages:Vector.<Message> = new Vector.<Message>();
      
      private static var _fullMessages:Vector.<Message> = new Vector.<Message>();
      
      private static var _ignoredCharacters:Vector.<MessageCharacter> = new Vector.<MessageCharacter>();
      
      private static var _messagesReceivedCount:int = 0;
      
      private static var _messagesSentCount:int = 0;
       
      
      public function Mailbox()
      {
         super();
         throw new Error("This class only provides static functions and must not be initialized directly.");
      }
      
      public static function reset() : void
      {
         _reload = true;
         _messagesCharacterInfo = new IntMap();
         _messagesRead = new IntMap();
         _messagesDeleted = new IntMap();
         _receivedMessages = new Vector.<Message>();
         _sentMessages = new Vector.<Message>();
         _fullMessages = new Vector.<Message>();
         _ignoredCharacters = new Vector.<MessageCharacter>();
         _messagesReceivedCount = 0;
         _messagesSentCount = 0;
      }
      
      public static function get reload() : Boolean
      {
         return _reload;
      }
      
      public static function set reload(param1:Boolean) : void
      {
         _reload = param1;
      }
      
      public static function updateMessageData(param1:DataObjectArray, param2:TypedObject, param3:Object, param4:Object, param5:TypedObject, param6:Boolean = true, param7:Boolean = true, param8:int = 0, param9:int = 0) : void
      {
         var _loc14_:* = null;
         var _loc15_:Boolean = false;
         var _loc18_:* = null;
         var _loc19_:* = null;
         _reload = false;
         if(!_messagesCharacterInfo.exists(0))
         {
            _messagesCharacterInfo.setData(0,new MessageCharacter({
               "id":0,
               "online_status":2,
               "gender":"-",
               "name":LocText.current.text("general/mail/system_name")
            }));
         }
         if(param1 !== null)
         {
            if(param6)
            {
               _messagesReceivedCount = param9;
            }
            if(param7)
            {
               _messagesSentCount = param8;
            }
            var _loc24_:int = 0;
            var _loc23_:* = param1;
            for each(var _loc20_ in param1)
            {
               _loc14_ = new Message(_loc20_);
               if(!containsMessage(_loc14_))
               {
                  var _loc22_:int = 0;
                  var _loc21_:* = _fullMessages;
                  for each(var _loc12_ in _fullMessages)
                  {
                     if(_loc12_.id == _loc14_.id)
                     {
                        _loc14_ = _loc12_;
                        break;
                     }
                  }
                  addMessageToList(_loc14_);
               }
            }
         }
         if(param2 !== null)
         {
            var _loc26_:int = 0;
            var _loc25_:* = param2.rawData;
            for(var _loc10_ in param2.rawData)
            {
               if(!_messagesCharacterInfo.exists(_loc10_))
               {
                  _messagesCharacterInfo.setData(_loc10_,new MessageCharacter(param2.rawData[_loc10_]));
               }
            }
         }
         if(param3 !== null)
         {
            var _loc28_:int = 0;
            var _loc27_:* = param3;
            for each(var _loc13_ in param3)
            {
               if(!_messagesRead.exists(_loc13_))
               {
                  _messagesRead.setData(_loc13_,true);
               }
            }
         }
         if(param4 !== null)
         {
            _loc15_ = false;
            _loc18_ = new Message(param4);
            var _loc30_:int = 0;
            var _loc29_:* = _fullMessages;
            for each(var _loc17_ in _fullMessages)
            {
               if(_loc17_.id == _loc18_.id)
               {
                  _loc15_ = true;
                  break;
               }
            }
            if(!_loc15_)
            {
               _fullMessages.push(_loc18_);
               if(_loc18_.isSent)
               {
                  var _loc32_:int = 0;
                  var _loc31_:* = _sentMessages;
                  for each(var _loc11_ in _sentMessages)
                  {
                     if(_loc11_.id == _loc18_.id)
                     {
                        _loc11_.update(_loc18_);
                        break;
                     }
                  }
               }
               else
               {
                  var _loc34_:int = 0;
                  var _loc33_:* = _receivedMessages;
                  for each(var _loc16_ in _receivedMessages)
                  {
                     if(_loc16_.id == _loc18_.id)
                     {
                        _loc16_.update(_loc18_);
                        break;
                     }
                  }
               }
            }
         }
         if(param5 !== null)
         {
            _ignoredCharacters = new Vector.<MessageCharacter>();
            var _loc36_:int = 0;
            var _loc35_:* = param5.rawData;
            for(_loc10_ in param5.rawData)
            {
               _loc19_ = new MessageCharacter(param5.rawData[_loc10_]);
               _ignoredCharacters.push(_loc19_);
            }
         }
      }
      
      private static function containsMessage(param1:Message) : Boolean
      {
         var _loc2_:* = undefined;
         var _loc3_:int = 0;
         if(param1.isSent)
         {
            _loc2_ = _sentMessages;
         }
         else
         {
            _loc2_ = _receivedMessages;
         }
         _loc3_ = 0;
         while(_loc3_ < _loc2_.length)
         {
            if(_loc2_[_loc3_].id == param1.id)
            {
               return true;
            }
            _loc3_++;
         }
         return false;
      }
      
      private static function addMessageToList(param1:Message) : void
      {
         var _loc2_:* = undefined;
         var _loc3_:int = 0;
         if(param1.isSent)
         {
            _loc2_ = _sentMessages;
         }
         else
         {
            _loc2_ = _receivedMessages;
         }
         if(_loc2_.length == 0 || param1.id < _loc2_[_loc2_.length - 1].id)
         {
            _loc2_.push(param1);
         }
         else
         {
            _loc3_ = 0;
            while(_loc3_ < _loc2_.length)
            {
               if(param1.id > _loc2_[_loc3_].id)
               {
                  _loc2_.splice(_loc3_,0,param1);
                  break;
               }
               _loc3_++;
            }
         }
      }
      
      public static function addSentMessage(param1:Object, param2:Object) : void
      {
         var _loc3_:Message = new Message(param1);
         sentMessages.unshift(_loc3_);
         if(param2 !== null)
         {
            var _loc6_:int = 0;
            var _loc5_:* = param2;
            for(var _loc4_ in param2)
            {
               if(!_messagesCharacterInfo.exists(_loc4_))
               {
                  _messagesCharacterInfo.setData(_loc4_,new MessageCharacter(param2[_loc4_]));
               }
            }
         }
      }
      
      public static function updateMessage(param1:DOMessage) : void
      {
         var _loc6_:int = 0;
         var _loc5_:* = _fullMessages;
         for each(var _loc3_ in _fullMessages)
         {
            if(_loc3_.id == param1.id as int)
            {
               _loc3_.update(param1);
               break;
            }
         }
         var _loc8_:int = 0;
         var _loc7_:* = _sentMessages;
         for each(var _loc4_ in _sentMessages)
         {
            if(_loc4_.id == param1.id as int)
            {
               _loc4_.update(param1);
               break;
            }
         }
         var _loc10_:int = 0;
         var _loc9_:* = _receivedMessages;
         for each(var _loc2_ in _receivedMessages)
         {
            if(_loc2_.id == param1.id as int)
            {
               _loc2_.update(param1);
               break;
            }
         }
      }
      
      public static function getMessage(param1:int) : Message
      {
         var _loc5_:int = 0;
         var _loc4_:* = _receivedMessages;
         for each(var _loc2_ in _receivedMessages)
         {
            if(_loc2_.id == param1 && _loc2_.isLoaded)
            {
               return _loc2_;
            }
         }
         var _loc7_:int = 0;
         var _loc6_:* = _sentMessages;
         for each(var _loc3_ in _sentMessages)
         {
            if(_loc3_.id == param1 && _loc3_.isLoaded)
            {
               return _loc3_;
            }
         }
         return null;
      }
      
      public static function getMaxMessageId() : int
      {
         var _loc2_:int = 0;
         var _loc5_:int = 0;
         var _loc4_:* = _receivedMessages;
         for each(var _loc1_ in _receivedMessages)
         {
            if(_loc1_.id > _loc2_)
            {
               _loc2_ = _loc1_.id;
            }
         }
         var _loc7_:int = 0;
         var _loc6_:* = _sentMessages;
         for each(var _loc3_ in _sentMessages)
         {
            if(_loc3_.id > _loc2_)
            {
               _loc2_ = _loc3_.id;
            }
         }
         return _loc2_;
      }
      
      public static function getMaxReceivedMessageId() : int
      {
         var _loc2_:int = 0;
         var _loc4_:int = 0;
         var _loc3_:* = _receivedMessages;
         for each(var _loc1_ in _receivedMessages)
         {
            if(_loc1_.id > _loc2_)
            {
               _loc2_ = _loc1_.id;
            }
         }
         return _loc2_;
      }
      
      public static function getMaxSentMessageId() : int
      {
         var _loc1_:int = 0;
         var _loc4_:int = 0;
         var _loc3_:* = _sentMessages;
         for each(var _loc2_ in _sentMessages)
         {
            if(_loc2_.id > _loc1_)
            {
               _loc1_ = _loc2_.id;
            }
         }
         return _loc1_;
      }
      
      public static function get receivedMessages() : Vector.<Message>
      {
         return _receivedMessages;
      }
      
      public static function get sentMessages() : Vector.<Message>
      {
         return _sentMessages;
      }
      
      public static function get ignoredCharacters() : Vector.<MessageCharacter>
      {
         return _ignoredCharacters;
      }
      
      public static function getMessageCharacter(param1:int) : MessageCharacter
      {
         if(_messagesCharacterInfo.exists(param1))
         {
            return _messagesCharacterInfo.getData(param1);
         }
         return null;
      }
      
      public static function isMessageRead(param1:int) : Boolean
      {
         if(_messagesRead.exists(param1))
         {
            return _messagesRead.getData(param1);
         }
         return false;
      }
      
      public static function maskMessageAsRead(param1:int) : void
      {
         if(!_messagesRead.exists(param1))
         {
            _messagesRead.setData(param1,true);
         }
      }
      
      public static function isMessageDeleted(param1:int) : Boolean
      {
         if(_messagesDeleted.exists(param1))
         {
            return _messagesDeleted.getData(param1);
         }
         return false;
      }
      
      public static function maskMessageAsDeleted(param1:int) : void
      {
         if(!_messagesDeleted.exists(param1))
         {
            _messagesDeleted.setData(param1,true);
         }
         var _loc4_:int = 0;
         var _loc6_:int = 0;
         var _loc5_:* = _receivedMessages;
         for each(var _loc2_ in _receivedMessages)
         {
            if(_loc2_.id == param1)
            {
               _loc4_ = _receivedMessages.indexOf(_loc2_);
               _receivedMessages.splice(_loc4_,1);
               return;
            }
         }
         var _loc8_:int = 0;
         var _loc7_:* = _sentMessages;
         for each(var _loc3_ in _sentMessages)
         {
            if(_loc3_.id == param1)
            {
               _loc4_ = _sentMessages.indexOf(_loc3_);
               _sentMessages.splice(_loc4_,1);
               return;
            }
         }
      }
      
      public static function maskMessagesAsDeleted(param1:Boolean) : void
      {
         if(param1)
         {
            _sentMessages = new Vector.<Message>();
         }
         else
         {
            _receivedMessages = new Vector.<Message>();
         }
      }
      
      public static function getPreviousMessage(param1:Message) : Message
      {
         var _loc3_:Vector.<Message> = receivedMessages;
         if(param1.isSent)
         {
            _loc3_ = sentMessages;
         }
         if(_loc3_.length == 1)
         {
            return _loc3_[0];
         }
         var _loc4_:int = 0;
         var _loc6_:int = 0;
         var _loc5_:* = _loc3_;
         for each(var _loc2_ in _loc3_)
         {
            if(_loc2_.id != param1.id)
            {
               _loc4_++;
               continue;
            }
            break;
         }
         if(_loc4_ == 0)
         {
            return _loc3_[_loc3_.length - 1];
         }
         return _loc3_[_loc4_ - 1];
      }
      
      public static function getNextMessage(param1:Message) : Message
      {
         var _loc3_:Vector.<Message> = receivedMessages;
         if(param1.isSent)
         {
            _loc3_ = sentMessages;
         }
         if(_loc3_.length == 1)
         {
            return _loc3_[0];
         }
         var _loc4_:int = 0;
         var _loc6_:int = 0;
         var _loc5_:* = _loc3_;
         for each(var _loc2_ in _loc3_)
         {
            if(_loc2_.id != param1.id)
            {
               _loc4_++;
               continue;
            }
            break;
         }
         if(_loc4_ == _loc3_.length - 1)
         {
            return _loc3_[0];
         }
         return _loc3_[_loc4_ + 1];
      }
      
      public static function hasNextMessage(param1:Message) : Boolean
      {
         var _loc3_:Vector.<Message> = receivedMessages;
         if(param1.isSent)
         {
            _loc3_ = sentMessages;
         }
         if(_loc3_.length == 1)
         {
            return false;
         }
         var _loc4_:int = 0;
         var _loc6_:int = 0;
         var _loc5_:* = _loc3_;
         for each(var _loc2_ in _loc3_)
         {
            if(_loc2_.id != param1.id)
            {
               _loc4_++;
               continue;
            }
            break;
         }
         return _loc4_ != _loc3_.length - 1;
      }
      
      public static function allReceivedMessagesLoaded() : Boolean
      {
         return _receivedMessages.length >= _messagesReceivedCount;
      }
      
      public static function allSentMessagesLoaded() : Boolean
      {
         return _sentMessages.length >= _messagesSentCount;
      }
   }
}
