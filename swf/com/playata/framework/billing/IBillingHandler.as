package com.playata.framework.billing
{
   import com.playata.framework.core.TypedObject;
   
   public interface IBillingHandler
   {
       
      
      function createProductInfo(param1:BillingProductType, param2:TypedObject) : IBillingProductInfo;
      
      function sortProducts(param1:Vector.<IBillingProduct>) : void;
   }
}
