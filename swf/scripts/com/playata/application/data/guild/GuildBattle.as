package com.playata.application.data.guild
{
   import com.playata.application.data.AppDateTime;
   import com.playata.application.data.dataobject.DOGuildBattle;
   import com.playata.application.data.reward.Reward;
   import com.playata.application.data.user.User;
   import com.playata.framework.core.TypedObject;
   import com.playata.framework.core.collection.IntMap;
   import com.playata.framework.core.util.StringUtil;
   import com.playata.framework.core.util.TimeUtil;
   import com.playata.framework.localization.LocText;
   
   public class GuildBattle extends DOGuildBattle
   {
      
      private static var _joinedAttackMembers:IntMap = new IntMap();
      
      private static var _joinedDefenseMembers:IntMap = new IntMap();
       
      
      private var _characters:Vector.<GuildBattleCharacter> = null;
      
      private var _winnerReward:Reward = null;
      
      private var _loserReward:Reward = null;
      
      private var _battleRounds:Vector.<GuildBattleRound> = null;
      
      public function GuildBattle(param1:DOGuildBattle)
      {
         super(param1);
      }
      
      public static function addJoinedAttackMembers(param1:int) : void
      {
         if(_joinedAttackMembers.exists(param1))
         {
            return;
         }
         _joinedAttackMembers.setData(param1,true);
      }
      
      public static function addJoinedDefenseMembers(param1:int) : void
      {
         if(_joinedDefenseMembers.exists(param1))
         {
            return;
         }
         _joinedDefenseMembers.setData(param1,true);
      }
      
      public static function removeJoinedAttackMembers(param1:int) : void
      {
         if(!_joinedAttackMembers.exists(param1))
         {
            return;
         }
         _joinedAttackMembers.remove(param1);
      }
      
      public static function removeJoinedDefenseMembers(param1:int) : void
      {
         if(!_joinedDefenseMembers.exists(param1))
         {
            return;
         }
         _joinedDefenseMembers.remove(param1);
      }
      
      public static function resetJoinedAttackMembers() : void
      {
         _joinedAttackMembers = new IntMap();
      }
      
      public static function resetJoinedDefenseMembers() : void
      {
         _joinedDefenseMembers = new IntMap();
      }
      
      public function get battleTimeString() : String
      {
         return AppDateTime.getDateTimeString(TimeUtil.localDateTime,tsAttack,1);
      }
      
      public function get loserGuildId() : int
      {
         if(guildWinnerId == guildAttackerId)
         {
            return guildDefenderId;
         }
         return guildAttackerId;
      }
      
      public function get isOwnGuildAttack() : Boolean
      {
         return guildAttackerId == User.current.character.guildId;
      }
      
      public function get isOwnGuildDefense() : Boolean
      {
         return guildDefenderId == User.current.character.guildId;
      }
      
      public function get isOwnGuildWinner() : Boolean
      {
         return guildWinnerId == User.current.character.guildId;
      }
      
      public function get attacker() : Guild
      {
         if(isOwnGuildAttack)
         {
            return User.current.character.guild;
         }
         return Guild.getGuildBattleGuild(guildAttackerId);
      }
      
      public function get defender() : Guild
      {
         if(isOwnGuildDefense)
         {
            return User.current.character.guild;
         }
         return Guild.getGuildBattleGuild(guildDefenderId);
      }
      
      public function get winner() : Guild
      {
         if(isOwnGuildWinner)
         {
            return User.current.character.guild;
         }
         return Guild.getGuildBattleGuild(guildWinnerId);
      }
      
      public function get loser() : Guild
      {
         if(!isOwnGuildWinner)
         {
            return User.current.character.guild;
         }
         return Guild.getGuildBattleGuild(loserGuildId);
      }
      
      public function get ownGuild() : Guild
      {
         return User.current.character.guild;
      }
      
      public function get otherGuild() : Guild
      {
         if(isOwnGuildAttack)
         {
            return Guild.getGuildBattleGuild(guildDefenderId);
         }
         return Guild.getGuildBattleGuild(guildAttackerId);
      }
      
      public function hasJoinedMember(param1:int) : Boolean
      {
         var _loc2_:* = null;
         if(isOwnGuildAttack)
         {
            if(_joinedAttackMembers.getData(param1) === true)
            {
               return true;
            }
         }
         else if(_joinedDefenseMembers.getData(param1) === true)
         {
            return true;
         }
         var _loc3_:String = getString("character_ids");
         if(_loc3_ != "")
         {
            _loc2_ = getFromJson(_loc3_,[]) as Array;
            return _loc2_.indexOf(param1) !== -1;
         }
         return false;
      }
      
      public function get winnerReward() : Reward
      {
         if(_winnerReward == null)
         {
            if(guildWinnerId == guildAttackerId)
            {
               _winnerReward = new Reward(attackerRewards);
            }
            else
            {
               _winnerReward = new Reward(defenderRewards);
            }
         }
         return _winnerReward;
      }
      
      public function get loserReward() : Reward
      {
         if(_loserReward == null)
         {
            if(guildWinnerId == guildAttackerId)
            {
               _loserReward = new Reward(defenderRewards);
            }
            else
            {
               _loserReward = new Reward(attackerRewards);
            }
         }
         return _loserReward;
      }
      
      public function get characterReward() : GuildBattleReward
      {
         return Guild.getGuildBattleReward(id);
      }
      
      public function get hasRounds() : Boolean
      {
         return !StringUtil.isEmpty(rounds);
      }
      
      public function get battleRounds() : Vector.<GuildBattleRound>
      {
         var _loc2_:* = null;
         var _loc3_:* = null;
         if(_battleRounds == null)
         {
            _battleRounds = new Vector.<GuildBattleRound>();
            _loc2_ = TypedObject.fromJsonString(rounds);
            var _loc5_:int = 0;
            var _loc4_:* = _loc2_.keys;
            for each(var _loc1_ in _loc2_.keys)
            {
               _loc3_ = new GuildBattleRound(_loc2_.getData(_loc1_));
               _battleRounds.push(_loc3_);
            }
         }
         return _battleRounds;
      }
      
      public function getCharacter(param1:int) : GuildBattleCharacter
      {
         var _loc4_:* = null;
         var _loc2_:* = null;
         if(_characters == null)
         {
            _characters = new Vector.<GuildBattleCharacter>();
            _loc4_ = TypedObject.fromJsonString(attackerCharacterProfiles);
            _loc2_ = null;
            var _loc7_:int = 0;
            var _loc6_:* = _loc4_.keys;
            for each(var _loc3_ in _loc4_.keys)
            {
               _loc2_ = new GuildBattleCharacter(_loc4_.getData(_loc3_),parseInt(_loc3_),isOwnGuildAttack);
               _characters.push(_loc2_);
            }
            _loc4_ = TypedObject.fromJsonString(defenderCharacterProfiles);
            var _loc9_:int = 0;
            var _loc8_:* = _loc4_.keys;
            for each(_loc3_ in _loc4_.keys)
            {
               _loc2_ = new GuildBattleCharacter(_loc4_.getData(_loc3_),parseInt(_loc3_),isOwnGuildDefense);
               _characters.push(_loc2_);
            }
            _characters.sort(sortByLevelStats);
         }
         var _loc11_:int = 0;
         var _loc10_:* = _characters;
         for each(var _loc5_ in _characters)
         {
            if(_loc5_.id == param1)
            {
               return _loc5_;
            }
         }
         return null;
      }
      
      private function sortByLevelStats(param1:GuildBattleCharacter, param2:GuildBattleCharacter) : int
      {
         if(param1.level < param2.level)
         {
            return -1;
         }
         if(param1.level > param2.level)
         {
            return 1;
         }
         if(param1.totalStats < param2.totalStats)
         {
            return -1;
         }
         if(param1.totalStats > param2.totalStats)
         {
            return 1;
         }
         return param1.id < param2.id?-1:1;
      }
      
      public function getRemainingCharacterNames(param1:GuildBattleCharacter) : String
      {
         if(_characters == null)
         {
            return "";
         }
         var _loc3_:Boolean = param1.isOwnGuildMember;
         var _loc4_:Boolean = false;
         var _loc5_:String = "";
         var _loc6_:int = 0;
         var _loc8_:int = 0;
         var _loc7_:* = _characters;
         for each(var _loc2_ in _characters)
         {
            if(_loc2_.isOwnGuildMember == _loc3_)
            {
               if(_loc2_ == param1)
               {
                  _loc4_ = true;
               }
               else if(_loc4_)
               {
                  _loc6_++;
                  if(_loc6_ <= 5)
                  {
                     if(_loc5_ != "")
                     {
                        _loc5_ = _loc5_ + ("\n" + _loc2_.name);
                     }
                     else
                     {
                        _loc5_ = _loc5_ + _loc2_.name;
                     }
                  }
               }
            }
         }
         if(_loc6_ > 5)
         {
            _loc5_ = _loc5_.substr(0,_loc5_.lastIndexOf("\n") + 1) + LocText.current.text("guild/remaining_characters_more",_loc6_ - 5);
         }
         return _loc5_;
      }
      
      public function endHitPoints(param1:GuildBattleCharacter, param2:int = -1) : int
      {
         var _loc5_:int = param1.hitPoints;
         var _loc3_:int = 0;
         var _loc7_:int = 0;
         var _loc6_:* = battleRounds;
         for each(var _loc4_ in battleRounds)
         {
            if(!(param2 != -1 && param2 <= _loc3_))
            {
               if(_loc4_.attacked == param1.id)
               {
                  _loc5_ = _loc5_ - (_loc4_.damage + _loc4_.dotDamage);
               }
               else if(_loc4_.attacker == param1.id)
               {
                  _loc5_ = _loc5_ - _loc4_.backfireDamage;
               }
               _loc3_++;
               continue;
            }
            break;
         }
         return _loc5_;
      }
      
      public function get ownGuildJoinedMemberCount() : int
      {
         var _loc3_:String = getString("character_ids");
         var _loc1_:Array = getFromJson(_loc3_,[]) as Array;
         var _loc2_:int = _loc1_.length;
         var _loc4_:IntMap = User.current.character.guildId == guildAttackerId?_joinedAttackMembers:_joinedDefenseMembers;
         var _loc7_:int = 0;
         var _loc6_:* = _loc4_;
         for(var _loc5_ in _loc4_)
         {
            if(_loc4_[_loc5_] && _loc1_.indexOf(_loc5_) == -1)
            {
               _loc2_++;
            }
         }
         return _loc2_;
      }
   }
}
