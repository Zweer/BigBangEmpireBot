package com.playata.application.data.guild
{
   import com.playata.application.AppConfig;
   import com.playata.application.AppEnvironment;
   import com.playata.application.data.AppDateTime;
   import com.playata.application.data.character.Character;
   import com.playata.application.data.constants.CConstant;
   import com.playata.application.data.constants.CGuildBackgroundLayer;
   import com.playata.application.data.constants.CGuildBooster;
   import com.playata.application.data.constants.CGuildStatsCapacityCost;
   import com.playata.application.data.constants.CGuildStatsCharacterStatsBoostCoost;
   import com.playata.application.data.constants.CGuildStatsQuestCoinRewardBoostCost;
   import com.playata.application.data.constants.CGuildStatsQuestXPRewardBoostCost;
   import com.playata.application.data.dataobject.DOGuild;
   import com.playata.application.data.dataobject.DOGuildBattle;
   import com.playata.application.data.dataobject.DOGuildBattleReward;
   import com.playata.application.data.dataobject.DOGuildCompetition;
   import com.playata.application.data.dataobject.DOGuildLeaderVote;
   import com.playata.application.data.dataobject.DOGuildMember;
   import com.playata.application.data.user.User;
   import com.playata.application.platform.ServerInfo;
   import com.playata.framework.application.Environment;
   import com.playata.framework.application.request.ActionRequestResponse;
   import com.playata.framework.core.TypedObject;
   import com.playata.framework.core.collection.IntMap;
   import com.playata.framework.core.collection.StringMap;
   import com.playata.framework.core.logging.Logger;
   import com.playata.framework.core.util.AlphaNumericSortUtil;
   import com.playata.framework.core.util.JsonUtil;
   import com.playata.framework.core.util.StringUtil;
   import com.playata.framework.core.util.TimeUtil;
   import com.playata.framework.data.DataObject;
   import com.playata.framework.data.DataObjectArray;
   import com.playata.framework.localization.LocText;
   
   public class Guild extends DOGuild
   {
      
      private static var _guildBattleGuilds:IntMap = new IntMap();
      
      private static var _guildBattleRewards:IntMap = new IntMap();
      
      private static var _receivedLogIds:StringMap = new StringMap();
       
      
      private var _members:Vector.<GuildMember>;
      
      private var _logMessages:Vector.<GuildLogMessage>;
      
      private var _pendingAttackGuildBattle:GuildBattle = null;
      
      private var _pendingDefenseGuildBattle:GuildBattle = null;
      
      private var _leaderVote:GuildLeaderVote = null;
      
      private var _guildCompetition:GuildCompetition = null;
      
      public function Guild(param1:DOGuild)
      {
         _members = new Vector.<GuildMember>();
         _logMessages = new Vector.<GuildLogMessage>();
         super(param1);
      }
      
      public static function fromData(param1:Object) : Guild
      {
         var _loc2_:TypedObject = new TypedObject(param1);
         var _loc3_:Guild = new Guild(new DOGuild(param1.requested_guild));
         if(_loc2_.hasData("requested_guild_members"))
         {
            _loc3_.refreshMembers(new DataObjectArray(param1.requested_guild_members,DOGuildMember));
         }
         return _loc3_;
      }
      
      public static function getGuildBattleGuild(param1:int) : Guild
      {
         return _guildBattleGuilds.getData(param1);
      }
      
      public static function getGuildBattleReward(param1:int) : GuildBattleReward
      {
         return _guildBattleRewards.getData(param1);
      }
      
      public static function resetGuildBattleData() : void
      {
         _guildBattleGuilds = new IntMap();
         _guildBattleRewards = new IntMap();
      }
      
      public static function resestReceivedLogIds() : void
      {
         _receivedLogIds = new StringMap();
      }
      
      public static function getStatName(param1:int) : String
      {
         switch(int(param1) - 1)
         {
            case 0:
               return LocText.current.text("guild/stat_guild_capacity_costs/name");
            case 1:
               return LocText.current.text("guild/stat_character_base_stats_boost_costs/name");
            case 2:
               return LocText.current.text("guild/stat_quest_xp_reward_boost_costs/name");
            case 3:
               return LocText.current.text("guild/stat_quest_game_currency_reward_boost_costs/name");
         }
      }
      
      public static function getRankName(param1:int) : String
      {
         switch(int(param1) - 1)
         {
            case 0:
               return LocText.current.text("guild/rank_leader");
            case 1:
               return LocText.current.text("guild/rank_officer");
            case 2:
               return LocText.current.text("guild/rank_member");
         }
      }
      
      override public function update(param1:TypedObject) : void
      {
         var _loc2_:DOGuild = new DOGuild(param1);
         var _loc3_:Boolean = _loc2_.activeQuestBoosterId === "" && hasData("active_quest_booster_id") && super.activeQuestBoosterId != "";
         if(_loc3_ || User.current && User.current.character && User.current.character.guild == this && _loc2_.activeQuestBoosterId != super.activeQuestBoosterId)
         {
            Environment.application.sendActionRequest("refreshQuests",{},handleRequests);
         }
         super.update(_loc2_);
      }
      
      public function getMember(param1:String, param2:Boolean = false) : GuildMember
      {
         param1 = param1.toLowerCase();
         if(param1.indexOf(",") > 0)
         {
            param1 = param1.substr(0,param1.indexOf(","));
         }
         var _loc5_:int = 0;
         var _loc4_:* = _members;
         for each(var _loc3_ in _members)
         {
            if(!(param2 && _loc3_.isMe))
            {
               if(_loc3_.name.toLowerCase() == param1.toLowerCase())
               {
                  return _loc3_;
               }
            }
         }
         return null;
      }
      
      override public function get locale() : String
      {
         if(super.locale == "")
         {
            return Environment.info.defaultLocale;
         }
         return super.locale;
      }
      
      public function getMemberById(param1:int) : GuildMember
      {
         var _loc4_:int = 0;
         var _loc3_:* = _members;
         for each(var _loc2_ in _members)
         {
            if(_loc2_.id == param1)
            {
               return _loc2_;
            }
         }
         return null;
      }
      
      public function findMember(param1:String, param2:Boolean) : GuildMember
      {
         var _loc3_:* = null;
         var _loc6_:int = 0;
         var _loc5_:* = _members;
         for each(var _loc4_ in _members)
         {
            if(!(param2 && _loc4_.isMe))
            {
               if(_loc4_.name.toLowerCase().indexOf(param1.toLowerCase()) == 0)
               {
                  if(_loc3_ != null)
                  {
                     return null;
                  }
                  _loc3_ = _loc4_;
               }
            }
         }
         return _loc3_;
      }
      
      public function removeMember(param1:GuildMember) : void
      {
         var _loc2_:int = _members.indexOf(param1);
         if(_loc2_ !== -1)
         {
            _members.splice(_loc2_,1);
            if(isOwnGuild)
            {
               AppEnvironment.friendBar.removeFriend(param1.userId,true);
            }
         }
      }
      
      public function refreshMembers(param1:DataObjectArray) : void
      {
         var _loc4_:Boolean = false;
         var _loc8_:int = 0;
         var _loc10_:* = null;
         var _loc6_:* = null;
         var _loc3_:Vector.<GuildMember> = new Vector.<GuildMember>();
         var _loc16_:int = 0;
         var _loc15_:* = _members;
         for each(var _loc2_ in _members)
         {
            _loc4_ = false;
            var _loc14_:int = 0;
            var _loc13_:* = param1;
            for each(var _loc9_ in param1)
            {
               if(_loc9_.id == _loc2_.id)
               {
                  _loc4_ = true;
                  break;
               }
            }
            if(!_loc4_)
            {
               _loc3_.push(_loc2_);
            }
         }
         var _loc18_:int = 0;
         var _loc17_:* = _loc3_;
         for each(var _loc12_ in _loc3_)
         {
            _loc8_ = _members.indexOf(_loc12_);
            if(_loc8_ !== -1)
            {
               _members.splice(_loc8_,1);
               if(isOwnGuild)
               {
                  AppEnvironment.friendBar.removeFriend(_loc12_.userId,true);
               }
            }
         }
         var _loc5_:Boolean = false;
         var _loc22_:int = 0;
         var _loc21_:* = param1;
         for each(var _loc7_ in param1)
         {
            _loc10_ = null;
            var _loc20_:int = 0;
            var _loc19_:* = _members;
            for each(var _loc11_ in _members)
            {
               if(_loc11_.id == _loc7_.id)
               {
                  _loc10_ = _loc11_;
                  _loc10_.update(_loc7_);
                  break;
               }
            }
            if(_loc10_ == null)
            {
               _loc6_ = new GuildMember(_loc7_,this);
               _members.push(_loc6_);
               _loc5_ = true;
            }
         }
         if(_loc5_ && isOwnGuild)
         {
            AppEnvironment.friendBar.syncFriendBar(true);
         }
         _members.sort(sortByRank);
      }
      
      public function refreshPendingGuildBattleAttack(param1:DOGuildBattle) : void
      {
         if(_pendingAttackGuildBattle == null || _pendingAttackGuildBattle.id != param1.id)
         {
            GuildBattle.resetJoinedAttackMembers();
            _pendingAttackGuildBattle = new GuildBattle(param1);
         }
         else
         {
            _pendingAttackGuildBattle.update(param1);
         }
      }
      
      public function refreshPendingGuildBattleDefense(param1:DOGuildBattle) : void
      {
         if(_pendingDefenseGuildBattle == null || _pendingDefenseGuildBattle.id != param1.id)
         {
            GuildBattle.resetJoinedDefenseMembers();
            _pendingDefenseGuildBattle = new GuildBattle(param1);
         }
         else
         {
            _pendingDefenseGuildBattle.update(param1);
         }
      }
      
      public function refreshGuildBattleGuilds(param1:DataObjectArray) : void
      {
         var _loc3_:int = 0;
         var _loc5_:int = 0;
         var _loc4_:* = param1;
         for each(var _loc2_ in param1)
         {
            _loc3_ = _loc2_.id;
            if(!_guildBattleGuilds.exists(_loc3_))
            {
               _guildBattleGuilds.setData(_loc3_,new Guild(_loc2_));
            }
         }
      }
      
      public function refreshGuildBattleRewards(param1:DataObjectArray) : void
      {
         var _loc2_:int = 0;
         var _loc5_:int = 0;
         var _loc4_:* = param1;
         for each(var _loc3_ in param1)
         {
            _loc2_ = _loc3_.guildBattleId;
            if(!_guildBattleRewards.exists(_loc2_))
            {
               _guildBattleRewards.setData(_loc2_,new GuildBattleReward(_loc3_));
            }
         }
      }
      
      public function refreshGuildLeaderVote(param1:DOGuildLeaderVote) : void
      {
         _leaderVote = DataObject.createOrUpdate(GuildLeaderVote,_leaderVote,param1);
      }
      
      public function refreshLogMessages(param1:TypedObject) : void
      {
         var _loc2_:* = null;
         var _loc3_:* = null;
         var _loc6_:int = 0;
         var _loc5_:* = param1.keys;
         for each(var _loc4_ in param1.keys)
         {
            _loc2_ = _loc4_;
            if(param1.hasData("type"))
            {
               _loc2_ = "event" + _loc2_;
            }
            else
            {
               _loc2_ = "chat" + _loc2_;
            }
            if(!_receivedLogIds.exists(_loc2_))
            {
               _loc3_ = new GuildLogMessage(param1.getData(_loc4_),_loc4_);
               _logMessages.push(_loc3_);
               _receivedLogIds.setData(_loc2_,true);
            }
         }
         _logMessages.sort(sortById);
      }
      
      public function refreshGuildCompetition(param1:DOGuildCompetition) : void
      {
         _guildCompetition = DataObject.createOrUpdate(GuildCompetition,_guildCompetition,param1);
      }
      
      private function sortById(param1:GuildLogMessage, param2:GuildLogMessage) : int
      {
         return AlphaNumericSortUtil.compare(param1.id,param2.id);
      }
      
      override public function get name() : String
      {
         return Character.getCleanName(super.name);
      }
      
      public function get foundationDateString() : String
      {
         return AppDateTime.timestampToLocalString(tsCreation,AppDateTime.dateFormat);
      }
      
      public function get hasGuildPageLink() : Boolean
      {
         return !StringUtil.isEmpty(forumPage);
      }
      
      public function get unlockedArtifactSlots() : int
      {
         var _loc2_:Number = totalImprovementPercentage();
         var _loc1_:int = 2;
         if(_loc2_ >= CConstant.guild_artifact_slot3_unlock_percentage * 100)
         {
            _loc1_++;
         }
         if(_loc2_ >= CConstant.guild_artifact_slot4_unlock_percentage * 100)
         {
            _loc1_++;
         }
         if(_loc2_ >= CConstant.guild_artifact_slot5_unlock_percentage * 100)
         {
            _loc1_++;
         }
         return _loc1_;
      }
      
      public function getArtifact(param1:int) : GuildArtifact
      {
         if(artifactsOwnedCurrent - 1 < param1)
         {
            return null;
         }
         return new GuildArtifact(allArtifactIds[param1]);
      }
      
      public function get allArtifactIds() : Vector.<int>
      {
         var _loc1_:TypedObject = TypedObject.fromJsonString(artifactIds);
         return _loc1_.valuesAsInt;
      }
      
      public function get hasAvailableStatPoints() : Boolean
      {
         return statPointsAvailable > 0;
      }
      
      public function get emblemSettings() : GuildEmblemSettings
      {
         return GuildEmblemSettings.fromGuild(this);
      }
      
      public function get arenaSettings() : GuildArenaSettings
      {
         return GuildArenaSettings.fromGuild(this);
      }
      
      public function get hasMinApplyLevel() : Boolean
      {
         return minApplyLevel > 0;
      }
      
      public function get hasMinApplyHonor() : Boolean
      {
         return minApplyHonor > 0;
      }
      
      public function get averageLevel() : int
      {
         var _loc1_:int = 0;
         var _loc4_:int = 0;
         var _loc3_:* = _members;
         for each(var _loc2_ in _members)
         {
            _loc1_ = _loc1_ + _loc2_.level;
         }
         return Math.round(_loc1_ / memberCount);
      }
      
      public function get averageStamina() : int
      {
         var _loc1_:int = 0;
         var _loc4_:int = 0;
         var _loc3_:* = _members;
         for each(var _loc2_ in _members)
         {
            _loc1_ = _loc1_ + _loc2_.statTotalStamina;
         }
         return Math.round(_loc1_ / memberCount);
      }
      
      public function get averageStrength() : int
      {
         var _loc2_:int = 0;
         var _loc4_:int = 0;
         var _loc3_:* = _members;
         for each(var _loc1_ in _members)
         {
            _loc2_ = _loc2_ + _loc1_.statTotalStrength;
         }
         return Math.round(_loc2_ / memberCount);
      }
      
      public function get averageCriticalRating() : int
      {
         var _loc2_:int = 0;
         var _loc4_:int = 0;
         var _loc3_:* = _members;
         for each(var _loc1_ in _members)
         {
            _loc2_ = _loc2_ + _loc1_.statTotalCriticalRating;
         }
         return Math.round(_loc2_ / memberCount);
      }
      
      public function get averageDodgeRating() : int
      {
         var _loc2_:int = 0;
         var _loc4_:int = 0;
         var _loc3_:* = _members;
         for each(var _loc1_ in _members)
         {
            _loc2_ = _loc2_ + _loc1_.statTotalDodgeRating;
         }
         return Math.round(_loc2_ / memberCount);
      }
      
      public function get memberCount() : int
      {
         return _members.length;
      }
      
      public function get members() : Vector.<GuildMember>
      {
         return _members;
      }
      
      public function getMembersSorted(param1:int = 0) : Vector.<GuildMember>
      {
         var _loc2_:Vector.<GuildMember> = _members.concat();
         switch(int(param1))
         {
            case 0:
               _loc2_.sort(sortByRank);
               break;
            case 1:
               _loc2_.sort(sortByPremiumCurrencySpent);
               break;
            case 2:
               _loc2_.sort(sortByGameCurrencySpent);
               break;
            case 3:
               _loc2_.sort(sortByGuildCompetitionPoints);
         }
         return _loc2_;
      }
      
      private function sortByRank(param1:GuildMember, param2:GuildMember) : int
      {
         if(param1.guildRank < param2.guildRank)
         {
            return -1;
         }
         if(param1.guildRank > param2.guildRank)
         {
            return 1;
         }
         if(param1.level > param2.level)
         {
            return -1;
         }
         if(param1.level < param2.level)
         {
            return 1;
         }
         return AlphaNumericSortUtil.compare(param1.name,param2.name);
      }
      
      private function sortByPremiumCurrencySpent(param1:GuildMember, param2:GuildMember) : int
      {
         if(param1.premiumCurrencyDonation < param2.premiumCurrencyDonation)
         {
            return 1;
         }
         if(param1.premiumCurrencyDonation > param2.premiumCurrencyDonation)
         {
            return -1;
         }
         return sortByRank(param1,param2);
      }
      
      private function sortByGameCurrencySpent(param1:GuildMember, param2:GuildMember) : int
      {
         if(param1.gameCurrencyDonation < param2.gameCurrencyDonation)
         {
            return 1;
         }
         if(param1.gameCurrencyDonation > param2.gameCurrencyDonation)
         {
            return -1;
         }
         return sortByRank(param1,param2);
      }
      
      private function sortByGuildCompetitionPoints(param1:GuildMember, param2:GuildMember) : int
      {
         if(param1.guildCompetitionPointsGathered < param2.guildCompetitionPointsGathered)
         {
            return 1;
         }
         if(param1.guildCompetitionPointsGathered > param2.guildCompetitionPointsGathered)
         {
            return -1;
         }
         return sortByRank(param1,param2);
      }
      
      public function get onlineMemberCount() : int
      {
         var _loc1_:int = 0;
         var _loc4_:int = 0;
         var _loc3_:* = _members;
         for each(var _loc2_ in _members)
         {
            if(_loc2_.isOnline)
            {
               _loc1_++;
            }
         }
         return _loc1_;
      }
      
      public function get leader() : GuildMember
      {
         var _loc3_:int = 0;
         var _loc2_:* = _members;
         for each(var _loc1_ in _members)
         {
            if(_loc1_.guildRank == 1)
            {
               return _loc1_;
            }
         }
         return null;
      }
      
      public function get logMessages() : Vector.<GuildLogMessage>
      {
         return _logMessages;
      }
      
      public function get lastReceivedPrivateMessage() : GuildLogMessage
      {
         var _loc1_:* = null;
         var _loc4_:int = 0;
         var _loc3_:* = _logMessages;
         for each(var _loc2_ in _logMessages)
         {
            if(_loc2_.isPrivateMessage)
            {
               _loc1_ = _loc2_;
            }
         }
         return _loc1_;
      }
      
      public function get isOwnGuild() : Boolean
      {
         if(User.current && User.current.character)
         {
            return id == User.current.character.guildId;
         }
         return false;
      }
      
      public function get isFull() : Boolean
      {
         return memberCount >= statGuildCapacity;
      }
      
      public function getStatValue(param1:int) : int
      {
         switch(int(param1) - 1)
         {
            case 0:
               return statGuildCapacity;
            case 1:
               return statCharacterBaseStatsBoost;
            case 2:
               return statQuestXpRewardBoost;
            case 3:
               return statQuestGameCurrencyRewardBoost;
         }
      }
      
      public function getStatImprovementCostGameCurrency(param1:int, param2:int) : int
      {
         switch(int(param1) - 1)
         {
            case 0:
               return CGuildStatsCapacityCost.fromId(param2).gameCurrencyCost;
            case 1:
               return CGuildStatsCharacterStatsBoostCoost.fromId(param2).gameCurrencyCost;
            case 2:
               return CGuildStatsQuestXPRewardBoostCost.fromId(param2).gameCurrencyCost;
            case 3:
               return CGuildStatsQuestCoinRewardBoostCost.fromId(param2).gameCurrencyCost;
         }
      }
      
      public function getStatImprovementCostPremiumCurrency(param1:int, param2:int) : int
      {
         switch(int(param1) - 1)
         {
            case 0:
               return CGuildStatsCapacityCost.fromId(param2).premiumCurrencyCost;
            case 1:
               return CGuildStatsCharacterStatsBoostCoost.fromId(param2).premiumCurrencyCost;
            case 2:
               return CGuildStatsQuestXPRewardBoostCost.fromId(param2).premiumCurrencyCost;
            case 3:
               return CGuildStatsQuestCoinRewardBoostCost.fromId(param2).premiumCurrencyCost;
         }
      }
      
      public function totalImprovementPercentage(param1:Number = 0) : Number
      {
         var _loc2_:Number = CConstant.guild_percentage_total_base;
         var _loc4_:Number = statGuildCapacity + statCharacterBaseStatsBoost + statQuestXpRewardBoost + statQuestGameCurrencyRewardBoost + param1;
         var _loc3_:Number = _loc4_ / _loc2_ * 100;
         return _loc3_;
      }
      
      public function get totalImprovementPercentageString() : String
      {
         var _loc1_:int = Math.floor(totalImprovementPercentage());
         return _loc1_.toString();
      }
      
      public function getGuildBoosterCostGameCurrency() : int
      {
         return CConstant.guild_booster_cost_game_currency_per_improvement * statGuildCapacity;
      }
      
      public function getGuildBoosterCostPremiumCurrency() : int
      {
         return CConstant.guild_booster_cost_premium_currency;
      }
      
      public function get currentStudioAppearance() : StudioAppearanceSettings
      {
         var _loc1_:StudioAppearanceSettings = new StudioAppearanceSettings({});
         _loc1_.room = getString("studio_room");
         _loc1_.quarter = getString("studio_quarter");
         _loc1_.motivation = getString("studio_motivation");
         _loc1_.popularity = getString("studio_popularity");
         _loc1_.equipment = getString("studio_equipment");
         _loc1_.actors_left = getString("studio_actors_left");
         _loc1_.actors_right = getString("studio_actors_right");
         return _loc1_;
      }
      
      public function get backgroundLayerMovieUrls() : Vector.<String>
      {
         if(AppConfig.customGuildBackgroundsEnabled)
         {
            return backgroundLayerMovieUrlsNew;
         }
         return backgroundLayerMovieUrlsDefault;
      }
      
      private function get backgroundLayerMovieUrlsNew() : Vector.<String>
      {
         return ServerInfo.studioBackgroundUrlsBySettings(currentStudioAppearance);
      }
      
      private function get backgroundLayerMovieUrlsDefault() : Vector.<String>
      {
         var _loc11_:* = null;
         var _loc4_:Number = totalImprovementPercentage();
         var _loc9_:Number = statQuestXpRewardBoost;
         var _loc6_:Number = statQuestGameCurrencyRewardBoost;
         var _loc10_:Number = statCharacterBaseStatsBoost;
         var _loc1_:Number = statGuildCapacity;
         var _loc5_:Number = totalImprovementPercentage();
         var _loc14_:Number = totalImprovementPercentage();
         var _loc16_:* = null;
         var _loc15_:* = null;
         var _loc12_:* = null;
         var _loc17_:* = null;
         var _loc8_:* = null;
         var _loc7_:* = null;
         var _loc3_:* = null;
         var _loc19_:int = 0;
         var _loc18_:* = CGuildBackgroundLayer.ids;
         for each(var _loc13_ in CGuildBackgroundLayer.ids)
         {
            _loc11_ = CGuildBackgroundLayer.fromId(_loc13_);
            if(_loc11_.isDefault)
            {
               if(_loc11_.type == "room" && _loc11_.value <= _loc4_)
               {
                  if(_loc16_ == null || _loc16_.value < _loc11_.value)
                  {
                     _loc16_ = _loc11_;
                  }
               }
               if(_loc11_.type == "actors_left" && _loc11_.value <= _loc5_)
               {
                  if(_loc7_ == null || _loc7_.value < _loc11_.value)
                  {
                     _loc7_ = _loc11_;
                  }
               }
               else if(_loc11_.type == "actors_right" && _loc11_.value <= _loc14_)
               {
                  if(_loc3_ == null || _loc3_.value < _loc11_.value)
                  {
                     _loc3_ = _loc11_;
                  }
               }
               else if(_loc11_.type == "equipment" && _loc11_.value <= _loc10_)
               {
                  if(_loc17_ == null || _loc17_.value < _loc11_.value)
                  {
                     _loc17_ = _loc11_;
                  }
               }
               else if(_loc11_.type == "motivation" && _loc11_.value <= _loc6_)
               {
                  if(_loc12_ == null || _loc12_.value < _loc11_.value)
                  {
                     _loc12_ = _loc11_;
                  }
               }
               else if(_loc11_.type == "popularity" && _loc11_.value <= _loc9_)
               {
                  if(_loc15_ == null || _loc15_.value < _loc11_.value)
                  {
                     _loc15_ = _loc11_;
                  }
               }
               else if(_loc11_.type == "quarter" && _loc11_.value <= _loc1_)
               {
                  if(_loc8_ == null || _loc8_.value < _loc11_.value)
                  {
                     _loc8_ = _loc11_;
                  }
               }
            }
         }
         var _loc2_:StudioAppearanceSettings = new StudioAppearanceSettings({});
         if(_loc16_ != null)
         {
            _loc2_.room = _loc16_.assetIdentifier;
         }
         if(_loc8_ != null)
         {
            _loc2_.quarter = _loc8_.assetIdentifier;
         }
         if(_loc12_ != null)
         {
            _loc2_.motivation = _loc12_.assetIdentifier;
         }
         if(_loc15_ != null)
         {
            _loc2_.popularity = _loc15_.assetIdentifier;
         }
         if(_loc17_ != null)
         {
            _loc2_.equipment = _loc17_.assetIdentifier;
         }
         if(_loc7_ != null)
         {
            _loc2_.actors_left = _loc7_.assetIdentifier;
         }
         if(_loc3_ != null)
         {
            _loc2_.actors_right = _loc3_.assetIdentifier;
         }
         return ServerInfo.studioBackgroundUrlsBySettings(_loc2_);
      }
      
      public function getNextOpticalChangeLevel(param1:int) : int
      {
         var _loc4_:* = null;
         var _loc2_:String = null;
         var _loc3_:* = 0;
         switch(int(param1) - 1)
         {
            case 0:
               _loc2_ = "quarter";
               _loc3_ = Number(statGuildCapacity);
               break;
            case 1:
               _loc2_ = "equipment";
               _loc3_ = Number(statCharacterBaseStatsBoost);
               break;
            case 2:
               _loc2_ = "motivation";
               _loc3_ = Number(statQuestXpRewardBoost);
               break;
            case 3:
               _loc2_ = "popularity";
               _loc3_ = Number(statQuestGameCurrencyRewardBoost);
         }
         var _loc7_:int = 0;
         var _loc6_:* = CGuildBackgroundLayer.ids;
         for each(var _loc5_ in CGuildBackgroundLayer.ids)
         {
            _loc4_ = CGuildBackgroundLayer.fromId(_loc5_);
            if(_loc4_.type == _loc2_ && _loc4_.value > _loc3_)
            {
               return _loc4_.value;
            }
         }
         return 0;
      }
      
      public function isNextImprovementOpticalChange() : Boolean
      {
         var _loc3_:* = null;
         var _loc1_:Number = totalImprovementPercentage();
         var _loc2_:Number = totalImprovementPercentage(1);
         var _loc6_:int = 0;
         var _loc5_:* = CGuildBackgroundLayer.ids;
         for each(var _loc4_ in CGuildBackgroundLayer.ids)
         {
            _loc3_ = CGuildBackgroundLayer.fromId(_loc4_);
            if(_loc3_.type == "room" && (_loc3_.value > _loc1_ && _loc3_.value <= _loc2_))
            {
               return true;
            }
         }
         return false;
      }
      
      public function get isAttacking() : Boolean
      {
         return pendingAttackGuildBattle != null;
      }
      
      public function get isDefending() : Boolean
      {
         return pendingDefenseGuildBattle != null;
      }
      
      public function get pendingAttackGuildBattle() : GuildBattle
      {
         if(_pendingAttackGuildBattle == null)
         {
            return null;
         }
         if(_pendingAttackGuildBattle.status != 1)
         {
            return null;
         }
         if(_pendingAttackGuildBattle.id != pendingGuildBattleAttackId)
         {
            return null;
         }
         return _pendingAttackGuildBattle;
      }
      
      public function get pendingDefenseGuildBattle() : GuildBattle
      {
         if(_pendingDefenseGuildBattle == null)
         {
            return null;
         }
         if(_pendingDefenseGuildBattle.status != 1)
         {
            return null;
         }
         if(_pendingDefenseGuildBattle.id != pendingGuildBattleDefenseId)
         {
            return null;
         }
         return _pendingDefenseGuildBattle;
      }
      
      public function get hasPendingLeaderVote() : Boolean
      {
         return _leaderVote != null && pendingLeaderVoteId > 0;
      }
      
      public function get leaderVote() : GuildLeaderVote
      {
         return _leaderVote;
      }
      
      public function get guildCompetition() : GuildCompetition
      {
         return _guildCompetition;
      }
      
      public function getFreeCustomizations(param1:String = "") : Vector.<String>
      {
         var _loc4_:* = null;
         var _loc3_:String = getString("studio_free_customizations");
         var _loc5_:Array = [];
         if(_loc3_ != "")
         {
            try
            {
               _loc5_ = JsonUtil.decode(_loc3_);
            }
            catch(e:Error)
            {
               Logger.debug("[Guild] Exception: \'" + e.message + "\'");
               Logger.debug("[Guild] JSON: \'" + _loc3_ + "\'");
               _loc5_ = [];
            }
         }
         var _loc2_:Vector.<String> = new Vector.<String>(0);
         var _loc10_:int = 0;
         var _loc9_:* = CGuildBackgroundLayer.ids;
         for each(var _loc6_ in CGuildBackgroundLayer.ids)
         {
            _loc4_ = CGuildBackgroundLayer.fromId(_loc6_);
            if((param1 == "" || _loc4_.type == param1) && _loc5_.indexOf(_loc4_.assetIdentifier) >= 0)
            {
               _loc2_.push(_loc4_.assetIdentifier);
            }
         }
         return _loc2_;
      }
      
      public function get questBoosterActive() : Boolean
      {
         return super.activeQuestBoosterId != "" && tsActiveQuestBoostExpires > TimeUtil.now;
      }
      
      override public function get activeQuestBoosterId() : String
      {
         if(hasData("ts_active_quest_boost_expires") && !questBoosterActive)
         {
            return "";
         }
         return super.activeQuestBoosterId;
      }
      
      public function get activeQuestBoosterAmount() : int
      {
         if(hasData("ts_active_quest_boost_expires") && !questBoosterActive)
         {
            return 0;
         }
         var _loc1_:String = activeQuestBoosterId;
         if(_loc1_ == "")
         {
            return 0;
         }
         return CGuildBooster.fromId(_loc1_).amount;
      }
      
      public function get duelBoosterActive() : Boolean
      {
         return super.activeDuelBoosterId != "" && tsActiveDuelBoostExpires > TimeUtil.now;
      }
      
      override public function get activeDuelBoosterId() : String
      {
         if(hasData("ts_active_duel_boost_expires") && !duelBoosterActive)
         {
            return "";
         }
         return super.activeDuelBoosterId;
      }
      
      public function get activeDuelBoosterAmount() : int
      {
         if(hasData("ts_active_duel_boost_expires") && !duelBoosterActive)
         {
            return 0;
         }
         var _loc1_:String = activeDuelBoosterId;
         if(_loc1_ == "")
         {
            return 0;
         }
         return CGuildBooster.fromId(_loc1_).amount;
      }
      
      private function handleRequests(param1:ActionRequestResponse) : void
      {
         var _loc2_:* = param1.action;
         if("refreshQuests" !== _loc2_)
         {
            throw new Error("Unsupported request action \'" + param1.action + "\'!");
         }
         if(param1.error == "")
         {
            Environment.application.updateData(param1.data);
         }
         else
         {
            Environment.reportError(param1.error,param1.request,false);
         }
      }
   }
}
