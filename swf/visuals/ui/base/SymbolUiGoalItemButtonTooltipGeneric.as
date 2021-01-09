package visuals.ui.base
{
   import com.playata.framework.display.Sprite;
   import com.playata.framework.display.lib.flash.FlashDisplayObjectContainer;
   import com.playata.framework.display.lib.flash.FlashLabel;
   import com.playata.framework.display.lib.flash.FlashLabelArea;
   import com.playata.framework.display.lib.flash.FlashSprite;
   import com.playata.framework.display.ui.controls.ILabel;
   import com.playata.framework.display.ui.controls.ILabelArea;
   import flash.display.MovieClip;
   import visuals.ui.elements.backgrounds.SymbolSlice9BackgroundTooltipGeneric;
   import visuals.ui.elements.generic.SymbolProgressBarBigGeneric;
   import visuals.ui.elements.goal.SymbolGoalInfoTtileRewardGeneric;
   import visuals.ui.elements.icons.SymbolIconBoosterGeneric;
   import visuals.ui.elements.icons.SymbolIconEnergyGeneric;
   import visuals.ui.elements.icons.SymbolIconFansGeneric;
   import visuals.ui.elements.icons.SymbolIconGameCurrencyGeneric;
   import visuals.ui.elements.icons.SymbolIconGiftGeneric;
   import visuals.ui.elements.icons.SymbolIconPlusGeneric;
   import visuals.ui.elements.icons.SymbolIconPremiumCurrencyGeneric;
   import visuals.ui.elements.icons.SymbolIconXpGeneric;
   import visuals.ui.elements.streaming.SymbolIconStreamingResourceGeneric;
   
   public class SymbolUiGoalItemButtonTooltipGeneric extends Sprite
   {
       
      
      private var _nativeObject:SymbolUiGoalItemButtonTooltip = null;
      
      public var background:SymbolSlice9BackgroundTooltipGeneric = null;
      
      public var progressBar:SymbolProgressBarBigGeneric = null;
      
      public var txtName:ILabelArea = null;
      
      public var captionProgress:ILabelArea = null;
      
      public var txtProgress:ILabelArea = null;
      
      public var captionReward:ILabelArea = null;
      
      public var iconXp:SymbolIconXpGeneric = null;
      
      public var iconBooster:SymbolIconBoosterGeneric = null;
      
      public var iconQuestEnergy:SymbolIconEnergyGeneric = null;
      
      public var iconStatPoints:SymbolIconPlusGeneric = null;
      
      public var iconItem:SymbolIconGiftGeneric = null;
      
      public var iconPremiumCurrency:SymbolIconPremiumCurrencyGeneric = null;
      
      public var iconCoins:SymbolIconGameCurrencyGeneric = null;
      
      public var iconFans:SymbolIconFansGeneric = null;
      
      public var iconStreamingResource:SymbolIconStreamingResourceGeneric = null;
      
      public var txtReward:ILabel = null;
      
      public var title:SymbolGoalInfoTtileRewardGeneric = null;
      
      public function SymbolUiGoalItemButtonTooltipGeneric(param1:MovieClip = null)
      {
         if(param1)
         {
            _nativeObject = param1 as SymbolUiGoalItemButtonTooltip;
         }
         else
         {
            _nativeObject = new SymbolUiGoalItemButtonTooltip();
         }
         super(null,FlashSprite.fromNative(_nativeObject));
         var _loc2_:FlashDisplayObjectContainer = _sprite as FlashDisplayObjectContainer;
         background = new SymbolSlice9BackgroundTooltipGeneric(_nativeObject.background);
         progressBar = new SymbolProgressBarBigGeneric(_nativeObject.progressBar);
         txtName = FlashLabelArea.fromNative(_nativeObject.txtName);
         captionProgress = FlashLabelArea.fromNative(_nativeObject.captionProgress);
         txtProgress = FlashLabelArea.fromNative(_nativeObject.txtProgress);
         captionReward = FlashLabelArea.fromNative(_nativeObject.captionReward);
         iconXp = new SymbolIconXpGeneric(_nativeObject.iconXp);
         iconBooster = new SymbolIconBoosterGeneric(_nativeObject.iconBooster);
         iconQuestEnergy = new SymbolIconEnergyGeneric(_nativeObject.iconQuestEnergy);
         iconStatPoints = new SymbolIconPlusGeneric(_nativeObject.iconStatPoints);
         iconItem = new SymbolIconGiftGeneric(_nativeObject.iconItem);
         iconPremiumCurrency = new SymbolIconPremiumCurrencyGeneric(_nativeObject.iconPremiumCurrency);
         iconCoins = new SymbolIconGameCurrencyGeneric(_nativeObject.iconCoins);
         iconFans = new SymbolIconFansGeneric(_nativeObject.iconFans);
         iconStreamingResource = new SymbolIconStreamingResourceGeneric(_nativeObject.iconStreamingResource);
         txtReward = FlashLabel.fromNative(_nativeObject.txtReward);
         title = new SymbolGoalInfoTtileRewardGeneric(_nativeObject.title);
      }
      
      public function setNativeInstance(param1:SymbolUiGoalItemButtonTooltip) : void
      {
         FlashSprite.setNativeInstance(_sprite,param1);
         _nativeObject = param1;
         syncInstances();
      }
      
      public function syncInstances() : void
      {
         if(_nativeObject.background)
         {
            background.setNativeInstance(_nativeObject.background);
         }
         if(_nativeObject.progressBar)
         {
            progressBar.setNativeInstance(_nativeObject.progressBar);
         }
         FlashLabelArea.setNativeInstance(txtName,_nativeObject.txtName);
         FlashLabelArea.setNativeInstance(captionProgress,_nativeObject.captionProgress);
         FlashLabelArea.setNativeInstance(txtProgress,_nativeObject.txtProgress);
         FlashLabelArea.setNativeInstance(captionReward,_nativeObject.captionReward);
         if(_nativeObject.iconXp)
         {
            iconXp.setNativeInstance(_nativeObject.iconXp);
         }
         if(_nativeObject.iconBooster)
         {
            iconBooster.setNativeInstance(_nativeObject.iconBooster);
         }
         if(_nativeObject.iconQuestEnergy)
         {
            iconQuestEnergy.setNativeInstance(_nativeObject.iconQuestEnergy);
         }
         if(_nativeObject.iconStatPoints)
         {
            iconStatPoints.setNativeInstance(_nativeObject.iconStatPoints);
         }
         if(_nativeObject.iconItem)
         {
            iconItem.setNativeInstance(_nativeObject.iconItem);
         }
         if(_nativeObject.iconPremiumCurrency)
         {
            iconPremiumCurrency.setNativeInstance(_nativeObject.iconPremiumCurrency);
         }
         if(_nativeObject.iconCoins)
         {
            iconCoins.setNativeInstance(_nativeObject.iconCoins);
         }
         if(_nativeObject.iconFans)
         {
            iconFans.setNativeInstance(_nativeObject.iconFans);
         }
         if(_nativeObject.iconStreamingResource)
         {
            iconStreamingResource.setNativeInstance(_nativeObject.iconStreamingResource);
         }
         FlashLabel.setNativeInstance(txtReward,_nativeObject.txtReward);
         if(_nativeObject.title)
         {
            title.setNativeInstance(_nativeObject.title);
         }
      }
   }
}
