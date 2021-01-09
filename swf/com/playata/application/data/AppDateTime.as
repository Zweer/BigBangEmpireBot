package com.playata.application.data
{
   import com.playata.framework.application.Environment;
   import com.playata.framework.core.util.DateTime;
   import com.playata.framework.core.util.TimeUtil;
   import com.playata.framework.localization.LocText;
   
   public class AppDateTime
   {
       
      
      public function AppDateTime()
      {
         super();
      }
      
      public static function get dateFormat() : String
      {
         return LocText.current.text("general/date_format");
      }
      
      public static function get timeFormatHM() : String
      {
         return LocText.current.text("general/time_format_hm");
      }
      
      public static function getPassedDateTimeString(param1:DateTime, param2:int) : String
      {
         var _loc3_:int = 0;
         var _loc4_:int = 0;
         if(LocText.current == null)
         {
            return null;
         }
         if(param2 + 60 > param1.timestamp)
         {
            return LocText.current.text("general/info_past_seconds");
         }
         if(param2 + 3600 > param1.timestamp)
         {
            _loc3_ = param1.timestamp - param2;
            _loc4_ = Math.floor(_loc3_ / 60);
            return LocText.current.text("general/time_past_minutes",_loc4_);
         }
         if(param1.isToday(param2))
         {
            return LocText.current.text("general/date_time_format",LocText.current.text("guild_battle/today"),AppDateTime.timestampToLocalString(param2,timeFormatHM));
         }
         if(param1.isYesterday(param2))
         {
            return LocText.current.text("general/date_time_format",LocText.current.text("general/date_yesterday"),AppDateTime.timestampToLocalString(param2,timeFormatHM));
         }
         return LocText.current.text("general/date_time_format",AppDateTime.timestampToLocalString(param2,dateFormat),AppDateTime.timestampToLocalString(param2,timeFormatHM));
      }
      
      public static function getPassedShortFormattedTimestamp(param1:int) : String
      {
         if(TimeUtil.localDateTime.isToday(param1))
         {
            return getFormattedTimestampHM(param1);
         }
         if(TimeUtil.localDateTime.isYesterday(param1))
         {
            return LocText.current.text("general/date_time_format",LocText.current.text("general/date_yesterday"),getFormattedTimestampHM(param1));
         }
         return timestampToLocalString(param1,dateFormat);
      }
      
      public static function getDateTimeString(param1:DateTime, param2:int, param3:int = 1) : String
      {
         if(param1.isToday(param2))
         {
            return getFormattedDateTimeToday(param2,param3);
         }
         if(param1.isTomorrow(param2))
         {
            return getFormattedDateTimeTomorrow(param2,param3);
         }
         return getFormattedDateTime(param2,param3);
      }
      
      public static function getShortFormattedDateTimeString(param1:DateTime, param2:int) : String
      {
         if(param1.isToday(param2))
         {
            return LocText.current.text("guild_battle/today_event_log");
         }
         if(param1.isTomorrow(param2))
         {
            return LocText.current.text("guild_battle/tomorrow_event_log");
         }
         return timestampToLocalString(param2,dateFormat);
      }
      
      public static function getFormattedDateTimeToday(param1:int, param2:int = 1) : String
      {
         if(param2 == 2)
         {
            return LocText.current.text("guild_battle/date_time_format_event_log",LocText.current.text("guild_battle/today_event_log"),getFormattedTimestampHM(param1));
         }
         return LocText.current.text("guild_battle/date_time_format",LocText.current.text("guild_battle/today"),getFormattedTimestampHM(param1));
      }
      
      public static function getFormattedDateTimeTomorrow(param1:int, param2:int = 1) : String
      {
         if(param2 == 2)
         {
            return LocText.current.text("guild_battle/date_time_format_event_log",LocText.current.text("guild_battle/tomorrow_event_log"),getFormattedTimestampHM(param1));
         }
         return LocText.current.text("guild_battle/date_time_format",LocText.current.text("guild_battle/tomorrow"),getFormattedTimestampHM(param1));
      }
      
      public static function getFormattedDateTime(param1:int, param2:int = 1) : String
      {
         if(param2 == 2)
         {
            return LocText.current.text("guild_battle/date_time_format_event_log",timestampToLocalString(param1,dateFormat),getFormattedTimestampHM(param1));
         }
         return LocText.current.text("guild_battle/date_time_format",timestampToLocalString(param1,dateFormat),getFormattedTimestampHM(param1));
      }
      
      public static function getFormattedTimestampHM(param1:int) : String
      {
         return timestampToLocalString(param1,timeFormatHM);
      }
      
      public static function timestampToLocalString(param1:int, param2:String, param3:Boolean = false) : String
      {
         if(param3)
         {
            param1 = param1 - TimeUtil.timestampCorrection;
         }
         var _loc4_:DateTime = DateTime.fromTimestamp(param1);
         return _loc4_.format(param2,Environment.info.defaultLocale);
      }
   }
}
