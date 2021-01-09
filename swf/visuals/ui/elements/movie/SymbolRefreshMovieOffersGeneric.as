package visuals.ui.elements.movie
{
   import com.playata.framework.display.Sprite;
   import com.playata.framework.display.lib.flash.FlashDisplayObjectContainer;
   import com.playata.framework.display.lib.flash.FlashLabelArea;
   import com.playata.framework.display.lib.flash.FlashSprite;
   import com.playata.framework.display.ui.controls.ILabelArea;
   import flash.display.MovieClip;
   import visuals.ui.elements.backgrounds.SymbolBackgroundScalableGeneric;
   import visuals.ui.elements.buttons.SymbolButtonPremiumGeneric;
   
   public class SymbolRefreshMovieOffersGeneric extends Sprite
   {
       
      
      private var _nativeObject:SymbolRefreshMovieOffers = null;
      
      public var symbolBackgroundScalable:SymbolBackgroundScalableGeneric = null;
      
      public var txtInfoAgain:ILabelArea = null;
      
      public var btnRefreshOffers:SymbolButtonPremiumGeneric = null;
      
      public function SymbolRefreshMovieOffersGeneric(param1:MovieClip = null)
      {
         if(param1)
         {
            _nativeObject = param1 as SymbolRefreshMovieOffers;
         }
         else
         {
            _nativeObject = new SymbolRefreshMovieOffers();
         }
         super(null,FlashSprite.fromNative(_nativeObject));
         var _loc2_:FlashDisplayObjectContainer = _sprite as FlashDisplayObjectContainer;
         symbolBackgroundScalable = new SymbolBackgroundScalableGeneric(_nativeObject.symbolBackgroundScalable);
         txtInfoAgain = FlashLabelArea.fromNative(_nativeObject.txtInfoAgain);
         btnRefreshOffers = new SymbolButtonPremiumGeneric(_nativeObject.btnRefreshOffers);
      }
      
      public function setNativeInstance(param1:SymbolRefreshMovieOffers) : void
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
         FlashLabelArea.setNativeInstance(txtInfoAgain,_nativeObject.txtInfoAgain);
         if(_nativeObject.btnRefreshOffers)
         {
            btnRefreshOffers.setNativeInstance(_nativeObject.btnRefreshOffers);
         }
      }
   }
}
