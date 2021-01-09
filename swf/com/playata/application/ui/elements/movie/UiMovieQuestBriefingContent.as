package com.playata.application.ui.elements.movie
{
   import com.playata.application.data.GameUtil;
   import com.playata.application.data.movie.MovieQuest;
   import com.playata.application.ui.elements.avatar.UiAvatarImage;
   import com.playata.application.ui.elements.generic.textfield.UiTextTooltip;
   import com.playata.framework.localization.LocText;
   import visuals.ui.elements.quest.SymbolMovieQuestBriefingContentGeneric;
   
   public class UiMovieQuestBriefingContent
   {
       
      
      private var _content:SymbolMovieQuestBriefingContentGeneric = null;
      
      private var _quest:MovieQuest = null;
      
      private var _difficultyTooltip:UiTextTooltip = null;
      
      private var _statQuestStatTooltip:UiTextTooltip;
      
      private var _npcAvatarFightQuest:UiAvatarImage;
      
      private var _npcAvatarStatQuest:UiAvatarImage;
      
      private var _movieVoteItemReward:UiMovieVoteItem;
      
      public function UiMovieQuestBriefingContent(param1:SymbolMovieQuestBriefingContentGeneric)
      {
         super();
         _content = param1;
         _npcAvatarFightQuest = new UiAvatarImage(_content.npcAvatarImageFightQuest,false);
         _npcAvatarStatQuest = new UiAvatarImage(_content.npcAvatarImageStatQuest,false);
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
      }
      
      public function get content() : SymbolMovieQuestBriefingContentGeneric
      {
         return _content;
      }
      
      public function refresh(param1:MovieQuest) : void
      {
         var _loc2_:* = null;
         _quest = param1;
         if(_quest == null)
         {
            return;
         }
         if(param1.isInstantQuest)
         {
            _content.txtDescriptionTimeQuest.text = param1.briefingText;
            _content.txtDescriptionTimeQuest.autoFontSize = true;
            _content.txtDescriptionTimeQuest.visible = true;
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
            _content.txtDescriptionTimeQuest.visible = false;
            _content.txtDescriptionFightQuest.visible = true;
            _content.stats.visible = true;
            _content.npcAvatarImageFightQuest.visible = false;
            _loc2_ = param1.statDescription + "\n\n" + param1.difficultyDescription;
            _statQuestStatTooltip = new UiTextTooltip(_content.stats,_loc2_);
            switch(int(param1.fightDifficulty) - 1)
            {
               case 0:
                  _difficultyTooltip = new UiTextTooltip(_content.txtDifficultyEasy,_loc2_);
                  break;
               case 1:
                  _difficultyTooltip = new UiTextTooltip(_content.txtDifficultyMedium,_loc2_);
                  break;
               case 2:
                  _difficultyTooltip = new UiTextTooltip(_content.txtDifficultyHard,_loc2_);
            }
            _content.txtDifficultyEasy.text = param1.difficultyName;
            _content.txtDifficultyMedium.text = param1.difficultyName;
            _content.txtDifficultyHard.text = param1.difficultyName;
            _content.txtDifficultyEasy.visible = param1.fightDifficulty == 1;
            _content.txtDifficultyMedium.visible = param1.fightDifficulty == 2;
            _content.txtDifficultyHard.visible = param1.fightDifficulty == 3;
            _content.stats.gotoAndStop(param1.statQuestStat);
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
            _content.txtDescriptionTimeQuest.visible = false;
            _content.txtDescriptionFightQuest.text = param1.briefingText;
            _content.txtDescriptionFightQuest.autoFontSize = true;
            _content.txtDescriptionFightQuest.visible = true;
            _content.stats.visible = false;
            _content.statQuestStatBackground.visible = false;
            _content.npcAvatarImageFightQuest.visible = true;
            _content.npcAvatarImageStatQuest.visible = false;
            switch(int(param1.fightDifficulty) - 1)
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
            _content.txtDifficultyEasy.visible = param1.fightDifficulty == 1;
            _content.txtDifficultyMedium.visible = param1.fightDifficulty == 2;
            _content.txtDifficultyHard.visible = param1.fightDifficulty == 3;
            _npcAvatarFightQuest.showNpcImage(param1.npcThumbnailImageUrl);
         }
         _content.txtRequirementsCaption.text = LocText.current.text("dialog/movie_quest_briefing/requirements");
         _content.txtRewardsCaption.text = LocText.current.text("dialog/movie_quest_briefing/rewards");
         _content.txtEnergy.text = GameUtil.getMovieEnergyString(param1.energyCost);
         _content.txtCoins.text = param1.reward.gameCurrencyString;
         _content.txtXp.text = param1.reward.xpString;
         _content.txtProgress.text = param1.reward.movieProgressString;
         _content.movieVoteReward.visible = param1.reward.movieVotes > 0;
         if(_content.movieVoteReward.visible)
         {
            if(_movieVoteItemReward == null)
            {
               _movieVoteItemReward = new UiMovieVoteItem(_content.movieVoteReward);
            }
            _movieVoteItemReward.movieVotes = param1.reward.movieVotes;
         }
      }
   }
}
