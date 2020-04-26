package com.playata.application.data.leaderboard
{
   import com.playata.application.data.AppDateTime;
   import com.playata.application.data.guild.LeaderboardSoloGuildCompetition;
   import com.playata.framework.core.util.TimeUtil;
   
   public class SoloGuildCompetitionLeaderboardContext
   {
       
      
      public var lastSoloGuildCompetitionLeaderboardRefresh:int = 0;
      
      public var currentCharacter:LeaderboardSoloGuildCompetition = null;
      
      public var characters:Vector.<LeaderboardSoloGuildCompetition>;
      
      public var maxCharacters:int = 0;
      
      public var endTimestamp:int = 0;
      
      public var selectCharacterLine:Boolean = true;
      
      public var offsetCharacters:int = 0;
      
      public var scrollUp:Boolean = true;
      
      public function SoloGuildCompetitionLeaderboardContext()
      {
         characters = new Vector.<LeaderboardSoloGuildCompetition>();
         super();
      }
      
      public function reset() : void
      {
         lastSoloGuildCompetitionLeaderboardRefresh = 0;
         currentCharacter = null;
         characters = new Vector.<LeaderboardSoloGuildCompetition>();
         maxCharacters = 0;
         endTimestamp = 0;
         selectCharacterLine = true;
         offsetCharacters = 0;
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
