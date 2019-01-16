package visuals.ui.base
{
   import com.playata.framework.display.Sprite;
   import com.playata.framework.display.lib.flash.FlashDisplayObjectContainer;
   import com.playata.framework.display.lib.flash.FlashLabelArea;
   import com.playata.framework.display.lib.flash.FlashSprite;
   import com.playata.framework.display.ui.controls.ILabelArea;
   import flash.display.MovieClip;
   import visuals.ui.elements.backgrounds.SymbolSlice9BackgroundTooltipGeneric;
   
   public class SymbolUiHeadlineTooltipGeneric extends Sprite
   {
       
      
      private var _nativeObject:SymbolUiHeadlineTooltip = null;
      
      public var background:SymbolSlice9BackgroundTooltipGeneric = null;
      
      public var title:ILabelArea = null;
      
      public var tooltip:ILabelArea = null;
      
      public function SymbolUiHeadlineTooltipGeneric(param1:MovieClip = null)
      {
         if(param1)
         {
            _nativeObject = param1 as SymbolUiHeadlineTooltip;
         }
         else
         {
            _nativeObject = new SymbolUiHeadlineTooltip();
         }
         super(null,FlashSprite.fromNative(_nativeObject));
         var _loc2_:FlashDisplayObjectContainer = _sprite as FlashDisplayObjectContainer;
         background = new SymbolSlice9BackgroundTooltipGeneric(_nativeObject.background);
         title = FlashLabelArea.fromNative(_nativeObject.title);
         tooltip = FlashLabelArea.fromNative(_nativeObject.tooltip);
      }
      
      public function setNativeInstance(param1:SymbolUiHeadlineTooltip) : void
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
         FlashLabelArea.setNativeInstance(title,_nativeObject.title);
         FlashLabelArea.setNativeInstance(tooltip,_nativeObject.tooltip);
      }
   }
}
