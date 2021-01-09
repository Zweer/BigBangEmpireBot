package visuals.ui.base
{
   import com.playata.framework.display.Sprite;
   import com.playata.framework.display.lib.flash.FlashDisplayObjectContainer;
   import com.playata.framework.display.lib.flash.FlashLabel;
   import com.playata.framework.display.lib.flash.FlashSprite;
   import com.playata.framework.display.ui.controls.ILabel;
   import flash.display.MovieClip;
   import visuals.ui.elements.backgrounds.SymbolBackgroundScalableGeneric;
   
   public class SymbolBlockerLayerGeneric extends Sprite
   {
       
      
      private var _nativeObject:SymbolBlockerLayer = null;
      
      public var blockBackground:SymbolBackgroundScalableGeneric = null;
      
      public var blockIndicator:SymbolBlockerAnimationGeneric = null;
      
      public var txtStatus:ILabel = null;
      
      public function SymbolBlockerLayerGeneric(param1:MovieClip = null)
      {
         if(param1)
         {
            _nativeObject = param1 as SymbolBlockerLayer;
         }
         else
         {
            _nativeObject = new SymbolBlockerLayer();
         }
         super(null,FlashSprite.fromNative(_nativeObject));
         var _loc2_:FlashDisplayObjectContainer = _sprite as FlashDisplayObjectContainer;
         blockBackground = new SymbolBackgroundScalableGeneric(_nativeObject.blockBackground);
         blockIndicator = new SymbolBlockerAnimationGeneric(_nativeObject.blockIndicator);
         txtStatus = FlashLabel.fromNative(_nativeObject.txtStatus);
      }
      
      public function setNativeInstance(param1:SymbolBlockerLayer) : void
      {
         FlashSprite.setNativeInstance(_sprite,param1);
         _nativeObject = param1;
         syncInstances();
      }
      
      public function syncInstances() : void
      {
         if(_nativeObject.blockBackground)
         {
            blockBackground.setNativeInstance(_nativeObject.blockBackground);
         }
         if(_nativeObject.blockIndicator)
         {
            blockIndicator.setNativeInstance(_nativeObject.blockIndicator);
         }
         FlashLabel.setNativeInstance(txtStatus,_nativeObject.txtStatus);
      }
   }
}
