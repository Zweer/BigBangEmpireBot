package com.playata.application.data.stream
{
   import com.playata.application.data.AppDateTime;
   import com.playata.application.data.character.Character;
   import com.playata.application.data.dataobject.DOIgnoredCharacter;
   import com.playata.application.data.user.User;
   import com.playata.framework.display.ui.IListItem;
   import com.playata.framework.localization.LocText;
   
   public class IgnoreMessageCharacter extends DOIgnoredCharacter implements IListItem
   {
       
      
      public function IgnoreMessageCharacter(param1:DOIgnoredCharacter)
      {
         super(param1);
      }
      
      override public function get name() : String
      {
         return Character.getCleanName(super.name);
      }
      
      public function get isMale() : Boolean
      {
         return gender == "m";
      }
      
      public function get isFemale() : Boolean
      {
         return gender == "f";
      }
      
      public function get isOnline() : Boolean
      {
         if(name == User.current.character.name)
         {
            return false;
         }
         if(onlineStatus != 1)
         {
            return false;
         }
         return true;
      }
      
      public function get ignoreDateString() : String
      {
         return LocText.current.text("general/date_time_format",AppDateTime.timestampToLocalString(tsIgnoreDate,AppDateTime.dateFormat,true),AppDateTime.getFormattedTimestampHM(tsIgnoreDate));
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
      
      public function get itemId() : String
      {
         return id.toString();
      }
   }
}
