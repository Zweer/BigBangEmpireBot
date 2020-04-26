package com.playata.application.data.guild
{
   import com.playata.application.data.AppDateTime;
   import com.playata.application.data.constants.CConstant;
   import com.playata.framework.core.util.DateTime;
   import com.playata.framework.core.util.TimeUtil;
   
   public class GuildBattleAttackTime
   {
       
      
      private var _guildBattleTime:int = 0;
      
      private var _serverTimestamp:int = 0;
      
      public function GuildBattleAttackTime(param1:int)
      {
         super();
         _guildBattleTime = param1;
         _serverTimestamp = getGuildBattleAttackTimestamp(_guildBattleTime);
      }
      
      public static function calculateBattleAttackTimestamp(param1:int, param2:Boolean) : int
      {
         var _loc4_:int = 0;
         if(param2)
         {
            _loc4_ = 86400;
         }
         var _loc5_:String = DateTime.fromTimestamp(TimeUtil.serverDateTime.timestamp + _loc4_).format("Y-M-D");
         var _loc3_:String = _loc5_ + " " + param1 + ":00:00";
         return DateTime.fromStringServer(_loc3_).timestamp;
      }
      
      public function get guildBattleTime() : int
      {
         return _guildBattleTime;
      }
      
      public function get serverTimestamp() : int
      {
         return _serverTimestamp;
      }
      
      public function get battleAttackTimeString() : String
      {
         return AppDateTime.getDateTimeString(TimeUtil.localDateTime,_serverTimestamp,1);
      }
      
      public function get battleAttackTimeStringEventLog() : String
      {
         return AppDateTime.getDateTimeString(TimeUtil.localDateTime,_serverTimestamp,2);
      }
      
      private function getGuildBattleAttackTimestamp(param1:int) : int
      {
         var _loc2_:int = TimeUtil.serverDateTime.hour;
         var _loc3_:int = CConstant.guild_battle_preparation_time;
         switch(int(param1) - 1)
         {
            case 0:
               return _loc2_ >= 12 - _loc3_?calculateBattleAttackTimestamp(12,true):int(calculateBattleAttackTimestamp(12,false));
            case 1:
               return _loc2_ >= 16 - _loc3_?calculateBattleAttackTimestamp(16,true):int(calculateBattleAttackTimestamp(16,false));
            case 2:
               return _loc2_ >= 18 - _loc3_?calculateBattleAttackTimestamp(18,true):int(calculateBattleAttackTimestamp(18,false));
            case 3:
               return _loc2_ >= 20 - _loc3_?calculateBattleAttackTimestamp(20,true):int(calculateBattleAttackTimestamp(20,false));
            case 4:
               return _loc2_ >= 22 - _loc3_?calculateBattleAttackTimestamp(22,true):int(calculateBattleAttackTimestamp(22,false));
         }
      }
   }
}
