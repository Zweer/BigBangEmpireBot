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
   import visuals.ui.base.SymbolUiButtonDefaultCheckGeneric;
   import visuals.ui.elements.booster.SymbolBoosterGeneric;
   import visuals.ui.elements.dating.SymbolIconDatingPictureGeneric;
   import visuals.ui.elements.generic.SymbolGenericListLineHighlightGeneric;
   import visuals.ui.elements.generic.SymbolGenericListLineOddGeneric;
   import visuals.ui.elements.icons.SymbolIconBoosterGeneric;
   import visuals.ui.elements.icons.SymbolIconCheckmarkGeneric;
   import visuals.ui.elements.icons.SymbolIconEnergyGeneric;
   import visuals.ui.elements.icons.SymbolIconGameCurrencyGeneric;
   import visuals.ui.elements.icons.SymbolIconGiftGeneric;
   import visuals.ui.elements.icons.SymbolIconLockGeneric;
   import visuals.ui.elements.icons.SymbolIconPlusGeneric;
   import visuals.ui.elements.icons.SymbolIconPremiumCurrencyGeneric;
   import visuals.ui.elements.icons.SymbolIconXpGeneric;
   import visuals.ui.elements.item.SymbolItemSlotGeneric;
   
   public class SymbolGoalInfoLineGeneric extends Sprite
   {
       
      
      private var _nativeObject:SymbolGoalInfoLine = null;
      
      public var backgroundEven:SymbolGenericListLineOddGeneric = null;
      
      public var backgroundOdd:SymbolGenericListLineOddGeneric = null;
      
      public var backgroundHighlight:SymbolGenericListLineHighlightGeneric = null;
      
      public var txtStage:ILabel = null;
      
      public var txtProgress:ILabelArea = null;
      
      public var txtReward:ILabelArea = null;
      
      public var iconXp:SymbolIconXpGeneric = null;
      
      public var iconBooster:SymbolIconBoosterGeneric = null;
      
      public var iconQuestEnergy:SymbolIconEnergyGeneric = null;
      
      public var iconStatPoints:SymbolIconPlusGeneric = null;
      
      public var iconItem:SymbolIconGiftGeneric = null;
      
      public var iconPremiumCurrency:SymbolIconPremiumCurrencyGeneric = null;
      
      public var iconCoins:SymbolIconGameCurrencyGeneric = null;
      
      public var boosterReward:SymbolBoosterGeneric = null;
      
      public var itemReward:SymbolItemSlotGeneric = null;
      
      public var title:SymbolGoalInfoTtileRewardGeneric = null;
      
      public var iconDating:SymbolIconDatingPictureGeneric = null;
      
      public var txtDatingReward:ILabel = null;
      
      public var btnCollect:SymbolUiButtonDefaultCheckGeneric = null;
      
      public var iconLock:SymbolIconLockGeneric = null;
      
      public var txtNew:ILabelArea = null;
      
      public var iconNew:SymbolGoalLineNewGeneric = null;
      
      public var iconCheckmark:SymbolIconCheckmarkGeneric = null;
      
      public function SymbolGoalInfoLineGeneric(param1:MovieClip = null)
      {
         if(param1)
         {
            _nativeObject = param1 as SymbolGoalInfoLine;
         }
         else
         {
            _nativeObject = new SymbolGoalInfoLine();
         }
         super(null,FlashSprite.fromNative(_nativeObject));
         var _loc2_:FlashDisplayObjectContainer = _sprite as FlashDisplayObjectContainer;
         backgroundEven = new SymbolGenericListLineOddGeneric(_nativeObject.backgroundEven);
         backgroundOdd = new SymbolGenericListLineOddGeneric(_nativeObject.backgroundOdd);
         backgroundHighlight = new SymbolGenericListLineHighlightGeneric(_nativeObject.backgroundHighlight);
         txtStage = FlashLabel.fromNative(_nativeObject.txtStage);
         txtProgress = FlashLabelArea.fromNative(_nativeObject.txtProgress);
         txtReward = FlashLabelArea.fromNative(_nativeObject.txtReward);
         iconXp = new SymbolIconXpGeneric(_nativeObject.iconXp);
         iconBooster = new SymbolIconBoosterGeneric(_nativeObject.iconBooster);
         iconQuestEnergy = new SymbolIconEnergyGeneric(_nativeObject.iconQuestEnergy);
         iconStatPoints = new SymbolIconPlusGeneric(_nativeObject.iconStatPoints);
         iconItem = new SymbolIconGiftGeneric(_nativeObject.iconItem);
         iconPremiumCurrency = new SymbolIconPremiumCurrencyGeneric(_nativeObject.iconPremiumCurrency);
         iconCoins = new SymbolIconGameCurrencyGeneric(_nativeObject.iconCoins);
         boosterReward = new SymbolBoosterGeneric(_nativeObject.boosterReward);
         itemReward = new SymbolItemSlotGeneric(_nativeObject.itemReward);
         title = new SymbolGoalInfoTtileRewardGeneric(_nativeObject.title);
         iconDating = new SymbolIconDatingPictureGeneric(_nativeObject.iconDating);
         txtDatingReward = FlashLabel.fromNative(_nativeObject.txtDatingReward);
         btnCollect = new SymbolUiButtonDefaultCheckGeneric(_nativeObject.btnCollect);
         iconLock = new SymbolIconLockGeneric(_nativeObject.iconLock);
         txtNew = FlashLabelArea.fromNative(_nativeObject.txtNew);
         iconNew = new SymbolGoalLineNewGeneric(_nativeObject.iconNew);
         iconCheckmark = new SymbolIconCheckmarkGeneric(_nativeObject.iconCheckmark);
      }
      
      public function setNativeInstance(param1:SymbolGoalInfoLine) : void
      {
         FlashSprite.setNativeInstance(_sprite,param1);
         _nativeObject = param1;
         syncInstances();
      }
      
      public function syncInstances() : void
      {
         if(_nativeObject.backgroundEven)
         {
            backgroundEven.setNativeInstance(_nativeObject.backgroundEven);
         }
         if(_nativeObject.backgroundOdd)
         {
            backgroundOdd.setNativeInstance(_nativeObject.backgroundOdd);
         }
         if(_nativeObject.backgroundHighlight)
         {
            backgroundHighlight.setNativeInstance(_nativeObject.backgroundHighlight);
         }
         FlashLabel.setNativeInstance(txtStage,_nativeObject.txtStage);
         FlashLabelArea.setNativeInstance(txtProgress,_nativeObject.txtProgress);
         FlashLabelArea.setNativeInstance(txtReward,_nativeObject.txtReward);
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
         if(_nativeObject.boosterReward)
         {
            boosterReward.setNativeInstance(_nativeObject.boosterReward);
         }
         if(_nativeObject.itemReward)
         {
            itemReward.setNativeInstance(_nativeObject.itemReward);
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
         if(_nativeObject.btnCollect)
         {
            btnCollect.setNativeInstance(_nativeObject.btnCollect);
         }
         if(_nativeObject.iconLock)
         {
            iconLock.setNativeInstance(_nativeObject.iconLock);
         }
         FlashLabelArea.setNativeInstance(txtNew,_nativeObject.txtNew);
         if(_nativeObject.iconNew)
         {
            iconNew.setNativeInstance(_nativeObject.iconNew);
         }
         if(_nativeObject.iconCheckmark)
         {
            iconCheckmark.setNativeInstance(_nativeObject.iconCheckmark);
         }
      }
   }
}
