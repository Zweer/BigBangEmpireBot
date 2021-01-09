package com.playata.framework.billing
{
   public interface IBillingProductInfo
   {
       
      
      function get name() : String;
      
      function get description() : String;
      
      function get type() : BillingProductType;
      
      function get index() : int;
      
      function get limit() : int;
   }
}
