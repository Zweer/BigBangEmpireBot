package com.playata.framework.tween.lib.greensock
{
   import com.greensock.TweenMax;
   import com.playata.framework.tween.ITween;
   
   public class GreenSockTween implements ITween
   {
       
      
      private var _tween:TweenMax = null;
      
      public function GreenSockTween(param1:TweenMax)
      {
         super();
         _tween = param1;
      }
      
      public function get tween() : TweenMax
      {
         return _tween;
      }
      
      public function get isActive() : Boolean
      {
         return _tween.isActive();
      }
      
      public function get isPaused() : Boolean
      {
         return _tween.paused();
      }
      
      public function play(param1:int) : void
      {
         _tween.play(param1);
      }
      
      public function pause() : void
      {
         _tween.pause();
      }
      
      public function resume() : void
      {
         _tween.resume();
      }
      
      public function kill() : void
      {
         _tween.kill();
      }
   }
}
