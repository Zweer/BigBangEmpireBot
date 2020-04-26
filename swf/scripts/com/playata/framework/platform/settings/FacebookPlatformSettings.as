package com.playata.framework.platform.settings
{
   public class FacebookPlatformSettings implements IPlatformSettings
   {
       
      
      public function FacebookPlatformSettings()
      {
         super();
      }
      
      public function get reloadParams() : Vector.<String>
      {
         var _loc1_:Vector.<String> = new Vector.<String>();
         _loc1_.push("facebook_access_token");
         return _loc1_;
      }
   }
}
