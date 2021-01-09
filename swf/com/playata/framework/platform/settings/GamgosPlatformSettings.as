package com.playata.framework.platform.settings
{
   public class GamgosPlatformSettings implements IPlatformSettings
   {
       
      
      public function GamgosPlatformSettings()
      {
         super();
      }
      
      public function get reloadParams() : Vector.<String>
      {
         var _loc1_:Vector.<String> = new Vector.<String>();
         _loc1_.push("gamgos_user_hash");
         _loc1_.push("gamgos_token");
         return _loc1_;
      }
   }
}
