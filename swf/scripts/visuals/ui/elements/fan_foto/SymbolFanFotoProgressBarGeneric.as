package visuals.ui.elements.fan_foto
{
   import com.playata.framework.display.Sprite;
   import com.playata.framework.display.lib.flash.FlashDisplayObjectContainer;
   import com.playata.framework.display.lib.flash.FlashLabel;
   import com.playata.framework.display.lib.flash.FlashSprite;
   import com.playata.framework.display.ui.controls.ILabel;
   import flash.display.MovieClip;
   import visuals.ui.base.SymbolDummyGeneric;
   import visuals.ui.elements.buttons.SymbolButtonPlusStaticGeneric;
   
   public class SymbolFanFotoProgressBarGeneric extends Sprite
   {
       
      
      private var _nativeObject:SymbolFanFotoProgressBar = null;
      
      public var fill:SymbolFanFotoProgressBarFillGeneric = null;
      
      public var txtValue:ILabel = null;
      
      public var mouseLayer:SymbolDummyGeneric = null;
      
      public var iconResource:SymbolIconFanFotoResourceGeneric = null;
      
      public var iconRandom:SymbolIconFanFotoRandomGeneric = null;
      
      public var iconRandom25:SymbolIconFanFotoRandom25Generic = null;
      
      public var iconNotRandom:SymbolIconFanFotoTagGeneric = null;
      
      public var btnPlus:SymbolButtonPlusStaticGeneric = null;
      
      public function SymbolFanFotoProgressBarGeneric(param1:MovieClip = null)
      {
         if(param1)
         {
            _nativeObject = param1 as SymbolFanFotoProgressBar;
         }
         else
         {
            _nativeObject = new SymbolFanFotoProgressBar();
         }
         super(null,FlashSprite.fromNative(_nativeObject));
         var _loc2_:FlashDisplayObjectContainer = _sprite as FlashDisplayObjectContainer;
         fill = new SymbolFanFotoProgressBarFillGeneric(_nativeObject.fill);
         txtValue = FlashLabel.fromNative(_nativeObject.txtValue);
         mouseLayer = new SymbolDummyGeneric(_nativeObject.mouseLayer);
         iconResource = new SymbolIconFanFotoResourceGeneric(_nativeObject.iconResource);
         iconRandom = new SymbolIconFanFotoRandomGeneric(_nativeObject.iconRandom);
         iconRandom25 = new SymbolIconFanFotoRandom25Generic(_nativeObject.iconRandom25);
         iconNotRandom = new SymbolIconFanFotoTagGeneric(_nativeObject.iconNotRandom);
         btnPlus = new SymbolButtonPlusStaticGeneric(_nativeObject.btnPlus);
      }
      
      public function setNativeInstance(param1:SymbolFanFotoProgressBar) : void
      {
         FlashSprite.setNativeInstance(_sprite,param1);
         _nativeObject = param1;
         syncInstances();
      }
      
      public function syncInstances() : void
      {
         if(_nativeObject.fill)
         {
            fill.setNativeInstance(_nativeObject.fill);
         }
         FlashLabel.setNativeInstance(txtValue,_nativeObject.txtValue);
         if(_nativeObject.mouseLayer)
         {
            mouseLayer.setNativeInstance(_nativeObject.mouseLayer);
         }
         if(_nativeObject.iconResource)
         {
            iconResource.setNativeInstance(_nativeObject.iconResource);
         }
         if(_nativeObject.iconRandom)
         {
            iconRandom.setNativeInstance(_nativeObject.iconRandom);
         }
         if(_nativeObject.iconRandom25)
         {
            iconRandom25.setNativeInstance(_nativeObject.iconRandom25);
         }
         if(_nativeObject.iconNotRandom)
         {
            iconNotRandom.setNativeInstance(_nativeObject.iconNotRandom);
         }
         if(_nativeObject.btnPlus)
         {
            btnPlus.setNativeInstance(_nativeObject.btnPlus);
         }
      }
   }
}
