package visuals.ui.elements.herobook
{
   import com.playata.framework.display.Sprite;
   import com.playata.framework.display.lib.flash.FlashDisplayObjectContainer;
   import com.playata.framework.display.lib.flash.FlashLabelArea;
   import com.playata.framework.display.lib.flash.FlashSprite;
   import com.playata.framework.display.ui.controls.ILabelArea;
   import flash.display.MovieClip;
   import visuals.ui.base.SymbolDummyGeneric;
   import visuals.ui.base.SymbolPlaceholderGeneric;
   import visuals.ui.base.SymbolUiButtonShortCheckGeneric;
   import visuals.ui.elements.buttons.SymbolButtonArrowRightGeneric;
   import visuals.ui.elements.buttons.SymbolButtonPremiumGeneric;
   import visuals.ui.elements.icons.SymbolIconCheckmarkGeneric;
   import visuals.ui.elements.icons.SymbolIconDeleteGeneric;
   import visuals.ui.elements.icons.SymbolIconEnergyGeneric;
   import visuals.ui.elements.icons.SymbolIconGameCurrencyGeneric;
   import visuals.ui.elements.icons.SymbolIconGiftGeneric;
   import visuals.ui.elements.icons.SymbolIconLockGeneric;
   import visuals.ui.elements.icons.SymbolIconPlusGeneric;
   import visuals.ui.elements.icons.SymbolIconPremiumCurrencyGeneric;
   import visuals.ui.elements.icons.SymbolIconXpGeneric;
   
   public class SymbolHerobookLineGeneric extends Sprite
   {
       
      
      private var _nativeObject:SymbolHerobookLine = null;
      
      public var btnRight:SymbolButtonArrowRightGeneric = null;
      
      public var txtTitle:ILabelArea = null;
      
      public var txtShortDescription:ILabelArea = null;
      
      public var iconCharacter:SymbolHerobookCharacterGeneric = null;
      
      public var timer:SymbolHerobookTimerGeneric = null;
      
      public var btnCollect:SymbolUiButtonShortCheckGeneric = null;
      
      public var btnInstantFinish:SymbolButtonPremiumGeneric = null;
      
      public var iconCheckmark:SymbolIconCheckmarkGeneric = null;
      
      public var iconInactive:SymbolIconDeleteGeneric = null;
      
      public var iconLock:SymbolIconLockGeneric = null;
      
      public var txtWeeklyInfo:ILabelArea = null;
      
      public var iconObjective:SymbolPlaceholderGeneric = null;
      
      public var iconCoins:SymbolIconGameCurrencyGeneric = null;
      
      public var txtReward:ILabelArea = null;
      
      public var iconXp:SymbolIconXpGeneric = null;
      
      public var iconQuestEnergy:SymbolIconEnergyGeneric = null;
      
      public var iconStatPoints:SymbolIconPlusGeneric = null;
      
      public var iconItem:SymbolIconGiftGeneric = null;
      
      public var iconPremiumCurrency:SymbolIconPremiumCurrencyGeneric = null;
      
      public var tooltip:SymbolDummyGeneric = null;
      
      public var iconRenew:SymbolIconHerobookRenewGeneric = null;
      
      public function SymbolHerobookLineGeneric(param1:MovieClip = null)
      {
         if(param1)
         {
            _nativeObject = param1 as SymbolHerobookLine;
         }
         else
         {
            _nativeObject = new SymbolHerobookLine();
         }
         super(null,FlashSprite.fromNative(_nativeObject));
         var _loc2_:FlashDisplayObjectContainer = _sprite as FlashDisplayObjectContainer;
         btnRight = new SymbolButtonArrowRightGeneric(_nativeObject.btnRight);
         txtTitle = FlashLabelArea.fromNative(_nativeObject.txtTitle);
         txtShortDescription = FlashLabelArea.fromNative(_nativeObject.txtShortDescription);
         iconCharacter = new SymbolHerobookCharacterGeneric(_nativeObject.iconCharacter);
         timer = new SymbolHerobookTimerGeneric(_nativeObject.timer);
         btnCollect = new SymbolUiButtonShortCheckGeneric(_nativeObject.btnCollect);
         btnInstantFinish = new SymbolButtonPremiumGeneric(_nativeObject.btnInstantFinish);
         iconCheckmark = new SymbolIconCheckmarkGeneric(_nativeObject.iconCheckmark);
         iconInactive = new SymbolIconDeleteGeneric(_nativeObject.iconInactive);
         iconLock = new SymbolIconLockGeneric(_nativeObject.iconLock);
         txtWeeklyInfo = FlashLabelArea.fromNative(_nativeObject.txtWeeklyInfo);
         iconObjective = new SymbolPlaceholderGeneric(_nativeObject.iconObjective);
         iconCoins = new SymbolIconGameCurrencyGeneric(_nativeObject.iconCoins);
         txtReward = FlashLabelArea.fromNative(_nativeObject.txtReward);
         iconXp = new SymbolIconXpGeneric(_nativeObject.iconXp);
         iconQuestEnergy = new SymbolIconEnergyGeneric(_nativeObject.iconQuestEnergy);
         iconStatPoints = new SymbolIconPlusGeneric(_nativeObject.iconStatPoints);
         iconItem = new SymbolIconGiftGeneric(_nativeObject.iconItem);
         iconPremiumCurrency = new SymbolIconPremiumCurrencyGeneric(_nativeObject.iconPremiumCurrency);
         tooltip = new SymbolDummyGeneric(_nativeObject.tooltip);
         iconRenew = new SymbolIconHerobookRenewGeneric(_nativeObject.iconRenew);
      }
      
      public function setNativeInstance(param1:SymbolHerobookLine) : void
      {
         FlashSprite.setNativeInstance(_sprite,param1);
         _nativeObject = param1;
         syncInstances();
      }
      
      public function syncInstances() : void
      {
         if(_nativeObject.btnRight)
         {
            btnRight.setNativeInstance(_nativeObject.btnRight);
         }
         FlashLabelArea.setNativeInstance(txtTitle,_nativeObject.txtTitle);
         FlashLabelArea.setNativeInstance(txtShortDescription,_nativeObject.txtShortDescription);
         if(_nativeObject.iconCharacter)
         {
            iconCharacter.setNativeInstance(_nativeObject.iconCharacter);
         }
         if(_nativeObject.timer)
         {
            timer.setNativeInstance(_nativeObject.timer);
         }
         if(_nativeObject.btnCollect)
         {
            btnCollect.setNativeInstance(_nativeObject.btnCollect);
         }
         if(_nativeObject.btnInstantFinish)
         {
            btnInstantFinish.setNativeInstance(_nativeObject.btnInstantFinish);
         }
         if(_nativeObject.iconCheckmark)
         {
            iconCheckmark.setNativeInstance(_nativeObject.iconCheckmark);
         }
         if(_nativeObject.iconInactive)
         {
            iconInactive.setNativeInstance(_nativeObject.iconInactive);
         }
         if(_nativeObject.iconLock)
         {
            iconLock.setNativeInstance(_nativeObject.iconLock);
         }
         FlashLabelArea.setNativeInstance(txtWeeklyInfo,_nativeObject.txtWeeklyInfo);
         if(_nativeObject.iconObjective)
         {
            iconObjective.setNativeInstance(_nativeObject.iconObjective);
         }
         if(_nativeObject.iconCoins)
         {
            iconCoins.setNativeInstance(_nativeObject.iconCoins);
         }
         FlashLabelArea.setNativeInstance(txtReward,_nativeObject.txtReward);
         if(_nativeObject.iconXp)
         {
            iconXp.setNativeInstance(_nativeObject.iconXp);
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
         if(_nativeObject.tooltip)
         {
            tooltip.setNativeInstance(_nativeObject.tooltip);
         }
         if(_nativeObject.iconRenew)
         {
            iconRenew.setNativeInstance(_nativeObject.iconRenew);
         }
      }
   }
}
