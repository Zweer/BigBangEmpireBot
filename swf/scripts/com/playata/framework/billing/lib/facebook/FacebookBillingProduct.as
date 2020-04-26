package com.playata.framework.billing.lib.facebook
{
   import com.playata.framework.billing.IBillingProductInfo;
   import com.playata.framework.billing.lib.standalone.WebBillingProduct;
   import com.playata.framework.core.TypedObject;
   
   public class FacebookBillingProduct extends WebBillingProduct
   {
       
      
      public function FacebookBillingProduct(param1:String, param2:IBillingProductInfo, param3:TypedObject)
      {
         super(param1,param2,param3);
      }
      
      override public function get currencySymbol() : String
      {
         return currencyCode;
      }
      
      public function get facebookMobilePricepointId() : String
      {
         return _rawData.getString("pricepoint_id");
      }
      
      public function get facebookOfferIndex() : int
      {
         return _rawData.getInt("index");
      }
   }
}
