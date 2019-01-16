package com.playata.framework.platform.settings
{
   public class KongregatePlatformSettings implements IPlatformSettings
   {
       
      
      public function KongregatePlatformSettings()
      {
         super();
      }
      
      public function get reloadParams() : Vector.<String>
      {
         var _loc1_:Vector.<String> = new Vector.<String>();
         _loc1_.push("kongregate_user_id");
         _loc1_.push("kongregate_username");
         _loc1_.push("kongregate_game_auth_token");
         return _loc1_;
      }
   }
}
