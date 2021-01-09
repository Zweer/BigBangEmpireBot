package com.playata.application.data.guild
{
   import com.playata.application.AppConfig;
   import com.playata.application.AppEnvironment;
   import com.playata.application.data.AppDateTime;
   import com.playata.application.data.character.Character;
   import com.playata.application.data.character.CharacterTooltipInformation;
   import com.playata.application.data.constants.CConstant;
   import com.playata.application.data.dataobject.DOGuildMember;
   import com.playata.application.data.titles.Titles;
   import com.playata.application.data.user.User;
   import com.playata.application.platform.ServerInfo;
   import com.playata.application.ui.elements.avatar.ICharacterTooltipProvider;
   import com.playata.framework.core.TypedObject;
   import com.playata.framework.core.util.JsonUtil;
   import com.playata.framework.core.util.TimeUtil;
   import com.playata.framework.display.ui.IListItem;
   import com.playata.framework.localization.LocText;
   import com.playata.framework.network.NetworkCore;
   
   public class GuildMember extends DOGuildMember implements ICharacterTooltipProvider, IListItem
   {
       
      
      private var _guild:Guild = null;
      
      public function GuildMember(param1:DOGuildMember, param2:Guild)
      {
         _guild = param2;
         super(param1);
      }
      
      override public function update(param1:TypedObject) : void
      {
         var _loc2_:DOGuildMember = new DOGuildMember(param1);
         var _loc3_:Boolean = false;
         if(_loc2_.hasData("gender") && hasData("gender"))
         {
            if(_loc2_.gender != gender)
            {
               _loc3_ = true;
            }
         }
         if(!_loc3_ && _loc2_.hasData("level") && hasData("level"))
         {
            if(_loc2_.level != level)
            {
               _loc3_ = true;
            }
         }
         if(!_loc3_ && _loc2_.hasData("online_status") && hasData("online_status"))
         {
            if(_loc2_.onlineStatus != onlineStatus)
            {
               _loc3_ = true;
            }
         }
         super.update(_loc2_);
         if(!NetworkCore.current.serverConnection.isSocketTransportActive && _loc3_)
         {
            AppEnvironment.friendBar.updateFriendByName(name,level,isOnline);
         }
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
      
      override public function get serverId() : String
      {
         if(!hasData("server_id"))
         {
            return ServerInfo.serverId;
         }
         return super.serverId;
      }
      
      public function get itemId() : String
      {
         return "gm" + id.toString();
      }
      
      public function get guild() : Guild
      {
         return _guild;
      }
      
      override public function get name() : String
      {
         return Character.getCleanName(super.name);
      }
      
      public function get nameWithTitle() : String
      {
         var _loc1_:String = getString("name");
         if(_loc1_.indexOf("___") != -1)
         {
            return LocText.current.text("general/character_deleted");
         }
         if(!hasData("title") || getString("title") == "" || AppConfig.titlesEnabled != true)
         {
            return name;
         }
         _loc1_ = Titles.instance.getNameWithTitle(_loc1_,getString("title"),gender);
         return _loc1_;
      }
      
      override public function get gender() : String
      {
         if(isMe)
         {
            return User.current.character.gender;
         }
         return super.gender;
      }
      
      public function get isMale() : Boolean
      {
         if(isMe)
         {
            return User.current.character.isMale;
         }
         return gender == "m";
      }
      
      public function get isFemale() : Boolean
      {
         if(isMe)
         {
            return User.current.character.isFemale;
         }
         return gender == "f";
      }
      
      override public function get level() : int
      {
         if(isMe)
         {
            return User.current.character.level;
         }
         return super.level;
      }
      
      override public function get guildRank() : int
      {
         if(isMe)
         {
            return User.current.character.guildRank;
         }
         return super.guildRank;
      }
      
      public function get guildRankName() : String
      {
         return Guild.getRankName(guildRank);
      }
      
      public function get joinDate() : String
      {
         return AppDateTime.getPassedShortFormattedTimestamp(tsGuildJoined);
      }
      
      public function get lastOnlineInfo() : String
      {
         if(isOnline)
         {
            return LocText.current.text("guild/member_online_status/now");
         }
         var _loc1_:int = tsLastOnline;
         if(lastAction <= 30)
         {
            return LocText.current.text("guild/member_online_status/last_minutes");
         }
         if(lastAction <= 240)
         {
            return LocText.current.text("guild/member_online_status/last_hours");
         }
         if(TimeUtil.localDateTime.isToday(_loc1_))
         {
            return LocText.current.text("guild/member_online_status/today");
         }
         if(TimeUtil.localDateTime.isYesterday(_loc1_))
         {
            return LocText.current.text("guild/member_online_status/yesterday");
         }
         return LocText.current.text("guild/member_online_status/date",AppDateTime.timestampToLocalString(_loc1_,AppDateTime.dateFormat));
      }
      
      override public function get guildCompetitionPointsGathered() : int
      {
         if(isMe)
         {
            return User.current.character.guildCompetitionPointsGathered;
         }
         return super.guildCompetitionPointsGathered;
      }
      
      public function get isOnline() : Boolean
      {
         if(onlineStatus != 1)
         {
            return false;
         }
         return true;
      }
      
      public function get isInOwnGuild() : Boolean
      {
         var _loc1_:Guild = User.current.character.guild;
         if(_loc1_ == null)
         {
            return false;
         }
         var _loc4_:int = 0;
         var _loc3_:* = _loc1_.members;
         for each(var _loc2_ in _loc1_.members)
         {
            if(_loc2_.id == id)
            {
               return true;
            }
         }
         return false;
      }
      
      public function get isMe() : Boolean
      {
         if(User.current == null || User.current.character == null)
         {
            return false;
         }
         return User.current.character.id == id;
      }
      
      public function get isAttacking() : Boolean
      {
         if(!guild.isAttacking)
         {
            return false;
         }
         return guild.pendingAttackGuildBattle.hasJoinedMember(id);
      }
      
      public function get isDefending() : Boolean
      {
         if(!guild.isDefending)
         {
            return false;
         }
         return guild.pendingDefenseGuildBattle.hasJoinedMember(id);
      }
      
      public function get isVoteOutAllowed() : Boolean
      {
         var _loc1_:Number = lastAction / 60 / 24;
         return guildRank == 1 && _loc1_ >= CConstant.guild_leader_vote_min_active_days;
      }
   }
}
