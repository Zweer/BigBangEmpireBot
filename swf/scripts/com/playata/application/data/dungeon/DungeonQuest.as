package com.playata.application.data.dungeon
{
   import com.playata.application.data.GameUtil;
   import com.playata.application.data.battle.Battle;
   import com.playata.application.data.character.Character;
   import com.playata.application.data.constants.CConstant;
   import com.playata.application.data.constants.CDungeonQuestTemplate;
   import com.playata.application.data.constants.CNPC;
   import com.playata.application.data.dataobject.DOBattle;
   import com.playata.application.data.dataobject.DODungeonQuest;
   import com.playata.application.data.outfit.Outfit;
   import com.playata.application.data.quest.IStatQuest;
   import com.playata.application.data.reward.Reward;
   import com.playata.application.data.user.User;
   import com.playata.application.platform.ServerInfo;
   import com.playata.framework.core.TypedObject;
   import com.playata.framework.data.DataObject;
   import com.playata.framework.localization.LocText;
   
   public class DungeonQuest extends DODungeonQuest implements IStatQuest
   {
       
      
      private var _battle:Battle = null;
      
      private var _reward:Reward = null;
      
      public function DungeonQuest(param1:DODungeonQuest)
      {
         super(param1);
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
      
      public function get isFightQuest() : Boolean
      {
         return type == 1;
      }
      
      public function get isStatQuest() : Boolean
      {
         return type == 2;
      }
      
      public function get statQuestStat() : int
      {
         return stat;
      }
      
      public function get statDescription() : String
      {
         if(isStatQuest)
         {
            switch(int(statQuestStat) - 1)
            {
               case 0:
                  return LocText.current.text("dialog/dungeon_quest_briefing/stat_quest/description_stamina");
               case 1:
                  return LocText.current.text("dialog/dungeon_quest_briefing/stat_quest/description_strength");
               case 2:
                  return LocText.current.text("dialog/dungeon_quest_briefing/stat_quest/description_critical_rating");
               case 3:
                  return LocText.current.text("dialog/dungeon_quest_briefing/stat_quest/description_dodge_rating");
            }
         }
         return null;
      }
      
      public function get difficultyName() : String
      {
         switch(int(difficulty) - 1)
         {
            case 0:
               return LocText.current.text("dialog/dungeon_quest_briefing/difficulty_easy");
            case 1:
               return LocText.current.text("dialog/dungeon_quest_briefing/difficulty_medium");
            case 2:
               return LocText.current.text("dialog/dungeon_quest_briefing/difficulty_hard");
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
            switch(int(difficulty) - 1)
            {
               case 0:
                  return LocText.current.text("dialog/dungeon_quest_briefing/fight_quest/difficulty_description_easy");
               case 1:
                  return LocText.current.text("dialog/dungeon_quest_briefing/fight_quest/difficulty_description_medium");
               case 2:
                  return LocText.current.text("dialog/dungeon_quest_briefing/fight_quest/difficulty_description_hard");
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
      
      public function get battle() : Battle
      {
         return _battle;
      }
      
      public function get isWon() : Boolean
      {
         return won;
      }
      
      public function get isFought() : Boolean
      {
         return status == 2;
      }
      
      public function get isFinished() : Boolean
      {
         return status == 3;
      }
      
      public function get reward() : Reward
      {
         if(_reward == null)
         {
            _reward = new Reward(rewards);
         }
         return _reward;
      }
      
      public function get dungeonQuestTemplate() : CDungeonQuestTemplate
      {
         return CDungeonQuestTemplate.fromId(identifier);
      }
      
      public function get npcIdentifier() : String
      {
         if(genderSuffix == "_f")
         {
            return dungeonQuestTemplate.npcIdentifierF;
         }
         return dungeonQuestTemplate.npcIdentifierM;
      }
      
      public function get npcLevel() : int
      {
         var _loc2_:int = characterLevel;
         var _loc4_:int = dungeonQuestTemplate.npcItemsCommons;
         var _loc1_:int = dungeonQuestTemplate.npcItemsRares;
         var _loc3_:int = dungeonQuestTemplate.npcItemsEpics;
         var _loc5_:int = Math.round(_loc2_ + (_loc4_ * CConstant.dungeon_quest_npc_stat_level_multi_commons + _loc1_ * CConstant.dungeon_quest_npc_stat_level_multi_rares + _loc3_ * CConstant.dungeon_quest_npc_stat_level_multi_epics - CConstant.dungeon_quest_npc_stat_level_decrease) * CConstant.dungeon_quest_npc_stat_level_multi_total);
         return _loc5_;
      }
      
      private function get genderSuffix() : String
      {
         return !!User.current.character.isMale?"_m":"_f";
      }
      
      public function get npcName() : String
      {
         return LocText.current.text("npc/" + identifier + "/name" + genderSuffix);
      }
      
      public function get npcVoiceType() : int
      {
         return CNPC.fromId(npcIdentifier).voice;
      }
      
      public function get npcImageUrl() : String
      {
         return ServerInfo.assetURL("dungeons/" + npcIdentifier,"png");
      }
      
      public function get npcThumbnailImageUrl() : String
      {
         return ServerInfo.assetURL("dungeons/" + npcIdentifier + "_t","png");
      }
      
      public function get npcQuestStarImageUrl() : String
      {
         return ServerInfo.assetURL("dungeons/" + npcIdentifier + "_i","png");
      }
      
      public function get briefingText() : String
      {
         return LocText.current.text("dungeon_quest/" + identifier + "/briefing" + genderSuffix);
      }
      
      public function get winText() : String
      {
         return LocText.current.text("dungeon_quest/" + identifier + "/win" + genderSuffix);
      }
      
      public function get lostText() : String
      {
         return LocText.current.text("dungeon_quest/" + identifier + "/lost" + genderSuffix);
      }
      
      public function get difficulty() : int
      {
         return dungeonQuestTemplate.statDifficulty;
      }
      
      public function get npcImageUrlHD() : String
      {
         return ServerInfo.assetURL("npc_hd/" + npcIdentifier,"png");
      }
      
      public function get isBoss() : Boolean
      {
         return dungeonQuestTemplate.isBoss;
      }
      
      public function get winChance() : Number
      {
         return GameUtil.calculateStatQuestWinChance(User.current.character,statQuestStat,difficulty,dungeonQuestTemplate.difficultyMultiplier);
      }
      
      public function get neededStat() : Number
      {
         return GameUtil.calculateNeededSatForStatQuest(User.current.character,statQuestStat,difficulty,dungeonQuestTemplate.difficultyMultiplier);
      }
   }
}
