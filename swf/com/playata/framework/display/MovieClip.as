package com.playata.framework.display
{
   public class MovieClip extends Sprite implements IMovieClip
   {
       
      
      protected var _movieClip:IMovieClip;
      
      public function MovieClip(param1:Object = null, param2:IMovieClip = null)
      {
         super();
         if(param2)
         {
            _movieClip = param2;
         }
         else
         {
            _movieClip = DisplayObjectFactory.createMovieClipFromSettings(param1);
         }
         _sprite = _movieClip;
         _displayObject = _movieClip;
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
      
      public function gotoAndStop(param1:Object) : void
      {
         _movieClip.gotoAndStop(param1);
      }
      
      public function gotoAndPlay(param1:Object) : void
      {
         _movieClip.gotoAndPlay(param1);
      }
   }
}
