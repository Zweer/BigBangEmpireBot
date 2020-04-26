package visuals.ui.elements.streaming
{
   import com.playata.framework.display.Sprite;
   import com.playata.framework.display.lib.flash.FlashDisplayObjectContainer;
   import com.playata.framework.display.lib.flash.FlashLabelArea;
   import com.playata.framework.display.lib.flash.FlashSprite;
   import com.playata.framework.display.ui.controls.ILabelArea;
   import flash.display.MovieClip;
   import visuals.ui.base.SymbolPlaceholderGeneric;
   import visuals.ui.elements.backgrounds.SymbolBackgroundScalableGeneric;
   
   public class SymbolStreamingSettingContentGeneric extends Sprite
   {
       
      
      private var _nativeObject:SymbolStreamingSettingContent = null;
      
      public var symbolBackgroundScalable:SymbolBackgroundScalableGeneric = null;
      
      public var symbolBackgroundScalable2:SymbolBackgroundScalableGeneric = null;
      
      public var symbolBackgroundScalable3:SymbolBackgroundScalableGeneric = null;
      
      public var image:SymbolPlaceholderGeneric = null;
      
      public var txtName:ILabelArea = null;
      
      public var txtDescription:ILabelArea = null;
      
      public var txtDurationCaption:ILabelArea = null;
      
      public var txtDuration:ILabelArea = null;
      
      public var txtMultiplierCaption:ILabelArea = null;
      
      public var txtMultiplier:ILabelArea = null;
      
      public var backgroundUnlock:SymbolBackgroundScalableGeneric = null;
      
      public var txtUnlock:ILabelArea = null;
      
      public function SymbolStreamingSettingContentGeneric(param1:MovieClip = null)
      {
         if(param1)
         {
            _nativeObject = param1 as SymbolStreamingSettingContent;
         }
         else
         {
            _nativeObject = new SymbolStreamingSettingContent();
         }
         super(null,FlashSprite.fromNative(_nativeObject));
         var _loc2_:FlashDisplayObjectContainer = _sprite as FlashDisplayObjectContainer;
         symbolBackgroundScalable = new SymbolBackgroundScalableGeneric(_nativeObject.symbolBackgroundScalable);
         symbolBackgroundScalable2 = new SymbolBackgroundScalableGeneric(_nativeObject.symbolBackgroundScalable2);
         symbolBackgroundScalable3 = new SymbolBackgroundScalableGeneric(_nativeObject.symbolBackgroundScalable3);
         image = new SymbolPlaceholderGeneric(_nativeObject.image);
         txtName = FlashLabelArea.fromNative(_nativeObject.txtName);
         txtDescription = FlashLabelArea.fromNative(_nativeObject.txtDescription);
         txtDurationCaption = FlashLabelArea.fromNative(_nativeObject.txtDurationCaption);
         txtDuration = FlashLabelArea.fromNative(_nativeObject.txtDuration);
         txtMultiplierCaption = FlashLabelArea.fromNative(_nativeObject.txtMultiplierCaption);
         txtMultiplier = FlashLabelArea.fromNative(_nativeObject.txtMultiplier);
         backgroundUnlock = new SymbolBackgroundScalableGeneric(_nativeObject.backgroundUnlock);
         txtUnlock = FlashLabelArea.fromNative(_nativeObject.txtUnlock);
      }
      
      public function setNativeInstance(param1:SymbolStreamingSettingContent) : void
      {
         FlashSprite.setNativeInstance(_sprite,param1);
         _nativeObject = param1;
         syncInstances();
      }
      
      public function syncInstances() : void
      {
         if(_nativeObject.symbolBackgroundScalable)
         {
            symbolBackgroundScalable.setNativeInstance(_nativeObject.symbolBackgroundScalable);
         }
         if(_nativeObject.symbolBackgroundScalable2)
         {
            symbolBackgroundScalable2.setNativeInstance(_nativeObject.symbolBackgroundScalable2);
         }
         if(_nativeObject.symbolBackgroundScalable3)
         {
            symbolBackgroundScalable3.setNativeInstance(_nativeObject.symbolBackgroundScalable3);
         }
         if(_nativeObject.image)
         {
            image.setNativeInstance(_nativeObject.image);
         }
         FlashLabelArea.setNativeInstance(txtName,_nativeObject.txtName);
         FlashLabelArea.setNativeInstance(txtDescription,_nativeObject.txtDescription);
         FlashLabelArea.setNativeInstance(txtDurationCaption,_nativeObject.txtDurationCaption);
         FlashLabelArea.setNativeInstance(txtDuration,_nativeObject.txtDuration);
         FlashLabelArea.setNativeInstance(txtMultiplierCaption,_nativeObject.txtMultiplierCaption);
         FlashLabelArea.setNativeInstance(txtMultiplier,_nativeObject.txtMultiplier);
         if(_nativeObject.backgroundUnlock)
         {
            backgroundUnlock.setNativeInstance(_nativeObject.backgroundUnlock);
         }
         FlashLabelArea.setNativeInstance(txtUnlock,_nativeObject.txtUnlock);
      }
   }
}
