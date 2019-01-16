package visuals.ui.elements.item
{
   import com.playata.framework.display.Sprite;
   import com.playata.framework.display.lib.flash.FlashDisplayObjectContainer;
   import com.playata.framework.display.lib.flash.FlashLabel;
   import com.playata.framework.display.lib.flash.FlashLabelArea;
   import com.playata.framework.display.lib.flash.FlashSprite;
   import com.playata.framework.display.ui.controls.ILabel;
   import com.playata.framework.display.ui.controls.ILabelArea;
   import flash.display.MovieClip;
   import visuals.ui.base.SymbolDummyGeneric;
   import visuals.ui.elements.backgrounds.SymbolSlice9BackgroundTooltipGeneric;
   import visuals.ui.elements.battle_skills.SymbolBattleSkillGeneric;
   import visuals.ui.elements.icons.SymbolIconGameCurrencyGeneric;
   import visuals.ui.elements.icons.SymbolIconOutfitInfoGeneric;
   import visuals.ui.elements.icons.SymbolIconPremiumCurrencyGeneric;
   import visuals.ui.elements.sewing_machine.SymbolIconItemPatternGeneric;
   
   public class SymbolItemTooltipGeneric extends Sprite
   {
       
      
      private var _nativeObject:SymbolItemTooltip = null;
      
      public var background:SymbolSlice9BackgroundTooltipGeneric = null;
      
      public var iconPremiumCurrency:SymbolIconPremiumCurrencyGeneric = null;
      
      public var iconCoins:SymbolIconGameCurrencyGeneric = null;
      
      public var txtPrice:ILabelArea = null;
      
      public var txtCompareValue:ILabelArea = null;
      
      public var txtCompareCaption:ILabelArea = null;
      
      public var stat1:SymbolItemTooltipStatGeneric = null;
      
      public var stat2:SymbolItemTooltipStatGeneric = null;
      
      public var stat3:SymbolItemTooltipStatGeneric = null;
      
      public var stat4:SymbolItemTooltipStatGeneric = null;
      
      public var stat5:SymbolItemTooltipStatGeneric = null;
      
      public var stat6:SymbolItemTooltipStatGeneric = null;
      
      public var txtCompare1:ILabel = null;
      
      public var txtCompare2:ILabel = null;
      
      public var txtCompare3:ILabel = null;
      
      public var txtCompare4:ILabel = null;
      
      public var txtCompare5:ILabel = null;
      
      public var txtCompare6:ILabel = null;
      
      public var txtItemName:ILabelArea = null;
      
      public var txtItemQualityCommon:ILabelArea = null;
      
      public var txtItemQualityRare:ILabelArea = null;
      
      public var txtItemQualityEpic:ILabelArea = null;
      
      public var txtItemCategory:ILabelArea = null;
      
      public var txtPriceCaption:ILabelArea = null;
      
      public var txtStatsCaption:ILabelArea = null;
      
      public var txtDescription:ILabelArea = null;
      
      public var setInfo:SymbolItemTooltipSetInfoGeneric = null;
      
      public var iconItemPatternInfo:SymbolIconItemPatternGeneric = null;
      
      public var txtItemPatternInfo:ILabelArea = null;
      
      public var iconItemEffect:SymbolDummyGeneric = null;
      
      public var txtItemEffectName:ILabelArea = null;
      
      public var txtOutfitsCaption:ILabelArea = null;
      
      public var txtOutfits:ILabelArea = null;
      
      public var txtOutfit:ILabelArea = null;
      
      public var iconOutfit:SymbolIconOutfitInfoGeneric = null;
      
      public var battleSkill:SymbolBattleSkillGeneric = null;
      
      public function SymbolItemTooltipGeneric(param1:MovieClip = null)
      {
         if(param1)
         {
            _nativeObject = param1 as SymbolItemTooltip;
         }
         else
         {
            _nativeObject = new SymbolItemTooltip();
         }
         super(null,FlashSprite.fromNative(_nativeObject));
         var _loc2_:FlashDisplayObjectContainer = _sprite as FlashDisplayObjectContainer;
         background = new SymbolSlice9BackgroundTooltipGeneric(_nativeObject.background);
         iconPremiumCurrency = new SymbolIconPremiumCurrencyGeneric(_nativeObject.iconPremiumCurrency);
         iconCoins = new SymbolIconGameCurrencyGeneric(_nativeObject.iconCoins);
         txtPrice = FlashLabelArea.fromNative(_nativeObject.txtPrice);
         txtCompareValue = FlashLabelArea.fromNative(_nativeObject.txtCompareValue);
         txtCompareCaption = FlashLabelArea.fromNative(_nativeObject.txtCompareCaption);
         stat1 = new SymbolItemTooltipStatGeneric(_nativeObject.stat1);
         stat2 = new SymbolItemTooltipStatGeneric(_nativeObject.stat2);
         stat3 = new SymbolItemTooltipStatGeneric(_nativeObject.stat3);
         stat4 = new SymbolItemTooltipStatGeneric(_nativeObject.stat4);
         stat5 = new SymbolItemTooltipStatGeneric(_nativeObject.stat5);
         stat6 = new SymbolItemTooltipStatGeneric(_nativeObject.stat6);
         txtCompare1 = FlashLabel.fromNative(_nativeObject.txtCompare1);
         txtCompare2 = FlashLabel.fromNative(_nativeObject.txtCompare2);
         txtCompare3 = FlashLabel.fromNative(_nativeObject.txtCompare3);
         txtCompare4 = FlashLabel.fromNative(_nativeObject.txtCompare4);
         txtCompare5 = FlashLabel.fromNative(_nativeObject.txtCompare5);
         txtCompare6 = FlashLabel.fromNative(_nativeObject.txtCompare6);
         txtItemName = FlashLabelArea.fromNative(_nativeObject.txtItemName);
         txtItemQualityCommon = FlashLabelArea.fromNative(_nativeObject.txtItemQualityCommon);
         txtItemQualityRare = FlashLabelArea.fromNative(_nativeObject.txtItemQualityRare);
         txtItemQualityEpic = FlashLabelArea.fromNative(_nativeObject.txtItemQualityEpic);
         txtItemCategory = FlashLabelArea.fromNative(_nativeObject.txtItemCategory);
         txtPriceCaption = FlashLabelArea.fromNative(_nativeObject.txtPriceCaption);
         txtStatsCaption = FlashLabelArea.fromNative(_nativeObject.txtStatsCaption);
         txtDescription = FlashLabelArea.fromNative(_nativeObject.txtDescription);
         setInfo = new SymbolItemTooltipSetInfoGeneric(_nativeObject.setInfo);
         iconItemPatternInfo = new SymbolIconItemPatternGeneric(_nativeObject.iconItemPatternInfo);
         txtItemPatternInfo = FlashLabelArea.fromNative(_nativeObject.txtItemPatternInfo);
         iconItemEffect = new SymbolDummyGeneric(_nativeObject.iconItemEffect);
         txtItemEffectName = FlashLabelArea.fromNative(_nativeObject.txtItemEffectName);
         txtOutfitsCaption = FlashLabelArea.fromNative(_nativeObject.txtOutfitsCaption);
         txtOutfits = FlashLabelArea.fromNative(_nativeObject.txtOutfits);
         txtOutfit = FlashLabelArea.fromNative(_nativeObject.txtOutfit);
         iconOutfit = new SymbolIconOutfitInfoGeneric(_nativeObject.iconOutfit);
         battleSkill = new SymbolBattleSkillGeneric(_nativeObject.battleSkill);
      }
      
      public function setNativeInstance(param1:SymbolItemTooltip) : void
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
         if(_nativeObject.iconPremiumCurrency)
         {
            iconPremiumCurrency.setNativeInstance(_nativeObject.iconPremiumCurrency);
         }
         if(_nativeObject.iconCoins)
         {
            iconCoins.setNativeInstance(_nativeObject.iconCoins);
         }
         FlashLabelArea.setNativeInstance(txtPrice,_nativeObject.txtPrice);
         FlashLabelArea.setNativeInstance(txtCompareValue,_nativeObject.txtCompareValue);
         FlashLabelArea.setNativeInstance(txtCompareCaption,_nativeObject.txtCompareCaption);
         if(_nativeObject.stat1)
         {
            stat1.setNativeInstance(_nativeObject.stat1);
         }
         if(_nativeObject.stat2)
         {
            stat2.setNativeInstance(_nativeObject.stat2);
         }
         if(_nativeObject.stat3)
         {
            stat3.setNativeInstance(_nativeObject.stat3);
         }
         if(_nativeObject.stat4)
         {
            stat4.setNativeInstance(_nativeObject.stat4);
         }
         if(_nativeObject.stat5)
         {
            stat5.setNativeInstance(_nativeObject.stat5);
         }
         if(_nativeObject.stat6)
         {
            stat6.setNativeInstance(_nativeObject.stat6);
         }
         FlashLabel.setNativeInstance(txtCompare1,_nativeObject.txtCompare1);
         FlashLabel.setNativeInstance(txtCompare2,_nativeObject.txtCompare2);
         FlashLabel.setNativeInstance(txtCompare3,_nativeObject.txtCompare3);
         FlashLabel.setNativeInstance(txtCompare4,_nativeObject.txtCompare4);
         FlashLabel.setNativeInstance(txtCompare5,_nativeObject.txtCompare5);
         FlashLabel.setNativeInstance(txtCompare6,_nativeObject.txtCompare6);
         FlashLabelArea.setNativeInstance(txtItemName,_nativeObject.txtItemName);
         FlashLabelArea.setNativeInstance(txtItemQualityCommon,_nativeObject.txtItemQualityCommon);
         FlashLabelArea.setNativeInstance(txtItemQualityRare,_nativeObject.txtItemQualityRare);
         FlashLabelArea.setNativeInstance(txtItemQualityEpic,_nativeObject.txtItemQualityEpic);
         FlashLabelArea.setNativeInstance(txtItemCategory,_nativeObject.txtItemCategory);
         FlashLabelArea.setNativeInstance(txtPriceCaption,_nativeObject.txtPriceCaption);
         FlashLabelArea.setNativeInstance(txtStatsCaption,_nativeObject.txtStatsCaption);
         FlashLabelArea.setNativeInstance(txtDescription,_nativeObject.txtDescription);
         if(_nativeObject.setInfo)
         {
            setInfo.setNativeInstance(_nativeObject.setInfo);
         }
         if(_nativeObject.iconItemPatternInfo)
         {
            iconItemPatternInfo.setNativeInstance(_nativeObject.iconItemPatternInfo);
         }
         FlashLabelArea.setNativeInstance(txtItemPatternInfo,_nativeObject.txtItemPatternInfo);
         if(_nativeObject.iconItemEffect)
         {
            iconItemEffect.setNativeInstance(_nativeObject.iconItemEffect);
         }
         FlashLabelArea.setNativeInstance(txtItemEffectName,_nativeObject.txtItemEffectName);
         FlashLabelArea.setNativeInstance(txtOutfitsCaption,_nativeObject.txtOutfitsCaption);
         FlashLabelArea.setNativeInstance(txtOutfits,_nativeObject.txtOutfits);
         FlashLabelArea.setNativeInstance(txtOutfit,_nativeObject.txtOutfit);
         if(_nativeObject.iconOutfit)
         {
            iconOutfit.setNativeInstance(_nativeObject.iconOutfit);
         }
         if(_nativeObject.battleSkill)
         {
            battleSkill.setNativeInstance(_nativeObject.battleSkill);
         }
      }
   }
}
