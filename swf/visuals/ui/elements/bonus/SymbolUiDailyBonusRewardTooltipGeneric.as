package visuals.ui.elements.bonus
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
   import visuals.ui.elements.icons.SymbolIconEnergyGeneric;
   import visuals.ui.elements.icons.SymbolIconGiftGeneric;
   import visuals.ui.elements.icons.SymbolIconPlusGeneric;
   import visuals.ui.elements.icons.SymbolIconPremiumCurrencyGeneric;
   import visuals.ui.elements.icons.SymbolIconXpGeneric;
   
   public class SymbolUiDailyBonusRewardTooltipGeneric extends Sprite
   {
       
      
      private var _nativeObject:SymbolUiDailyBonusRewardTooltip = null;
      
      public var background:SymbolSlice9BackgroundTooltipGeneric = null;
      
      public var tooltip:ILabelArea = null;
      
      public var txtRewardsCaption:ILabel = null;
      
      public var txtRewards:ILabelArea = null;
      
      public var iconXp:SymbolIconXpGeneric = null;
      
      public var iconQuestEnergy:SymbolIconEnergyGeneric = null;
      
      public var iconItem:SymbolIconGiftGeneric = null;
      
      public var iconStatPoints:SymbolIconPlusGeneric = null;
      
      public var iconPremiumCurrency:SymbolIconPremiumCurrencyGeneric = null;
      
      public var iconHead:SymbolDailyBonusRewardHeadGeneric = null;
      
      public var iconLegs:SymbolDailyBonusRewardLegsGeneric = null;
      
      public var iconChest:SymbolDailyBonusRewardChestGeneric = null;
      
      public var iconBelt:SymbolDailyBonusRewardBeltGeneric = null;
      
      public var iconBoots:SymbolDailyBonusRewardBootsGeneric = null;
      
      public var iconRing:SymbolDailyBonusRewardRingGeneric = null;
      
      public var iconNecklace:SymbolDailyBonusRewardNechlaceGeneric = null;
      
      public var iconPiercing:SymbolDailyBonusRewardPiercingGeneric = null;
      
      public var iconGadget:SymbolDailyBonusRewardGadgetGeneric = null;
      
      public var iconMissile:SymbolDailyBonusRewardMissileGeneric = null;
      
      public function SymbolUiDailyBonusRewardTooltipGeneric(param1:MovieClip = null)
      {
         if(param1)
         {
            _nativeObject = param1 as SymbolUiDailyBonusRewardTooltip;
         }
         else
         {
            _nativeObject = new SymbolUiDailyBonusRewardTooltip();
         }
         super(null,FlashSprite.fromNative(_nativeObject));
         var _loc2_:FlashDisplayObjectContainer = _sprite as FlashDisplayObjectContainer;
         background = new SymbolSlice9BackgroundTooltipGeneric(_nativeObject.background);
         tooltip = FlashLabelArea.fromNative(_nativeObject.tooltip);
         txtRewardsCaption = FlashLabel.fromNative(_nativeObject.txtRewardsCaption);
         txtRewards = FlashLabelArea.fromNative(_nativeObject.txtRewards);
         iconXp = new SymbolIconXpGeneric(_nativeObject.iconXp);
         iconQuestEnergy = new SymbolIconEnergyGeneric(_nativeObject.iconQuestEnergy);
         iconItem = new SymbolIconGiftGeneric(_nativeObject.iconItem);
         iconStatPoints = new SymbolIconPlusGeneric(_nativeObject.iconStatPoints);
         iconPremiumCurrency = new SymbolIconPremiumCurrencyGeneric(_nativeObject.iconPremiumCurrency);
         iconHead = new SymbolDailyBonusRewardHeadGeneric(_nativeObject.iconHead);
         iconLegs = new SymbolDailyBonusRewardLegsGeneric(_nativeObject.iconLegs);
         iconChest = new SymbolDailyBonusRewardChestGeneric(_nativeObject.iconChest);
         iconBelt = new SymbolDailyBonusRewardBeltGeneric(_nativeObject.iconBelt);
         iconBoots = new SymbolDailyBonusRewardBootsGeneric(_nativeObject.iconBoots);
         iconRing = new SymbolDailyBonusRewardRingGeneric(_nativeObject.iconRing);
         iconNecklace = new SymbolDailyBonusRewardNechlaceGeneric(_nativeObject.iconNecklace);
         iconPiercing = new SymbolDailyBonusRewardPiercingGeneric(_nativeObject.iconPiercing);
         iconGadget = new SymbolDailyBonusRewardGadgetGeneric(_nativeObject.iconGadget);
         iconMissile = new SymbolDailyBonusRewardMissileGeneric(_nativeObject.iconMissile);
      }
      
      public function setNativeInstance(param1:SymbolUiDailyBonusRewardTooltip) : void
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
         FlashLabelArea.setNativeInstance(tooltip,_nativeObject.tooltip);
         FlashLabel.setNativeInstance(txtRewardsCaption,_nativeObject.txtRewardsCaption);
         FlashLabelArea.setNativeInstance(txtRewards,_nativeObject.txtRewards);
         if(_nativeObject.iconXp)
         {
            iconXp.setNativeInstance(_nativeObject.iconXp);
         }
         if(_nativeObject.iconQuestEnergy)
         {
            iconQuestEnergy.setNativeInstance(_nativeObject.iconQuestEnergy);
         }
         if(_nativeObject.iconItem)
         {
            iconItem.setNativeInstance(_nativeObject.iconItem);
         }
         if(_nativeObject.iconStatPoints)
         {
            iconStatPoints.setNativeInstance(_nativeObject.iconStatPoints);
         }
         if(_nativeObject.iconPremiumCurrency)
         {
            iconPremiumCurrency.setNativeInstance(_nativeObject.iconPremiumCurrency);
         }
         if(_nativeObject.iconHead)
         {
            iconHead.setNativeInstance(_nativeObject.iconHead);
         }
         if(_nativeObject.iconLegs)
         {
            iconLegs.setNativeInstance(_nativeObject.iconLegs);
         }
         if(_nativeObject.iconChest)
         {
            iconChest.setNativeInstance(_nativeObject.iconChest);
         }
         if(_nativeObject.iconBelt)
         {
            iconBelt.setNativeInstance(_nativeObject.iconBelt);
         }
         if(_nativeObject.iconBoots)
         {
            iconBoots.setNativeInstance(_nativeObject.iconBoots);
         }
         if(_nativeObject.iconRing)
         {
            iconRing.setNativeInstance(_nativeObject.iconRing);
         }
         if(_nativeObject.iconNecklace)
         {
            iconNecklace.setNativeInstance(_nativeObject.iconNecklace);
         }
         if(_nativeObject.iconPiercing)
         {
            iconPiercing.setNativeInstance(_nativeObject.iconPiercing);
         }
         if(_nativeObject.iconGadget)
         {
            iconGadget.setNativeInstance(_nativeObject.iconGadget);
         }
         if(_nativeObject.iconMissile)
         {
            iconMissile.setNativeInstance(_nativeObject.iconMissile);
         }
      }
   }
}
