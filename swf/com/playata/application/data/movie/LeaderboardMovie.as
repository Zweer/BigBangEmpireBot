package com.playata.application.data.movie
{
   import com.playata.application.AppConfig;
   import com.playata.application.data.dataobject.DOLeaderboardMovie;
   import com.playata.application.data.titles.Titles;
   import com.playata.application.data.user.User;
   import com.playata.framework.localization.LocText;
   
   public class LeaderboardMovie extends DOLeaderboardMovie
   {
       
      
      public function LeaderboardMovie(param1:Object = null)
      {
         super(param1);
      }
      
      override public function get characterName() : String
      {
         var _loc1_:String = super.characterName;
         if(_loc1_.indexOf("___") != -1)
         {
            _loc1_ = LocText.current.text("general/character_deleted");
         }
         return _loc1_;
      }
      
      public function get characterNameWithTitle() : String
      {
         if(!hasData("character_title") || getString("character_title") == "" || AppConfig.titlesEnabled != true)
         {
            return characterName;
         }
         var _loc1_:String = getString("character_name");
         if(_loc1_.indexOf("___") != -1)
         {
            return LocText.current.text("general/character_deleted");
         }
         _loc1_ = Titles.instance.getNameWithTitle(_loc1_,getString("character_title"),characterGender);
         return _loc1_;
      }
      
      public function get isCharacterMale() : Boolean
      {
         return characterGender == "m";
      }
      
      public function get isCharacterFemale() : Boolean
      {
         return characterGender == "f";
      }
      
      public function get isCharacterOnline() : Boolean
      {
         if(id == User.current.character.id)
         {
            return false;
         }
         var _loc1_:int = getInt("character_online_status");
         if(_loc1_ != 1)
         {
            return false;
         }
         return true;
      }
      
      public function get isPlayer() : Boolean
      {
         return characterId == User.current.character.id;
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
         return User.current.character.guild.getMember(characterName) !== null;
      }
      
      public function get coverSettings() : String
      {
         return getString("cover");
      }
      
      public function get hasGuild() : Boolean
      {
         return getData("guild_id") > 0;
      }
      
      override public function get guildName() : String
      {
         var _loc1_:String = super.guildName;
         if(_loc1_.indexOf("___") != -1)
         {
            return _loc1_.substr(_loc1_.indexOf("___") + 3);
         }
         return _loc1_;
      }
      
      public function get isMyGuild() : Boolean
      {
         return hasGuild && User.current.character.guildId == getData("guild_id");
      }
   }
}
