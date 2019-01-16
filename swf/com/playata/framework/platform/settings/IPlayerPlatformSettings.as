package com.playata.framework.platform.settings
{
   public class IPlayerPlatformSettings implements IPlatformSettings
   {
       
      
      public function IPlayerPlatformSettings()
      {
         super();
      }
      
      public function get reloadParams() : Vector.<String>
      {
         var _loc1_:Vector.<String> = new Vector.<String>();
         _loc1_.push("access_token");
         return _loc1_;
      }
   }
}
