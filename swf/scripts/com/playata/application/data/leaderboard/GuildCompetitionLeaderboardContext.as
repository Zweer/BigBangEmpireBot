package com.playata.application.data.leaderboard
{
   import com.playata.application.data.AppDateTime;
   import com.playata.application.data.guild.LeaderboardGuildCompetition;
   import com.playata.framework.core.util.TimeUtil;
   
   public class GuildCompetitionLeaderboardContext
   {
       
      
      public var lastGuildCompetitionLeaderboardRefresh:int = 0;
      
      public var currentGuild:LeaderboardGuildCompetition = null;
      
      public var guilds:Vector.<LeaderboardGuildCompetition>;
      
      public var maxGuilds:int = 0;
      
      public var endTimestamp:int = 0;
      
      public var guildsWithReward:int = 0;
      
      public var selectGuildLine:Boolean = true;
      
      public var offsetGuilds:int = 0;
      
      public var scrollUp:Boolean = true;
      
      public function GuildCompetitionLeaderboardContext()
      {
         guilds = new Vector.<LeaderboardGuildCompetition>();
         super();
      }
      
      public function reset() : void
      {
         lastGuildCompetitionLeaderboardRefresh = 0;
         currentGuild = null;
         guilds = new Vector.<LeaderboardGuildCompetition>();
         maxGuilds = 0;
         endTimestamp = 0;
         guildsWithReward = 0;
         selectGuildLine = true;
         offsetGuilds = 0;
      }
      
      public function get tournamentEndDateTime() : String
      {
         if(TimeUtil.localDateTime.isToday(endTimestamp))
         {
            return AppDateTime.getFormattedDateTimeToday(endTimestamp);
         }
         return AppDateTime.getFormattedDateTime(endTimestamp,2);
      }
   }
}
