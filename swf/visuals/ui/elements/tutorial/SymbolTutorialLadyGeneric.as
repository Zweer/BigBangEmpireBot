package visuals.ui.elements.tutorial
{
   import com.playata.framework.display.MovieClip;
   import com.playata.framework.display.lib.flash.FlashDisplayObjectContainer;
   import com.playata.framework.display.lib.flash.FlashMovieClip;
   
   public class SymbolTutorialLadyGeneric extends com.playata.framework.display.MovieClip
   {
       
      
      private var _nativeObject:SymbolTutorialLady = null;
      
      public var ladySide:SymbolLadySideGeneric = null;
      
      public var message:SymbolTutorialMessageBubbleGeneric = null;
      
      public var ladyFront:SymbolLadyFrontGeneric = null;
      
      public var ladyBack:SymbolLadyBackGeneric = null;
      
      public function SymbolTutorialLadyGeneric(param1:flash.display.MovieClip = null)
      {
         if(param1)
         {
            _nativeObject = param1 as SymbolTutorialLady;
         }
         else
         {
            _nativeObject = new SymbolTutorialLady();
         }
         super(null,FlashMovieClip.fromNative(_nativeObject));
         var _loc2_:FlashDisplayObjectContainer = _sprite as FlashDisplayObjectContainer;
         ladySide = new SymbolLadySideGeneric(_nativeObject.ladySide);
         message = new SymbolTutorialMessageBubbleGeneric(_nativeObject.message);
         ladyFront = new SymbolLadyFrontGeneric(_nativeObject.ladyFront);
         ladyBack = new SymbolLadyBackGeneric(_nativeObject.ladyBack);
      }
      
      public function setNativeInstance(param1:SymbolTutorialLady) : void
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
         if(_nativeObject.ladySide)
         {
            ladySide.setNativeInstance(_nativeObject.ladySide);
         }
         if(_nativeObject.message)
         {
            message.setNativeInstance(_nativeObject.message);
         }
         if(_nativeObject.ladyFront)
         {
            ladyFront.setNativeInstance(_nativeObject.ladyFront);
         }
         if(_nativeObject.ladyBack)
         {
            ladyBack.setNativeInstance(_nativeObject.ladyBack);
         }
      }
   }
}
