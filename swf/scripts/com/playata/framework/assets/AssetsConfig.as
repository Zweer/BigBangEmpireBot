package com.playata.framework.assets
{
   import com.playata.framework.core.Core;
   
   public final class AssetsConfig
   {
       
      
      public function AssetsConfig()
      {
         super();
      }
      
      public static function get cdnURL() : String
      {
         return Core.config.getString("urlCDN");
      }
   }
}
