package com.playata.application.data.guild
{
   import com.playata.application.data.dataobject.DOLeaderboardGuildCompetition;
   import com.playata.application.data.user.User;
   
   public class LeaderboardGuildCompetition extends DOLeaderboardGuildCompetition
   {
       
      
      private var _emblemSettings:GuildEmblemSettings = null;
      
      public function LeaderboardGuildCompetition(param1:DOLeaderboardGuildCompetition)
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
      
      public function get isMyGuild() : Boolean
      {
         if(!User.current.character.hasGuild)
         {
            return false;
         }
         return User.current.character.guild.id == id;
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
            _emblemSettings = GuildEmblemSettings.fromLeaderboardGuildCompetition(this);
         }
         return _emblemSettings;
      }
   }
}
