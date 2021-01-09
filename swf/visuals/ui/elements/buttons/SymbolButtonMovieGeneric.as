package visuals.ui.elements.buttons
{
   import com.playata.framework.display.Sprite;
   import com.playata.framework.display.lib.flash.FlashDisplayObjectContainer;
   import com.playata.framework.display.lib.flash.FlashSprite;
   import flash.display.MovieClip;
   
   public class SymbolButtonMovieGeneric extends Sprite
   {
       
      
      private var _nativeObject:SymbolButtonMovie = null;
      
      public var progressMask:SymbolButtonMovieProgressGeneric = null;
      
      public function SymbolButtonMovieGeneric(param1:MovieClip = null)
      {
         if(param1)
         {
            _nativeObject = param1 as SymbolButtonMovie;
         }
         else
         {
            _nativeObject = new SymbolButtonMovie();
         }
         super(null,FlashSprite.fromNative(_nativeObject));
         var _loc2_:FlashDisplayObjectContainer = _sprite as FlashDisplayObjectContainer;
         progressMask = new SymbolButtonMovieProgressGeneric(_nativeObject.progressMask);
      }
      
      public function setNativeInstance(param1:SymbolButtonMovie) : void
      {
         FlashSprite.setNativeInstance(_sprite,param1);
         _nativeObject = param1;
         syncInstances();
      }
      
      public function syncInstances() : void
      {
         if(_nativeObject.progressMask)
         {
            progressMask.setNativeInstance(_nativeObject.progressMask);
         }
      }
   }
}
