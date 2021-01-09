package visuals.ui.elements.generic
{
   import com.playata.framework.display.Sprite;
   import com.playata.framework.display.lib.flash.FlashDisplayObjectContainer;
   import com.playata.framework.display.lib.flash.FlashLabelArea;
   import com.playata.framework.display.lib.flash.FlashSprite;
   import com.playata.framework.display.ui.controls.ILabelArea;
   import flash.display.MovieClip;
   import visuals.ui.base.SymbolDummyGeneric;
   
   public class SymbolUiSliderSoundPackageGeneric extends Sprite
   {
       
      
      private var _nativeObject:SymbolUiSliderSoundPackage = null;
      
      public var symbolDummy:SymbolDummyGeneric = null;
      
      public var barSlider:SymbolUiSliderBarSoundPackageGeneric = null;
      
      public var package1:ILabelArea = null;
      
      public var package2:ILabelArea = null;
      
      public var btnSlider:SymbolUiSliderButtonLargerGeneric = null;
      
      public function SymbolUiSliderSoundPackageGeneric(param1:MovieClip = null)
      {
         if(param1)
         {
            _nativeObject = param1 as SymbolUiSliderSoundPackage;
         }
         else
         {
            _nativeObject = new SymbolUiSliderSoundPackage();
         }
         super(null,FlashSprite.fromNative(_nativeObject));
         var _loc2_:FlashDisplayObjectContainer = _sprite as FlashDisplayObjectContainer;
         symbolDummy = new SymbolDummyGeneric(_nativeObject.symbolDummy);
         barSlider = new SymbolUiSliderBarSoundPackageGeneric(_nativeObject.barSlider);
         package1 = FlashLabelArea.fromNative(_nativeObject.package1);
         package2 = FlashLabelArea.fromNative(_nativeObject.package2);
         btnSlider = new SymbolUiSliderButtonLargerGeneric(_nativeObject.btnSlider);
      }
      
      public function setNativeInstance(param1:SymbolUiSliderSoundPackage) : void
      {
         FlashSprite.setNativeInstance(_sprite,param1);
         _nativeObject = param1;
         syncInstances();
      }
      
      public function syncInstances() : void
      {
         if(_nativeObject.symbolDummy)
         {
            symbolDummy.setNativeInstance(_nativeObject.symbolDummy);
         }
         if(_nativeObject.barSlider)
         {
            barSlider.setNativeInstance(_nativeObject.barSlider);
         }
         FlashLabelArea.setNativeInstance(package1,_nativeObject.package1);
         FlashLabelArea.setNativeInstance(package2,_nativeObject.package2);
         if(_nativeObject.btnSlider)
         {
            btnSlider.setNativeInstance(_nativeObject.btnSlider);
         }
      }
   }
}
