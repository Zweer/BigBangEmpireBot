package visuals.ui.elements.guild
{
   import com.playata.framework.display.Sprite;
   import com.playata.framework.display.lib.flash.FlashDisplayObjectContainer;
   import com.playata.framework.display.lib.flash.FlashSprite;
   import flash.display.MovieClip;
   import visuals.ui.base.SymbolDummyGeneric;
   import visuals.ui.base.SymbolPlaceholderGeneric;
   
   public class SymbolColorBoxPickerGeneric extends Sprite
   {
       
      
      private var _nativeObject:SymbolColorBoxPicker = null;
      
      public var background:SymbolColorBoxPickerBackgroundGeneric = null;
      
      public var tooltipLayer:SymbolDummyGeneric = null;
      
      public var boxes:SymbolPlaceholderGeneric = null;
      
      public function SymbolColorBoxPickerGeneric(param1:MovieClip = null)
      {
         if(param1)
         {
            _nativeObject = param1 as SymbolColorBoxPicker;
         }
         else
         {
            _nativeObject = new SymbolColorBoxPicker();
         }
         super(null,FlashSprite.fromNative(_nativeObject));
         var _loc2_:FlashDisplayObjectContainer = _sprite as FlashDisplayObjectContainer;
         background = new SymbolColorBoxPickerBackgroundGeneric(_nativeObject.background);
         tooltipLayer = new SymbolDummyGeneric(_nativeObject.tooltipLayer);
         boxes = new SymbolPlaceholderGeneric(_nativeObject.boxes);
      }
      
      public function setNativeInstance(param1:SymbolColorBoxPicker) : void
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
         if(_nativeObject.tooltipLayer)
         {
            tooltipLayer.setNativeInstance(_nativeObject.tooltipLayer);
         }
         if(_nativeObject.boxes)
         {
            boxes.setNativeInstance(_nativeObject.boxes);
         }
      }
   }
}
