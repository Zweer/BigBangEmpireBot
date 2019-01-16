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
   import visuals.ui.elements.icons.SymbolIconPlusGeneric;
   import visuals.ui.elements.icons.SymbolIconPremiumCurrencyGeneric;
   import visuals.ui.elements.icons.SymbolIconXpGeneric;
   
   public class SymbolUiGuildCompetitionProgressTooltipGeneric extends Sprite
   {
       
      
      private var _nativeObject:SymbolUiGuildCompetitionProgressTooltip = null;
      
      public var background:SymbolSlice9BackgroundTooltipGeneric = null;
      
      public var tooltip:ILabelArea = null;
      
      public var txtNoRewards:ILabelArea = null;
      
      public var iconPremiumCurrency:SymbolIconPremiumCurrencyGeneric = null;
      
      public var txtRewardsCaption:ILabel = null;
      
      public var iconStatPoints:SymbolIconPlusGeneric = null;
      
      public var txtStatPoints:ILabelArea = null;
      
      public var iconXP:SymbolIconXpGeneric = null;
      
      public var txtPremiumCurrency:ILabelArea = null;
      
      public var txtXP:ILabelArea = null;
      
      public function SymbolUiGuildCompetitionProgressTooltipGeneric(param1:MovieClip = null)
      {
         if(param1)
         {
            _nativeObject = param1 as SymbolUiGuildCompetitionProgressTooltip;
         }
         else
         {
            _nativeObject = new SymbolUiGuildCompetitionProgressTooltip();
         }
         super(null,FlashSprite.fromNative(_nativeObject));
         var _loc2_:FlashDisplayObjectContainer = _sprite as FlashDisplayObjectContainer;
         background = new SymbolSlice9BackgroundTooltipGeneric(_nativeObject.background);
         tooltip = FlashLabelArea.fromNative(_nativeObject.tooltip);
         txtNoRewards = FlashLabelArea.fromNative(_nativeObject.txtNoRewards);
         iconPremiumCurrency = new SymbolIconPremiumCurrencyGeneric(_nativeObject.iconPremiumCurrency);
         txtRewardsCaption = FlashLabel.fromNative(_nativeObject.txtRewardsCaption);
         iconStatPoints = new SymbolIconPlusGeneric(_nativeObject.iconStatPoints);
         txtStatPoints = FlashLabelArea.fromNative(_nativeObject.txtStatPoints);
         iconXP = new SymbolIconXpGeneric(_nativeObject.iconXP);
         txtPremiumCurrency = FlashLabelArea.fromNative(_nativeObject.txtPremiumCurrency);
         txtXP = FlashLabelArea.fromNative(_nativeObject.txtXP);
      }
      
      public function setNativeInstance(param1:SymbolUiGuildCompetitionProgressTooltip) : void
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
         FlashLabelArea.setNativeInstance(txtNoRewards,_nativeObject.txtNoRewards);
         if(_nativeObject.iconPremiumCurrency)
         {
            iconPremiumCurrency.setNativeInstance(_nativeObject.iconPremiumCurrency);
         }
         FlashLabel.setNativeInstance(txtRewardsCaption,_nativeObject.txtRewardsCaption);
         if(_nativeObject.iconStatPoints)
         {
            iconStatPoints.setNativeInstance(_nativeObject.iconStatPoints);
         }
         FlashLabelArea.setNativeInstance(txtStatPoints,_nativeObject.txtStatPoints);
         if(_nativeObject.iconXP)
         {
            iconXP.setNativeInstance(_nativeObject.iconXP);
         }
         FlashLabelArea.setNativeInstance(txtPremiumCurrency,_nativeObject.txtPremiumCurrency);
         FlashLabelArea.setNativeInstance(txtXP,_nativeObject.txtXP);
      }
   }
}
