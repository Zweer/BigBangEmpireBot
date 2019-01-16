package com.playata.framework.audio
{
   import com.playata.framework.core.IEnvironmentModule;
   
   public interface IAudioCore extends IEnvironmentModule
   {
       
      
      function get soundProvider() : ISoundProvider;
      
      function set soundProvider(param1:ISoundProvider) : void;
      
      function set checkPlay(param1:Function) : void;
      
      function set volumeFX(param1:Number) : void;
      
      function get volumeFX() : Number;
      
      function set volumeMusic(param1:Number) : void;
      
      function get volumeMusic() : Number;
      
      function set volumeMaster(param1:Number) : void;
      
      function get volumeMaster() : Number;
      
      function set cacheSounds(param1:Boolean) : void;
      
      function cacheSound(param1:String) : void;
      
      function playFX(param1:String, param2:Boolean = false) : IFX;
      
      function stopAllFX() : void;
      
      function get currentMusic() : IMusic;
      
      function playMusic(param1:String, param2:Number = 2, param3:Number = 0.2) : void;
      
      function stopMusic() : void;
   }
}
