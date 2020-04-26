package com.playata.framework.billing
{
   import com.playata.framework.core.TypedObject;
   
   public interface IBillingProduct
   {
       
      
      function get id() : String;
      
      function get paymentMethodId() : int;
      
      function get locale() : String;
      
      function get currencyCode() : String;
      
      function get currencySymbol() : String;
      
      function get price() : Number;
      
      function get priceString() : String;
      
      function get info() : IBillingProductInfo;
      
      function get rawData() : TypedObject;
   }
}
