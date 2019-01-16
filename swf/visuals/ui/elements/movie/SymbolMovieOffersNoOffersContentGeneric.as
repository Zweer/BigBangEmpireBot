package visuals.ui.elements.movie
{
   import com.playata.framework.display.Sprite;
   import com.playata.framework.display.lib.flash.FlashDisplayObjectContainer;
   import com.playata.framework.display.lib.flash.FlashLabelArea;
   import com.playata.framework.display.lib.flash.FlashSprite;
   import com.playata.framework.display.ui.controls.ILabelArea;
   import flash.display.MovieClip;
   import visuals.ui.elements.buttons.SymbolButtonPremiumGeneric;
   import visuals.ui.elements.duel.SymbolDiscountHintGeneric;
   
   public class SymbolMovieOffersNoOffersContentGeneric extends Sprite
   {
       
      
      private var _nativeObject:SymbolMovieOffersNoOffersContent = null;
      
      public var bgNoOffers:SymbolBackgroundMovieOffersNoOffersGeneric = null;
      
      public var txtInfoNoOffers:ILabelArea = null;
      
      public var txtTitleNoOffers:ILabelArea = null;
      
      public var txtTimerNoOffers:ILabelArea = null;
      
      public var txtRemainingMovies:ILabelArea = null;
      
      public var btnSkipCooldown:SymbolButtonPremiumGeneric = null;
      
      public var discountHint:SymbolDiscountHintGeneric = null;
      
      public function SymbolMovieOffersNoOffersContentGeneric(param1:MovieClip = null)
      {
         if(param1)
         {
            _nativeObject = param1 as SymbolMovieOffersNoOffersContent;
         }
         else
         {
            _nativeObject = new SymbolMovieOffersNoOffersContent();
         }
         super(null,FlashSprite.fromNative(_nativeObject));
         var _loc2_:FlashDisplayObjectContainer = _sprite as FlashDisplayObjectContainer;
         bgNoOffers = new SymbolBackgroundMovieOffersNoOffersGeneric(_nativeObject.bgNoOffers);
         txtInfoNoOffers = FlashLabelArea.fromNative(_nativeObject.txtInfoNoOffers);
         txtTitleNoOffers = FlashLabelArea.fromNative(_nativeObject.txtTitleNoOffers);
         txtTimerNoOffers = FlashLabelArea.fromNative(_nativeObject.txtTimerNoOffers);
         txtRemainingMovies = FlashLabelArea.fromNative(_nativeObject.txtRemainingMovies);
         btnSkipCooldown = new SymbolButtonPremiumGeneric(_nativeObject.btnSkipCooldown);
         discountHint = new SymbolDiscountHintGeneric(_nativeObject.discountHint);
      }
      
      public function setNativeInstance(param1:SymbolMovieOffersNoOffersContent) : void
      {
         FlashSprite.setNativeInstance(_sprite,param1);
         _nativeObject = param1;
         syncInstances();
      }
      
      public function syncInstances() : void
      {
         if(_nativeObject.bgNoOffers)
         {
            bgNoOffers.setNativeInstance(_nativeObject.bgNoOffers);
         }
         FlashLabelArea.setNativeInstance(txtInfoNoOffers,_nativeObject.txtInfoNoOffers);
         FlashLabelArea.setNativeInstance(txtTitleNoOffers,_nativeObject.txtTitleNoOffers);
         FlashLabelArea.setNativeInstance(txtTimerNoOffers,_nativeObject.txtTimerNoOffers);
         FlashLabelArea.setNativeInstance(txtRemainingMovies,_nativeObject.txtRemainingMovies);
         if(_nativeObject.btnSkipCooldown)
         {
            btnSkipCooldown.setNativeInstance(_nativeObject.btnSkipCooldown);
         }
         if(_nativeObject.discountHint)
         {
            discountHint.setNativeInstance(_nativeObject.discountHint);
         }
      }
   }
}
