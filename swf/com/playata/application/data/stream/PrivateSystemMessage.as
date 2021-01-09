package com.playata.application.data.stream
{
   import com.playata.application.data.dataobject.DOPrivateSystemMessage;
   import com.playata.application.data.user.User;
   import com.playata.framework.core.TypedObject;
   import com.playata.framework.core.util.TimeUtil;
   import com.playata.framework.display.ui.IListItem;
   import com.playata.framework.localization.LocText;
   
   public class PrivateSystemMessage extends SystemMessage implements IListItem
   {
       
      
      public function PrivateSystemMessage(param1:DOPrivateSystemMessage)
      {
         super(param1);
      }
      
      override public function get message() : String
      {
         if(isGuildMassMessage)
         {
            return LocText.current.text("dialog/mail_read/received_title",flagValue) + ":\n" + super.message;
         }
         return super.message;
      }
      
      public function get isLoadingItem() : Boolean
      {
         return id == -1;
      }
      
      public function get isRead() : Boolean
      {
         return getBoolean("read");
      }
      
      public function markAsRead() : void
      {
         if(isRead)
         {
            return;
         }
         update(new TypedObject({"read":true}));
         User.current.character.streams.privateSystemMessages.decreaseUnreadCount();
      }
      
      public function get isDeleted() : Boolean
      {
         return getBoolean("deleted");
      }
      
      public function markAsDeleted() : void
      {
         markAsRead();
         update(new TypedObject({"deleted":true}));
         User.current.character.streams.privateSystemMessages.deleteMessage(this);
      }
      
      public function get isSystemMessage() : Boolean
      {
         return !isGuildMessage && !isItemMessage && !isPrivateConversationMarriageProposal;
      }
      
      public function get isGuildMessage() : Boolean
      {
         return flag == "guild_invitation" || flag == "guild_info_mail" || flag == "guild_application" || flag == "guild_mass_mail";
      }
      
      public function get isItemMessage() : Boolean
      {
         return flag == "item";
      }
      
      public function get isFriendInviteMessage() : Boolean
      {
         return flag == "friend_invite";
      }
      
      public function get isGuildInvitationMessage() : Boolean
      {
         return flag == "guild_invitation";
      }
      
      public function get isGuildApplicationMessage() : Boolean
      {
         return flag == "guild_application";
      }
      
      public function get isGuildMassMessage() : Boolean
      {
         return flag == "guild_mass_mail";
      }
      
      public function get isPrivateConversationInviteMessage() : Boolean
      {
         return flag == "pc_invite";
      }
      
      public function get isPrivateConversationMarriageProposal() : Boolean
      {
         return flag == "marriage_proposal";
      }
      
      public function get isGuildInvitationValid() : Boolean
      {
         return isGuildInvitationMessage && flagValue != "" && !isGuildInvitationAccepted && !isGuildInvitationDeclined;
      }
      
      public function get isGuildInvitationAccepted() : Boolean
      {
         return isGuildInvitationMessage && flagValue == "accepted";
      }
      
      public function get isGuildInvitationDeclined() : Boolean
      {
         return isGuildInvitationMessage && flagValue == "declined";
      }
      
      public function get isGuildApplicationValid() : Boolean
      {
         return isGuildApplicationMessage && flagValue != "" && !isGuildApplicationAccepted && !isGuildApplicationDeclined;
      }
      
      public function get isGuildApplicationAccepted() : Boolean
      {
         return isGuildApplicationMessage && flagValue == "accepted";
      }
      
      public function get isGuildApplicationDeclined() : Boolean
      {
         return isGuildApplicationMessage && flagValue == "declined";
      }
      
      public function get isPrivateConversationInviteValid() : Boolean
      {
         return isPrivateConversationInviteMessage && flagValue != "" && !isPrivateConversationInviteAccepted && !isPrivateConversationInviteDeclined;
      }
      
      public function get isPrivateConversationInviteAccepted() : Boolean
      {
         return isPrivateConversationInviteMessage && flagValue == "accepted";
      }
      
      public function get isPrivateConversationInviteDeclined() : Boolean
      {
         return isPrivateConversationInviteMessage && flagValue == "declined";
      }
      
      public function get privateConversationInviteCharacterName() : String
      {
         if(!isPrivateConversationInviteValid)
         {
            return null;
         }
         return flagValue.substr(0,flagValue.indexOf("_"));
      }
      
      public function get privateConversationInvitePrivateConversationId() : int
      {
         if(!isPrivateConversationInviteValid)
         {
            return 0;
         }
         return parseInt(flagValue.substr(flagValue.indexOf("_") + 1));
      }
      
      public function get isVoucherExpired() : Boolean
      {
         var _loc3_:int = 0;
         var _loc1_:String = message;
         var _loc2_:int = _loc1_.indexOf("[usertime:");
         var _loc4_:int = 0;
         if(_loc2_ >= 0)
         {
            _loc3_ = _loc1_.indexOf("]",_loc2_);
            _loc4_ = parseInt(_loc1_.substr(_loc2_ + 10,_loc3_ - _loc2_ - 10));
         }
         return _loc4_ != 0 && TimeUtil.now > _loc4_;
      }
      
      public function get hasItems() : Boolean
      {
         return isItemMessage && flagValue != "";
      }
      
      public function get itemCount() : int
      {
         if(!hasItems)
         {
            return 0;
         }
         var _loc1_:Array = flagValue.split(";");
         return _loc1_.length;
      }
      
      public function get item1Id() : int
      {
         if(!hasItems)
         {
            return 0;
         }
         var _loc1_:Array = flagValue.split(";");
         if(_loc1_.length < 1)
         {
            return 0;
         }
         return parseInt(_loc1_[0]);
      }
      
      public function get item2Id() : int
      {
         if(!hasItems)
         {
            return 0;
         }
         var _loc1_:Array = flagValue.split(";");
         if(_loc1_.length < 2)
         {
            return 0;
         }
         return parseInt(_loc1_[1]);
      }
      
      public function get item3Id() : int
      {
         if(!hasItems)
         {
            return 0;
         }
         var _loc1_:Array = flagValue.split(";");
         if(_loc1_.length < 3)
         {
            return 0;
         }
         return parseInt(_loc1_[2]);
      }
      
      public function get item4Id() : int
      {
         if(!hasItems)
         {
            return 0;
         }
         var _loc1_:Array = flagValue.split(";");
         if(_loc1_.length < 4)
         {
            return 0;
         }
         return parseInt(_loc1_[3]);
      }
      
      public function get item5Id() : int
      {
         if(!hasItems)
         {
            return 0;
         }
         var _loc1_:Array = flagValue.split(";");
         if(_loc1_.length < 5)
         {
            return 0;
         }
         return parseInt(_loc1_[4]);
      }
      
      public function get areItemsClaimed() : Boolean
      {
         if(!isItemMessage)
         {
            return false;
         }
         return flagValue == "";
      }
      
      public function get areItemsLoaded() : Boolean
      {
         if(item1Id != 0 && !User.current.character.getItemById(item1Id))
         {
            return false;
         }
         if(item2Id != 0 && !User.current.character.getItemById(item2Id))
         {
            return false;
         }
         if(item3Id != 0 && !User.current.character.getItemById(item3Id))
         {
            return false;
         }
         if(item4Id != 0 && !User.current.character.getItemById(item4Id))
         {
            return false;
         }
         if(item5Id != 0 && !User.current.character.getItemById(item5Id))
         {
            return false;
         }
         return true;
      }
      
      public function get itemId() : String
      {
         return id.toString();
      }
   }
}
