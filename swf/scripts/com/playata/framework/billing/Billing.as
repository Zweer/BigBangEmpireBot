package com.playata.framework.billing
{
   import com.playata.framework.core.signal.ISignal;
   import com.playata.framework.core.signal.Signal;
   
   public class Billing
   {
       
      
      protected var _handler:IBillingHandler = null;
      
      protected var _initializing:Boolean = false;
      
      protected var _products:Vector.<IBillingProduct> = null;
      
      protected var _callbackRequestProductsOnComplete:Function = null;
      
      protected var _callbackPurchaseProductOnComplete:Function = null;
      
      private var _onLockApplication:ISignal = null;
      
      private var _onUnlockApplication:ISignal = null;
      
      public function Billing(param1:IBillingHandler)
      {
         super();
         _handler = param1;
         _onLockApplication = new Signal();
         _onUnlockApplication = new Signal();
      }
      
      public function get onLockApplication() : ISignal
      {
         return _onLockApplication;
      }
      
      public function get onUnlockApplication() : ISignal
      {
         return _onUnlockApplication;
      }
   }
}
