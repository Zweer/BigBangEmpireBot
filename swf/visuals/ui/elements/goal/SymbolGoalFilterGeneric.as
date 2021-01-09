package visuals.ui.elements.goal
{
   import com.playata.framework.display.Sprite;
   import com.playata.framework.display.lib.flash.FlashDisplayObjectContainer;
   import com.playata.framework.display.lib.flash.FlashLabelArea;
   import com.playata.framework.display.lib.flash.FlashSprite;
   import com.playata.framework.display.lib.flash.FlashTextInput;
   import com.playata.framework.display.ui.controls.ILabelArea;
   import com.playata.framework.display.ui.controls.ITextInput;
   import flash.display.MovieClip;
   import visuals.ui.base.SymbolUiCheckboxGeneric;
   import visuals.ui.elements.backgrounds.SymbolSlice9BackgroundDialogGeneric;
   import visuals.ui.elements.icons.SymbolIconBoosterGeneric;
   import visuals.ui.elements.icons.SymbolIconEnergyGeneric;
   import visuals.ui.elements.icons.SymbolIconGameCurrencyGeneric;
   import visuals.ui.elements.icons.SymbolIconGiftGeneric;
   import visuals.ui.elements.icons.SymbolIconPlusGeneric;
   import visuals.ui.elements.icons.SymbolIconPremiumCurrencyGeneric;
   import visuals.ui.elements.icons.SymbolIconXpGeneric;
   
   public class SymbolGoalFilterGeneric extends Sprite
   {
       
      
      private var _nativeObject:SymbolGoalFilter = null;
      
      public var dialogBackground:SymbolSlice9BackgroundDialogGeneric = null;
      
      public var ckbOnlyUnlocked:SymbolUiCheckboxGeneric = null;
      
      public var txtOnlyUnlocked:ILabelArea = null;
      
      public var ckbShowCoinGoals:SymbolUiCheckboxGeneric = null;
      
      public var txtShowCoinGoals:ILabelArea = null;
      
      public var ckbShowPremiumGoal:SymbolUiCheckboxGeneric = null;
      
      public var txtShowPremiumGoal:ILabelArea = null;
      
      public var ckbShowStatGoal:SymbolUiCheckboxGeneric = null;
      
      public var txtShowStatGoal:ILabelArea = null;
      
      public var ckbShowItemGoal:SymbolUiCheckboxGeneric = null;
      
      public var txtShowItemGoal:ILabelArea = null;
      
      public var ckbShowXPGoal:SymbolUiCheckboxGeneric = null;
      
      public var txtShowXPGoal:ILabelArea = null;
      
      public var ckbShowEnergyGoal:SymbolUiCheckboxGeneric = null;
      
      public var txtShowEnergyGoal:ILabelArea = null;
      
      public var ckbShowBoosterGoal:SymbolUiCheckboxGeneric = null;
      
      public var txtShowBoosterGoal:ILabelArea = null;
      
      public var symbolIconGameCurrency:SymbolIconGameCurrencyGeneric = null;
      
      public var symbolIconPremiumCurrency:SymbolIconPremiumCurrencyGeneric = null;
      
      public var symbolIconPlus:SymbolIconPlusGeneric = null;
      
      public var symbolIconGift:SymbolIconGiftGeneric = null;
      
      public var symbolIconXp:SymbolIconXpGeneric = null;
      
      public var symbolIconEnergy:SymbolIconEnergyGeneric = null;
      
      public var symbolIconBooster:SymbolIconBoosterGeneric = null;
      
      public var btnSaveSettings:SymbolIconSaveFilterGeneric = null;
      
      public var ckbShowTitleGoal:SymbolUiCheckboxGeneric = null;
      
      public var txtShowTitleGoal:ILabelArea = null;
      
      public var inputSearch:ITextInput = null;
      
      public function SymbolGoalFilterGeneric(param1:MovieClip = null)
      {
         if(param1)
         {
            _nativeObject = param1 as SymbolGoalFilter;
         }
         else
         {
            _nativeObject = new SymbolGoalFilter();
         }
         super(null,FlashSprite.fromNative(_nativeObject));
         var _loc2_:FlashDisplayObjectContainer = _sprite as FlashDisplayObjectContainer;
         dialogBackground = new SymbolSlice9BackgroundDialogGeneric(_nativeObject.dialogBackground);
         ckbOnlyUnlocked = new SymbolUiCheckboxGeneric(_nativeObject.ckbOnlyUnlocked);
         txtOnlyUnlocked = FlashLabelArea.fromNative(_nativeObject.txtOnlyUnlocked);
         ckbShowCoinGoals = new SymbolUiCheckboxGeneric(_nativeObject.ckbShowCoinGoals);
         txtShowCoinGoals = FlashLabelArea.fromNative(_nativeObject.txtShowCoinGoals);
         ckbShowPremiumGoal = new SymbolUiCheckboxGeneric(_nativeObject.ckbShowPremiumGoal);
         txtShowPremiumGoal = FlashLabelArea.fromNative(_nativeObject.txtShowPremiumGoal);
         ckbShowStatGoal = new SymbolUiCheckboxGeneric(_nativeObject.ckbShowStatGoal);
         txtShowStatGoal = FlashLabelArea.fromNative(_nativeObject.txtShowStatGoal);
         ckbShowItemGoal = new SymbolUiCheckboxGeneric(_nativeObject.ckbShowItemGoal);
         txtShowItemGoal = FlashLabelArea.fromNative(_nativeObject.txtShowItemGoal);
         ckbShowXPGoal = new SymbolUiCheckboxGeneric(_nativeObject.ckbShowXPGoal);
         txtShowXPGoal = FlashLabelArea.fromNative(_nativeObject.txtShowXPGoal);
         ckbShowEnergyGoal = new SymbolUiCheckboxGeneric(_nativeObject.ckbShowEnergyGoal);
         txtShowEnergyGoal = FlashLabelArea.fromNative(_nativeObject.txtShowEnergyGoal);
         ckbShowBoosterGoal = new SymbolUiCheckboxGeneric(_nativeObject.ckbShowBoosterGoal);
         txtShowBoosterGoal = FlashLabelArea.fromNative(_nativeObject.txtShowBoosterGoal);
         symbolIconGameCurrency = new SymbolIconGameCurrencyGeneric(_nativeObject.symbolIconGameCurrency);
         symbolIconPremiumCurrency = new SymbolIconPremiumCurrencyGeneric(_nativeObject.symbolIconPremiumCurrency);
         symbolIconPlus = new SymbolIconPlusGeneric(_nativeObject.symbolIconPlus);
         symbolIconGift = new SymbolIconGiftGeneric(_nativeObject.symbolIconGift);
         symbolIconXp = new SymbolIconXpGeneric(_nativeObject.symbolIconXp);
         symbolIconEnergy = new SymbolIconEnergyGeneric(_nativeObject.symbolIconEnergy);
         symbolIconBooster = new SymbolIconBoosterGeneric(_nativeObject.symbolIconBooster);
         btnSaveSettings = new SymbolIconSaveFilterGeneric(_nativeObject.btnSaveSettings);
         ckbShowTitleGoal = new SymbolUiCheckboxGeneric(_nativeObject.ckbShowTitleGoal);
         txtShowTitleGoal = FlashLabelArea.fromNative(_nativeObject.txtShowTitleGoal);
         inputSearch = FlashTextInput.fromNative(_nativeObject.inputSearch);
      }
      
      public function setNativeInstance(param1:SymbolGoalFilter) : void
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
         if(_nativeObject.ckbOnlyUnlocked)
         {
            ckbOnlyUnlocked.setNativeInstance(_nativeObject.ckbOnlyUnlocked);
         }
         FlashLabelArea.setNativeInstance(txtOnlyUnlocked,_nativeObject.txtOnlyUnlocked);
         if(_nativeObject.ckbShowCoinGoals)
         {
            ckbShowCoinGoals.setNativeInstance(_nativeObject.ckbShowCoinGoals);
         }
         FlashLabelArea.setNativeInstance(txtShowCoinGoals,_nativeObject.txtShowCoinGoals);
         if(_nativeObject.ckbShowPremiumGoal)
         {
            ckbShowPremiumGoal.setNativeInstance(_nativeObject.ckbShowPremiumGoal);
         }
         FlashLabelArea.setNativeInstance(txtShowPremiumGoal,_nativeObject.txtShowPremiumGoal);
         if(_nativeObject.ckbShowStatGoal)
         {
            ckbShowStatGoal.setNativeInstance(_nativeObject.ckbShowStatGoal);
         }
         FlashLabelArea.setNativeInstance(txtShowStatGoal,_nativeObject.txtShowStatGoal);
         if(_nativeObject.ckbShowItemGoal)
         {
            ckbShowItemGoal.setNativeInstance(_nativeObject.ckbShowItemGoal);
         }
         FlashLabelArea.setNativeInstance(txtShowItemGoal,_nativeObject.txtShowItemGoal);
         if(_nativeObject.ckbShowXPGoal)
         {
            ckbShowXPGoal.setNativeInstance(_nativeObject.ckbShowXPGoal);
         }
         FlashLabelArea.setNativeInstance(txtShowXPGoal,_nativeObject.txtShowXPGoal);
         if(_nativeObject.ckbShowEnergyGoal)
         {
            ckbShowEnergyGoal.setNativeInstance(_nativeObject.ckbShowEnergyGoal);
         }
         FlashLabelArea.setNativeInstance(txtShowEnergyGoal,_nativeObject.txtShowEnergyGoal);
         if(_nativeObject.ckbShowBoosterGoal)
         {
            ckbShowBoosterGoal.setNativeInstance(_nativeObject.ckbShowBoosterGoal);
         }
         FlashLabelArea.setNativeInstance(txtShowBoosterGoal,_nativeObject.txtShowBoosterGoal);
         if(_nativeObject.symbolIconGameCurrency)
         {
            symbolIconGameCurrency.setNativeInstance(_nativeObject.symbolIconGameCurrency);
         }
         if(_nativeObject.symbolIconPremiumCurrency)
         {
            symbolIconPremiumCurrency.setNativeInstance(_nativeObject.symbolIconPremiumCurrency);
         }
         if(_nativeObject.symbolIconPlus)
         {
            symbolIconPlus.setNativeInstance(_nativeObject.symbolIconPlus);
         }
         if(_nativeObject.symbolIconGift)
         {
            symbolIconGift.setNativeInstance(_nativeObject.symbolIconGift);
         }
         if(_nativeObject.symbolIconXp)
         {
            symbolIconXp.setNativeInstance(_nativeObject.symbolIconXp);
         }
         if(_nativeObject.symbolIconEnergy)
         {
            symbolIconEnergy.setNativeInstance(_nativeObject.symbolIconEnergy);
         }
         if(_nativeObject.symbolIconBooster)
         {
            symbolIconBooster.setNativeInstance(_nativeObject.symbolIconBooster);
         }
         if(_nativeObject.btnSaveSettings)
         {
            btnSaveSettings.setNativeInstance(_nativeObject.btnSaveSettings);
         }
         if(_nativeObject.ckbShowTitleGoal)
         {
            ckbShowTitleGoal.setNativeInstance(_nativeObject.ckbShowTitleGoal);
         }
         FlashLabelArea.setNativeInstance(txtShowTitleGoal,_nativeObject.txtShowTitleGoal);
         FlashTextInput.setNativeInstance(inputSearch,_nativeObject.inputSearch);
      }
   }
}
