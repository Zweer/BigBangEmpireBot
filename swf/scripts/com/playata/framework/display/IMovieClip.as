package com.playata.framework.display
{
   public interface IMovieClip extends ISprite
   {
       
      
      function get currentFrame() : int;
      
      function get currentLabel() : String;
      
      function get totalFrames() : int;
      
      function play() : void;
      
      function stop() : void;
      
      function get isPlaying() : Boolean;
      
      function gotoAndPlay(param1:Object) : void;
      
      function gotoAndStop(param1:Object) : void;
   }
}
