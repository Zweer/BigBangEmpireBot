package visuals.ui.dialogs
{
   import com.playata.framework.display.Sprite;
   import com.playata.framework.display.lib.flash.FlashDisplayObjectContainer;
   import com.playata.framework.display.lib.flash.FlashLabel;
   import com.playata.framework.display.lib.flash.FlashLabelArea;
   import com.playata.framework.display.lib.flash.FlashSprite;
   import com.playata.framework.display.ui.controls.ILabel;
   import com.playata.framework.display.ui.controls.ILabelArea;
   import flash.display.MovieClip;
   import visuals.ui.elements.backgrounds.SymbolSlice9BackgroundDialogGeneric;
   import visuals.ui.elements.buttons.SymbolButtonCloseGeneric;
   import visuals.ui.elements.streaming.SymbolRefreshStreamingOffersGeneric;
   import visuals.ui.elements.streaming.SymbolStreamingOfferGeneric;
   
   public class SymbolDialogStreamingOffersGeneric extends Sprite
   {
       
      
      private var _nativeObject:SymbolDialogStreamingOffers = null;
      
      public var dialogBackground:SymbolSlice9BackgroundDialogGeneric = null;
      
      public var txtDialogTitle:ILabel = null;
      
      public var refresh:SymbolRefreshStreamingOffersGeneric = null;
      
      public var streamingOffer1:SymbolStreamingOfferGeneric = null;
      
      public var streamingOffer2:SymbolStreamingOfferGeneric = null;
      
      public var streamingOffer3:SymbolStreamingOfferGeneric = null;
      
      public var txtInfo:ILabelArea = null;
      
      public var btnClose:SymbolButtonCloseGeneric = null;
      
      public function SymbolDialogStreamingOffersGeneric(param1:MovieClip = null)
      {
         if(param1)
         {
            _nativeObject = param1 as SymbolDialogStreamingOffers;
         }
         else
         {
            _nativeObject = new SymbolDialogStreamingOffers();
         }
         super(null,FlashSprite.fromNative(_nativeObject));
         var _loc2_:FlashDisplayObjectContainer = _sprite as FlashDisplayObjectContainer;
         dialogBackground = new SymbolSlice9BackgroundDialogGeneric(_nativeObject.dialogBackground);
         txtDialogTitle = FlashLabel.fromNative(_nativeObject.txtDialogTitle);
         refresh = new SymbolRefreshStreamingOffersGeneric(_nativeObject.refresh);
         streamingOffer1 = new SymbolStreamingOfferGeneric(_nativeObject.streamingOffer1);
         streamingOffer2 = new SymbolStreamingOfferGeneric(_nativeObject.streamingOffer2);
         streamingOffer3 = new SymbolStreamingOfferGeneric(_nativeObject.streamingOffer3);
         txtInfo = FlashLabelArea.fromNative(_nativeObject.txtInfo);
         btnClose = new SymbolButtonCloseGeneric(_nativeObject.btnClose);
      }
      
      public function setNativeInstance(param1:SymbolDialogStreamingOffers) : void
      {
         FlashSprite.setNativeInstance(_sprite,param1);
         _nativeObject = param1;
         syncInstances();
      }
      
      public function syncInstances() : void
      {
         if(_nativeObject.dialogBackground)
         {
            dialogBackground.setNativeInstance(_nativeObject.dialogBackground);
         }
         FlashLabel.setNativeInstance(txtDialogTitle,_nativeObject.txtDialogTitle);
         if(_nativeObject.refresh)
         {
            refresh.setNativeInstance(_nativeObject.refresh);
         }
         if(_nativeObject.streamingOffer1)
         {
            streamingOffer1.setNativeInstance(_nativeObject.streamingOffer1);
         }
         if(_nativeObject.streamingOffer2)
         {
            streamingOffer2.setNativeInstance(_nativeObject.streamingOffer2);
         }
         if(_nativeObject.streamingOffer3)
         {
            streamingOffer3.setNativeInstance(_nativeObject.streamingOffer3);
         }
         FlashLabelArea.setNativeInstance(txtInfo,_nativeObject.txtInfo);
         if(_nativeObject.btnClose)
         {
            btnClose.setNativeInstance(_nativeObject.btnClose);
         }
      }
   }
}
