package com.playata.framework.audio.lib.flash
{
   import com.playata.framework.audio.IMusic;
   import flash.media.Sound;
   
   public class FlashMusic extends FlashSoundInstance implements IMusic
   {
       
      
      public function FlashMusic(param1:String, param2:Sound, param3:Number = 1)
      {
         super(param1,param2,param3);
      }
   }
}
