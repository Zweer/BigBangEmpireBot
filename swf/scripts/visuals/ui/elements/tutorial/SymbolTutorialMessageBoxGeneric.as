package visuals.ui.elements.tutorial
{
   import com.playata.framework.display.Sprite;
   import com.playata.framework.display.lib.flash.FlashDisplayObjectContainer;
   import com.playata.framework.display.lib.flash.FlashLabelArea;
   import com.playata.framework.display.lib.flash.FlashSprite;
   import com.playata.framework.display.ui.controls.ILabelArea;
   import flash.display.MovieClip;
   import visuals.ui.elements.backgrounds.SymbolSlice9BackgroundTooltipGeneric;
   
   public class SymbolTutorialMessageBoxGeneric extends Sprite
   {
       
      
      private var _nativeObject:SymbolTutorialMessageBox = null;
      
      public var background:SymbolSlice9BackgroundTooltipGeneric = null;
      
      public var caption:ILabelArea = null;
      
      public function SymbolTutorialMessageBoxGeneric(param1:MovieClip = null)
      {
         if(param1)
         {
            _nativeObject = param1 as SymbolTutorialMessageBox;
         }
         else
         {
            _nativeObject = new SymbolTutorialMessageBox();
         }
         super(null,FlashSprite.fromNative(_nativeObject));
         var _loc2_:FlashDisplayObjectContainer = _sprite as FlashDisplayObjectContainer;
         background = new SymbolSlice9BackgroundTooltipGeneric(_nativeObject.background);
         caption = FlashLabelArea.fromNative(_nativeObject.caption);
      }
      
      public function setNativeInstance(param1:SymbolTutorialMessageBox) : void
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
         FlashLabelArea.setNativeInstance(caption,_nativeObject.caption);
      }
   }
}
