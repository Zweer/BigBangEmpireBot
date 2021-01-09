package com.playata.framework.network
{
   public class WebNetworkInfo extends NetworkInfoBasic implements INetworkInfo
   {
       
      
      public function WebNetworkInfo()
      {
         super();
      }
      
      public function get online() : Boolean
      {
         return debugOnline;
      }
   }
}
