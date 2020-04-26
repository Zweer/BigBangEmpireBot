package com.playata.framework.audio
{
   public class SoundPackages
   {
      
      public static const Default:int = 0;
      
      public static const Package1:int = 1;
      
      private static const SOUNDS_IN_PACKAGE:Object = {1:["event_quest_complete.mp3","goal_collected.mp3","voice_female_critical1.mp3","voice_female_critical2.mp3","voice_female_critical3.mp3","voice_female_critical4.mp3","voice_female_critical5.mp3","voice_female_critical6.mp3","voice_female_critical7.mp3","voice_female_critical8.mp3","voice_female_critical9.mp3","voice_female_critical10.mp3","voice_female_normal1.mp3","voice_female_normal2.mp3","voice_female_normal3.mp3","voice_female_normal4.mp3","voice_female_normal5.mp3","voice_female_normal6.mp3","voice_female_normal7.mp3","voice_female_normal8.mp3","voice_female_normal9.mp3","voice_female_normal10.mp3"]};
       
      
      public function SoundPackages()
      {
         super();
      }
      
      public static function getPackageUrlForSound(param1:int, param2:String) : String
      {
         if(param1 == 0)
         {
            return "";
         }
         if(SOUNDS_IN_PACKAGE[param1].indexOf(param2) >= 0)
         {
            return param1 + "/";
         }
         return "";
      }
   }
}
