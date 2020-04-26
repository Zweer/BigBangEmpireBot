package com.playata.application.data.tournament
{
   import com.playata.application.data.AppDateTime;
   import com.playata.framework.core.util.TimeUtil;
   
   public class MovieTournament
   {
      
      private static var _movieTournamentEndTimestamp:int = 0;
       
      
      public function MovieTournament()
      {
         super();
      }
      
      public static function get movieTournamentEndTimestamp() : int
      {
         return _movieTournamentEndTimestamp;
      }
      
      public static function set movieTournamentEndTimestamp(param1:int) : void
      {
         _movieTournamentEndTimestamp = param1;
      }
      
      public static function get tournamentEndDateTime() : String
      {
         var _loc1_:int = movieTournamentEndTimestamp;
         if(TimeUtil.localDateTime.isToday(_loc1_))
         {
            return AppDateTime.getFormattedDateTimeToday(_loc1_);
         }
         return AppDateTime.getFormattedDateTime(_loc1_,2);
      }
   }
}
