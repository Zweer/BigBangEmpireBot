package com.playata.framework.audio.lib.flash
{
   import com.playata.framework.audio.ISound;
   import flash.media.Sound;
   
   public class FlashSound implements ISound
   {
       
      
      private var _sound:Sound = null;
      
      public function FlashSound(param1:Sound)
      {
         super();
         _sound = param1;
      }
      
      public function get sound() : Sound
      {
         return _sound;
      }
   }
}
