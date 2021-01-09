package com.playata.application.data.user_story
{
   import com.playata.application.data.AppDateTime;
   import com.playata.application.data.dataobject.DOUserStory;
   import com.playata.application.data.user.User;
   import com.playata.application.platform.ServerInfo;
   import com.playata.framework.localization.LocText;
   
   public class UserStory extends DOUserStory
   {
       
      
      public function UserStory(param1:DOUserStory)
      {
         super(param1);
      }
      
      public function get isOwnServer() : Boolean
      {
         if(!hasData("server_id"))
         {
            return false;
         }
         return serverId == ServerInfo.serverId;
      }
      
      public function get isMe() : Boolean
      {
         if(!isOwnServer)
         {
            return false;
         }
         if(!hasData("character_id"))
         {
            return false;
         }
         if(User.current == null || User.current.character == null)
         {
            return false;
         }
         return User.current.character.id == characterId;
      }
      
      public function get isMyGuildMember() : Boolean
      {
         if(!isOwnServer)
         {
            return false;
         }
         if(isMe)
         {
            return false;
         }
         if(!hasData("character_name"))
         {
            return false;
         }
         if(!User.current.character.hasGuild)
         {
            return false;
         }
         return User.current.character.guild.getMember(characterName) !== null;
      }
      
      public function get isMale() : Boolean
      {
         return characterGender == "m";
      }
      
      public function get isFemale() : Boolean
      {
         return characterGender == "f";
      }
      
      public function get stageName() : String
      {
         if(stage == 0)
         {
            return LocText.current.text("dialog/user_story/all_stages");
         }
         return LocText.current.text("dialog/stage_unlocked/stage" + stage + "_title");
      }
      
      public function get tagName() : String
      {
         return LocText.current.text("dialog/user_story/tag_" + tag + "/name");
      }
      
      public function get tagTooltip() : String
      {
         return LocText.current.text("dialog/user_story/tag_" + tag + "/tooltip");
      }
      
      override public function get title() : String
      {
         if(UserStories.isUserStoryReported(id) || status == 5)
         {
            return LocText.current.text("quest/user_story_reported/title");
         }
         if(status == 6)
         {
            return LocText.current.text("quest/user_story_deleted/title");
         }
         return getString("title");
      }
      
      override public function get briefing() : String
      {
         if(UserStories.isUserStoryReported(id) || status == 5)
         {
            return LocText.current.text("quest/user_story_reported/briefing");
         }
         if(status == 6)
         {
            return LocText.current.text("quest/user_story_deleted/briefing");
         }
         return getString("briefing");
      }
      
      override public function get outro() : String
      {
         if(UserStories.isUserStoryReported(id) || status == 5)
         {
            return LocText.current.text("quest/user_story_reported/briefing");
         }
         if(status == 6)
         {
            return LocText.current.text("quest/user_story_deleted/briefing");
         }
         return getString("outro");
      }
      
      public function get dateTime() : String
      {
         return AppDateTime.getPassedShortFormattedTimestamp(tsCreation);
      }
      
      public function canBeReported() : Boolean
      {
         return status != 1 && status != 5 && status != 6 && !UserStories.isUserStoryReported(id) && !isMe;
      }
   }
}
