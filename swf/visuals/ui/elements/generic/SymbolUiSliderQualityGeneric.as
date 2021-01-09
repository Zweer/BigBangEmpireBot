package visuals.ui.elements.generic
{
   import com.playata.framework.display.Sprite;
   import com.playata.framework.display.lib.flash.FlashDisplayObjectContainer;
   import com.playata.framework.display.lib.flash.FlashLabelArea;
   import com.playata.framework.display.lib.flash.FlashSprite;
   import com.playata.framework.display.ui.controls.ILabelArea;
   import flash.display.MovieClip;
   
   public class SymbolUiSliderQualityGeneric extends Sprite
   {
       
      
      private var _nativeObject:SymbolUiSliderQuality = null;
      
      public var barSlider:SymbolUiSliderBarQualityGeneric = null;
      
      public var qualityLow:ILabelArea = null;
      
      public var qualityMedium:ILabelArea = null;
      
      public var qualityHigh:ILabelArea = null;
      
      public var btnSlider:SymbolUiSliderButtonLargerGeneric = null;
      
      public function SymbolUiSliderQualityGeneric(param1:MovieClip = null)
      {
         if(param1)
         {
            _nativeObject = param1 as SymbolUiSliderQuality;
         }
         else
         {
            _nativeObject = new SymbolUiSliderQuality();
         }
         super(null,FlashSprite.fromNative(_nativeObject));
         var _loc2_:FlashDisplayObjectContainer = _sprite as FlashDisplayObjectContainer;
         barSlider = new SymbolUiSliderBarQualityGeneric(_nativeObject.barSlider);
         qualityLow = FlashLabelArea.fromNative(_nativeObject.qualityLow);
         qualityMedium = FlashLabelArea.fromNative(_nativeObject.qualityMedium);
         qualityHigh = FlashLabelArea.fromNative(_nativeObject.qualityHigh);
         btnSlider = new SymbolUiSliderButtonLargerGeneric(_nativeObject.btnSlider);
      }
      
      public function setNativeInstance(param1:SymbolUiSliderQuality) : void
      {
         FlashSprite.setNativeInstance(_sprite,param1);
         _nativeObject = param1;
         syncInstances();
      }
      
      public function syncInstances() : void
      {
         if(_nativeObject.barSlider)
         {
            barSlider.setNativeInstance(_nativeObject.barSlider);
         }
         FlashLabelArea.setNativeInstance(qualityLow,_nativeObject.qualityLow);
         FlashLabelArea.setNativeInstance(qualityMedium,_nativeObject.qualityMedium);
         FlashLabelArea.setNativeInstance(qualityHigh,_nativeObject.qualityHigh);
         if(_nativeObject.btnSlider)
         {
            btnSlider.setNativeInstance(_nativeObject.btnSlider);
         }
      }
   }
}
