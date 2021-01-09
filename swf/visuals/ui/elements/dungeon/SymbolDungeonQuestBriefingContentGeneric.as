package visuals.ui.elements.dungeon
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
   import visuals.ui.elements.icons.SymbolIconLevelStarGeneric;
   import visuals.ui.elements.icons.SymbolIconXpGeneric;
   import visuals.ui.elements.item.SymbolItemSlotGeneric;
   import visuals.ui.elements.quest.SymbolQuestBriefingStatsGeneric;
   
   public class SymbolDungeonQuestBriefingContentGeneric extends Sprite
   {
       
      
      private var _nativeObject:SymbolDungeonQuestBriefingContent = null;
      
      public var txtLevel:ILabelArea = null;
      
      public var iconLevel:SymbolIconLevelStarGeneric = null;
      
      public var npcAvatarImageFightQuest:SymbolAvatarImagePlaceholderGeneric = null;
      
      public var txtDifficultyHard:ILabel = null;
      
      public var txtDifficultyMedium:ILabel = null;
      
      public var txtDifficultyEasy:ILabel = null;
      
      public var statQuestStatBackground:SymbolStatQuestStatBackgroundGeneric = null;
      
      public var npcAvatarImageStatQuest:SymbolAvatarImagePlaceholderGeneric = null;
      
      public var stats:SymbolQuestBriefingStatsGeneric = null;
      
      public var iconCoins:SymbolIconGameCurrencyGeneric = null;
      
      public var txtCoins:ILabel = null;
      
      public var iconXp:SymbolIconXpGeneric = null;
      
      public var txtXp:ILabel = null;
      
      public var txtRewardsCaption:ILabel = null;
      
      public var txtDescription:ILabelArea = null;
      
      public var itemReward:SymbolItemSlotGeneric = null;
      
      public function SymbolDungeonQuestBriefingContentGeneric(param1:MovieClip = null)
      {
         if(param1)
         {
            _nativeObject = param1 as SymbolDungeonQuestBriefingContent;
         }
         else
         {
            _nativeObject = new SymbolDungeonQuestBriefingContent();
         }
         super(null,FlashSprite.fromNative(_nativeObject));
         var _loc2_:FlashDisplayObjectContainer = _sprite as FlashDisplayObjectContainer;
         txtLevel = FlashLabelArea.fromNative(_nativeObject.txtLevel);
         iconLevel = new SymbolIconLevelStarGeneric(_nativeObject.iconLevel);
         npcAvatarImageFightQuest = new SymbolAvatarImagePlaceholderGeneric(_nativeObject.npcAvatarImageFightQuest);
         txtDifficultyHard = FlashLabel.fromNative(_nativeObject.txtDifficultyHard);
         txtDifficultyMedium = FlashLabel.fromNative(_nativeObject.txtDifficultyMedium);
         txtDifficultyEasy = FlashLabel.fromNative(_nativeObject.txtDifficultyEasy);
         statQuestStatBackground = new SymbolStatQuestStatBackgroundGeneric(_nativeObject.statQuestStatBackground);
         npcAvatarImageStatQuest = new SymbolAvatarImagePlaceholderGeneric(_nativeObject.npcAvatarImageStatQuest);
         stats = new SymbolQuestBriefingStatsGeneric(_nativeObject.stats);
         iconCoins = new SymbolIconGameCurrencyGeneric(_nativeObject.iconCoins);
         txtCoins = FlashLabel.fromNative(_nativeObject.txtCoins);
         iconXp = new SymbolIconXpGeneric(_nativeObject.iconXp);
         txtXp = FlashLabel.fromNative(_nativeObject.txtXp);
         txtRewardsCaption = FlashLabel.fromNative(_nativeObject.txtRewardsCaption);
         txtDescription = FlashLabelArea.fromNative(_nativeObject.txtDescription);
         itemReward = new SymbolItemSlotGeneric(_nativeObject.itemReward);
      }
      
      public function setNativeInstance(param1:SymbolDungeonQuestBriefingContent) : void
      {
         FlashSprite.setNativeInstance(_sprite,param1);
         _nativeObject = param1;
         syncInstances();
      }
      
      public function syncInstances() : void
      {
         FlashLabelArea.setNativeInstance(txtLevel,_nativeObject.txtLevel);
         if(_nativeObject.iconLevel)
         {
            iconLevel.setNativeInstance(_nativeObject.iconLevel);
         }
         if(_nativeObject.npcAvatarImageFightQuest)
         {
            npcAvatarImageFightQuest.setNativeInstance(_nativeObject.npcAvatarImageFightQuest);
         }
         FlashLabel.setNativeInstance(txtDifficultyHard,_nativeObject.txtDifficultyHard);
         FlashLabel.setNativeInstance(txtDifficultyMedium,_nativeObject.txtDifficultyMedium);
         FlashLabel.setNativeInstance(txtDifficultyEasy,_nativeObject.txtDifficultyEasy);
         if(_nativeObject.statQuestStatBackground)
         {
            statQuestStatBackground.setNativeInstance(_nativeObject.statQuestStatBackground);
         }
         if(_nativeObject.npcAvatarImageStatQuest)
         {
            npcAvatarImageStatQuest.setNativeInstance(_nativeObject.npcAvatarImageStatQuest);
         }
         if(_nativeObject.stats)
         {
            stats.setNativeInstance(_nativeObject.stats);
         }
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
         FlashLabel.setNativeInstance(txtRewardsCaption,_nativeObject.txtRewardsCaption);
         FlashLabelArea.setNativeInstance(txtDescription,_nativeObject.txtDescription);
         if(_nativeObject.itemReward)
         {
            itemReward.setNativeInstance(_nativeObject.itemReward);
         }
      }
   }
}
