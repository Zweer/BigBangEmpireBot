package com.playata.framework.audio
{
   public interface ISoundProvider
   {
       
      
      function get supportsCaching() : Boolean;
      
      function get soundPackage() : int;
      
      function set soundPackage(param1:int) : void;
      
      function cacheSound(param1:String) : void;
      
      function getSound(param1:String) : ISound;
   }
}
