package com.playata.application.ui.elements.quest
{
   import com.playata.application.data.GameUtil;
   import com.playata.application.data.character.Character;
   import com.playata.application.data.dating.DatingUtil;
   import com.playata.application.data.quest.Quest;
   import com.playata.application.data.story_dungeon.StoryDungeon;
   import com.playata.application.data.user.User;
   import com.playata.application.ui.elements.avatar.UiAvatarImage;
   import com.playata.application.ui.elements.dating.UiDatingItemReward;
   import com.playata.application.ui.elements.dungeon.UiDungeonKeyReward;
   import com.playata.application.ui.elements.event.UiEventItemReward;
   import com.playata.application.ui.elements.generic.UiLabelScrollContainer;
   import com.playata.application.ui.elements.generic.textfield.UiTextTooltip;
   import com.playata.application.ui.elements.guild_competition.UiGuildCompetitionItemReward;
   import com.playata.application.ui.elements.herobook.UiHerobookItemReward;
   import com.playata.application.ui.elements.item.UiItemSlot;
   import com.playata.application.ui.elements.movie.UiMovieVoteItem;
   import com.playata.application.ui.elements.slotmachine.UiSlotMachineJetonReward;
   import com.playata.framework.core.util.TimeUtil;
   import com.playata.framework.display.ui.Direction;
   import com.playata.framework.localization.LocText;
   import visuals.ui.elements.quest.SymbolQuestBriefingContentGeneric;
   
   public class UiQuestBriefingContent
   {
       
      
      private var _content:SymbolQuestBriefingContentGeneric = null;
      
      private var _quest:Quest = null;
      
      private var _itemReward:UiItemSlot = null;
      
      private var _dungeonKeyReward:UiDungeonKeyReward = null;
      
      private var _movieVoteItemReward:UiMovieVoteItem = null;
      
      private var _eventItemReward:UiEventItemReward = null;
      
      private var _datingItemReward:UiDatingItemReward = null;
      
      private var _slotMachineJetonRewards:UiSlotMachineJetonReward;
      
      private var _difficultyTooltip:UiTextTooltip = null;
      
      private var _guildCompetitionItemReward:UiGuildCompetitionItemReward;
      
      private var _herobookItemReward:UiHerobookItemReward = null;
      
      private var _statQuestStatTooltip:UiTextTooltip;
      
      private var _storyDungeonTooltipText:UiTextTooltip;
      
      private var _storyDungeonTooltipIcon:UiTextTooltip;
      
      private var _repeatStoryDungeonTooltipIcon:UiTextTooltip;
      
      private var _repeatDatingTooltipIcon:UiTextTooltip;
      
      private var _npcAvatarFightQuest:UiAvatarImage;
      
      private var _npcAvatarStatQuest:UiAvatarImage;
      
      private var _timeQuestScrollContainer:UiLabelScrollContainer;
      
      public function UiQuestBriefingContent(param1:SymbolQuestBriefingContentGeneric)
      {
         super();
         _content = param1;
         _npcAvatarFightQuest = new UiAvatarImage(_content.npcAvatarImageFightQuest,false);
         _npcAvatarStatQuest = new UiAvatarImage(_content.npcAvatarImageStatQuest,false);
         _timeQuestScrollContainer = new UiLabelScrollContainer(_content.txtDescriptionTimeQuest,Direction.VERTICAL,true,false,true,true,true);
      }
      
      public function dispose() : void
      {
         if(_difficultyTooltip != null)
         {
            _difficultyTooltip.dispose();
            _difficultyTooltip = null;
         }
         if(_statQuestStatTooltip != null)
         {
            _statQuestStatTooltip.dispose();
            _statQuestStatTooltip = null;
         }
         if(_storyDungeonTooltipText != null)
         {
            _storyDungeonTooltipText.dispose();
            _storyDungeonTooltipText = null;
         }
         if(_storyDungeonTooltipIcon != null)
         {
            _storyDungeonTooltipIcon.dispose();
            _storyDungeonTooltipIcon = null;
         }
         if(_repeatStoryDungeonTooltipIcon != null)
         {
            _repeatStoryDungeonTooltipIcon.dispose();
            _repeatStoryDungeonTooltipIcon = null;
         }
         if(_repeatDatingTooltipIcon != null)
         {
            _repeatDatingTooltipIcon.dispose();
            _repeatDatingTooltipIcon = null;
         }
         if(_npcAvatarFightQuest != null)
         {
            _npcAvatarFightQuest.dispose();
            _npcAvatarFightQuest = null;
         }
         if(_npcAvatarStatQuest != null)
         {
            _npcAvatarStatQuest.dispose();
            _npcAvatarStatQuest = null;
         }
         _timeQuestScrollContainer.dispose();
         _timeQuestScrollContainer = null;
      }
      
      public function get content() : SymbolQuestBriefingContentGeneric
      {
         return _content;
      }
      
      public function refresh(param1:Quest) : void
      {
         var _loc7_:* = null;
         _quest = param1;
         if(_quest == null)
         {
            return;
         }
         var _loc2_:Character = User.current.character;
         var _loc4_:String = null;
         if(param1.isTimeQuest)
         {
            _timeQuestScrollContainer.text = param1.briefingText;
            _timeQuestScrollContainer.visible = true;
            _content.txtDescriptionFightQuest.visible = false;
            _content.stats.visible = false;
            _content.statQuestStatBackground.visible = false;
            _content.npcAvatarImageFightQuest.visible = false;
            _content.npcAvatarImageStatQuest.visible = false;
            _content.txtDifficultyEasy.visible = false;
            _content.txtDifficultyMedium.visible = false;
            _content.txtDifficultyHard.visible = false;
         }
         else if(param1.isUserStoryQuest)
         {
            _timeQuestScrollContainer.text = param1.briefingText;
            _timeQuestScrollContainer.visible = true;
            _content.txtDescriptionFightQuest.visible = false;
            _content.stats.visible = false;
            _content.statQuestStatBackground.visible = false;
            _content.npcAvatarImageFightQuest.visible = false;
            _content.npcAvatarImageStatQuest.visible = false;
            _content.txtDifficultyEasy.visible = false;
            _content.txtDifficultyMedium.visible = false;
            _content.txtDifficultyHard.visible = false;
         }
         else if(param1.isStatQuest)
         {
            _content.txtDescriptionFightQuest.text = param1.briefingText;
            _content.txtDescriptionFightQuest.autoFontSize = true;
            _timeQuestScrollContainer.visible = false;
            _content.txtDescriptionFightQuest.visible = true;
            _content.stats.visible = true;
            _content.npcAvatarImageFightQuest.visible = false;
            _content.txtDifficultyEasy.text = param1.difficultyName;
            _content.txtDifficultyMedium.text = param1.difficultyName;
            _content.txtDifficultyHard.text = param1.difficultyName;
            _content.txtDifficultyEasy.visible = param1.difficulty == 1;
            _content.txtDifficultyMedium.visible = param1.difficulty == 2;
            _content.txtDifficultyHard.visible = param1.difficulty == 3;
            _content.stats.gotoAndStop(param1.statQuestStat);
            _loc4_ = param1.statDescription + "\n\n" + param1.difficultyDescription;
            _statQuestStatTooltip = new UiTextTooltip(_content.stats,_loc4_);
            switch(int(param1.difficulty) - 1)
            {
               case 0:
                  _difficultyTooltip = new UiTextTooltip(_content.txtDifficultyEasy,_loc4_);
                  break;
               case 1:
                  _difficultyTooltip = new UiTextTooltip(_content.txtDifficultyMedium,_loc4_);
                  break;
               case 2:
                  _difficultyTooltip = new UiTextTooltip(_content.txtDifficultyHard,_loc4_);
            }
            if(param1.npcIdentifier)
            {
               _npcAvatarStatQuest.showNpcImage(param1.npcThumbnailImageUrl);
               _content.stats.x = 165;
               _content.npcAvatarImageStatQuest.visible = true;
               _content.statQuestStatBackground.visible = false;
            }
            else
            {
               _content.stats.x = 190;
               _content.npcAvatarImageStatQuest.visible = false;
               _content.statQuestStatBackground.visible = true;
            }
         }
         else
         {
            _timeQuestScrollContainer.visible = false;
            _content.txtDescriptionFightQuest.text = param1.briefingText;
            _content.txtDescriptionFightQuest.autoFontSize = true;
            _content.txtDescriptionFightQuest.visible = true;
            _content.stats.visible = false;
            _content.statQuestStatBackground.visible = false;
            _content.npcAvatarImageFightQuest.visible = true;
            _content.npcAvatarImageStatQuest.visible = false;
            switch(int(param1.difficulty) - 1)
            {
               case 0:
                  _difficultyTooltip = new UiTextTooltip(_content.txtDifficultyEasy,param1.difficultyDescription);
                  break;
               case 1:
                  _difficultyTooltip = new UiTextTooltip(_content.txtDifficultyMedium,param1.difficultyDescription);
                  break;
               case 2:
                  _difficultyTooltip = new UiTextTooltip(_content.txtDifficultyHard,param1.difficultyDescription);
            }
            _content.txtDifficultyEasy.text = param1.difficultyName;
            _content.txtDifficultyMedium.text = param1.difficultyName;
            _content.txtDifficultyHard.text = param1.difficultyName;
            _content.txtDifficultyEasy.visible = param1.difficulty == 1;
            _content.txtDifficultyMedium.visible = param1.difficulty == 2;
            _content.txtDifficultyHard.visible = param1.difficulty == 3;
            _npcAvatarFightQuest.showNpcImage(param1.npcThumbnailImageUrl);
         }
         _content.txtRequirementsCaption.text = LocText.current.text("dialog/quest_briefing/requirements");
         _content.txtRewardsCaption.text = LocText.current.text("dialog/quest_briefing/rewards");
         _content.txtDuration.text = TimeUtil.secondsToString(param1.duration);
         _content.txtEnergy.text = GameUtil.getEnergyString(param1.energyCost);
         _content.itemReward.visible = param1.reward.itemId != 0;
         if(param1.reward.itemId != 0)
         {
            if(_itemReward == null)
            {
               _itemReward = new UiItemSlot(_content.itemReward,0);
            }
            _itemReward.item = _loc2_.getItemById(param1.reward.itemId);
            _itemReward.itemGraphic.tooltip.positionType = 2;
         }
         _content.dungeonKeyReward.visible = !_loc2_.hasDungeonKey && param1.reward.dungeonKey && _loc2_.currentDungeon == null;
         if(_content.dungeonKeyReward.visible)
         {
            if(_dungeonKeyReward == null)
            {
               _dungeonKeyReward = new UiDungeonKeyReward(_content.dungeonKeyReward);
            }
         }
         _content.movieVoteReward.visible = param1.reward.movieVotes > 0;
         if(_content.movieVoteReward.visible)
         {
            if(_movieVoteItemReward == null)
            {
               _movieVoteItemReward = new UiMovieVoteItem(_content.movieVoteReward);
            }
            _movieVoteItemReward.movieVotes = param1.reward.movieVotes;
         }
         _content.eventItemReward.visible = param1.reward.eventItemIdentifier != null;
         if(_content.eventItemReward.visible)
         {
            if(_eventItemReward == null)
            {
               _eventItemReward = new UiEventItemReward(_content.eventItemReward);
            }
            _eventItemReward.eventItem = param1.reward.eventItemIdentifier;
         }
         _content.datingItemReward.visible = param1.reward.datingItemIdentifier != null;
         if(_content.datingItemReward.visible)
         {
            if(_datingItemReward == null)
            {
               _datingItemReward = new UiDatingItemReward(_content.datingItemReward);
            }
            _datingItemReward.datingItem = param1.reward.datingItemIdentifier;
         }
         var _loc3_:int = param1.reward.storyDungeonUnlockPoint;
         _content.txtStoryDungeon.visible = false;
         _content.iconStoryDungeon.visible = false;
         if(_loc3_ > 0)
         {
            _loc7_ = null;
            if(_loc2_.currentStoryDungeon && _loc2_.currentStoryDungeon.storyDungeonIndex == _loc3_)
            {
               _loc7_ = _loc2_.currentStoryDungeon;
            }
            else if(_loc2_.repeatStoryDungeon && _loc2_.repeatStoryDungeon.storyDungeonIndex == _loc3_)
            {
               _loc7_ = _loc2_.repeatStoryDungeon;
            }
            if(_loc7_ && !_loc7_.allPointsCollected())
            {
               _content.txtStoryDungeon.visible = true;
               _content.iconStoryDungeon.visible = true;
               _content.txtStoryDungeon.text = StoryDungeon.getUnlockPoinName(_loc7_.storyDungeonIndex);
               _content.txtStoryDungeon.autoFontSize = true;
               _content.iconStoryDungeon.setUriSprite(StoryDungeon.getUnlockPointImageUrl(_loc7_.storyDungeonIndex),37,37,false,1,null,true);
               _loc4_ = StoryDungeon.getUnlockPoinTooltip(_loc7_.storyDungeonIndex);
               if(!_storyDungeonTooltipText)
               {
                  _storyDungeonTooltipText = new UiTextTooltip(_content.txtStoryDungeon,_loc4_);
               }
               else
               {
                  _storyDungeonTooltipText.text = _loc4_;
               }
               if(!_storyDungeonTooltipIcon)
               {
                  _storyDungeonTooltipIcon = new UiTextTooltip(_content.iconStoryDungeon,_loc4_);
               }
               else
               {
                  _storyDungeonTooltipIcon.text = _loc4_;
               }
            }
         }
         _content.iconRepeatStoryDungeonKey.visible = false;
         if(param1.reward.repeatStoryDungeonIndex > 0)
         {
            _content.txtStoryDungeon.visible = true;
            _content.iconRepeatStoryDungeonKey.visible = true;
            _content.txtStoryDungeon.text = StoryDungeon.getRepeatKeyName(param1.reward.repeatStoryDungeonIndex);
            _content.txtStoryDungeon.autoFontSize = true;
            _content.iconRepeatStoryDungeonKey.setUriSprite(StoryDungeon.getRepeatKeyImageUrl(param1.reward.repeatStoryDungeonIndex),37,37,false,1,null,true);
            _loc4_ = StoryDungeon.getRepeatKeyName(param1.reward.repeatStoryDungeonIndex) + "\n\n" + StoryDungeon.getRepeatKeyDescription(param1.reward.repeatStoryDungeonIndex);
            if(!_storyDungeonTooltipText)
            {
               _storyDungeonTooltipText = new UiTextTooltip(_content.txtStoryDungeon,_loc4_);
            }
            else
            {
               _storyDungeonTooltipText.text = _loc4_;
            }
            if(!_repeatStoryDungeonTooltipIcon)
            {
               _repeatStoryDungeonTooltipIcon = new UiTextTooltip(_content.iconRepeatStoryDungeonKey,_loc4_);
            }
            else
            {
               _repeatStoryDungeonTooltipIcon.text = _loc4_;
            }
         }
         _content.iconRepeatDatingKey.visible = false;
         if(param1.reward.repeatDatingIndex > 0)
         {
            _content.txtStoryDungeon.visible = true;
            _content.iconRepeatDatingKey.visible = true;
            _content.txtStoryDungeon.text = DatingUtil.getRepeatKeyName(param1.reward.repeatDatingIndex);
            _content.txtStoryDungeon.autoFontSize = true;
            _content.iconRepeatDatingKey.setUriSprite(DatingUtil.getRepeatKeyImageUrl(param1.reward.repeatDatingIndex),37,37,false,1,null,true);
            _loc4_ = DatingUtil.getRepeatKeyName(param1.reward.repeatDatingIndex) + "\n\n" + DatingUtil.getRepeatKeyDescription(param1.reward.repeatDatingIndex);
            if(!_storyDungeonTooltipText)
            {
               _storyDungeonTooltipText = new UiTextTooltip(_content.txtStoryDungeon,_loc4_);
            }
            else
            {
               _storyDungeonTooltipText.text = _loc4_;
            }
            if(!_repeatDatingTooltipIcon)
            {
               _repeatDatingTooltipIcon = new UiTextTooltip(_content.iconRepeatDatingKey,_loc4_);
            }
            else
            {
               _repeatDatingTooltipIcon.text = _loc4_;
            }
         }
         _content.slotmachineJetonReward.visible = _quest.reward.slotMachinJetons > 0;
         if(_content.slotmachineJetonReward.visible)
         {
            if(_slotMachineJetonRewards == null)
            {
               _slotMachineJetonRewards = new UiSlotMachineJetonReward(_content.slotmachineJetonReward);
            }
            _slotMachineJetonRewards.amount = _quest.reward.slotMachinJetons;
         }
         _content.guildCompetitionItemReward.visible = _quest.reward.guildCompetitionItemIdentifier != null;
         if(_content.guildCompetitionItemReward.visible)
         {
            if(_guildCompetitionItemReward == null)
            {
               _guildCompetitionItemReward = new UiGuildCompetitionItemReward(_content.guildCompetitionItemReward);
            }
            _guildCompetitionItemReward.guildCompetitionItem = _quest.reward.guildCompetitionItemIdentifier;
         }
         _content.herobookItemReward.visible = param1.reward.herobookItemIdentifier != null;
         if(_content.herobookItemReward.visible)
         {
            if(_herobookItemReward == null)
            {
               _herobookItemReward = new UiHerobookItemReward(_content.herobookItemReward);
            }
            _herobookItemReward.refresh(param1.reward.herobookItemIdentifier);
         }
         var _loc5_:int = param1.reward.opticalChangeResource;
         _content.iconOpticalChangeResource.visible = false;
         if(!_content.txtStoryDungeon.visible && _loc5_ > 0)
         {
            _content.txtStoryDungeon.visible = true;
            _content.iconOpticalChangeResource.visible = true;
            _content.txtStoryDungeon.text = GameUtil.getOpticalChangeResourceString(_loc5_);
         }
         var _loc6_:int = param1.reward.fanFotoResource;
         _content.iconFanFotoResource.visible = false;
         if(!_content.txtStoryDungeon.visible && _loc6_ > 0 && _loc2_.fanFoto)
         {
            _content.txtStoryDungeon.visible = true;
            _content.iconFanFotoResource.visible = true;
            _content.txtStoryDungeon.text = GameUtil.getFanFotoResourceString(_loc6_);
         }
         _content.iconCoins.visible = param1.reward.gameCurrency > 0;
         _content.txtCoins.visible = param1.reward.gameCurrency > 0;
         _content.txtCoins.text = param1.reward.gameCurrencyString;
         _content.iconXp.visible = param1.reward.xp > 0;
         _content.txtXp.visible = param1.reward.xp > 0;
         _content.txtXp.text = param1.reward.xpString;
      }
   }
}
