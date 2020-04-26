package com.playata.framework.platform.settings
{
   public class OdnoklassnikiPlatformSettings implements IPlatformSettings
   {
       
      
      public function OdnoklassnikiPlatformSettings()
      {
         super();
      }
      
      public function get reloadParams() : Vector.<String>
      {
         var _loc1_:Vector.<String> = new Vector.<String>();
         _loc1_.push("authorized");
         _loc1_.push("ip_geo_location");
         _loc1_.push("api_server");
         _loc1_.push("new_sig");
         _loc1_.push("apiconnection");
         _loc1_.push("first_start");
         _loc1_.push("clientLog");
         _loc1_.push("session_secret_key");
         _loc1_.push("refplace");
         _loc1_.push("application_key");
         _loc1_.push("auth_sig");
         _loc1_.push("web_server");
         _loc1_.push("session_key");
         _loc1_.push("logged_user_id");
         _loc1_.push("sig");
         return _loc1_;
      }
   }
}
