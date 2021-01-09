package visuals.ui.elements.movie
{
   import com.playata.framework.display.Sprite;
   import com.playata.framework.display.lib.flash.FlashDisplayObjectContainer;
   import com.playata.framework.display.lib.flash.FlashSprite;
   import flash.display.MovieClip;
   import visuals.ui.elements.backgrounds.SymbolSlice9BackgroundDialogGeneric;
   
   public class SymbolBackgroundMovieOffersGeneric extends Sprite
   {
       
      
      private var _nativeObject:SymbolBackgroundMovieOffers = null;
      
      public var background:SymbolSlice9BackgroundDialogGeneric = null;
      
      public function SymbolBackgroundMovieOffersGeneric(param1:MovieClip = null)
      {
         if(param1)
         {
            _nativeObject = param1 as SymbolBackgroundMovieOffers;
         }
         else
         {
            _nativeObject = new SymbolBackgroundMovieOffers();
         }
         super(null,FlashSprite.fromNative(_nativeObject));
         var _loc2_:FlashDisplayObjectContainer = _sprite as FlashDisplayObjectContainer;
         background = new SymbolSlice9BackgroundDialogGeneric(_nativeObject.background);
      }
      
      public function setNativeInstance(param1:SymbolBackgroundMovieOffers) : void
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
      }
   }
}
