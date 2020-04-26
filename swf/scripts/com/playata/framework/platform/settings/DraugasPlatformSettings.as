package com.playata.framework.platform.settings
{
   public class DraugasPlatformSettings implements IPlatformSettings
   {
       
      
      public function DraugasPlatformSettings()
      {
         super();
      }
      
      public function get reloadParams() : Vector.<String>
      {
         var _loc1_:Vector.<String> = new Vector.<String>();
         _loc1_.push("user_sessid_hash");
         return _loc1_;
      }
   }
}
