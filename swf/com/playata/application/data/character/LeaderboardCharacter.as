package com.playata.application.data.character
{
   import com.playata.application.AppConfig;
   import com.playata.application.data.dataobject.DOLeaderboardCharacter;
   import com.playata.application.data.guild.GuildEmblemSettings;
   import com.playata.application.data.titles.Titles;
   import com.playata.application.data.user.User;
   import com.playata.application.ui.elements.avatar.ICharacterTooltipProvider;
   import com.playata.framework.application.Environment;
   import com.playata.framework.core.util.JsonUtil;
   import com.playata.framework.localization.LocText;
   
   public class LeaderboardCharacter extends DOLeaderboardCharacter implements ICharacterTooltipProvider
   {
       
      
      private var _emblemSettings:GuildEmblemSettings = null;
      
      public function LeaderboardCharacter(param1:DOLeaderboardCharacter)
      {
         super(param1);
      }
      
      public function get isMe() : Boolean
      {
         if(User.current == null || User.current.character == null)
         {
            return false;
         }
         return User.current.character.id == id;
      }
      
      public function getCharacterTooltipInformation() : CharacterTooltipInformation
      {
         var _loc1_:* = null;
         var _loc3_:CharacterTooltipInformation = new CharacterTooltipInformation();
         _loc3_.totalStamina = getInt("stat_total_stamina");
         _loc3_.totalStrength = getInt("stat_total_strength");
         _loc3_.totalCriticalRating = getInt("stat_total_critical_rating");
         _loc3_.totalDodgeRating = getInt("stat_total_dodge_rating");
         _loc3_.avatarImageSettings = getString("avatar_image");
         var _loc2_:Object = {};
         if(hasData("battle_data") && getString("battle_data") != "" && getString("battle_data") != "[]")
         {
            _loc1_ = JsonUtil.decode(getString("battle_data"));
            if(_loc1_["effects"])
            {
               _loc2_ = _loc1_["effects"];
            }
         }
         _loc3_.battleEffectsData = _loc2_;
         return _loc3_;
      }
      
      override public function get name() : String
      {
         var _loc1_:String = super.name;
         if(_loc1_.indexOf("___") != -1)
         {
            _loc1_ = LocText.current.text("general/character_deleted");
         }
         return _loc1_;
      }
      
      override public function get locale() : String
      {
         if(super.locale == "")
         {
            return Environment.info.defaultLocale;
         }
         return super.locale;
      }
      
      public function get nameWithTitle() : String
      {
         if(!hasData("title") || getString("title") == "" || AppConfig.titlesEnabled != true)
         {
            return name;
         }
         var _loc1_:String = getString("name");
         if(_loc1_.indexOf("___") != -1)
         {
            return LocText.current.text("general/character_deleted");
         }
         _loc1_ = Titles.instance.getNameWithTitle(_loc1_,getString("title"),gender);
         return _loc1_;
      }
      
      override public function get guildName() : String
      {
         var _loc1_:String = super.guildName;
         if(_loc1_.indexOf("___") != -1)
         {
            _loc1_ = LocText.current.text("general/character_deleted");
         }
         return _loc1_;
      }
      
      public function get hasGuild() : Boolean
      {
         return guildName != "";
      }
      
      public function get isMale() : Boolean
      {
         return gender == "m";
      }
      
      public function get isFemale() : Boolean
      {
         return gender == "f";
      }
      
      public function get tournamentValue() : int
      {
         return value;
      }
      
      public function get isOnline() : Boolean
      {
         if(id == User.current.character.id)
         {
            return false;
         }
         if(onlineStatus != 1)
         {
            return false;
         }
         return true;
      }
      
      public function get emblemSettings() : GuildEmblemSettings
      {
         if(_emblemSettings == null)
         {
            _emblemSettings = GuildEmblemSettings.fromLeaderboardCharacter(this);
         }
         return _emblemSettings;
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
