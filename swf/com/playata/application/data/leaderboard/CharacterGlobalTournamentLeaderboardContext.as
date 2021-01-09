package com.playata.application.data.leaderboard
{
   import com.playata.application.data.character.LeaderboardCharacter;
   
   public class CharacterGlobalTournamentLeaderboardContext
   {
       
      
      public var lastCharacterLeaderboardRefresh:int = 0;
      
      public var currentCharacter:LeaderboardCharacter = null;
      
      public var characters:Vector.<LeaderboardCharacter>;
      
      public var maxCharacters:int = 0;
      
      public var selectCharacterLine:Boolean = true;
      
      public var offsetCharacters:int = 0;
      
      public var scrollUp:Boolean = true;
      
      public function CharacterGlobalTournamentLeaderboardContext()
      {
         characters = new Vector.<LeaderboardCharacter>();
         super();
      }
      
      public function reset() : void
      {
         lastCharacterLeaderboardRefresh = 0;
         currentCharacter = null;
         characters = new Vector.<LeaderboardCharacter>();
         maxCharacters = 0;
         selectCharacterLine = true;
         offsetCharacters = 0;
      }
   }
}
