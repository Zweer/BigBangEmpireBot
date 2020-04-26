package com.playata.application.data.leaderboard
{
   import com.playata.application.data.guild.LeaderboardGuild;
   
   public class GuildLeaderboardContext
   {
       
      
      public var lastGuildLeaderboardRefresh:int = 0;
      
      public var currentGuild:LeaderboardGuild = null;
      
      public var guilds:Vector.<LeaderboardGuild>;
      
      public var maxGuilds:int = 0;
      
      public var selectGuildLine:Boolean = true;
      
      public var offsetGuilds:int = 0;
      
      public var guildSortType:int = 1;
      
      public var scrollUp:Boolean = true;
      
      public var showOnlySameLocale:Boolean = false;
      
      public var serverId:String = "";
      
      public function GuildLeaderboardContext()
      {
         guilds = new Vector.<LeaderboardGuild>();
         super();
      }
      
      public function reset() : void
      {
         lastGuildLeaderboardRefresh = 0;
         currentGuild = null;
         guilds = new Vector.<LeaderboardGuild>();
         maxGuilds = 0;
         selectGuildLine = true;
         offsetGuilds = 0;
         guildSortType = 1;
         showOnlySameLocale = false;
         serverId = "";
      }
   }
}
