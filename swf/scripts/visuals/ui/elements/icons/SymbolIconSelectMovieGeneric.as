package visuals.ui.elements.icons
{
   import com.playata.framework.display.Sprite;
   import com.playata.framework.display.lib.flash.FlashDisplayObjectContainer;
   import com.playata.framework.display.lib.flash.FlashSprite;
   import flash.display.MovieClip;
   import visuals.ui.elements.generic.SymbolCounterGeneric;
   import visuals.ui.elements.movie.SymbolIconMovieSelectButtonGeneric;
   
   public class SymbolIconSelectMovieGeneric extends Sprite
   {
       
      
      private var _nativeObject:SymbolIconSelectMovie = null;
      
      public var symbolIconMovieSelectButton:SymbolIconMovieSelectButtonGeneric = null;
      
      public var info:SymbolCounterGeneric = null;
      
      public function SymbolIconSelectMovieGeneric(param1:MovieClip = null)
      {
         if(param1)
         {
            _nativeObject = param1 as SymbolIconSelectMovie;
         }
         else
         {
            _nativeObject = new SymbolIconSelectMovie();
         }
         super(null,FlashSprite.fromNative(_nativeObject));
         var _loc2_:FlashDisplayObjectContainer = _sprite as FlashDisplayObjectContainer;
         symbolIconMovieSelectButton = new SymbolIconMovieSelectButtonGeneric(_nativeObject.symbolIconMovieSelectButton);
         info = new SymbolCounterGeneric(_nativeObject.info);
      }
      
      public function setNativeInstance(param1:SymbolIconSelectMovie) : void
      {
         FlashSprite.setNativeInstance(_sprite,param1);
         _nativeObject = param1;
         syncInstances();
      }
      
      public function syncInstances() : void
      {
         if(_nativeObject.symbolIconMovieSelectButton)
         {
            symbolIconMovieSelectButton.setNativeInstance(_nativeObject.symbolIconMovieSelectButton);
         }
         if(_nativeObject.info)
         {
            info.setNativeInstance(_nativeObject.info);
         }
      }
   }
}
