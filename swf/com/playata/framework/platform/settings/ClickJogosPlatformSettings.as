package com.playata.framework.platform.settings
{
   public class ClickJogosPlatformSettings implements IPlatformSettings
   {
       
      
      public function ClickJogosPlatformSettings()
      {
         super();
      }
      
      public function get reloadParams() : Vector.<String>
      {
         var _loc1_:Vector.<String> = new Vector.<String>();
         _loc1_.push("clickjogos_user_id");
         return _loc1_;
      }
   }
}
