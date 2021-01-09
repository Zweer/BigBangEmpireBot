package com.playata.application.data.stream
{
   import com.playata.application.data.dataobject.DOIgnoredCharacter;
   import com.playata.framework.application.Environment;
   import com.playata.framework.core.TypedObject;
   import com.playata.framework.data.DataObjectArray;
   
   public class Streams
   {
       
      
      private var _serverSystemMessageTeaserIdentifier:String = null;
      
      private var _serverSystemMessages:ServerSystemMessages = null;
      
      private var _privateSystemMessages:PrivateSystemMessages = null;
      
      private var _privateConversations:PrivateConversations = null;
      
      private var _resourceRequests:ResourceRequests = null;
      
      private var _userVouchers:UserVouchers = null;
      
      private var _ignoredCharacters:Vector.<IgnoreMessageCharacter> = null;
      
      private var _unreadCount:int = -1;
      
      public function Streams()
      {
         super();
         _serverSystemMessages = new ServerSystemMessages();
         _privateSystemMessages = new PrivateSystemMessages();
         _privateConversations = new PrivateConversations();
         _resourceRequests = new ResourceRequests();
         _userVouchers = new UserVouchers();
         _ignoredCharacters = new Vector.<IgnoreMessageCharacter>();
      }
      
      public function set serverSystemMessageTeaserIdentifier(param1:String) : void
      {
         _serverSystemMessageTeaserIdentifier = param1;
      }
      
      public function get serverSystemMessageTeaserIdentifier() : String
      {
         if(!_serverSystemMessageTeaserIdentifier)
         {
            return "default";
         }
         return _serverSystemMessageTeaserIdentifier;
      }
      
      public function get serverSystemMessages() : ServerSystemMessages
      {
         return _serverSystemMessages;
      }
      
      public function get privateSystemMessages() : PrivateSystemMessages
      {
         return _privateSystemMessages;
      }
      
      public function get privateConversations() : PrivateConversations
      {
         return _privateConversations;
      }
      
      public function get resourceRequests() : ResourceRequests
      {
         return _resourceRequests;
      }
      
      public function get userVouchers() : UserVouchers
      {
         return _userVouchers;
      }
      
      public function get ignoredCharacters() : Vector.<IgnoreMessageCharacter>
      {
         return _ignoredCharacters;
      }
      
      public function get unreadCount() : int
      {
         var _loc1_:int = 0;
         _loc1_ = _loc1_ + _serverSystemMessages.unreadCount;
         _loc1_ = _loc1_ + _privateSystemMessages.unreadCount;
         _loc1_ = _loc1_ + _privateConversations.unreadCount;
         _loc1_ = _loc1_ + _resourceRequests.unreadCount;
         _loc1_ = _loc1_ + _userVouchers.unreadCount;
         _loc1_ = Math.max(0,_loc1_);
         if(_unreadCount != -1 && _loc1_ > _unreadCount)
         {
            Environment.audio.playFX("new_mail_notification.mp3");
         }
         _unreadCount = _loc1_;
         return _unreadCount;
      }
      
      public function update(param1:TypedObject, param2:int) : void
      {
         if(!param1)
         {
            return;
         }
         if(param1.hasData("m"))
         {
            _serverSystemMessages.updateStream(param1.getData("m")[param2]);
         }
         if(param1.hasData("s"))
         {
            _privateSystemMessages.updateStream(param1.getData("s")[param2]);
         }
         if(param1.hasData("p"))
         {
            _privateConversations.updateStreams(param1.getData("p"));
         }
         if(param1.hasData("r"))
         {
            _resourceRequests.updateStream(param1.getData("r")[param2]);
         }
         if(param1.hasData("v"))
         {
            _userVouchers.updateStream(param1.getData("v")[param2]);
         }
      }
      
      public function updateIgnoredCharacterInfo(param1:DataObjectArray) : void
      {
         var _loc3_:* = null;
         if(!param1)
         {
            return;
         }
         _ignoredCharacters = new Vector.<IgnoreMessageCharacter>();
         var _loc5_:int = 0;
         var _loc4_:* = param1;
         for each(var _loc2_ in param1)
         {
            _loc3_ = new IgnoreMessageCharacter(_loc2_);
            _ignoredCharacters.push(_loc3_);
         }
      }
   }
}
