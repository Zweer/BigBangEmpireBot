package com.playata.application.data.mailbox
{
   import com.playata.application.data.AppDateTime;
   import com.playata.application.data.dataobject.DOMessageIgnore;
   import com.playata.application.data.user.User;
   import com.playata.framework.localization.LocText;
   
   public class MessageCharacter extends DOMessageIgnore
   {
       
      
      public function MessageCharacter(param1:Object = null)
      {
         super(param1);
      }
      
      public function get name() : String
      {
         var _loc1_:String = getString("name");
         if(_loc1_.indexOf("___") != -1)
         {
            _loc1_ = LocText.current.text("general/character_deleted");
         }
         return _loc1_;
      }
      
      public function get gender() : String
      {
         return getString("gender");
      }
      
      public function get isMale() : Boolean
      {
         return gender == "m";
      }
      
      public function get isFemale() : Boolean
      {
         return gender == "f";
      }
      
      public function get isSystem() : Boolean
      {
         return gender == "-";
      }
      
      public function get isOnline() : Boolean
      {
         if(name == User.current.character.name)
         {
            return false;
         }
         var _loc1_:int = getInt("online_status");
         if(_loc1_ != 1)
         {
            return false;
         }
         return true;
      }
      
      public function get ignoreDateString() : String
      {
         var _loc1_:int = getInt("ts_ignore_date");
         return LocText.current.text("general/date_time_format",AppDateTime.timestampToLocalString(_loc1_,AppDateTime.dateFormat),AppDateTime.getFormattedTimestampHM(_loc1_));
      }
      
      public function get isMyGuildMember() : Boolean
      {
         if(id == User.current.character.id)
         {
            return false;
         }
         if(!User.current.character.hasGuild)
         {
            return false;
         }
         return User.current.character.guild.getMember(name) !== null;
      }
   }
}
