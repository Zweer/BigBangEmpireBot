package com.playata.application.data.mailbox
{
   import com.playata.application.data.AppDateTime;
   import com.playata.application.data.dataobject.DOMessage;
   import com.playata.application.data.user.User;
   
   public class Message extends DOMessage
   {
       
      
      public function Message(param1:Object = null)
      {
         super(param1);
      }
      
      public function get isLoaded() : Boolean
      {
         return hasData("message");
      }
      
      public function get isSent() : Boolean
      {
         return characterFromId == User.current.character.id;
      }
      
      public function get sender() : MessageCharacter
      {
         return Mailbox.getMessageCharacter(characterFromId);
      }
      
      public function get recipients() : Vector.<MessageCharacter>
      {
         var _loc1_:Vector.<MessageCharacter> = new Vector.<MessageCharacter>();
         if(isTeamMail)
         {
            return _loc1_;
         }
         var _loc2_:String = characterToIds;
         var _loc3_:Array = _loc2_.split(";");
         var _loc6_:int = 0;
         var _loc5_:* = _loc3_;
         for each(var _loc4_ in _loc3_)
         {
            if(_loc4_ != "")
            {
               _loc1_.push(Mailbox.getMessageCharacter(parseInt(_loc4_)));
            }
         }
         return _loc1_;
      }
      
      public function get isTeamMail() : Boolean
      {
         return flag == "team_mail";
      }
      
      public function get isSystemTeamMail() : Boolean
      {
         return flag == "guild_invitation" || flag == "guild_application" || flag == "system_team_mail";
      }
      
      public function get isItemMail() : Boolean
      {
         return flag == "item" || flag == "item_html";
      }
      
      public function get isVoucherMail() : Boolean
      {
         return flagValue && flagValue.indexOf("gamelink/open_voucher_dialog") >= 0;
      }
      
      public function get buttonLabel() : String
      {
         if(flag != "partner_ad" && flag != "partner_ad_html")
         {
            return null;
         }
         if(!flagValue)
         {
            return null;
         }
         if(flagValue.indexOf("!BL!:") == -1)
         {
            return null;
         }
         var _loc1_:String = flagValue.substr(flagValue.indexOf("!BL!:") + 5);
         return _loc1_;
      }
      
      public function get hasItems() : Boolean
      {
         return (flag == "item" || flag == "item_html") && flagValue != "";
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
         if(flag != "item" && flag != "item_html")
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
      
      public function get recipientNames() : String
      {
         if(isTeamMail)
         {
            return flagValue;
         }
         var _loc1_:String = characterToIds;
         var _loc3_:Array = _loc1_.split(";");
         var _loc2_:Array = [];
         var _loc6_:int = 0;
         var _loc5_:* = _loc3_;
         for each(var _loc4_ in _loc3_)
         {
            if(_loc4_ != "")
            {
               _loc2_.push(Mailbox.getMessageCharacter(parseInt(_loc4_)).name);
            }
         }
         return _loc2_.join(", ");
      }
      
      override public function get flag() : String
      {
         var _loc1_:String = super.flag;
         if(_loc1_ && _loc1_.indexOf(";") != -1)
         {
            _loc1_ = _loc1_.substr(_loc1_.indexOf(";") + 1);
         }
         return _loc1_;
      }
      
      public function get hasFlag() : Boolean
      {
         return flag != "";
      }
      
      public function get isRead() : Boolean
      {
         if(isSent)
         {
            return true;
         }
         return Mailbox.isMessageRead(id);
      }
      
      public function markAsRead() : void
      {
         if(isSent)
         {
            return;
         }
         Mailbox.maskMessageAsRead(id);
      }
      
      public function get isDeleted() : Boolean
      {
         return Mailbox.isMessageDeleted(id);
      }
      
      public function markAsDeleted() : void
      {
         Mailbox.maskMessageAsDeleted(id);
      }
      
      public function get dateTime() : String
      {
         return AppDateTime.getPassedShortFormattedTimestamp(tsCreation);
      }
   }
}
