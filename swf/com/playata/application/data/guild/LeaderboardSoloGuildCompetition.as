package com.playata.application.data.guild
{
   import com.playata.application.data.dataobject.DOLeaderboardSoloGuildCompetition;
   import com.playata.application.data.user.User;
   
   public class LeaderboardSoloGuildCompetition extends DOLeaderboardSoloGuildCompetition
   {
       
      
      private var _emblemSettings:GuildEmblemSettings = null;
      
      public function LeaderboardSoloGuildCompetition(param1:DOLeaderboardSoloGuildCompetition)
      {
         super(param1);
      }
      
      public function get name() : String
      {
         var _loc1_:String = n;
         if(_loc1_.indexOf("___") != -1)
         {
            _loc1_ = _loc1_.substr(_loc1_.indexOf("___") + 3);
         }
         return _loc1_;
      }
      
      public function get isMale() : Boolean
      {
         return g == "m";
      }
      
      public function get isFemale() : Boolean
      {
         return g == "f";
      }
      
      public function get isOnline() : Boolean
      {
         if(id == User.current.character.id)
         {
            return false;
         }
         if(os != 1)
         {
            return false;
         }
         return true;
      }
      
      public function get guildName() : String
      {
         var _loc1_:String = gn;
         if(_loc1_.indexOf("___") != -1)
         {
            _loc1_ = _loc1_.substr(_loc1_.indexOf("___") + 3);
         }
         return _loc1_;
      }
      
      public function get guildId() : int
      {
         return gi;
      }
      
      public function get emblemBackgroundShapeId() : int
      {
         return ebs;
      }
      
      public function get emblemBackgroundColorIndex() : int
      {
         return ebc;
      }
      
      public function get emblemBackgroundBorderColorIndex() : int
      {
         return ebbc;
      }
      
      public function get emblemIconShapeId() : int
      {
         return eis;
      }
      
      public function get emblemIconColorIndex() : int
      {
         return eic;
      }
      
      public function get emblemIconSize() : int
      {
         return eiz;
      }
      
      public function get score() : int
      {
         return s;
      }
      
      public function get emblemSettings() : GuildEmblemSettings
      {
         if(_emblemSettings == null)
         {
            _emblemSettings = GuildEmblemSettings.fromLeaderboardSoloGuildCompetition(this);
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
