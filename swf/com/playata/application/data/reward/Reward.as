package com.playata.application.data.reward
{
   import com.playata.application.data.GameUtil;
   import com.playata.application.data.dating.Dating;
   import com.playata.application.data.dating.DatingStep;
   import com.playata.application.data.dating.DatingUtil;
   import com.playata.application.data.story_dungeon.StoryDungeon;
   import com.playata.application.data.user.User;
   import com.playata.application.ui.panels.PanelSlotMachine;
   import com.playata.framework.core.TypedObject;
   import com.playata.framework.core.util.TimeUtil;
   
   public class Reward
   {
       
      
      private var _reward:TypedObject = null;
      
      public function Reward(param1:String)
      {
         super();
         _reward = TypedObject.fromJsonString(param1);
      }
      
      public function get xp() : int
      {
         return _reward.getInt("xp");
      }
      
      public function get xpString() : String
      {
         if(xp == 0)
         {
            return "";
         }
         return GameUtil.getXpString(xp);
      }
      
      public function get gameCurrency() : int
      {
         return _reward.getInt("coins");
      }
      
      public function get gameCurrencyString() : String
      {
         if(gameCurrency == 0)
         {
            return "";
         }
         return GameUtil.getGameCurrencyString(gameCurrency);
      }
      
      public function get honor() : int
      {
         return _reward.getInt("honor");
      }
      
      public function get honorString() : String
      {
         return GameUtil.getHonorString(honor);
      }
      
      public function get premiumCurrency() : int
      {
         return _reward.getInt("premium");
      }
      
      public function get premiumCurrencyString() : String
      {
         if(premiumCurrency == 0)
         {
            return "";
         }
         return GameUtil.getPremiumCurrencyString(premiumCurrency);
      }
      
      public function get itemId() : int
      {
         return _reward.getInt("item");
      }
      
      public function get dungeonKey() : Boolean
      {
         return _reward.getBoolean("dungeon_key") && !User.current.character.hasDungeonKey && User.current.character.currentDungeon == null && !TimeUtil.serverDateTime.isToday(User.current.character.tsLastDungeonStarted);
      }
      
      public function get movieVotes() : int
      {
         return _reward.getInt("movie_votes");
      }
      
      public function get title() : String
      {
         if(!_reward.hasData("title"))
         {
            return null;
         }
         return _reward.getString("title");
      }
      
      public function get hasGuildImprovementPoint() : Boolean
      {
         if(!_reward.hasData("improvement_point"))
         {
            return false;
         }
         return _reward.getInt("improvement_point") > 0;
      }
      
      public function get movieProgress() : int
      {
         return _reward.getInt("movie_progress");
      }
      
      public function get movieProgressString() : String
      {
         if(movieProgress == 0)
         {
            return "";
         }
         return GameUtil.getMovieProgressString(movieProgress);
      }
      
      public function get storyDungeonUnlockPoint() : int
      {
         if(!_reward.hasData("story_dungeon_point"))
         {
            return 0;
         }
         return _reward.getInt("story_dungeon_point");
      }
      
      public function get repeatStoryDungeonIndex() : int
      {
         if(!_reward.hasData("repeat_story_dungeon_index"))
         {
            return 0;
         }
         var _loc1_:StoryDungeon = User.current.character.repeatStoryDungeon;
         if(_loc1_ && _loc1_.status != 3)
         {
            return 0;
         }
         return _reward.getInt("repeat_story_dungeon_index");
      }
      
      public function get opticalChangeResource() : int
      {
         if(!_reward.hasData("optical_change_resource"))
         {
            return 0;
         }
         return _reward.getInt("optical_change_resource");
      }
      
      public function get streamingResource() : int
      {
         if(!_reward.hasData("streaming_resource"))
         {
            return 0;
         }
         return _reward.getInt("streaming_resource");
      }
      
      public function get streamingResourceString() : String
      {
         if(streamingResource == 0)
         {
            return "";
         }
         return GameUtil.getStreamingResourceString(streamingResource);
      }
      
      public function get fans() : int
      {
         if(!_reward.hasData("fans"))
         {
            return 0;
         }
         return _reward.getInt("fans");
      }
      
      public function get fansString() : String
      {
         if(fans == 0)
         {
            return "";
         }
         return GameUtil.getFansString(fans);
      }
      
      public function get fanFotoResource() : int
      {
         if(!_reward.hasData("fan_foto_resource"))
         {
            return 0;
         }
         return _reward.getInt("fan_foto_resource");
      }
      
      public function get eventItemIdentifier() : String
      {
         var _loc1_:String = null;
         if(_reward.hasData("event_item",true))
         {
            _loc1_ = _reward.getString("event_item");
         }
         if(_loc1_)
         {
            if(!User.current.character.hasEventQuest)
            {
               return null;
            }
            if(!User.current.character.eventQuest.isAvailable)
            {
               return null;
            }
            if(!User.current.character.eventQuest.isStarted)
            {
               return null;
            }
            if(!User.current.character.eventQuest.hasActiveObjectiveWithItem(_loc1_))
            {
               return null;
            }
         }
         return _loc1_;
      }
      
      public function get herobookItemIdentifier() : String
      {
         var _loc1_:String = null;
         if(_reward.hasData("herobook_item_common",true))
         {
            _loc1_ = _reward.getString("herobook_item_common");
         }
         else if(_reward.hasData("herobook_item_rare",true))
         {
            _loc1_ = _reward.getString("herobook_item_rare");
         }
         else if(_reward.hasData("herobook_item_epic",true))
         {
            _loc1_ = _reward.getString("herobook_item_epic");
         }
         if(_loc1_)
         {
            if(!User.current.character.herobook.hasActiveObjectiveWithItem(_loc1_))
            {
               return null;
            }
         }
         return _loc1_;
      }
      
      public function get slotMachinJetons() : int
      {
         if(!_reward.hasData("slotmachine_jetons"))
         {
            return 0;
         }
         if(!PanelSlotMachine.slotmachineAvailable())
         {
            return 0;
         }
         return _reward.getInt("slotmachine_jetons");
      }
      
      public function get questEnergy() : int
      {
         if(!_reward.hasData("quest_energy"))
         {
            return 0;
         }
         return _reward.getInt("quest_energy");
      }
      
      public function get questEnergyString() : String
      {
         if(questEnergy == 0)
         {
            return "";
         }
         return GameUtil.getEnergyString(questEnergy);
      }
      
      public function get statPoints() : int
      {
         if(!_reward.hasData("statPoints"))
         {
            return 0;
         }
         return _reward.getInt("statPoints");
      }
      
      public function get artifactId() : int
      {
         if(!_reward.hasData("artifact_id"))
         {
            return 0;
         }
         return _reward.getInt("artifact_id");
      }
      
      public function get artifactStolen() : Boolean
      {
         if(!_reward.hasData("artifact_stolen"))
         {
            return false;
         }
         return _reward.getBoolean("artifact_stolen");
      }
      
      public function get statPointsString() : String
      {
         if(statPoints == 0)
         {
            return "";
         }
         return GameUtil.getStatPointString(statPoints);
      }
      
      public function get guildMissiles() : int
      {
         if(!_reward.hasData("missiles"))
         {
            return 0;
         }
         return _reward.getInt("missiles");
      }
      
      public function get herobookItemQuality() : int
      {
         if(_reward.hasData("herobook_item_common"))
         {
            return 1;
         }
         if(_reward.hasData("herobook_item_rare"))
         {
            return 2;
         }
         if(_reward.hasData("herobook_item_epic"))
         {
            return 3;
         }
         return 1;
      }
      
      public function get datingItemIdentifier() : String
      {
         var _loc2_:* = null;
         var _loc1_:int = 0;
         var _loc4_:* = null;
         var _loc3_:String = null;
         if(_reward.hasData("dating_item"))
         {
            _loc3_ = _reward.getString("dating_item");
         }
         if(_loc3_)
         {
            if(!DatingUtil.isAvailable)
            {
               return null;
            }
            _loc2_ = User.current.character.dating;
            if(!_loc2_)
            {
               return null;
            }
            _loc1_ = 0;
            while(_loc1_ < _loc2_.datingSteps.length)
            {
               _loc4_ = _loc2_.datingSteps[_loc1_];
               if(_loc4_.rewardReference == _loc3_ && _loc4_.isStarted)
               {
                  return _loc3_;
               }
               _loc1_++;
            }
            return null;
         }
         return _loc3_;
      }
      
      public function get repeatDatingIndex() : int
      {
         if(!_reward.hasData("repeat_dating_index"))
         {
            return 0;
         }
         var _loc2_:Dating = User.current.character.dating;
         var _loc1_:int = _reward.getInt("repeat_dating_index");
         if(!_loc2_.hasDatingStepCompleted(_loc1_) || _loc2_.hasActiveDatingStep(_loc1_))
         {
            return 0;
         }
         return _loc1_;
      }
      
      public function get guildCompetitionItemIdentifier() : String
      {
         var _loc1_:String = null;
         if(_reward.hasData("guild_competition_item",true))
         {
            _loc1_ = _reward.getString("guild_competition_item");
         }
         if(_loc1_)
         {
            if(!User.current.character.hasGuild)
            {
               return null;
            }
            if(!User.current.character.guild.guildCompetition)
            {
               return null;
            }
            if(!User.current.character.guild.guildCompetition.isActive)
            {
               return null;
            }
            if(!User.current.character.guild.guildCompetition.isStarted)
            {
               return null;
            }
            if(!User.current.character.guild.guildCompetition.hasObjectiveWithItem(_loc1_))
            {
               return null;
            }
         }
         return _loc1_;
      }
      
      public function get reward() : TypedObject
      {
         return _reward;
      }
   }
}
