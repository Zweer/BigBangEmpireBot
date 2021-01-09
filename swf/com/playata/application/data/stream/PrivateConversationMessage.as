package com.playata.application.data.stream
{
   import com.playata.application.data.AppDateTime;
   import com.playata.application.data.dataobject.DOPrivateConversationMessage;
   import com.playata.application.data.user.User;
   import com.playata.framework.core.util.TimeUtil;
   import com.playata.framework.display.ui.IListItem;
   import com.playata.framework.localization.LocText;
   
   public class PrivateConversationMessage extends DOPrivateConversationMessage implements IListItem
   {
       
      
      private var _privateConversation:PrivateConversation = null;
      
      public function PrivateConversationMessage(param1:PrivateConversation, param2:DOPrivateConversationMessage = null)
      {
         super(param2);
         _privateConversation = param1;
      }
      
      public function get isMyMessage() : Boolean
      {
         return senderId == User.current.character.id;
      }
      
      public function get isDeleted() : Boolean
      {
         return getBoolean("deleted");
      }
      
      public function get isSystem() : Boolean
      {
         return getBoolean("system");
      }
      
      public function get senderId() : int
      {
         return characterFromId;
      }
      
      public function get conversation() : PrivateConversation
      {
         return _privateConversation;
      }
      
      public function set conversation(param1:PrivateConversation) : void
      {
         _privateConversation = param1;
      }
      
      public function get sender() : PrivateConversationMember
      {
         return _privateConversation.members.getData(senderId);
      }
      
      public function get dateTime() : String
      {
         return AppDateTime.getPassedDateTimeString(TimeUtil.localDateTime,tsCreation);
      }
      
      override public function get message() : String
      {
         if(isDeleted)
         {
            return "(" + LocText.current.text("panel_streams/private_conversations/message_deleted") + ")";
         }
         var _loc1_:String = super.message;
         _loc1_ = _loc1_.split("\r").join("\n");
         return convertLinks(_loc1_);
      }
      
      private function convertLinks(param1:String) : String
      {
         var _loc4_:* = null;
         var _loc3_:int = 0;
         if(param1 == "")
         {
            return "";
         }
         var _loc5_:RegExp = /\b((?:https?:\/\/|www\d{0,3}[.]|[a-z0-9.\-]+[.][a-z]{2,4}\/)(?:[^\s()<>]+|\(([^\s()<>]+|(\([^\s()<>]+\)))*\))+(?:\(([^\s()<>]+|(\([^\s()<>]+\)))*\)|[^\s`!()\[\]{};:'".,<>?«»“”‘’]))/gi;
         var _loc2_:RegExp = /\"www/g;
         param1 = param1.replace(_loc5_,"<a href=\"$&\" target=\"_blank\">$&</a>");
         param1 = param1.replace(_loc2_,"\"http://www");
         if(param1.indexOf("<a href") != -1)
         {
            _loc4_ = "abcdefghijklmnopqrstuvwxyz";
            _loc3_ = 0;
            while(_loc3_ < _loc4_.length)
            {
               param1 = param1.replace("<a href=\"" + _loc4_.charAt(_loc3_),"<a href=\"http://" + _loc4_.charAt(_loc3_));
               _loc3_++;
            }
            param1 = param1.replace("<a href=\"http://https://","<a href=\"https://");
            param1 = param1.replace("<a href=\"http://http://","<a href=\"http://");
         }
         return param1;
      }
      
      public function get isLoadMorePreviousMessage() : Boolean
      {
         return id == -1;
      }
      
      public function get isLoadMoreNextMessage() : Boolean
      {
         return id == PrivateConversation.LOAD_MORE_NEXT_MESSAGE_ID;
      }
      
      public function get itemId() : String
      {
         return id.toString();
      }
   }
}
