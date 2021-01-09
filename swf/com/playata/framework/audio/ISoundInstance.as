package com.playata.framework.audio
{
   import com.playata.framework.core.IDisposable;
   import com.playata.framework.core.signal.ISignal;
   
   public interface ISoundInstance extends IDisposable
   {
       
      
      function get identifier() : String;
      
      function get isLooping() : Boolean;
      
      function get onComplete() : ISignal;
      
      function get isPlaying() : Boolean;
      
      function get duration() : Number;
      
      function get volume() : Number;
      
      function set volume(param1:Number) : void;
      
      function play(param1:Boolean = false) : void;
      
      function stop() : void;
      
      function pause() : void;
      
      function resume() : void;
      
      function fadeIn(param1:Number, param2:Function = null) : void;
      
      function fadeOut(param1:Number, param2:Function = null) : void;
   }
}
