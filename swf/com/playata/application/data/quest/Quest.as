package com.playata.application.data.quest
{
   import com.playata.application.data.GameUtil;
   import com.playata.application.data.battle.Battle;
   import com.playata.application.data.bonus.BonusInfo;
   import com.playata.application.data.character.Character;
   import com.playata.application.data.constants.CNPC;
   import com.playata.application.data.constants.CQuestTemplate;
   import com.playata.application.data.dataobject.DOBattle;
   import com.playata.application.data.dataobject.DOQuest;
   import com.playata.application.data.item.Item;
   import com.playata.application.data.outfit.Outfit;
   import com.playata.application.data.reward.QuestReward;
   import com.playata.application.data.reward.Reward;
   import com.playata.application.data.user.User;
   import com.playata.application.platform.ServerInfo;
   import com.playata.framework.core.TypedObject;
   import com.playata.framework.core.util.TimeUtil;
   import com.playata.framework.data.DataObject;
   import com.playata.framework.localization.LocText;
   
   public class Quest extends DOQuest implements IDurationEvent, IStatQuest
   {
       
      
      private var _battle:Battle = null;
      
      private var _reward:QuestReward = null;
      
      public function Quest(param1:DOQuest)
      {
         super(param1);
      }
      
      public static function get maxQuestEnergy() : int
      {
         var _loc1_:Number = User.current.character.maxQuestEnergy;
         var _loc2_:Number = BonusInfo.getValue(1);
         if(_loc2_ > 0)
         {
            _loc1_ = _loc1_ * _loc2_;
         }
         return int(_loc1_);
      }
      
      public function refreshBattle(param1:DOBattle) : void
      {
         _battle = DataObject.createOrUpdate(Battle,_battle,param1);
      }
      
      override public function update(param1:TypedObject) : void
      {
         super.update(param1);
         if(param1.hasData("rewards"))
         {
            _reward = null;
         }
      }
      
      public function get remainingSeconds() : int
      {
         var _loc2_:int = tsComplete;
         var _loc1_:int = _loc2_ - TimeUtil.now;
         if(_loc1_ < 0)
         {
            _loc1_ = 0;
         }
         return _loc1_;
      }
      
      public function get progress() : Number
      {
         return (1 - remainingSeconds / duration) * 100;
      }
      
      public function get remainingSecondsNonBoosted() : int
      {
         var _loc1_:int = durationRaw - duration;
         return remainingSeconds + _loc1_;
      }
      
      public function get battle() : Battle
      {
         return _battle;
      }
      
      public function get isWon() : Boolean
      {
         return getBoolean("won");
      }
      
      public function get isTimeQuest() : Boolean
      {
         return type == 1;
      }
      
      public function get isFightQuest() : Boolean
      {
         return type == 2;
      }
      
      public function get isStatQuest() : Boolean
      {
         return type == 3;
      }
      
      public function get statQuestStat() : int
      {
         return getInt("stat");
      }
      
      public function get isConventionShow() : Boolean
      {
         return false;
      }
      
      public function get difficulty() : int
      {
         return fightDifficulty;
      }
      
      public function get npcIdentifier() : String
      {
         return fightNpcIdentifier;
      }
      
      public function get isStarted() : Boolean
      {
         return status == 2;
      }
      
      public function get isRunning() : Boolean
      {
         return status == 2 && remainingSeconds > 0;
      }
      
      public function get isFinished() : Boolean
      {
         return status == 4;
      }
      
      public function get instantFinishPremiumAmount() : int
      {
         return GameUtil.getQuestInstantFinishCost(duration);
      }
      
      public function get difficultyName() : String
      {
         switch(int(fightDifficulty) - 1)
         {
            case 0:
               return LocText.current.text("dialog/quest_briefing/difficulty_easy");
            case 1:
               return LocText.current.text("dialog/quest_briefing/difficulty_medium");
            case 2:
               return LocText.current.text("dialog/quest_briefing/difficulty_hard");
         }
      }
      
      public function get difficultyDescription() : String
      {
         var _loc2_:* = null;
         var _loc5_:int = 0;
         var _loc3_:* = null;
         var _loc4_:* = null;
         var _loc6_:int = 0;
         var _loc1_:* = null;
         if(isFightQuest)
         {
            switch(int(fightDifficulty) - 1)
            {
               case 0:
                  return LocText.current.text("dialog/quest_briefing/fight_quest/difficulty_description_easy");
               case 1:
                  return LocText.current.text("dialog/quest_briefing/fight_quest/difficulty_description_medium");
               case 2:
                  return LocText.current.text("dialog/quest_briefing/fight_quest/difficulty_description_hard");
            }
         }
         else
         {
            _loc2_ = "";
            switch(int(statQuestStat) - 1)
            {
               case 0:
                  _loc2_ = LocText.current.text("general/stat_stamina");
                  break;
               case 1:
                  _loc2_ = LocText.current.text("general/stat_strength");
                  break;
               case 2:
                  _loc2_ = LocText.current.text("general/stat_critical_rating");
                  break;
               case 3:
                  _loc2_ = LocText.current.text("general/stat_dodge_rating");
            }
            _loc5_ = 0;
            switch(int(statQuestStat) - 1)
            {
               case 0:
                  _loc5_ = 2;
                  break;
               case 1:
                  _loc5_ = 3;
                  break;
               case 2:
                  _loc5_ = 4;
                  break;
               case 3:
                  _loc5_ = 5;
            }
            _loc3_ = User.current.character;
            _loc4_ = _loc3_.outfits.getOutfitWithSetting(_loc5_);
            _loc6_ = 0;
            if(_loc4_)
            {
               _loc1_ = _loc3_.outfits.getCharacterStatsWithOutfit(_loc3_,_loc4_);
               switch(int(statQuestStat) - 1)
               {
                  case 0:
                     _loc6_ = _loc1_.getInt("stat_total_stamina");
                     break;
                  case 1:
                     _loc6_ = _loc1_.getInt("stat_total_strength");
                     break;
                  case 2:
                     _loc6_ = _loc1_.getInt("stat_total_critical_rating");
                     break;
                  case 3:
                     _loc6_ = _loc1_.getInt("stat_total_dodge_rating");
               }
               return LocText.current.text("dialog/quest_briefing/stat_quest/needed_stat_with_outfit",LocText.current.formatHugeNumber(neededStat),LocText.current.formatHugeNumber(_loc6_),_loc2_,_loc4_.name);
            }
            switch(int(statQuestStat) - 1)
            {
               case 0:
                  _loc6_ = _loc3_.statTotalStamina;
                  break;
               case 1:
                  _loc6_ = _loc3_.statTotalStrength;
                  break;
               case 2:
                  _loc6_ = _loc3_.statTotalCriticalRating;
                  break;
               case 3:
                  _loc6_ = _loc3_.statTotalDodgeRating;
            }
            return LocText.current.text("dialog/quest_briefing/stat_quest/needed_stat",LocText.current.formatHugeNumber(neededStat),LocText.current.formatHugeNumber(_loc6_),_loc2_);
         }
      }
      
      public function get statDescription() : String
      {
         if(isStatQuest)
         {
            switch(int(statQuestStat) - 1)
            {
               case 0:
                  return LocText.current.text("dialog/quest_briefing/stat_quest/description_stamina");
               case 1:
                  return LocText.current.text("dialog/quest_briefing/stat_quest/description_strength");
               case 2:
                  return LocText.current.text("dialog/quest_briefing/stat_quest/description_critical_rating");
               case 3:
                  return LocText.current.text("dialog/quest_briefing/stat_quest/description_dodge_rating");
            }
         }
         return null;
      }
      
      public function get reward() : QuestReward
      {
         if(_reward == null)
         {
            _reward = new QuestReward(rewards);
         }
         return _reward;
      }
      
      public function get npcName() : String
      {
         return LocText.current.text("npc/" + identifier + "/name");
      }
      
      override public function get stage() : int
      {
         var _loc1_:int = super.stage;
         if(_loc1_ == 0)
         {
            return User.current.character.getQuestStageByQuestId(id);
         }
         return _loc1_;
      }
      
      public function get npcVoiceType() : int
      {
         return CNPC.fromId(fightNpcIdentifier).voice;
      }
      
      public function get effect() : String
      {
         return CQuestTemplate.fromId(identifier).effect;
      }
      
      public function get visibleOnMap() : Boolean
      {
         return CQuestTemplate.fromId(identifier).visibleOnMap;
      }
      
      public function get npcImageUrl() : String
      {
         return ServerInfo.assetURL("npc/" + fightNpcIdentifier,"png");
      }
      
      public function get npcImageUrlHD() : String
      {
         return ServerInfo.assetURL("npc_hd/" + fightNpcIdentifier,"png");
      }
      
      public function get npcThumbnailImageUrl() : String
      {
         return ServerInfo.assetURL("npc/" + fightNpcIdentifier + "_t","png");
      }
      
      public function get effectImageUrl() : String
      {
         if(!effect)
         {
            return null;
         }
         return ServerInfo.assetURL("effects/" + effect,"png");
      }
      
      public function get briefingText() : String
      {
         return LocText.current.text("quest/" + identifier + "/briefing");
      }
      
      public function get progressText() : String
      {
         return briefingText;
      }
      
      public function get winText() : String
      {
         return LocText.current.text("quest/" + identifier + "/win");
      }
      
      public function get lostText() : String
      {
         return LocText.current.text("quest/" + identifier + "/lost");
      }
      
      public function get xpPerEnergyValue() : Number
      {
         return xpRewardInclVoting / energyCost;
      }
      
      public function get xpRewardInclVoting() : Number
      {
         var _loc2_:* = null;
         var _loc3_:int = reward.xp;
         var _loc1_:Character = User.current.character;
         if(reward.movieVotes > 0)
         {
            _loc2_ = _loc1_.movieVoteRewards;
            if(_loc2_)
            {
               if(_loc2_.xp > 0)
               {
                  _loc3_ = _loc3_ + _loc2_.xp;
               }
            }
         }
         return _loc3_;
      }
      
      public function get gameCurrencyPerEnergyValue() : Number
      {
         return coinRewardInclItemAndVoting / energyCost;
      }
      
      public function get coinRewardInclItemAndVoting() : Number
      {
         var _loc3_:* = null;
         var _loc7_:int = 0;
         var _loc5_:int = 0;
         var _loc8_:int = 0;
         var _loc6_:int = 0;
         var _loc4_:int = reward.gameCurrency;
         var _loc1_:Character = User.current.character;
         var _loc2_:Item = null;
         if(hasItemReward)
         {
            _loc2_ = _loc1_.getItemById(reward.itemId);
            if(_loc2_)
            {
               _loc4_ = _loc4_ + _loc2_.sellPrice;
            }
         }
         if(reward.movieVotes > 0)
         {
            _loc3_ = _loc1_.movieVoteRewards;
            if(_loc3_)
            {
               if(_loc3_.itemId > 0)
               {
                  _loc2_ = _loc1_.getItemById(_loc3_.itemId);
                  if(_loc2_)
                  {
                     _loc4_ = _loc4_ + _loc2_.sellPrice;
                  }
               }
               else if(_loc3_.gameCurrency)
               {
                  _loc4_ = _loc4_ + _loc3_.gameCurrency;
               }
               else if(_loc3_.statPoints)
               {
                  _loc7_ = GameUtil.calcNeededGameCurrency(_loc1_.getInt("stat_bought_stamina"));
                  _loc5_ = GameUtil.calcNeededGameCurrency(_loc1_.getInt("stat_bought_strength"));
                  _loc8_ = GameUtil.calcNeededGameCurrency(_loc1_.getInt("stat_bought_critical_rating"));
                  _loc6_ = GameUtil.calcNeededGameCurrency(_loc1_.getInt("stat_bought_dodge_rating"));
                  _loc4_ = _loc4_ + Math.min(_loc7_,_loc5_,_loc8_,_loc6_);
               }
            }
         }
         return _loc4_;
      }
      
      public function get hasItemReward() : Boolean
      {
         return reward.itemId != 0;
      }
      
      public function get winChance() : Number
      {
         return GameUtil.calculateStatQuestWinChance(User.current.character,statQuestStat,fightDifficulty);
      }
      
      public function get neededStat() : Number
      {
         return GameUtil.calculateNeededSatForStatQuest(User.current.character,statQuestStat,fightDifficulty);
      }
   }
}
