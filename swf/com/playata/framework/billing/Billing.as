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
      
      protected var _callbackRequestProductsOnCompleteCache:Vector.<Function>;
      
      private var _onLockApplication:ISignal = null;
      
      private var _onUnlockApplication:ISignal = null;
      
      public function Billing(param1:IBillingHandler)
      {
         _callbackRequestProductsOnCompleteCache = new Vector.<Function>();
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
      
      protected function finishRequestProducts() : void
      {
         _initializing = false;
         if(_callbackRequestProductsOnComplete != null)
         {
            _callbackRequestProductsOnComplete(_products);
         }
         if(_callbackRequestProductsOnCompleteCache != null)
         {
            var _loc3_:int = 0;
            var _loc2_:* = _callbackRequestProductsOnCompleteCache;
            for each(var _loc1_ in _callbackRequestProductsOnCompleteCache)
            {
               _loc1_(_products);
            }
            _callbackRequestProductsOnCompleteCache = new Vector.<Function>();
         }
      }
   }
}
