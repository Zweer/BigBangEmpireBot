package visuals.ui.elements.quest
{
   import com.playata.framework.display.Sprite;
   import com.playata.framework.display.lib.flash.FlashDisplayObjectContainer;
   import com.playata.framework.display.lib.flash.FlashLabel;
   import com.playata.framework.display.lib.flash.FlashLabelArea;
   import com.playata.framework.display.lib.flash.FlashSprite;
   import com.playata.framework.display.ui.controls.ILabel;
   import com.playata.framework.display.ui.controls.ILabelArea;
   import flash.display.MovieClip;
   import visuals.ui.base.SymbolPlaceholderGeneric;
   import visuals.ui.elements.avatar.SymbolAvatarImagePlaceholderGeneric;
   import visuals.ui.elements.dungeon.SymbolDungeonKeyRewardGeneric;
   import visuals.ui.elements.fan_foto.SymbolIconFanFotoResourceGeneric;
   import visuals.ui.elements.gauge.SymbolStatQuestStatBackgroundGeneric;
   import visuals.ui.elements.icons.SymbolIconDurationGeneric;
   import visuals.ui.elements.icons.SymbolIconEnergyGeneric;
   import visuals.ui.elements.icons.SymbolIconGameCurrencyGeneric;
   import visuals.ui.elements.icons.SymbolIconXpGeneric;
   import visuals.ui.elements.item.SymbolItemSlotGeneric;
   import visuals.ui.elements.movie.SymbolMovieItemGeneric;
   import visuals.ui.elements.optical_changes.SymbolOpticalChangeResourceGeneric;
   import visuals.ui.elements.slotmachine.SymbolSlotmachineJetonRewardGeneric;
   
   public class SymbolQuestBriefingContentGeneric extends Sprite
   {
       
      
      private var _nativeObject:SymbolQuestBriefingContent = null;
      
      public var txtDescriptionTimeQuest:ILabelArea = null;
      
      public var txtDifficultyHard:ILabelArea = null;
      
      public var txtDifficultyMedium:ILabelArea = null;
      
      public var txtDifficultyEasy:ILabelArea = null;
      
      public var iconDuration:SymbolIconDurationGeneric = null;
      
      public var txtDuration:ILabel = null;
      
      public var iconCoins:SymbolIconGameCurrencyGeneric = null;
      
      public var txtCoins:ILabel = null;
      
      public var iconXp:SymbolIconXpGeneric = null;
      
      public var txtXp:ILabel = null;
      
      public var iconStoryDungeon:SymbolPlaceholderGeneric = null;
      
      public var iconRepeatStoryDungeonKey:SymbolPlaceholderGeneric = null;
      
      public var iconRepeatDatingKey:SymbolPlaceholderGeneric = null;
      
      public var iconFanFotoResource:SymbolIconFanFotoResourceGeneric = null;
      
      public var iconOpticalChangeResource:SymbolOpticalChangeResourceGeneric = null;
      
      public var txtStoryDungeon:ILabelArea = null;
      
      public var txtRewardsCaption:ILabel = null;
      
      public var txtRequirementsCaption:ILabel = null;
      
      public var iconEnergy:SymbolIconEnergyGeneric = null;
      
      public var txtEnergy:ILabel = null;
      
      public var itemReward:SymbolItemSlotGeneric = null;
      
      public var npcAvatarImageFightQuest:SymbolAvatarImagePlaceholderGeneric = null;
      
      public var npcAvatarImageStatQuest:SymbolAvatarImagePlaceholderGeneric = null;
      
      public var statQuestStatBackground:SymbolStatQuestStatBackgroundGeneric = null;
      
      public var stats:SymbolQuestBriefingStatsGeneric = null;
      
      public var txtDescriptionFightQuest:ILabelArea = null;
      
      public var dungeonKeyReward:SymbolDungeonKeyRewardGeneric = null;
      
      public var movieVoteReward:SymbolMovieItemGeneric = null;
      
      public var eventItemReward:SymbolMovieItemGeneric = null;
      
      public var datingItemReward:SymbolMovieItemGeneric = null;
      
      public var guildCompetitionItemReward:SymbolMovieItemGeneric = null;
      
      public var herobookItemReward:SymbolMovieItemGeneric = null;
      
      public var slotmachineJetonReward:SymbolSlotmachineJetonRewardGeneric = null;
      
      public function SymbolQuestBriefingContentGeneric(param1:MovieClip = null)
      {
         if(param1)
         {
            _nativeObject = param1 as SymbolQuestBriefingContent;
         }
         else
         {
            _nativeObject = new SymbolQuestBriefingContent();
         }
         super(null,FlashSprite.fromNative(_nativeObject));
         var _loc2_:FlashDisplayObjectContainer = _sprite as FlashDisplayObjectContainer;
         txtDescriptionTimeQuest = FlashLabelArea.fromNative(_nativeObject.txtDescriptionTimeQuest);
         txtDifficultyHard = FlashLabelArea.fromNative(_nativeObject.txtDifficultyHard);
         txtDifficultyMedium = FlashLabelArea.fromNative(_nativeObject.txtDifficultyMedium);
         txtDifficultyEasy = FlashLabelArea.fromNative(_nativeObject.txtDifficultyEasy);
         iconDuration = new SymbolIconDurationGeneric(_nativeObject.iconDuration);
         txtDuration = FlashLabel.fromNative(_nativeObject.txtDuration);
         iconCoins = new SymbolIconGameCurrencyGeneric(_nativeObject.iconCoins);
         txtCoins = FlashLabel.fromNative(_nativeObject.txtCoins);
         iconXp = new SymbolIconXpGeneric(_nativeObject.iconXp);
         txtXp = FlashLabel.fromNative(_nativeObject.txtXp);
         iconStoryDungeon = new SymbolPlaceholderGeneric(_nativeObject.iconStoryDungeon);
         iconRepeatStoryDungeonKey = new SymbolPlaceholderGeneric(_nativeObject.iconRepeatStoryDungeonKey);
         iconRepeatDatingKey = new SymbolPlaceholderGeneric(_nativeObject.iconRepeatDatingKey);
         iconFanFotoResource = new SymbolIconFanFotoResourceGeneric(_nativeObject.iconFanFotoResource);
         iconOpticalChangeResource = new SymbolOpticalChangeResourceGeneric(_nativeObject.iconOpticalChangeResource);
         txtStoryDungeon = FlashLabelArea.fromNative(_nativeObject.txtStoryDungeon);
         txtRewardsCaption = FlashLabel.fromNative(_nativeObject.txtRewardsCaption);
         txtRequirementsCaption = FlashLabel.fromNative(_nativeObject.txtRequirementsCaption);
         iconEnergy = new SymbolIconEnergyGeneric(_nativeObject.iconEnergy);
         txtEnergy = FlashLabel.fromNative(_nativeObject.txtEnergy);
         itemReward = new SymbolItemSlotGeneric(_nativeObject.itemReward);
         npcAvatarImageFightQuest = new SymbolAvatarImagePlaceholderGeneric(_nativeObject.npcAvatarImageFightQuest);
         npcAvatarImageStatQuest = new SymbolAvatarImagePlaceholderGeneric(_nativeObject.npcAvatarImageStatQuest);
         statQuestStatBackground = new SymbolStatQuestStatBackgroundGeneric(_nativeObject.statQuestStatBackground);
         stats = new SymbolQuestBriefingStatsGeneric(_nativeObject.stats);
         txtDescriptionFightQuest = FlashLabelArea.fromNative(_nativeObject.txtDescriptionFightQuest);
         dungeonKeyReward = new SymbolDungeonKeyRewardGeneric(_nativeObject.dungeonKeyReward);
         movieVoteReward = new SymbolMovieItemGeneric(_nativeObject.movieVoteReward);
         eventItemReward = new SymbolMovieItemGeneric(_nativeObject.eventItemReward);
         datingItemReward = new SymbolMovieItemGeneric(_nativeObject.datingItemReward);
         guildCompetitionItemReward = new SymbolMovieItemGeneric(_nativeObject.guildCompetitionItemReward);
         herobookItemReward = new SymbolMovieItemGeneric(_nativeObject.herobookItemReward);
         slotmachineJetonReward = new SymbolSlotmachineJetonRewardGeneric(_nativeObject.slotmachineJetonReward);
      }
      
      public function setNativeInstance(param1:SymbolQuestBriefingContent) : void
      {
         FlashSprite.setNativeInstance(_sprite,param1);
         _nativeObject = param1;
         syncInstances();
      }
      
      public function syncInstances() : void
      {
         FlashLabelArea.setNativeInstance(txtDescriptionTimeQuest,_nativeObject.txtDescriptionTimeQuest);
         FlashLabelArea.setNativeInstance(txtDifficultyHard,_nativeObject.txtDifficultyHard);
         FlashLabelArea.setNativeInstance(txtDifficultyMedium,_nativeObject.txtDifficultyMedium);
         FlashLabelArea.setNativeInstance(txtDifficultyEasy,_nativeObject.txtDifficultyEasy);
         if(_nativeObject.iconDuration)
         {
            iconDuration.setNativeInstance(_nativeObject.iconDuration);
         }
         FlashLabel.setNativeInstance(txtDuration,_nativeObject.txtDuration);
         if(_nativeObject.iconCoins)
         {
            iconCoins.setNativeInstance(_nativeObject.iconCoins);
         }
         FlashLabel.setNativeInstance(txtCoins,_nativeObject.txtCoins);
         if(_nativeObject.iconXp)
         {
            iconXp.setNativeInstance(_nativeObject.iconXp);
         }
         FlashLabel.setNativeInstance(txtXp,_nativeObject.txtXp);
         if(_nativeObject.iconStoryDungeon)
         {
            iconStoryDungeon.setNativeInstance(_nativeObject.iconStoryDungeon);
         }
         if(_nativeObject.iconRepeatStoryDungeonKey)
         {
            iconRepeatStoryDungeonKey.setNativeInstance(_nativeObject.iconRepeatStoryDungeonKey);
         }
         if(_nativeObject.iconRepeatDatingKey)
         {
            iconRepeatDatingKey.setNativeInstance(_nativeObject.iconRepeatDatingKey);
         }
         if(_nativeObject.iconFanFotoResource)
         {
            iconFanFotoResource.setNativeInstance(_nativeObject.iconFanFotoResource);
         }
         if(_nativeObject.iconOpticalChangeResource)
         {
            iconOpticalChangeResource.setNativeInstance(_nativeObject.iconOpticalChangeResource);
         }
         FlashLabelArea.setNativeInstance(txtStoryDungeon,_nativeObject.txtStoryDungeon);
         FlashLabel.setNativeInstance(txtRewardsCaption,_nativeObject.txtRewardsCaption);
         FlashLabel.setNativeInstance(txtRequirementsCaption,_nativeObject.txtRequirementsCaption);
         if(_nativeObject.iconEnergy)
         {
            iconEnergy.setNativeInstance(_nativeObject.iconEnergy);
         }
         FlashLabel.setNativeInstance(txtEnergy,_nativeObject.txtEnergy);
         if(_nativeObject.itemReward)
         {
            itemReward.setNativeInstance(_nativeObject.itemReward);
         }
         if(_nativeObject.npcAvatarImageFightQuest)
         {
            npcAvatarImageFightQuest.setNativeInstance(_nativeObject.npcAvatarImageFightQuest);
         }
         if(_nativeObject.npcAvatarImageStatQuest)
         {
            npcAvatarImageStatQuest.setNativeInstance(_nativeObject.npcAvatarImageStatQuest);
         }
         if(_nativeObject.statQuestStatBackground)
         {
            statQuestStatBackground.setNativeInstance(_nativeObject.statQuestStatBackground);
         }
         if(_nativeObject.stats)
         {
            stats.setNativeInstance(_nativeObject.stats);
         }
         FlashLabelArea.setNativeInstance(txtDescriptionFightQuest,_nativeObject.txtDescriptionFightQuest);
         if(_nativeObject.dungeonKeyReward)
         {
            dungeonKeyReward.setNativeInstance(_nativeObject.dungeonKeyReward);
         }
         if(_nativeObject.movieVoteReward)
         {
            movieVoteReward.setNativeInstance(_nativeObject.movieVoteReward);
         }
         if(_nativeObject.eventItemReward)
         {
            eventItemReward.setNativeInstance(_nativeObject.eventItemReward);
         }
         if(_nativeObject.datingItemReward)
         {
            datingItemReward.setNativeInstance(_nativeObject.datingItemReward);
         }
         if(_nativeObject.guildCompetitionItemReward)
         {
            guildCompetitionItemReward.setNativeInstance(_nativeObject.guildCompetitionItemReward);
         }
         if(_nativeObject.herobookItemReward)
         {
            herobookItemReward.setNativeInstance(_nativeObject.herobookItemReward);
         }
         if(_nativeObject.slotmachineJetonReward)
         {
            slotmachineJetonReward.setNativeInstance(_nativeObject.slotmachineJetonReward);
         }
      }
   }
}
