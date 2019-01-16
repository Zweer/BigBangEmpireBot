package com.playata.framework.billing
{
   import com.playata.framework.core.TypedObject;
   import com.playata.framework.core.signal.ISignal;
   
   public interface IBilling
   {
       
      
      function get hasProductsLoaded() : Boolean;
      
      function requestProducts(param1:Function = null, param2:Boolean = false, param3:String = null) : void;
      
      function purchaseProduct(param1:IBillingProduct, param2:Function, param3:int = 1, param4:Boolean = false) : void;
      
      function restorePurchases(param1:Function) : void;
      
      function resetProducts() : void;
      
      function getPaymentMethods(param1:TypedObject = null) : Vector.<PaymentMethod>;
      
      function get onLockApplication() : ISignal;
      
      function get onUnlockApplication() : ISignal;
   }
}
