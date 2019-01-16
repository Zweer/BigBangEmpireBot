package com.playata.framework.display.lib.flash
{
   import com.playata.framework.core.TypedObject;
   import com.playata.framework.display.IMovieClip;
   import flash.display.MovieClip;
   
   public class FlashMovieClip extends FlashSprite implements IMovieClip
   {
       
      
      public var _movieClip:MovieClip = null;
      
      public function FlashMovieClip(param1:TypedObject, param2:MovieClip = null)
      {
         if(param2)
         {
            _movieClip = param2;
         }
         else
         {
            _movieClip = new MovieClip();
         }
         super(param1,_movieClip);
      }
      
      public static function setNativeInstance(param1:IMovieClip, param2:MovieClip) : void
      {
         (param1 as FlashMovieClip)._movieClip = param2;
         (param1 as FlashMovieClip)._sprite = param2;
         (param1 as FlashMovieClip)._displayObjectContainer = param2;
         (param1 as FlashMovieClip)._displayObject = param2;
      }
      
      public static function fromNative(param1:MovieClip) : FlashMovieClip
      {
         return new FlashMovieClip(null,param1);
      }
      
      public function get currentFrame() : int
      {
         return _movieClip.currentFrame;
      }
      
      public function get currentLabel() : String
      {
         return _movieClip.currentLabel;
      }
      
      public function get totalFrames() : int
      {
         return _movieClip.totalFrames;
      }
      
      public function play() : void
      {
         _movieClip.play();
      }
      
      public function stop() : void
      {
         _movieClip.stop();
      }
      
      public function get isPlaying() : Boolean
      {
         return _movieClip.isPlaying;
      }
      
      public function gotoAndPlay(param1:Object) : void
      {
         _movieClip.gotoAndPlay(param1);
      }
      
      public function gotoAndStop(param1:Object) : void
      {
         _movieClip.gotoAndStop(param1);
      }
   }
}
