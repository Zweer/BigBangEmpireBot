package com.playata.application.data.server
{
   import com.playata.application.data.user.User;
   import com.playata.framework.core.TypedObject;
   
   public class SyncStates
   {
      
      private static var _data:TypedObject = TypedObject.empty;
      
      private static var _pendingSyncGame:Boolean = false;
      
      private static var _pendingGetGuildLog:Boolean = false;
      
      private static var _lastSyncGameTimestamp:int = 0;
       
      
      public function SyncStates()
      {
         super();
      }
      
      public static function set pendingSyncGame(param1:Boolean) : void
      {
         _pendingSyncGame = param1;
      }
      
      public static function set pendingGetGuildLog(param1:Boolean) : void
      {
         _pendingGetGuildLog = param1;
      }
      
      public static function refresh(param1:TypedObject) : void
      {
         var _loc4_:int = 0;
         var _loc3_:* = param1.keys;
         for each(var _loc2_ in param1.keys)
         {
            _data.setData(_loc2_,param1.getData(_loc2_));
            if(_loc2_.indexOf("guild") === 0)
            {
               _data.setData("syncgame_" + _loc2_,param1.getData(_loc2_));
               _data.setData("getguildlog_" + _loc2_,param1.getData(_loc2_));
            }
         }
      }
      
      public static function getData(param1:String) : int
      {
         return _data.getInt(param1);
      }
      
      public static function reset() : void
      {
         _data = TypedObject.empty;
      }
      
      public static function get syncGameData() : TypedObject
      {
         var _loc5_:int = 0;
         var _loc3_:int = 0;
         var _loc2_:TypedObject = TypedObject.empty;
         if(!User.current || !User.current.character)
         {
            return _loc2_;
         }
         var _loc6_:int = getData("server");
         if(_loc6_)
         {
            _loc2_.setInt("sync_server",_loc6_);
         }
         var _loc4_:int = getData("user" + User.current.id);
         if(_loc4_)
         {
            _loc2_.setInt("sync_user" + User.current.id,_loc4_);
         }
         var _loc1_:int = getData("character" + User.current.character.id);
         if(_loc1_)
         {
            _loc2_.setInt("sync_character" + User.current.character.id,_loc1_);
         }
         if(User.current.character.hasGuild)
         {
            _loc5_ = getData("syncgame_guild" + User.current.character.guildId);
            if(_loc5_)
            {
               _loc2_.setInt("sync_guild" + User.current.character.guildId,_loc5_);
            }
         }
         if(User.current.character.conventionId)
         {
            _loc3_ = getData("convention" + User.current.character.conventionId);
            _loc2_.setInt("sync_convention_id",User.current.character.conventionId);
            if(_loc3_)
            {
               _loc2_.setInt("sync_convention" + User.current.character.conventionId,_loc3_);
            }
         }
         _loc2_.setBoolean("force_sync",needsForcedSyncGame);
         return _loc2_;
      }
      
      public static function get needsForcedSyncGame() : Boolean
      {
         if(_pendingSyncGame)
         {
            return true;
         }
         if(User.current.character.hasExpiredQuestBooster || User.current.character.hasExpiredStatsBooster || User.current.character.hasExpiredWorkBooster || User.current.character.hasExpiredSenseBooster || User.current.character.hasExpiredMultitaskingBooster)
         {
            return true;
         }
         if(User.current.character.hasGuild && User.current.character.guild.hasPendingLeaderVote && User.current.character.guild.leaderVote.isRunning && User.current.character.guild.leaderVote.remainingSeconds <= 0)
         {
            return true;
         }
         return false;
      }
      
      public static function get isSyncGameDataSynced() : Boolean
      {
         var _loc4_:int = 0;
         var _loc2_:int = 0;
         if(!User.current || !User.current.character)
         {
            return true;
         }
         if(needsForcedSyncGame)
         {
            return false;
         }
         var _loc5_:int = getData("server");
         if(!_loc5_)
         {
            return false;
         }
         var _loc3_:int = getData("user" + User.current.id);
         if(!_loc3_)
         {
            return false;
         }
         var _loc1_:int = getData("character" + User.current.character.id);
         if(!_loc1_)
         {
            return false;
         }
         if(User.current.character.hasGuild)
         {
            _loc4_ = getData("syncgame_guild" + User.current.character.guildId);
            if(!_loc4_)
            {
               return false;
            }
         }
         if(User.current.character.conventionId)
         {
            _loc2_ = getData("convention" + User.current.character.conventionId);
            if(!_loc2_)
            {
               return false;
            }
         }
         return true;
      }
      
      public static function updateSyncGameDataInfo(param1:int) : void
      {
         _lastSyncGameTimestamp = param1;
      }
      
      public static function get syncGuildData() : TypedObject
      {
         var _loc1_:TypedObject = TypedObject.empty;
         if(!User.current || !User.current.character)
         {
            return _loc1_;
         }
         if(!User.current.character.hasGuild)
         {
            return _loc1_;
         }
         var _loc2_:int = getData("guild" + User.current.character.guildId);
         if(_loc2_)
         {
            _loc1_.setInt("sync_guild" + User.current.character.guildId,_loc2_);
         }
         return _loc1_;
      }
      
      public static function getGuildLogData(param1:Boolean) : TypedObject
      {
         var _loc3_:TypedObject = new TypedObject({"init_request":param1});
         if(!User.current || !User.current.character)
         {
            return _loc3_;
         }
         if(!User.current.character.hasGuild)
         {
            return _loc3_;
         }
         var _loc2_:int = getData("getguildlog_guild" + User.current.character.guildId);
         if(_loc2_)
         {
            _loc3_.setInt("sync_guild" + User.current.character.guildId,_loc2_);
         }
         return _loc3_;
      }
      
      public static function get needsForcedGetGuildLog() : Boolean
      {
         if(_pendingGetGuildLog)
         {
            return true;
         }
         return false;
      }
      
      public static function get isGetGuildLogDataSynced() : Boolean
      {
         if(!User.current || !User.current.character)
         {
            return true;
         }
         if(!User.current.character.hasGuild)
         {
            return true;
         }
         if(needsForcedGetGuildLog)
         {
            return false;
         }
         var _loc1_:int = getData("getguildlog_guild" + User.current.character.guildId);
         if(_loc1_)
         {
            return true;
         }
         return false;
      }
   }
}
