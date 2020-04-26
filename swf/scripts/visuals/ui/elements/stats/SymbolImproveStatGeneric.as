package visuals.ui.elements.stats
{
   import com.playata.framework.display.Sprite;
   import com.playata.framework.display.lib.flash.FlashDisplayObjectContainer;
   import com.playata.framework.display.lib.flash.FlashLabel;
   import com.playata.framework.display.lib.flash.FlashSprite;
   import com.playata.framework.display.ui.controls.ILabel;
   import flash.display.MovieClip;
   import visuals.ui.base.SymbolDummyGeneric;
   import visuals.ui.elements.buttons.SymbolButtonHelpGeneric;
   import visuals.ui.elements.buttons.SymbolButtonIncreaseGameCurrencyGeneric;
   import visuals.ui.elements.icons.SymbolIconCriticalHitRatingMediumGeneric;
   import visuals.ui.elements.icons.SymbolIconDodgeRatingMediumGeneric;
   import visuals.ui.elements.icons.SymbolIconStaminaMediumGeneric;
   import visuals.ui.elements.icons.SymbolIconStrengthMediumGeneric;
   
   public class SymbolImproveStatGeneric extends Sprite
   {
       
      
      private var _nativeObject:SymbolImproveStat = null;
      
      public var barBackground:SymbolStatBarBackgroundGeneric = null;
      
      public var iconStrength:SymbolIconStrengthMediumGeneric = null;
      
      public var iconCriticalRating:SymbolIconCriticalHitRatingMediumGeneric = null;
      
      public var iconStamina:SymbolIconStaminaMediumGeneric = null;
      
      public var iconDodgeRating:SymbolIconDodgeRatingMediumGeneric = null;
      
      public var barFill:SymbolStatBarFillGeneric = null;
      
      public var txtStatValue:ILabel = null;
      
      public var txtInfo:ILabel = null;
      
      public var btnIncrease:SymbolButtonIncreaseGameCurrencyGeneric = null;
      
      public var tooltipLayer:SymbolDummyGeneric = null;
      
      public var btnHelp:SymbolButtonHelpGeneric = null;
      
      public function SymbolImproveStatGeneric(param1:MovieClip = null)
      {
         if(param1)
         {
            _nativeObject = param1 as SymbolImproveStat;
         }
         else
         {
            _nativeObject = new SymbolImproveStat();
         }
         super(null,FlashSprite.fromNative(_nativeObject));
         var _loc2_:FlashDisplayObjectContainer = _sprite as FlashDisplayObjectContainer;
         barBackground = new SymbolStatBarBackgroundGeneric(_nativeObject.barBackground);
         iconStrength = new SymbolIconStrengthMediumGeneric(_nativeObject.iconStrength);
         iconCriticalRating = new SymbolIconCriticalHitRatingMediumGeneric(_nativeObject.iconCriticalRating);
         iconStamina = new SymbolIconStaminaMediumGeneric(_nativeObject.iconStamina);
         iconDodgeRating = new SymbolIconDodgeRatingMediumGeneric(_nativeObject.iconDodgeRating);
         barFill = new SymbolStatBarFillGeneric(_nativeObject.barFill);
         txtStatValue = FlashLabel.fromNative(_nativeObject.txtStatValue);
         txtInfo = FlashLabel.fromNative(_nativeObject.txtInfo);
         btnIncrease = new SymbolButtonIncreaseGameCurrencyGeneric(_nativeObject.btnIncrease);
         tooltipLayer = new SymbolDummyGeneric(_nativeObject.tooltipLayer);
         btnHelp = new SymbolButtonHelpGeneric(_nativeObject.btnHelp);
      }
      
      public function setNativeInstance(param1:SymbolImproveStat) : void
      {
         FlashSprite.setNativeInstance(_sprite,param1);
         _nativeObject = param1;
         syncInstances();
      }
      
      public function syncInstances() : void
      {
         if(_nativeObject.barBackground)
         {
            barBackground.setNativeInstance(_nativeObject.barBackground);
         }
         if(_nativeObject.iconStrength)
         {
            iconStrength.setNativeInstance(_nativeObject.iconStrength);
         }
         if(_nativeObject.iconCriticalRating)
         {
            iconCriticalRating.setNativeInstance(_nativeObject.iconCriticalRating);
         }
         if(_nativeObject.iconStamina)
         {
            iconStamina.setNativeInstance(_nativeObject.iconStamina);
         }
         if(_nativeObject.iconDodgeRating)
         {
            iconDodgeRating.setNativeInstance(_nativeObject.iconDodgeRating);
         }
         if(_nativeObject.barFill)
         {
            barFill.setNativeInstance(_nativeObject.barFill);
         }
         FlashLabel.setNativeInstance(txtStatValue,_nativeObject.txtStatValue);
         FlashLabel.setNativeInstance(txtInfo,_nativeObject.txtInfo);
         if(_nativeObject.btnIncrease)
         {
            btnIncrease.setNativeInstance(_nativeObject.btnIncrease);
         }
         if(_nativeObject.tooltipLayer)
         {
            tooltipLayer.setNativeInstance(_nativeObject.tooltipLayer);
         }
         if(_nativeObject.btnHelp)
         {
            btnHelp.setNativeInstance(_nativeObject.btnHelp);
         }
      }
   }
}
