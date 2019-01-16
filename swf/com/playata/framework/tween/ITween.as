package com.playata.framework.tween
{
   public interface ITween
   {
       
      
      function get isActive() : Boolean;
      
      function get isPaused() : Boolean;
      
      function play(param1:int) : void;
      
      function pause() : void;
      
      function resume() : void;
      
      function kill() : void;
   }
}
