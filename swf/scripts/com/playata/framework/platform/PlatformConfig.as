package com.playata.framework.platform
{
   import com.playata.framework.core.Core;
   
   public final class PlatformConfig
   {
       
      
      public function PlatformConfig()
      {
         super();
      }
      
      public static function get platform() : String
      {
         return Core.config.getString("platform");
      }
      
      public static function get facebookAppId() : String
      {
         return Core.config.getString("facebookAppId");
      }
      
      public static function get facebookAppLinkUrl() : String
      {
         return Core.config.getString("facebookAppLinkUrl");
      }
      
      public static function get facebookAccessToken() : String
      {
         return Core.config.getString("facebook_access_token");
      }
      
      public static function get facebookSignedRequest() : String
      {
         return Core.config.getString("facebook_signed_request");
      }
      
      public static function get draugiemUserSessionIdHash() : String
      {
         return Core.config.getString("user_sessid_hash");
      }
      
      public static function get ssoInfo() : String
      {
         return Core.config.getString("ssoInfo");
      }
      
      public static function get platformSettings() : Object
      {
         return Core.config.cfg("platform_settings");
      }
      
      public static function get urlPublic() : String
      {
         return Core.config.getString("urlPublic");
      }
      
      public static function get draugiemUserKey() : String
      {
         return Core.config.getString("draugiem_user_key");
      }
      
      public static function get kongregateUserId() : String
      {
         return Core.config.getString("kongregate_user_id");
      }
      
      public static function get kongregateGameAuthToken() : String
      {
         return Core.config.getString("kongregate_game_auth_token");
      }
   }
}
