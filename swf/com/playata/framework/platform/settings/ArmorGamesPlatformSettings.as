package com.playata.framework.platform.settings
{
   public class ArmorGamesPlatformSettings implements IPlatformSettings
   {
       
      
      public function ArmorGamesPlatformSettings()
      {
         super();
      }
      
      public function get reloadParams() : Vector.<String>
      {
         var _loc1_:Vector.<String> = new Vector.<String>();
         _loc1_.push("armorgames_user_id");
         _loc1_.push("armorgames_auth_token");
         return _loc1_;
      }
   }
}
