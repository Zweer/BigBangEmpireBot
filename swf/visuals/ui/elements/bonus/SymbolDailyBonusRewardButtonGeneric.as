package visuals.ui.elements.bonus
{
   import com.playata.framework.display.Sprite;
   import com.playata.framework.display.lib.flash.FlashDisplayObjectContainer;
   import com.playata.framework.display.lib.flash.FlashSprite;
   import flash.display.MovieClip;
   import visuals.ui.elements.icons.SymbolIconEnergyGeneric;
   import visuals.ui.elements.icons.SymbolIconGiftGeneric;
   import visuals.ui.elements.icons.SymbolIconPlusGeneric;
   import visuals.ui.elements.icons.SymbolIconPremiumCurrencyGeneric;
   import visuals.ui.elements.icons.SymbolIconXpGeneric;
   
   public class SymbolDailyBonusRewardButtonGeneric extends Sprite
   {
       
      
      private var _nativeObject:SymbolDailyBonusRewardButton = null;
      
      public var line:SymbolDailyBonusRewardBackgroundLineGeneric = null;
      
      public var symbolDailyBonusRewardBackground:SymbolDailyBonusRewardBackgroundGeneric = null;
      
      public var iconQuestEnergy:SymbolIconEnergyGeneric = null;
      
      public var iconXp:SymbolIconXpGeneric = null;
      
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
      
      public function SymbolDailyBonusRewardButtonGeneric(param1:MovieClip = null)
      {
         if(param1)
         {
            _nativeObject = param1 as SymbolDailyBonusRewardButton;
         }
         else
         {
            _nativeObject = new SymbolDailyBonusRewardButton();
         }
         super(null,FlashSprite.fromNative(_nativeObject));
         var _loc2_:FlashDisplayObjectContainer = _sprite as FlashDisplayObjectContainer;
         line = new SymbolDailyBonusRewardBackgroundLineGeneric(_nativeObject.line);
         symbolDailyBonusRewardBackground = new SymbolDailyBonusRewardBackgroundGeneric(_nativeObject.symbolDailyBonusRewardBackground);
         iconQuestEnergy = new SymbolIconEnergyGeneric(_nativeObject.iconQuestEnergy);
         iconXp = new SymbolIconXpGeneric(_nativeObject.iconXp);
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
      
      public function setNativeInstance(param1:SymbolDailyBonusRewardButton) : void
      {
         FlashSprite.setNativeInstance(_sprite,param1);
         _nativeObject = param1;
         syncInstances();
      }
      
      public function syncInstances() : void
      {
         if(_nativeObject.line)
         {
            line.setNativeInstance(_nativeObject.line);
         }
         if(_nativeObject.symbolDailyBonusRewardBackground)
         {
            symbolDailyBonusRewardBackground.setNativeInstance(_nativeObject.symbolDailyBonusRewardBackground);
         }
         if(_nativeObject.iconQuestEnergy)
         {
            iconQuestEnergy.setNativeInstance(_nativeObject.iconQuestEnergy);
         }
         if(_nativeObject.iconXp)
         {
            iconXp.setNativeInstance(_nativeObject.iconXp);
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
