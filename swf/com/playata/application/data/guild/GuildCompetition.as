package com.playata.application.data.guild
{
   import com.playata.application.data.AppDateTime;
   import com.playata.application.data.constants.CGuildCompetition;
   import com.playata.application.data.dataobject.DOGuildCompetition;
   import com.playata.application.platform.ServerInfo;
   import com.playata.framework.core.TypedObject;
   import com.playata.framework.core.util.DateTime;
   import com.playata.framework.core.util.TimeUtil;
   import com.playata.framework.localization.LocText;
   
   public class GuildCompetition extends DOGuildCompetition
   {
      
      private static var _currentIdentifier:String = null;
       
      
      private var _tsLastUpdate:int = 0;
      
      public function GuildCompetition(param1:DOGuildCompetition)
      {
         super(param1);
         currentIdentifier = identifier;
      }
      
      public static function get currentIdentifier() : String
      {
         return _currentIdentifier;
      }
      
      public static function set currentIdentifier(param1:String) : void
      {
         _currentIdentifier = param1;
      }
      
      override public function update(param1:TypedObject) : void
      {
         super.update(param1);
         currentIdentifier = identifier;
         _tsLastUpdate = TimeUtil.now;
      }
      
      public function get tsStart() : int
      {
         return getInt("ts_start");
      }
      
      public function get objectives() : Object
      {
         return CGuildCompetition.constantsData[identifier]["objectives"];
      }
      
      public function hasObjectiveWithItem(param1:String) : Boolean
      {
         var _loc3_:* = null;
         var _loc2_:* = null;
         var _loc6_:int = 0;
         var _loc5_:* = objectives;
         for each(var _loc4_ in objectives)
         {
            _loc3_ = new TypedObject(_loc4_);
            if(_loc3_.getInt("type") == 14)
            {
               _loc2_ = _loc3_.getString("reference");
               if(_loc2_ != "" && _loc2_ != "all")
               {
                  if(_loc2_.split(";").indexOf(param1) >= 0)
                  {
                     return true;
                  }
                  continue;
               }
               return true;
            }
         }
         return false;
      }
      
      public function get rank() : int
      {
         return getInt("rank");
      }
      
      public function get score() : int
      {
         return getInt("score");
      }
      
      public function get guildsWithRewards() : int
      {
         return getInt("guilds_with_rewards");
      }
      
      public function get hasGuildsWithRewards() : Boolean
      {
         return hasData("guilds_with_rewards");
      }
      
      public function get guildsSameScore() : int
      {
         return getInt("guilds_same_score");
      }
      
      public function get hasGuildsSameScore() : Boolean
      {
         return hasData("guilds_same_score") && guildsSameScore > 0;
      }
      
      public function get guildsHigherScore() : Object
      {
         return getData("guilds_higher_score") as Object;
      }
      
      public function get hasGuildsHigherScore() : Boolean
      {
         return hasData("guilds_higher_score") && guildsHigherScore != null;
      }
      
      public function get guildsHigherScoreEmplemSettings() : GuildEmblemSettings
      {
         return new GuildEmblemSettings(guildsHigherScore.emblem_background_shape,guildsHigherScore.emblem_background_color,guildsHigherScore.emblem_background_border_color,guildsHigherScore.emblem_icon_shape,guildsHigherScore.emblem_icon_color,guildsHigherScore.emblem_icon_size);
      }
      
      public function get guildsHigherScoreScore() : int
      {
         return guildsHigherScore.score as int;
      }
      
      public function get guildsHigherScoreGuildCount() : int
      {
         return guildsHigherScore.guild_count as int;
      }
      
      public function get guildsHigherScoreGuildName() : String
      {
         return guildsHigherScore.guild_name as String;
      }
      
      public function get guildsLowerScore() : Object
      {
         return getData("guilds_lower_score") as Object;
      }
      
      public function get hasGuildsLowerScore() : Boolean
      {
         return hasData("guilds_lower_score") && guildsLowerScore != null;
      }
      
      public function get guildsLowerScoreEmplemSettings() : GuildEmblemSettings
      {
         return new GuildEmblemSettings(guildsLowerScore.emblem_background_shape,guildsLowerScore.emblem_background_color,guildsLowerScore.emblem_background_border_color,guildsLowerScore.emblem_icon_shape,guildsLowerScore.emblem_icon_color,guildsLowerScore.emblem_icon_size);
      }
      
      public function get guildsLowerScoreScore() : int
      {
         return guildsLowerScore.score as int;
      }
      
      public function get guildsLowerScoreGuildCount() : int
      {
         return guildsLowerScore.guild_count as int;
      }
      
      public function get guildsLowerScoreGuildName() : String
      {
         return guildsLowerScore.guild_name as String;
      }
      
      public function get isStarted() : Boolean
      {
         return status == 1;
      }
      
      public function get isFinished() : Boolean
      {
         return status == 2;
      }
      
      public function get remainingSeconds() : int
      {
         return tsEnd - TimeUtil.now;
      }
      
      public function get isActive() : Boolean
      {
         return remainingSeconds > 0 && isStarted;
      }
      
      public function get timeRemainingString() : String
      {
         var _loc2_:Number = remainingSeconds;
         var _loc1_:Vector.<int> = new Vector.<int>(0);
         _loc1_.push(Math.floor(_loc2_ / 86400));
         _loc1_.push(Math.floor(_loc2_ / 3600 % 24));
         if(_loc1_[0] > 0)
         {
            return TimeUtil.getDayString(_loc1_[0]) + ", " + TimeUtil.getHourString(_loc1_[1]);
         }
         return TimeUtil.secondsToString(remainingSeconds);
      }
      
      public function get timeRemainingStringShort() : String
      {
         var _loc2_:Number = remainingSeconds;
         var _loc1_:Vector.<int> = new Vector.<int>(0);
         _loc1_.push(Math.floor(_loc2_ / 86400));
         _loc1_.push(Math.floor(_loc2_ / 3600 % 24));
         if(_loc1_[0] > 0)
         {
            return TimeUtil.getDayString(_loc1_[0]);
         }
         if(_loc1_[1] > 0)
         {
            return TimeUtil.getHourString(_loc1_[1]);
         }
         return TimeUtil.secondsToString(remainingSeconds,true,true);
      }
      
      public function get flavorText() : String
      {
         return LocText.current.text("guild_competition/" + identifier + "/flavor_text");
      }
      
      public function get descriptionText() : String
      {
         return LocText.current.text("guild_competition/" + identifier + "/description_text");
      }
      
      public function getScoreInfoText(param1:Object) : String
      {
         return LocText.current.text("guild_competition/" + identifier + "/" + param1.objective_identifier + "/score_info",param1.multiplier);
      }
      
      public function get npcImageUrl() : String
      {
         return ServerInfo.assetURL("guild_competition/" + identifier + "_i","png");
      }
      
      public function get hasConventionData() : Boolean
      {
         return hasData("convention_start_times");
      }
      
      public function get conventionStartTimes() : String
      {
         var _loc2_:int = 0;
         var _loc4_:int = 0;
         var _loc3_:int = 0;
         var _loc6_:Vector.<int> = new Vector.<int>(0);
         if(hasData("convention_start_times"))
         {
            _loc2_ = TimeUtil.now;
            var _loc8_:int = 0;
            var _loc7_:* = getData("convention_start_times");
            for each(var _loc5_ in getData("convention_start_times"))
            {
               _loc4_ = DateTime.fromStringServer(_loc5_).timestamp;
               if(_loc4_ > _loc2_)
               {
                  _loc6_.push(_loc4_);
                  if(_loc6_.length < 3)
                  {
                     continue;
                  }
                  break;
               }
            }
         }
         var _loc1_:String = "";
         _loc3_ = 0;
         while(_loc3_ < _loc6_.length)
         {
            if(_loc3_ > 0)
            {
               _loc1_ = _loc1_ + "\n";
            }
            _loc1_ = _loc1_ + AppDateTime.getDateTimeString(TimeUtil.localDateTime,_loc6_[_loc3_],1);
            _loc3_++;
         }
         return _loc1_;
      }
      
      public function get remainingConventionStartTimes() : int
      {
         var _loc1_:int = 0;
         var _loc2_:int = 0;
         var _loc4_:int = 0;
         if(hasData("convention_start_times"))
         {
            _loc1_ = TimeUtil.now;
            var _loc6_:int = 0;
            var _loc5_:* = getData("convention_start_times");
            for each(var _loc3_ in getData("convention_start_times"))
            {
               _loc2_ = DateTime.fromStringServer(_loc3_).timestamp;
               if(_loc2_ > _loc1_)
               {
                  _loc4_++;
               }
            }
         }
         return _loc4_;
      }
      
      public function get tsLastUpdate() : int
      {
         return _tsLastUpdate;
      }
   }
}
