package visuals.ui.elements.buttons
{
   import com.playata.framework.display.Sprite;
   import com.playata.framework.display.lib.flash.FlashDisplayObjectContainer;
   import com.playata.framework.display.lib.flash.FlashSprite;
   import flash.display.MovieClip;
   
   public class SymbolButtonMovieProgressGeneric extends Sprite
   {
       
      
      private var _nativeObject:SymbolButtonMovieProgress = null;
      
      public var m:SymbolButtonMovieProgressMaskGeneric = null;
      
      public function SymbolButtonMovieProgressGeneric(param1:MovieClip = null)
      {
         if(param1)
         {
            _nativeObject = param1 as SymbolButtonMovieProgress;
         }
         else
         {
            _nativeObject = new SymbolButtonMovieProgress();
         }
         super(null,FlashSprite.fromNative(_nativeObject));
         var _loc2_:FlashDisplayObjectContainer = _sprite as FlashDisplayObjectContainer;
         m = new SymbolButtonMovieProgressMaskGeneric(_nativeObject.m);
      }
      
      public function setNativeInstance(param1:SymbolButtonMovieProgress) : void
      {
         FlashSprite.setNativeInstance(_sprite,param1);
         _nativeObject = param1;
         syncInstances();
      }
      
      public function syncInstances() : void
      {
         if(_nativeObject.m)
         {
            m.setNativeInstance(_nativeObject.m);
         }
      }
   }
}
