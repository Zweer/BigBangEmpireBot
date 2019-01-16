package visuals.ui.elements.stats
{
   import com.playata.framework.display.Sprite;
   import com.playata.framework.display.lib.flash.FlashDisplayObjectContainer;
   import com.playata.framework.display.lib.flash.FlashLabel;
   import com.playata.framework.display.lib.flash.FlashSprite;
   import com.playata.framework.display.ui.controls.ILabel;
   import flash.display.MovieClip;
   import visuals.ui.base.SymbolDummyGeneric;
   import visuals.ui.elements.buttons.SymbolButtonPlusGeneric;
   import visuals.ui.elements.icons.SymbolIconCriticalHitRatingGeneric;
   import visuals.ui.elements.icons.SymbolIconDodgeRatingGeneric;
   import visuals.ui.elements.icons.SymbolIconStaminaGeneric;
   import visuals.ui.elements.icons.SymbolIconStrengthGeneric;
   
   public class SymbolStatBarGeneric extends Sprite
   {
       
      
      private var _nativeObject:SymbolStatBar = null;
      
      public var background:SymbolStatBarBackgroundGeneric = null;
      
      public var iconStrength:SymbolIconStrengthGeneric = null;
      
      public var iconCriticalHitRating:SymbolIconCriticalHitRatingGeneric = null;
      
      public var iconStamina:SymbolIconStaminaGeneric = null;
      
      public var iconDodgeRating:SymbolIconDodgeRatingGeneric = null;
      
      public var fillBase:SymbolStatBarFillGeneric = null;
      
      public var txtStatValue:ILabel = null;
      
      public var txtFreeStats:ILabel = null;
      
      public var btnIncrease:SymbolButtonPlusGeneric = null;
      
      public var tooltipLayer:SymbolDummyGeneric = null;
      
      public function SymbolStatBarGeneric(param1:MovieClip = null)
      {
         if(param1)
         {
            _nativeObject = param1 as SymbolStatBar;
         }
         else
         {
            _nativeObject = new SymbolStatBar();
         }
         super(null,FlashSprite.fromNative(_nativeObject));
         var _loc2_:FlashDisplayObjectContainer = _sprite as FlashDisplayObjectContainer;
         background = new SymbolStatBarBackgroundGeneric(_nativeObject.background);
         iconStrength = new SymbolIconStrengthGeneric(_nativeObject.iconStrength);
         iconCriticalHitRating = new SymbolIconCriticalHitRatingGeneric(_nativeObject.iconCriticalHitRating);
         iconStamina = new SymbolIconStaminaGeneric(_nativeObject.iconStamina);
         iconDodgeRating = new SymbolIconDodgeRatingGeneric(_nativeObject.iconDodgeRating);
         fillBase = new SymbolStatBarFillGeneric(_nativeObject.fillBase);
         txtStatValue = FlashLabel.fromNative(_nativeObject.txtStatValue);
         txtFreeStats = FlashLabel.fromNative(_nativeObject.txtFreeStats);
         btnIncrease = new SymbolButtonPlusGeneric(_nativeObject.btnIncrease);
         tooltipLayer = new SymbolDummyGeneric(_nativeObject.tooltipLayer);
      }
      
      public function setNativeInstance(param1:SymbolStatBar) : void
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
         if(_nativeObject.iconStrength)
         {
            iconStrength.setNativeInstance(_nativeObject.iconStrength);
         }
         if(_nativeObject.iconCriticalHitRating)
         {
            iconCriticalHitRating.setNativeInstance(_nativeObject.iconCriticalHitRating);
         }
         if(_nativeObject.iconStamina)
         {
            iconStamina.setNativeInstance(_nativeObject.iconStamina);
         }
         if(_nativeObject.iconDodgeRating)
         {
            iconDodgeRating.setNativeInstance(_nativeObject.iconDodgeRating);
         }
         if(_nativeObject.fillBase)
         {
            fillBase.setNativeInstance(_nativeObject.fillBase);
         }
         FlashLabel.setNativeInstance(txtStatValue,_nativeObject.txtStatValue);
         FlashLabel.setNativeInstance(txtFreeStats,_nativeObject.txtFreeStats);
         if(_nativeObject.btnIncrease)
         {
            btnIncrease.setNativeInstance(_nativeObject.btnIncrease);
         }
         if(_nativeObject.tooltipLayer)
         {
            tooltipLayer.setNativeInstance(_nativeObject.tooltipLayer);
         }
      }
   }
}
