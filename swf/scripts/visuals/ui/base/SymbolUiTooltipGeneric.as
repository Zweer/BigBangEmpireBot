package visuals.ui.base
{
   import com.playata.framework.display.Sprite;
   import com.playata.framework.display.lib.flash.FlashDisplayObjectContainer;
   import com.playata.framework.display.lib.flash.FlashLabelArea;
   import com.playata.framework.display.lib.flash.FlashSprite;
   import com.playata.framework.display.ui.controls.ILabelArea;
   import flash.display.MovieClip;
   import visuals.ui.elements.backgrounds.SymbolSlice9BackgroundTooltipGeneric;
   
   public class SymbolUiTooltipGeneric extends Sprite
   {
       
      
      private var _nativeObject:SymbolUiTooltip = null;
      
      public var background:SymbolSlice9BackgroundTooltipGeneric = null;
      
      public var tooltip:ILabelArea = null;
      
      public function SymbolUiTooltipGeneric(param1:MovieClip = null)
      {
         if(param1)
         {
            _nativeObject = param1 as SymbolUiTooltip;
         }
         else
         {
            _nativeObject = new SymbolUiTooltip();
         }
         super(null,FlashSprite.fromNative(_nativeObject));
         var _loc2_:FlashDisplayObjectContainer = _sprite as FlashDisplayObjectContainer;
         background = new SymbolSlice9BackgroundTooltipGeneric(_nativeObject.background);
         tooltip = FlashLabelArea.fromNative(_nativeObject.tooltip);
      }
      
      public function setNativeInstance(param1:SymbolUiTooltip) : void
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
      }
   }
}
