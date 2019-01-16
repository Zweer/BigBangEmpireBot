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
   import visuals.ui.elements.buttons.SymbolButtonArrowLeftBlueGeneric;
   import visuals.ui.elements.dating.SymbolIconDatingPictureGeneric;
   import visuals.ui.elements.icons.SymbolIconBoosterGeneric;
   import visuals.ui.elements.icons.SymbolIconEnergyGeneric;
   import visuals.ui.elements.icons.SymbolIconGameCurrencyGeneric;
   import visuals.ui.elements.icons.SymbolIconGiftGeneric;
   import visuals.ui.elements.icons.SymbolIconLockGeneric;
   import visuals.ui.elements.icons.SymbolIconPlusGeneric;
   import visuals.ui.elements.icons.SymbolIconPremiumCurrencyGeneric;
   import visuals.ui.elements.icons.SymbolIconXpGeneric;
   
   public class SymbolGoalInfoGeneric extends Sprite
   {
       
      
      private var _nativeObject:SymbolGoalInfo = null;
      
      public var iconGoal:SymbolPlaceholderGeneric = null;
      
      public var txtReward:ILabel = null;
      
      public var txtRewardsCaption:ILabel = null;
      
      public var txtProgressCaption:ILabel = null;
      
      public var txtDescription:ILabelArea = null;
      
      public var txtProgress:ILabelArea = null;
      
      public var txtTitle:ILabelArea = null;
      
      public var btnBack:SymbolButtonArrowLeftBlueGeneric = null;
      
      public var iconXp:SymbolIconXpGeneric = null;
      
      public var iconBooster:SymbolIconBoosterGeneric = null;
      
      public var iconQuestEnergy:SymbolIconEnergyGeneric = null;
      
      public var iconStatPoints:SymbolIconPlusGeneric = null;
      
      public var iconItem:SymbolIconGiftGeneric = null;
      
      public var iconPremiumCurrency:SymbolIconPremiumCurrencyGeneric = null;
      
      public var iconCoins:SymbolIconGameCurrencyGeneric = null;
      
      public var title:SymbolGoalInfoTtileRewardGeneric = null;
      
      public var iconDating:SymbolIconDatingPictureGeneric = null;
      
      public var txtDatingReward:ILabel = null;
      
      public var iconLock:SymbolIconLockGeneric = null;
      
      public function SymbolGoalInfoGeneric(param1:MovieClip = null)
      {
         if(param1)
         {
            _nativeObject = param1 as SymbolGoalInfo;
         }
         else
         {
            _nativeObject = new SymbolGoalInfo();
         }
         super(null,FlashSprite.fromNative(_nativeObject));
         var _loc2_:FlashDisplayObjectContainer = _sprite as FlashDisplayObjectContainer;
         iconGoal = new SymbolPlaceholderGeneric(_nativeObject.iconGoal);
         txtReward = FlashLabel.fromNative(_nativeObject.txtReward);
         txtRewardsCaption = FlashLabel.fromNative(_nativeObject.txtRewardsCaption);
         txtProgressCaption = FlashLabel.fromNative(_nativeObject.txtProgressCaption);
         txtDescription = FlashLabelArea.fromNative(_nativeObject.txtDescription);
         txtProgress = FlashLabelArea.fromNative(_nativeObject.txtProgress);
         txtTitle = FlashLabelArea.fromNative(_nativeObject.txtTitle);
         btnBack = new SymbolButtonArrowLeftBlueGeneric(_nativeObject.btnBack);
         iconXp = new SymbolIconXpGeneric(_nativeObject.iconXp);
         iconBooster = new SymbolIconBoosterGeneric(_nativeObject.iconBooster);
         iconQuestEnergy = new SymbolIconEnergyGeneric(_nativeObject.iconQuestEnergy);
         iconStatPoints = new SymbolIconPlusGeneric(_nativeObject.iconStatPoints);
         iconItem = new SymbolIconGiftGeneric(_nativeObject.iconItem);
         iconPremiumCurrency = new SymbolIconPremiumCurrencyGeneric(_nativeObject.iconPremiumCurrency);
         iconCoins = new SymbolIconGameCurrencyGeneric(_nativeObject.iconCoins);
         title = new SymbolGoalInfoTtileRewardGeneric(_nativeObject.title);
         iconDating = new SymbolIconDatingPictureGeneric(_nativeObject.iconDating);
         txtDatingReward = FlashLabel.fromNative(_nativeObject.txtDatingReward);
         iconLock = new SymbolIconLockGeneric(_nativeObject.iconLock);
      }
      
      public function setNativeInstance(param1:SymbolGoalInfo) : void
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
         FlashLabel.setNativeInstance(txtProgressCaption,_nativeObject.txtProgressCaption);
         FlashLabelArea.setNativeInstance(txtDescription,_nativeObject.txtDescription);
         FlashLabelArea.setNativeInstance(txtProgress,_nativeObject.txtProgress);
         FlashLabelArea.setNativeInstance(txtTitle,_nativeObject.txtTitle);
         if(_nativeObject.btnBack)
         {
            btnBack.setNativeInstance(_nativeObject.btnBack);
         }
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
         if(_nativeObject.title)
         {
            title.setNativeInstance(_nativeObject.title);
         }
         if(_nativeObject.iconDating)
         {
            iconDating.setNativeInstance(_nativeObject.iconDating);
         }
         FlashLabel.setNativeInstance(txtDatingReward,_nativeObject.txtDatingReward);
         if(_nativeObject.iconLock)
         {
            iconLock.setNativeInstance(_nativeObject.iconLock);
         }
      }
   }
}
