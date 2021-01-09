package com.playata.application.data.tournament
{
   import com.playata.application.data.AppDateTime;
   import com.playata.framework.core.util.TimeUtil;
   
   public class GlobalTournament
   {
      
      private static var _globalTournamentEndTimestamp:int = 0;
       
      
      public function GlobalTournament()
      {
         super();
      }
      
      public static function get globalTournamentEndTimestamp() : int
      {
         return _globalTournamentEndTimestamp;
      }
      
      public static function set globalTournamentEndTimestamp(param1:int) : void
      {
         _globalTournamentEndTimestamp = param1;
      }
      
      public static function get tournamentEndDateTime() : String
      {
         var _loc1_:int = globalTournamentEndTimestamp;
         if(TimeUtil.localDateTime.isToday(_loc1_))
         {
            return AppDateTime.getFormattedDateTimeToday(_loc1_);
         }
         return AppDateTime.getFormattedDateTime(_loc1_,2);
      }
   }
}
