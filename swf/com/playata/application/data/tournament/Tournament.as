package com.playata.application.data.tournament
{
   import com.playata.application.data.AppDateTime;
   import com.playata.application.data.GameUtil;
   import com.playata.application.data.constants.CTournamentReward;
   import com.playata.framework.core.util.TimeUtil;
   
   public class Tournament
   {
      
      public static const TOURNAMENT_COUNT:int = 5;
      
      private static var _tournamentEndTimestamp:int = 0;
       
      
      public function Tournament()
      {
         super();
      }
      
      public static function get tournamentEndTimestamp() : int
      {
         return _tournamentEndTimestamp;
      }
      
      public static function set tournamentEndTimestamp(param1:int) : void
      {
         _tournamentEndTimestamp = param1;
      }
      
      public static function get tournamentEndDateTime() : String
      {
         var _loc1_:int = tournamentEndTimestamp;
         if(TimeUtil.localDateTime.isToday(_loc1_))
         {
            return AppDateTime.getFormattedDateTimeToday(_loc1_);
         }
         return AppDateTime.getFormattedDateTime(_loc1_,2);
      }
      
      public static function getRewardString(param1:int, param2:int) : String
      {
         var _loc3_:* = null;
         var _loc5_:int = 0;
         var _loc6_:int = 0;
         var _loc8_:int = 0;
         var _loc7_:* = CTournamentReward.ids;
         for each(var _loc4_ in CTournamentReward.ids)
         {
            _loc3_ = CTournamentReward.fromId(_loc4_);
            if(_loc3_.tournamentType == param1)
            {
               if(param2 >= _loc3_.rankStart && param2 <= _loc3_.rankEnd)
               {
                  _loc5_ = _loc3_.rewardType;
                  _loc6_ = _loc3_.rewardAmount;
                  return getRewardTypeString(_loc5_,_loc6_);
               }
            }
         }
         return null;
      }
      
      public static function getRewardTypeString(param1:int, param2:int) : String
      {
         switch(int(param1) - 1)
         {
            case 0:
               return GameUtil.getPremiumCurrencyString(param2);
            case 1:
               return GameUtil.getGuildPremiumCurrencyString(param2);
         }
      }
   }
}
