package com.playata.framework.platform.settings
{
   public class VkontaktePlatformSettings implements IPlatformSettings
   {
       
      
      public function VkontaktePlatformSettings()
      {
         super();
      }
      
      public function get reloadParams() : Vector.<String>
      {
         var _loc1_:Vector.<String> = new Vector.<String>();
         _loc1_.push("viewer_id");
         _loc1_.push("api_id");
         _loc1_.push("auth_key");
         return _loc1_;
      }
   }
}
