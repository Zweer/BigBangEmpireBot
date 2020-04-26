package com.playata.framework.platform.settings
{
   public class IdnetPlatformSettings implements IPlatformSettings
   {
       
      
      public function IdnetPlatformSettings()
      {
         super();
      }
      
      public function get reloadParams() : Vector.<String>
      {
         var _loc1_:Vector.<String> = new Vector.<String>();
         _loc1_.push("token");
         _loc1_.push("layout");
         return _loc1_;
      }
   }
}
