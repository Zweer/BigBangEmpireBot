package com.playata.application.ui.elements.dungeon
{
   import com.playata.application.data.dungeon.DungeonQuest;
   import com.playata.application.data.user.User;
   import com.playata.application.ui.elements.avatar.UiAvatarImage;
   import com.playata.application.ui.elements.generic.textfield.UiTextTooltip;
   import com.playata.application.ui.elements.item.UiItemSlot;
   import com.playata.framework.application.Environment;
   import com.playata.framework.localization.LocText;
   import visuals.ui.elements.dungeon.SymbolDungeonQuestBriefingContentGeneric;
   
   public class UiDungeonQuestBriefingContent
   {
       
      
      private var _content:SymbolDungeonQuestBriefingContentGeneric = null;
      
      private var _dungeonQuest:DungeonQuest = null;
      
      private var _itemReward:UiItemSlot = null;
      
      private var _npcAvatarFightQuest:UiAvatarImage;
      
      private var _npcAvatarStatQuest:UiAvatarImage;
      
      private var _statQuestStatTooltip:UiTextTooltip;
      
      private var _difficultyTooltip:UiTextTooltip;
      
      public function UiDungeonQuestBriefingContent(param1:SymbolDungeonQuestBriefingContentGeneric)
      {
         var _loc2_:* = NaN;
         super();
         _content = param1;
         if(Environment.info.defaultLocale == "de_DE")
         {
            _loc2_ = 70;
            _content.iconCoins.x = _content.iconCoins.x + _loc2_;
            _content.txtCoins.x = _content.txtCoins.x + _loc2_;
            _content.iconXp.x = _content.iconXp.x + _loc2_;
            _content.txtXp.x = _content.txtXp.x + _loc2_;
         }
         _npcAvatarFightQuest = new UiAvatarImage(_content.npcAvatarImageFightQuest,false);
         _npcAvatarStatQuest = new UiAvatarImage(_content.npcAvatarImageStatQuest,false);
      }
      
      public function dispose() : void
      {
         if(_statQuestStatTooltip != null)
         {
            _statQuestStatTooltip.dispose();
            _statQuestStatTooltip = null;
         }
         if(_difficultyTooltip != null)
         {
            _difficultyTooltip.dispose();
            _difficultyTooltip = null;
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
      
      public function get content() : SymbolDungeonQuestBriefingContentGeneric
      {
         return _content;
      }
      
      public function refresh(param1:DungeonQuest) : void
      {
         var _loc2_:* = null;
         _dungeonQuest = param1;
         if(_dungeonQuest == null)
         {
            return;
         }
         _content.txtDescription.text = _dungeonQuest.briefingText;
         _content.txtDescription.autoFontSize = true;
         _content.txtLevel.text = LocText.current.text("dialog/dungeon_quest_briefing/npc_level",_dungeonQuest.npcLevel);
         _content.txtRewardsCaption.text = LocText.current.text("dialog/dungeon_quest_briefing/rewards_caption");
         if(_dungeonQuest.isFightQuest)
         {
            _npcAvatarFightQuest.showDungeonNpcImage(param1.npcThumbnailImageUrl);
            _content.npcAvatarImageStatQuest.visible = false;
            _content.statQuestStatBackground.visible = false;
            _content.stats.visible = false;
            _content.txtDifficultyEasy.visible = false;
            _content.txtDifficultyMedium.visible = false;
            _content.txtDifficultyHard.visible = false;
         }
         else
         {
            _content.stats.gotoAndStop(param1.statQuestStat);
            _content.npcAvatarImageFightQuest.visible = false;
            _content.iconLevel.visible = false;
            _content.txtLevel.visible = false;
            if(_dungeonQuest.npcIdentifier)
            {
               _npcAvatarStatQuest.showDungeonNpcImage(param1.npcThumbnailImageUrl);
               _content.stats.x = 195;
               _content.statQuestStatBackground.visible = false;
            }
            else
            {
               _content.stats.x = 225;
               _content.npcAvatarImageStatQuest.visible = false;
            }
            _loc2_ = param1.statDescription + "\n\n" + param1.difficultyDescription;
            _statQuestStatTooltip = new UiTextTooltip(_content.stats,_loc2_);
            switch(int(param1.difficulty) - 1)
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
            _content.txtDifficultyEasy.autoFontSize = true;
            _content.txtDifficultyMedium.autoFontSize = true;
            _content.txtDifficultyHard.autoFontSize = true;
            _content.txtDifficultyEasy.visible = param1.difficulty == 1;
            _content.txtDifficultyMedium.visible = param1.difficulty == 2;
            _content.txtDifficultyHard.visible = param1.difficulty == 3;
         }
         _content.itemReward.visible = _dungeonQuest.reward.itemId != 0;
         if(_dungeonQuest.reward.itemId != 0)
         {
            if(_itemReward == null)
            {
               _itemReward = new UiItemSlot(_content.itemReward,0);
            }
            _itemReward.item = User.current.character.getItemById(_dungeonQuest.reward.itemId);
         }
         _content.iconCoins.visible = _dungeonQuest.reward.gameCurrency > 0;
         _content.txtCoins.visible = _dungeonQuest.reward.gameCurrency > 0;
         _content.txtCoins.text = _dungeonQuest.reward.gameCurrencyString;
         _content.iconXp.visible = _dungeonQuest.reward.xp > 0;
         _content.txtXp.visible = _dungeonQuest.reward.xp > 0;
         _content.txtXp.text = _dungeonQuest.reward.xpString;
      }
   }
}
