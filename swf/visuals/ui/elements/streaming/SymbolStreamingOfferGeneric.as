package visuals.ui.elements.streaming
{
   import com.playata.framework.display.Sprite;
   import com.playata.framework.display.lib.flash.FlashDisplayObjectContainer;
   import com.playata.framework.display.lib.flash.FlashLabelArea;
   import com.playata.framework.display.lib.flash.FlashSprite;
   import com.playata.framework.display.ui.controls.ILabelArea;
   import flash.display.MovieClip;
   import visuals.ui.base.SymbolDummyGeneric;
   import visuals.ui.base.SymbolPlaceholderGeneric;
   import visuals.ui.base.SymbolUiButtonWideGeneric;
   import visuals.ui.elements.backgrounds.SymbolBackgroundScalableGeneric;
   import visuals.ui.elements.icons.SymbolIconGameCurrencyGeneric;
   import visuals.ui.elements.item.SymbolItemSlotGeneric;
   
   public class SymbolStreamingOfferGeneric extends Sprite
   {
       
      
      private var _nativeObject:SymbolStreamingOffer = null;
      
      public var symbolBackgroundScalable:SymbolBackgroundScalableGeneric = null;
      
      public var imageBg:SymbolPlaceholderGeneric = null;
      
      public var imageActor:SymbolPlaceholderGeneric = null;
      
      public var symbolBackgroundScalable2:SymbolBackgroundScalableGeneric = null;
      
      public var txtSetting:ILabelArea = null;
      
      public var txtDuration:ILabelArea = null;
      
      public var itemSlot:SymbolItemSlotGeneric = null;
      
      public var iconGameCurrency:SymbolIconGameCurrencyGeneric = null;
      
      public var iconStreamingResource:SymbolIconStreamingResourceGeneric = null;
      
      public var btnStartStreaming:SymbolUiButtonWideGeneric = null;
      
      public var tooltipDuration:SymbolDummyGeneric = null;
      
      public var tooltipStreamingShow:SymbolDummyGeneric = null;
      
      public function SymbolStreamingOfferGeneric(param1:MovieClip = null)
      {
         if(param1)
         {
            _nativeObject = param1 as SymbolStreamingOffer;
         }
         else
         {
            _nativeObject = new SymbolStreamingOffer();
         }
         super(null,FlashSprite.fromNative(_nativeObject));
         var _loc2_:FlashDisplayObjectContainer = _sprite as FlashDisplayObjectContainer;
         symbolBackgroundScalable = new SymbolBackgroundScalableGeneric(_nativeObject.symbolBackgroundScalable);
         imageBg = new SymbolPlaceholderGeneric(_nativeObject.imageBg);
         imageActor = new SymbolPlaceholderGeneric(_nativeObject.imageActor);
         symbolBackgroundScalable2 = new SymbolBackgroundScalableGeneric(_nativeObject.symbolBackgroundScalable2);
         txtSetting = FlashLabelArea.fromNative(_nativeObject.txtSetting);
         txtDuration = FlashLabelArea.fromNative(_nativeObject.txtDuration);
         itemSlot = new SymbolItemSlotGeneric(_nativeObject.itemSlot);
         iconGameCurrency = new SymbolIconGameCurrencyGeneric(_nativeObject.iconGameCurrency);
         iconStreamingResource = new SymbolIconStreamingResourceGeneric(_nativeObject.iconStreamingResource);
         btnStartStreaming = new SymbolUiButtonWideGeneric(_nativeObject.btnStartStreaming);
         tooltipDuration = new SymbolDummyGeneric(_nativeObject.tooltipDuration);
         tooltipStreamingShow = new SymbolDummyGeneric(_nativeObject.tooltipStreamingShow);
      }
      
      public function setNativeInstance(param1:SymbolStreamingOffer) : void
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
         if(_nativeObject.imageBg)
         {
            imageBg.setNativeInstance(_nativeObject.imageBg);
         }
         if(_nativeObject.imageActor)
         {
            imageActor.setNativeInstance(_nativeObject.imageActor);
         }
         if(_nativeObject.symbolBackgroundScalable2)
         {
            symbolBackgroundScalable2.setNativeInstance(_nativeObject.symbolBackgroundScalable2);
         }
         FlashLabelArea.setNativeInstance(txtSetting,_nativeObject.txtSetting);
         FlashLabelArea.setNativeInstance(txtDuration,_nativeObject.txtDuration);
         if(_nativeObject.itemSlot)
         {
            itemSlot.setNativeInstance(_nativeObject.itemSlot);
         }
         if(_nativeObject.iconGameCurrency)
         {
            iconGameCurrency.setNativeInstance(_nativeObject.iconGameCurrency);
         }
         if(_nativeObject.iconStreamingResource)
         {
            iconStreamingResource.setNativeInstance(_nativeObject.iconStreamingResource);
         }
         if(_nativeObject.btnStartStreaming)
         {
            btnStartStreaming.setNativeInstance(_nativeObject.btnStartStreaming);
         }
         if(_nativeObject.tooltipDuration)
         {
            tooltipDuration.setNativeInstance(_nativeObject.tooltipDuration);
         }
         if(_nativeObject.tooltipStreamingShow)
         {
            tooltipStreamingShow.setNativeInstance(_nativeObject.tooltipStreamingShow);
         }
      }
   }
}
