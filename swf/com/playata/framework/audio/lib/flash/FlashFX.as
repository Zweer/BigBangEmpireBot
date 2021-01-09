package com.playata.framework.audio.lib.flash
{
   import com.playata.framework.audio.IFX;
   import flash.media.Sound;
   
   public class FlashFX extends FlashSoundInstance implements IFX
   {
       
      
      public function FlashFX(param1:String, param2:Sound, param3:Number = 1)
      {
         super(param1,param2,param3);
      }
   }
}
