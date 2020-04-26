package com.playata.framework.billing.lib.standalone
{
   import com.playata.framework.billing.IBillingProduct;
   import com.playata.framework.billing.IBillingProductInfo;
   import com.playata.framework.core.TypedObject;
   
   public class WebBillingProduct implements IBillingProduct
   {
       
      
      protected var _id:String = null;
      
      protected var _info:IBillingProductInfo = null;
      
      protected var _rawData:TypedObject = null;
      
      public function WebBillingProduct(param1:String, param2:IBillingProductInfo, param3:TypedObject)
      {
         super();
         _id = param1;
         _info = param2;
         _rawData = param3;
      }
      
      public function get id() : String
      {
         return _id;
      }
      
      public function get paymentMethodId() : int
      {
         return _rawData.getInt("payment_method");
      }
      
      public function get locale() : String
      {
         return _rawData.getString("locale");
      }
      
      public function get currencyCode() : String
      {
         return _rawData.getString("currency");
      }
      
      public function get currencySymbol() : String
      {
         if(_rawData.hasData("currency_symbol",true) && _rawData.getString("currency_symbol") != "")
         {
            return _rawData.getString("currency_symbol");
         }
         return currencyCode;
      }
      
      public function get price() : Number
      {
         return _rawData.rawData.price;
      }
      
      public function get priceString() : String
      {
         if(_rawData.hasData("price_string",true) && _rawData.getString("price_string") != "")
         {
            return _rawData.getString("price_string");
         }
         return price + " " + currencySymbol;
      }
      
      public function get info() : IBillingProductInfo
      {
         return _info;
      }
      
      public function get rawData() : TypedObject
      {
         return _rawData;
      }
   }
}
