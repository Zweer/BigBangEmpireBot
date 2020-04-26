package com.playata.application.data.guild
{
   import com.playata.application.data.constants.CConstant;
   import com.playata.application.data.dataobject.DOGuildLeaderVote;
   import com.playata.application.data.user.User;
   import com.playata.framework.core.TypedObject;
   import com.playata.framework.core.collection.IntMap;
   import com.playata.framework.core.util.TimeUtil;
   
   public class GuildLeaderVote extends DOGuildLeaderVote
   {
       
      
      private var _allAllowedCharacterIds:Vector.<int> = null;
      
      private var _allVoteResults:IntMap = null;
      
      public function GuildLeaderVote(param1:DOGuildLeaderVote)
      {
         super(param1);
      }
      
      override public function update(param1:TypedObject) : void
      {
         super.update(param1);
         _allVoteResults = null;
      }
      
      public function get isRunning() : Boolean
      {
         return status == 1;
      }
      
      public function get isFinished() : Boolean
      {
         return status == 2;
      }
      
      public function isAllowedToVote(param1:int) : Boolean
      {
         return allAllowedCharacterIds.indexOf(param1) != -1;
      }
      
      public function get allAllowedCharacterIds() : Vector.<int>
      {
         var _loc1_:* = null;
         if(_allAllowedCharacterIds == null)
         {
            _allAllowedCharacterIds = new Vector.<int>();
            _loc1_ = TypedObject.fromJsonString(allowedCharacterIds);
            var _loc4_:int = 0;
            var _loc3_:* = _loc1_.valuesAsInt;
            for each(var _loc2_ in _loc1_.valuesAsInt)
            {
               _allAllowedCharacterIds.push(_loc2_);
            }
         }
         return _allAllowedCharacterIds;
      }
      
      public function hasAlreadyVoted(param1:int) : Boolean
      {
         return allVoteResults.exists(param1);
      }
      
      public function get allVoteResults() : IntMap
      {
         var _loc2_:* = null;
         if(_allVoteResults == null)
         {
            _allVoteResults = new IntMap();
            _loc2_ = TypedObject.fromJsonString(voteResults);
            var _loc4_:int = 0;
            var _loc3_:* = _loc2_.keys;
            for each(var _loc1_ in _loc2_.keys)
            {
               _allVoteResults.setData(parseInt(_loc1_),_loc2_.getInt(_loc1_));
            }
         }
         return _allVoteResults;
      }
      
      public function get isVoteResultNewLeader() : Boolean
      {
         if(currentVoteOutVotes < neededVotes)
         {
            return false;
         }
         if(!voteResultNewLeader)
         {
            return false;
         }
         return voteResultNewLeader.id != currentLeaderCharacterId;
      }
      
      public function get voteResultNewLeader() : GuildMember
      {
         var _loc3_:int = 0;
         var _loc1_:IntMap = new IntMap();
         var _loc8_:int = 0;
         var _loc7_:* = allVoteResults;
         for(var _loc4_ in allVoteResults)
         {
            _loc3_ = allVoteResults.getData(_loc4_);
            if(_loc3_ != 0)
            {
               if(User.current.character.guild.getMemberById(_loc3_) != null)
               {
                  if(!_loc1_.exists(_loc3_))
                  {
                     _loc1_.setData(_loc3_,0);
                  }
                  _loc1_.setData(_loc3_,_loc1_.getData(_loc3_) + 1);
               }
            }
         }
         var _loc5_:int = 0;
         var _loc2_:* = 0;
         var _loc10_:int = 0;
         var _loc9_:* = _loc1_;
         for(var _loc6_ in _loc1_)
         {
            if(_loc1_.getData(_loc6_) > _loc5_)
            {
               _loc5_ = _loc1_.getData(_loc6_);
               _loc2_ = _loc6_;
            }
         }
         return User.current.character.guild.getMemberById(_loc2_);
      }
      
      public function get currentKeepVotes() : int
      {
         var _loc2_:int = 0;
         var _loc1_:int = 0;
         var _loc5_:int = 0;
         var _loc4_:* = allVoteResults;
         for(var _loc3_ in allVoteResults)
         {
            _loc2_ = allVoteResults.getData(_loc3_);
            if(_loc2_ != 0)
            {
               if(User.current.character.guild.getMemberById(_loc2_) != null)
               {
                  if(_loc2_ == currentLeaderCharacterId)
                  {
                     _loc1_++;
                  }
               }
            }
         }
         return _loc1_;
      }
      
      public function get currentVoteOutVotes() : int
      {
         var _loc2_:int = 0;
         var _loc1_:int = 0;
         var _loc5_:int = 0;
         var _loc4_:* = allVoteResults;
         for(var _loc3_ in allVoteResults)
         {
            _loc2_ = allVoteResults.getData(_loc3_);
            if(_loc2_ == 0)
            {
               _loc1_++;
            }
            else if(User.current.character.guild.getMemberById(_loc2_) != null)
            {
               if(_loc2_ != currentLeaderCharacterId)
               {
                  _loc1_++;
               }
            }
         }
         return _loc1_;
      }
      
      public function get currentVoteCount() : int
      {
         return allVoteResults.length;
      }
      
      public function get currentKeepPercentage() : int
      {
         var _loc1_:int = currentVoteCount;
         if(_loc1_ == 0)
         {
            return 0;
         }
         return Math.round(currentKeepVotes / _loc1_ * 100);
      }
      
      public function get currentVoteOutPercentage() : int
      {
         var _loc1_:int = currentVoteCount;
         if(_loc1_ == 0)
         {
            return 0;
         }
         return Math.round(currentVoteOutVotes / _loc1_ * 100);
      }
      
      public function get neededVotes() : int
      {
         return Math.ceil(allAllowedCharacterIds.length / 2) as int;
      }
      
      public function get initiator() : GuildMember
      {
         return getMember(initiatorCharacterId);
      }
      
      public function get currentLeader() : GuildMember
      {
         try
         {
            var _loc2_:* = User.current.character.guild.getMemberById(currentLeaderCharacterId);
            return _loc2_;
         }
         catch(e:Error)
         {
            var _loc3_:* = null;
            return _loc3_;
         }
      }
      
      public function get isSupportInitiated() : Boolean
      {
         return initiatorCharacterId == 0 || currentLeaderCharacterId == 0;
      }
      
      public function getMember(param1:int) : GuildMember
      {
         return User.current.character.guild.getMemberById(param1);
      }
      
      public function get remainingSeconds() : int
      {
         var _loc1_:int = CConstant.guild_leader_vote_duration * 60 * 60;
         var _loc2_:int = tsCreation + _loc1_;
         return _loc2_ - TimeUtil.now;
      }
   }
}
