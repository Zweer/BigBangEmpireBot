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
   import visuals.ui.elements.avatar.SymbolAvatarImagePlaceholderGeneric;
   import visuals.ui.elements.gauge.SymbolStatQuestStatBackgroundGeneric;
   import visuals.ui.elements.icons.SymbolIconGameCurrencyGeneric;
   import visuals.ui.elements.icons.SymbolIconXpGeneric;
   import visuals.ui.elements.movie.SymbolMovieItemGeneric;
   
   public class SymbolMovieQuestBriefingContentGeneric extends Sprite
   {
       
      
      private var _nativeObject:SymbolMovieQuestBriefingContent = null;
      
      public var txtDescriptionTimeQuest:ILabelArea = null;
      
      public var txtDifficultyHard:ILabelArea = null;
      
      public var txtDifficultyMedium:ILabelArea = null;
      
      public var txtDifficultyEasy:ILabelArea = null;
      
      public var txtEnergy:ILabel = null;
      
      public var iconCoins:SymbolIconGameCurrencyGeneric = null;
      
      public var txtCoins:ILabel = null;
      
      public var iconXp:SymbolIconXpGeneric = null;
      
      public var txtXp:ILabel = null;
      
      public var txtProgress:ILabel = null;
      
      public var txtRewardsCaption:ILabel = null;
      
      public var txtRequirementsCaption:ILabel = null;
      
      public var npcAvatarImageFightQuest:SymbolAvatarImagePlaceholderGeneric = null;
      
      public var npcAvatarImageStatQuest:SymbolAvatarImagePlaceholderGeneric = null;
      
      public var statQuestStatBackground:SymbolStatQuestStatBackgroundGeneric = null;
      
      public var stats:SymbolQuestBriefingStatsGeneric = null;
      
      public var txtDescriptionFightQuest:ILabelArea = null;
      
      public var movieVoteReward:SymbolMovieItemGeneric = null;
      
      public function SymbolMovieQuestBriefingContentGeneric(param1:MovieClip = null)
      {
         if(param1)
         {
            _nativeObject = param1 as SymbolMovieQuestBriefingContent;
         }
         else
         {
            _nativeObject = new SymbolMovieQuestBriefingContent();
         }
         super(null,FlashSprite.fromNative(_nativeObject));
         var _loc2_:FlashDisplayObjectContainer = _sprite as FlashDisplayObjectContainer;
         txtDescriptionTimeQuest = FlashLabelArea.fromNative(_nativeObject.txtDescriptionTimeQuest);
         txtDifficultyHard = FlashLabelArea.fromNative(_nativeObject.txtDifficultyHard);
         txtDifficultyMedium = FlashLabelArea.fromNative(_nativeObject.txtDifficultyMedium);
         txtDifficultyEasy = FlashLabelArea.fromNative(_nativeObject.txtDifficultyEasy);
         txtEnergy = FlashLabel.fromNative(_nativeObject.txtEnergy);
         iconCoins = new SymbolIconGameCurrencyGeneric(_nativeObject.iconCoins);
         txtCoins = FlashLabel.fromNative(_nativeObject.txtCoins);
         iconXp = new SymbolIconXpGeneric(_nativeObject.iconXp);
         txtXp = FlashLabel.fromNative(_nativeObject.txtXp);
         txtProgress = FlashLabel.fromNative(_nativeObject.txtProgress);
         txtRewardsCaption = FlashLabel.fromNative(_nativeObject.txtRewardsCaption);
         txtRequirementsCaption = FlashLabel.fromNative(_nativeObject.txtRequirementsCaption);
         npcAvatarImageFightQuest = new SymbolAvatarImagePlaceholderGeneric(_nativeObject.npcAvatarImageFightQuest);
         npcAvatarImageStatQuest = new SymbolAvatarImagePlaceholderGeneric(_nativeObject.npcAvatarImageStatQuest);
         statQuestStatBackground = new SymbolStatQuestStatBackgroundGeneric(_nativeObject.statQuestStatBackground);
         stats = new SymbolQuestBriefingStatsGeneric(_nativeObject.stats);
         txtDescriptionFightQuest = FlashLabelArea.fromNative(_nativeObject.txtDescriptionFightQuest);
         movieVoteReward = new SymbolMovieItemGeneric(_nativeObject.movieVoteReward);
      }
      
      public function setNativeInstance(param1:SymbolMovieQuestBriefingContent) : void
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
         FlashLabel.setNativeInstance(txtEnergy,_nativeObject.txtEnergy);
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
         FlashLabel.setNativeInstance(txtProgress,_nativeObject.txtProgress);
         FlashLabel.setNativeInstance(txtRewardsCaption,_nativeObject.txtRewardsCaption);
         FlashLabel.setNativeInstance(txtRequirementsCaption,_nativeObject.txtRequirementsCaption);
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
         if(_nativeObject.movieVoteReward)
         {
            movieVoteReward.setNativeInstance(_nativeObject.movieVoteReward);
         }
      }
   }
}
