package com.playata.application.data.movie
{
   import com.playata.application.data.GameUtil;
   import com.playata.application.data.battle.Battle;
   import com.playata.application.data.character.Character;
   import com.playata.application.data.constants.CNPC;
   import com.playata.application.data.dataobject.DOBattle;
   import com.playata.application.data.dataobject.DOMovieQuest;
   import com.playata.application.data.outfit.Outfit;
   import com.playata.application.data.quest.IStatQuest;
   import com.playata.application.data.reward.Reward;
   import com.playata.application.data.user.User;
   import com.playata.application.platform.ServerInfo;
   import com.playata.framework.core.TypedObject;
   import com.playata.framework.data.DataObject;
   import com.playata.framework.localization.LocText;
   
   public class MovieQuest extends DOMovieQuest implements IStatQuest
   {
       
      
      private var _battle:Battle = null;
      
      private var _reward:Reward = null;
      
      public function MovieQuest(param1:Object = null)
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
      
      public function get battle() : Battle
      {
         return _battle;
      }
      
      public function get isWon() : Boolean
      {
         return won;
      }
      
      public function get isInstantQuest() : Boolean
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
         return stat;
      }
      
      public function get difficulty() : int
      {
         return fightDifficulty;
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
      
      public function get reward() : Reward
      {
         if(_reward == null)
         {
            _reward = new Reward(rewards);
         }
         return _reward;
      }
      
      public function get npcName() : String
      {
         return LocText.current.text("movie_quest/" + identifier + "/name");
      }
      
      public function get npcIdentifier() : String
      {
         return getString("fight_npc_identifier");
      }
      
      public function get npcVoiceType() : int
      {
         return CNPC.fromId(npcIdentifier).voice;
      }
      
      public function get npcImageUrl() : String
      {
         return ServerInfo.assetURL("npc/" + npcIdentifier,"png");
      }
      
      public function get npcImageUrlHD() : String
      {
         return ServerInfo.assetURL("npc_hd/" + npcIdentifier,"png");
      }
      
      public function get npcThumbnailImageUrl() : String
      {
         return ServerInfo.assetURL("npc/" + npcIdentifier + "_t","png");
      }
      
      public function get briefingText() : String
      {
         return LocText.current.text("movie_quest/" + identifier + "/briefing");
      }
      
      public function get winText() : String
      {
         return LocText.current.text("movie_quest/" + identifier + "/win");
      }
      
      public function get lostText() : String
      {
         return LocText.current.text("movie_quest/" + identifier + "/lost");
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
