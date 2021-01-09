package visuals.ui.elements.booster
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
   import visuals.ui.elements.buttons.SymbolButtonPremiumGeneric;
   import visuals.ui.elements.icons.SymbolIconCheckmarkGeneric;
   
   public class SymbolButtonHeroSenseBoosterGeneric extends Sprite
   {
       
      
      private var _nativeObject:SymbolButtonHeroSenseBooster = null;
      
      public var btnBuyForPremiumCurrency:SymbolButtonPremiumGeneric = null;
      
      public var txtDuration:ILabel = null;
      
      public var checkmark:SymbolIconCheckmarkGeneric = null;
      
      public var txtName:ILabelArea = null;
      
      public var tooltipLayer:SymbolDummyGeneric = null;
      
      public function SymbolButtonHeroSenseBoosterGeneric(param1:MovieClip = null)
      {
         if(param1)
         {
            _nativeObject = param1 as SymbolButtonHeroSenseBooster;
         }
         else
         {
            _nativeObject = new SymbolButtonHeroSenseBooster();
         }
         super(null,FlashSprite.fromNative(_nativeObject));
         var _loc2_:FlashDisplayObjectContainer = _sprite as FlashDisplayObjectContainer;
         btnBuyForPremiumCurrency = new SymbolButtonPremiumGeneric(_nativeObject.btnBuyForPremiumCurrency);
         txtDuration = FlashLabel.fromNative(_nativeObject.txtDuration);
         checkmark = new SymbolIconCheckmarkGeneric(_nativeObject.checkmark);
         txtName = FlashLabelArea.fromNative(_nativeObject.txtName);
         tooltipLayer = new SymbolDummyGeneric(_nativeObject.tooltipLayer);
      }
      
      public function setNativeInstance(param1:SymbolButtonHeroSenseBooster) : void
      {
         FlashSprite.setNativeInstance(_sprite,param1);
         _nativeObject = param1;
         syncInstances();
      }
      
      public function syncInstances() : void
      {
         if(_nativeObject.btnBuyForPremiumCurrency)
         {
            btnBuyForPremiumCurrency.setNativeInstance(_nativeObject.btnBuyForPremiumCurrency);
         }
         FlashLabel.setNativeInstance(txtDuration,_nativeObject.txtDuration);
         if(_nativeObject.checkmark)
         {
            checkmark.setNativeInstance(_nativeObject.checkmark);
         }
         FlashLabelArea.setNativeInstance(txtName,_nativeObject.txtName);
         if(_nativeObject.tooltipLayer)
         {
            tooltipLayer.setNativeInstance(_nativeObject.tooltipLayer);
         }
      }
   }
}
