package visuals.ui.elements.action_bar
{
   import com.playata.framework.display.MovieClip;
   import com.playata.framework.display.lib.flash.FlashDisplayObjectContainer;
   import com.playata.framework.display.lib.flash.FlashMovieClip;
   import visuals.ui.elements.buttons.SymbolButtonPlusStaticGeneric;
   import visuals.ui.elements.icons.SymbolIconLockGeneric;
   import visuals.ui.elements.icons.SymbolIconUnlockGeneric;
   
   public class SymbolActionBarButtonGeneric extends com.playata.framework.display.MovieClip
   {
       
      
      private var _nativeObject:SymbolActionBarButton = null;
      
      public var symbolButtonPlusStatic:SymbolButtonPlusStaticGeneric = null;
      
      public var symbolIconLock:SymbolIconLockGeneric = null;
      
      public var symbolIconUnlock:SymbolIconUnlockGeneric = null;
      
      public function SymbolActionBarButtonGeneric(param1:flash.display.MovieClip = null)
      {
         if(param1)
         {
            _nativeObject = param1 as SymbolActionBarButton;
         }
         else
         {
            _nativeObject = new SymbolActionBarButton();
         }
         super(null,FlashMovieClip.fromNative(_nativeObject));
         var _loc2_:FlashDisplayObjectContainer = _sprite as FlashDisplayObjectContainer;
         symbolButtonPlusStatic = new SymbolButtonPlusStaticGeneric(_nativeObject.symbolButtonPlusStatic);
         symbolIconLock = new SymbolIconLockGeneric(_nativeObject.symbolIconLock);
         symbolIconUnlock = new SymbolIconUnlockGeneric(_nativeObject.symbolIconUnlock);
      }
      
      public function setNativeInstance(param1:SymbolActionBarButton) : void
      {
         FlashMovieClip.setNativeInstance(_movieClip,param1);
         _nativeObject = param1;
         syncInstances();
      }
      
      override public function play() : void
      {
         super.play();
         syncInstances();
      }
      
      override public function stop() : void
      {
         super.stop();
         syncInstances();
      }
      
      override public function gotoAndStop(param1:Object) : void
      {
         super.gotoAndStop(param1);
         syncInstances();
      }
      
      override public function gotoAndPlay(param1:Object) : void
      {
         _movieClip.gotoAndPlay(param1);
         syncInstances();
      }
      
      public function syncInstances() : void
      {
         if(_nativeObject.symbolButtonPlusStatic)
         {
            symbolButtonPlusStatic.setNativeInstance(_nativeObject.symbolButtonPlusStatic);
         }
         if(_nativeObject.symbolIconLock)
         {
            symbolIconLock.setNativeInstance(_nativeObject.symbolIconLock);
         }
         if(_nativeObject.symbolIconUnlock)
         {
            symbolIconUnlock.setNativeInstance(_nativeObject.symbolIconUnlock);
         }
      }
   }
}
