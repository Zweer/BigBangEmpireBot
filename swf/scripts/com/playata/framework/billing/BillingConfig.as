package com.playata.framework.billing
{
   import com.playata.framework.core.Core;
   
   public final class BillingConfig
   {
       
      
      public function BillingConfig()
      {
         super();
      }
      
      public static function get paymentMethods() : Array
      {
         return Core.config.getArray("payment_methods");
      }
      
      public static function get billingServiceKey() : String
      {
         return Core.config.getString("billingServiceKey");
      }
      
      public static function get paymentGeoBlocks() : Object
      {
         return Core.config.cfg("payment_geo_blocks");
      }
      
      public static function get paymentMethodFilter() : Object
      {
         return Core.config.cfg("payment_method_filter");
      }
   }
}
