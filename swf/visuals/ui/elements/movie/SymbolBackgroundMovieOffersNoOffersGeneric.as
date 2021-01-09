package visuals.ui.elements.movie
{
   import com.playata.framework.display.Sprite;
   import com.playata.framework.display.lib.flash.FlashDisplayObjectContainer;
   import com.playata.framework.display.lib.flash.FlashSprite;
   import flash.display.MovieClip;
   import visuals.ui.elements.backgrounds.SymbolSlice9BackgroundDialogGeneric;
   
   public class SymbolBackgroundMovieOffersNoOffersGeneric extends Sprite
   {
       
      
      private var _nativeObject:SymbolBackgroundMovieOffersNoOffers = null;
      
      public var backgroundBig:SymbolSlice9BackgroundDialogGeneric = null;
      
      public var backgroundSmall:SymbolSlice9BackgroundDialogGeneric = null;
      
      public function SymbolBackgroundMovieOffersNoOffersGeneric(param1:MovieClip = null)
      {
         if(param1)
         {
            _nativeObject = param1 as SymbolBackgroundMovieOffersNoOffers;
         }
         else
         {
            _nativeObject = new SymbolBackgroundMovieOffersNoOffers();
         }
         super(null,FlashSprite.fromNative(_nativeObject));
         var _loc2_:FlashDisplayObjectContainer = _sprite as FlashDisplayObjectContainer;
         backgroundBig = new SymbolSlice9BackgroundDialogGeneric(_nativeObject.backgroundBig);
         backgroundSmall = new SymbolSlice9BackgroundDialogGeneric(_nativeObject.backgroundSmall);
      }
      
      public function setNativeInstance(param1:SymbolBackgroundMovieOffersNoOffers) : void
      {
         FlashSprite.setNativeInstance(_sprite,param1);
         _nativeObject = param1;
         syncInstances();
      }
      
      public function syncInstances() : void
      {
         if(_nativeObject.backgroundBig)
         {
            backgroundBig.setNativeInstance(_nativeObject.backgroundBig);
         }
         if(_nativeObject.backgroundSmall)
         {
            backgroundSmall.setNativeInstance(_nativeObject.backgroundSmall);
         }
      }
   }
}
