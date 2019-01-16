package visuals.ui.dialogs
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
   import visuals.ui.base.SymbolUiButtonDefaultGeneric;
   import visuals.ui.elements.backgrounds.SymbolSlice9BackgroundDialogGeneric;
   import visuals.ui.elements.dungeon.SymbolDungeonKeyRewardGeneric;
   import visuals.ui.elements.fan_foto.SymbolIconFanFotoResourceGeneric;
   import visuals.ui.elements.icons.SymbolIconGameCurrencyGeneric;
   import visuals.ui.elements.icons.SymbolIconPremiumCurrencyGeneric;
   import visuals.ui.elements.icons.SymbolIconXpGeneric;
   import visuals.ui.elements.item.SymbolItemSlotGeneric;
   import visuals.ui.elements.movie.SymbolMovieItemGeneric;
   import visuals.ui.elements.optical_changes.SymbolOpticalChangeResourceGeneric;
   import visuals.ui.elements.slotmachine.SymbolSlotmachineJetonRewardGeneric;
   
   public class SymbolDialogQuestCompleteGeneric extends Sprite
   {
       
      
      private var _nativeObject:SymbolDialogQuestComplete = null;
      
      public var dialogBackground:SymbolSlice9BackgroundDialogGeneric = null;
      
      public var txtDialogTitle:ILabel = null;
      
      public var btnClose:SymbolUiButtonDefaultGeneric = null;
      
      public var iconCoins:SymbolIconGameCurrencyGeneric = null;
      
      public var txtCoins:ILabel = null;
      
      public var iconXp:SymbolIconXpGeneric = null;
      
      public var txtXp:ILabel = null;
      
      public var txtRewardsCaption:ILabel = null;
      
      public var itemReward:SymbolItemSlotGeneric = null;
      
      public var txtOutcome:ILabelArea = null;
      
      public var iconPremiumCurrency:SymbolIconPremiumCurrencyGeneric = null;
      
      public var txtPremiumCurrency:ILabel = null;
      
      public var txtStoryDungeon:ILabelArea = null;
      
      public var iconStoryDungeon:SymbolPlaceholderGeneric = null;
      
      public var iconFanFotoResource:SymbolIconFanFotoResourceGeneric = null;
      
      public var iconOpticalChangeResource:SymbolOpticalChangeResourceGeneric = null;
      
      public var iconRepeatStoryDungeonKey:SymbolPlaceholderGeneric = null;
      
      public var iconRepeatDatingKey:SymbolPlaceholderGeneric = null;
      
      public var dungeonKeyReward:SymbolDungeonKeyRewardGeneric = null;
      
      public var movieVoteReward:SymbolMovieItemGeneric = null;
      
      public var eventItemReward:SymbolMovieItemGeneric = null;
      
      public var datingItemReward:SymbolMovieItemGeneric = null;
      
      public var guildCompetitionItemReward:SymbolMovieItemGeneric = null;
      
      public var herobookItemReward:SymbolMovieItemGeneric = null;
      
      public var slotmachineJetonReward:SymbolSlotmachineJetonRewardGeneric = null;
      
      public function SymbolDialogQuestCompleteGeneric(param1:MovieClip = null)
      {
         if(param1)
         {
            _nativeObject = param1 as SymbolDialogQuestComplete;
         }
         else
         {
            _nativeObject = new SymbolDialogQuestComplete();
         }
         super(null,FlashSprite.fromNative(_nativeObject));
         var _loc2_:FlashDisplayObjectContainer = _sprite as FlashDisplayObjectContainer;
         dialogBackground = new SymbolSlice9BackgroundDialogGeneric(_nativeObject.dialogBackground);
         txtDialogTitle = FlashLabel.fromNative(_nativeObject.txtDialogTitle);
         btnClose = new SymbolUiButtonDefaultGeneric(_nativeObject.btnClose);
         iconCoins = new SymbolIconGameCurrencyGeneric(_nativeObject.iconCoins);
         txtCoins = FlashLabel.fromNative(_nativeObject.txtCoins);
         iconXp = new SymbolIconXpGeneric(_nativeObject.iconXp);
         txtXp = FlashLabel.fromNative(_nativeObject.txtXp);
         txtRewardsCaption = FlashLabel.fromNative(_nativeObject.txtRewardsCaption);
         itemReward = new SymbolItemSlotGeneric(_nativeObject.itemReward);
         txtOutcome = FlashLabelArea.fromNative(_nativeObject.txtOutcome);
         iconPremiumCurrency = new SymbolIconPremiumCurrencyGeneric(_nativeObject.iconPremiumCurrency);
         txtPremiumCurrency = FlashLabel.fromNative(_nativeObject.txtPremiumCurrency);
         txtStoryDungeon = FlashLabelArea.fromNative(_nativeObject.txtStoryDungeon);
         iconStoryDungeon = new SymbolPlaceholderGeneric(_nativeObject.iconStoryDungeon);
         iconFanFotoResource = new SymbolIconFanFotoResourceGeneric(_nativeObject.iconFanFotoResource);
         iconOpticalChangeResource = new SymbolOpticalChangeResourceGeneric(_nativeObject.iconOpticalChangeResource);
         iconRepeatStoryDungeonKey = new SymbolPlaceholderGeneric(_nativeObject.iconRepeatStoryDungeonKey);
         iconRepeatDatingKey = new SymbolPlaceholderGeneric(_nativeObject.iconRepeatDatingKey);
         dungeonKeyReward = new SymbolDungeonKeyRewardGeneric(_nativeObject.dungeonKeyReward);
         movieVoteReward = new SymbolMovieItemGeneric(_nativeObject.movieVoteReward);
         eventItemReward = new SymbolMovieItemGeneric(_nativeObject.eventItemReward);
         datingItemReward = new SymbolMovieItemGeneric(_nativeObject.datingItemReward);
         guildCompetitionItemReward = new SymbolMovieItemGeneric(_nativeObject.guildCompetitionItemReward);
         herobookItemReward = new SymbolMovieItemGeneric(_nativeObject.herobookItemReward);
         slotmachineJetonReward = new SymbolSlotmachineJetonRewardGeneric(_nativeObject.slotmachineJetonReward);
      }
      
      public function setNativeInstance(param1:SymbolDialogQuestComplete) : void
      {
         FlashSprite.setNativeInstance(_sprite,param1);
         _nativeObject = param1;
         syncInstances();
      }
      
      public function syncInstances() : void
      {
         if(_nativeObject.dialogBackground)
         {
            dialogBackground.setNativeInstance(_nativeObject.dialogBackground);
         }
         FlashLabel.setNativeInstance(txtDialogTitle,_nativeObject.txtDialogTitle);
         if(_nativeObject.btnClose)
         {
            btnClose.setNativeInstance(_nativeObject.btnClose);
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
         if(_nativeObject.itemReward)
         {
            itemReward.setNativeInstance(_nativeObject.itemReward);
         }
         FlashLabelArea.setNativeInstance(txtOutcome,_nativeObject.txtOutcome);
         if(_nativeObject.iconPremiumCurrency)
         {
            iconPremiumCurrency.setNativeInstance(_nativeObject.iconPremiumCurrency);
         }
         FlashLabel.setNativeInstance(txtPremiumCurrency,_nativeObject.txtPremiumCurrency);
         FlashLabelArea.setNativeInstance(txtStoryDungeon,_nativeObject.txtStoryDungeon);
         if(_nativeObject.iconStoryDungeon)
         {
            iconStoryDungeon.setNativeInstance(_nativeObject.iconStoryDungeon);
         }
         if(_nativeObject.iconFanFotoResource)
         {
            iconFanFotoResource.setNativeInstance(_nativeObject.iconFanFotoResource);
         }
         if(_nativeObject.iconOpticalChangeResource)
         {
            iconOpticalChangeResource.setNativeInstance(_nativeObject.iconOpticalChangeResource);
         }
         if(_nativeObject.iconRepeatStoryDungeonKey)
         {
            iconRepeatStoryDungeonKey.setNativeInstance(_nativeObject.iconRepeatStoryDungeonKey);
         }
         if(_nativeObject.iconRepeatDatingKey)
         {
            iconRepeatDatingKey.setNativeInstance(_nativeObject.iconRepeatDatingKey);
         }
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
