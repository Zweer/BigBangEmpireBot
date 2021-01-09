package com.playata.framework.network
{
   import com.playata.framework.core.Core;
   
   public final class NetworkConfig
   {
       
      
      public function NetworkConfig()
      {
         super();
      }
      
      public static function get socketServerURL() : String
      {
         if(Core.config == null)
         {
            return null;
         }
         if(!Core.config.hasCfg("urlSocketServer"))
         {
            return null;
         }
         return Core.config.getString("urlSocketServer");
      }
      
      public static function get socketCommunicationEnabled() : Boolean
      {
         if(Core.config == null)
         {
            return false;
         }
         if(!Core.config.hasCfg("socket_communication_enabled"))
         {
            return false;
         }
         return Core.config.getBoolean("socket_communication_enabled");
      }
   }
}
