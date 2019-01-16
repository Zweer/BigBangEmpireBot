package visuals.ui.elements.goal
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
   import visuals.ui.base.SymbolUiButtonDefaultCheckGeneric;
   import visuals.ui.elements.booster.SymbolBoosterGeneric;
   import visuals.ui.elements.dating.SymbolIconDatingPictureGeneric;
   import visuals.ui.elements.icons.SymbolIconBoosterGeneric;
   import visuals.ui.elements.icons.SymbolIconEnergyGeneric;
   import visuals.ui.elements.icons.SymbolIconGameCurrencyGeneric;
   import visuals.ui.elements.icons.SymbolIconGiftGeneric;
   import visuals.ui.elements.icons.SymbolIconPlusGeneric;
   import visuals.ui.elements.icons.SymbolIconPremiumCurrencyGeneric;
   import visuals.ui.elements.icons.SymbolIconXpGeneric;
   import visuals.ui.elements.item.SymbolItemSlotGeneric;
   
   public class SymbolGoalCompleteGeneric extends Sprite
   {
       
      
      private var _nativeObject:SymbolGoalComplete = null;
      
      public var iconGoal:SymbolPlaceholderGeneric = null;
      
      public var txtReward:ILabel = null;
      
      public var txtRewardsCaption:ILabel = null;
      
      public var txtDescription:ILabelArea = null;
      
      public var btnCollect:SymbolUiButtonDefaultCheckGeneric = null;
      
      public var txtTitle:ILabelArea = null;
      
      public var itemReward:SymbolItemSlotGeneric = null;
      
      public var boosterReward:SymbolBoosterGeneric = null;
      
      public var iconXp:SymbolIconXpGeneric = null;
      
      public var iconStatPoints:SymbolIconPlusGeneric = null;
      
      public var iconBooster:SymbolIconBoosterGeneric = null;
      
      public var iconQuestEnergy:SymbolIconEnergyGeneric = null;
      
      public var iconItem:SymbolIconGiftGeneric = null;
      
      public var iconPremiumCurrency:SymbolIconPremiumCurrencyGeneric = null;
      
      public var iconCoins:SymbolIconGameCurrencyGeneric = null;
      
      public var title:SymbolGoalInfoTtileRewardGeneric = null;
      
      public var iconDating:SymbolIconDatingPictureGeneric = null;
      
      public var txtDatingReward:ILabel = null;
      
      public function SymbolGoalCompleteGeneric(param1:MovieClip = null)
      {
         if(param1)
         {
            _nativeObject = param1 as SymbolGoalComplete;
         }
         else
         {
            _nativeObject = new SymbolGoalComplete();
         }
         super(null,FlashSprite.fromNative(_nativeObject));
         var _loc2_:FlashDisplayObjectContainer = _sprite as FlashDisplayObjectContainer;
         iconGoal = new SymbolPlaceholderGeneric(_nativeObject.iconGoal);
         txtReward = FlashLabel.fromNative(_nativeObject.txtReward);
         txtRewardsCaption = FlashLabel.fromNative(_nativeObject.txtRewardsCaption);
         txtDescription = FlashLabelArea.fromNative(_nativeObject.txtDescription);
         btnCollect = new SymbolUiButtonDefaultCheckGeneric(_nativeObject.btnCollect);
         txtTitle = FlashLabelArea.fromNative(_nativeObject.txtTitle);
         itemReward = new SymbolItemSlotGeneric(_nativeObject.itemReward);
         boosterReward = new SymbolBoosterGeneric(_nativeObject.boosterReward);
         iconXp = new SymbolIconXpGeneric(_nativeObject.iconXp);
         iconStatPoints = new SymbolIconPlusGeneric(_nativeObject.iconStatPoints);
         iconBooster = new SymbolIconBoosterGeneric(_nativeObject.iconBooster);
         iconQuestEnergy = new SymbolIconEnergyGeneric(_nativeObject.iconQuestEnergy);
         iconItem = new SymbolIconGiftGeneric(_nativeObject.iconItem);
         iconPremiumCurrency = new SymbolIconPremiumCurrencyGeneric(_nativeObject.iconPremiumCurrency);
         iconCoins = new SymbolIconGameCurrencyGeneric(_nativeObject.iconCoins);
         title = new SymbolGoalInfoTtileRewardGeneric(_nativeObject.title);
         iconDating = new SymbolIconDatingPictureGeneric(_nativeObject.iconDating);
         txtDatingReward = FlashLabel.fromNative(_nativeObject.txtDatingReward);
      }
      
      public function setNativeInstance(param1:SymbolGoalComplete) : void
      {
         FlashSprite.setNativeInstance(_sprite,param1);
         _nativeObject = param1;
         syncInstances();
      }
      
      public function syncInstances() : void
      {
         if(_nativeObject.iconGoal)
         {
            iconGoal.setNativeInstance(_nativeObject.iconGoal);
         }
         FlashLabel.setNativeInstance(txtReward,_nativeObject.txtReward);
         FlashLabel.setNativeInstance(txtRewardsCaption,_nativeObject.txtRewardsCaption);
         FlashLabelArea.setNativeInstance(txtDescription,_nativeObject.txtDescription);
         if(_nativeObject.btnCollect)
         {
            btnCollect.setNativeInstance(_nativeObject.btnCollect);
         }
         FlashLabelArea.setNativeInstance(txtTitle,_nativeObject.txtTitle);
         if(_nativeObject.itemReward)
         {
            itemReward.setNativeInstance(_nativeObject.itemReward);
         }
         if(_nativeObject.boosterReward)
         {
            boosterReward.setNativeInstance(_nativeObject.boosterReward);
         }
         if(_nativeObject.iconXp)
         {
            iconXp.setNativeInstance(_nativeObject.iconXp);
         }
         if(_nativeObject.iconStatPoints)
         {
            iconStatPoints.setNativeInstance(_nativeObject.iconStatPoints);
         }
         if(_nativeObject.iconBooster)
         {
            iconBooster.setNativeInstance(_nativeObject.iconBooster);
         }
         if(_nativeObject.iconQuestEnergy)
         {
            iconQuestEnergy.setNativeInstance(_nativeObject.iconQuestEnergy);
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
         if(_nativeObject.title)
         {
            title.setNativeInstance(_nativeObject.title);
         }
         if(_nativeObject.iconDating)
         {
            iconDating.setNativeInstance(_nativeObject.iconDating);
         }
         FlashLabel.setNativeInstance(txtDatingReward,_nativeObject.txtDatingReward);
      }
   }
}
