package com.playata.application.billing
{
   import com.playata.framework.billing.BillingProductType;
   import com.playata.framework.billing.ConsumableBillingProductInfo;
   import com.playata.framework.billing.IBillingHandler;
   import com.playata.framework.billing.IBillingProduct;
   import com.playata.framework.billing.IBillingProductInfo;
   import com.playata.framework.billing.PremiumNormalBillingProductInfo;
   import com.playata.framework.billing.PremiumSpecialBillingProductInfo;
   import com.playata.framework.core.TypedObject;
   
   public class AppBillingHandler implements IBillingHandler
   {
       
      
      public function AppBillingHandler()
      {
         super();
      }
      
      public static function sortByTypeIndex(param1:IBillingProduct, param2:IBillingProduct) : int
      {
         var _loc5_:* = null;
         var _loc6_:* = null;
         var _loc3_:* = null;
         var _loc4_:* = null;
         var _loc7_:* = null;
         var _loc8_:* = null;
         if(param1.info is PremiumSpecialBillingProductInfo && param2.info is PremiumSpecialBillingProductInfo)
         {
            _loc5_ = param1.info as PremiumSpecialBillingProductInfo;
            _loc6_ = param2.info as PremiumSpecialBillingProductInfo;
            if(_loc5_.index < _loc6_.index)
            {
               return -1;
            }
            if(_loc5_.index > _loc6_.index)
            {
               return 1;
            }
         }
         if(param1.info is ConsumableBillingProductInfo && param2.info is ConsumableBillingProductInfo)
         {
            _loc3_ = param1.info as ConsumableBillingProductInfo;
            _loc4_ = param2.info as ConsumableBillingProductInfo;
            if(_loc3_.index < _loc4_.index)
            {
               return -1;
            }
            if(_loc3_.index > _loc4_.index)
            {
               return 1;
            }
         }
         if(param1.info is PremiumNormalBillingProductInfo && param2.info is PremiumNormalBillingProductInfo)
         {
            _loc7_ = param1.info as PremiumNormalBillingProductInfo;
            _loc8_ = param2.info as PremiumNormalBillingProductInfo;
            if(_loc7_.premiumAmount < _loc8_.premiumAmount)
            {
               return -1;
            }
            if(_loc7_.premiumAmount > _loc8_.premiumAmount)
            {
               return 1;
            }
         }
         return 0;
      }
      
      public function createProductInfo(param1:BillingProductType, param2:TypedObject) : IBillingProductInfo
      {
         var _loc3_:* = param1;
         switch(_loc3_)
         {
            case BillingProductType.PREMIUM_NORMAL:
               return new PremiumNormalBillingProductInfo(param2);
            case BillingProductType.PREMIUM_SPECIAL:
               return new AppPremiumSpecialBillingProductInfo(param2);
            case BillingProductType.CONSUMABLE:
               return new AppConsumableBillingProductInfo(param2);
            default:
               throw new Error("Unknown product type");
         }
      }
      
      public function sortProducts(param1:Vector.<IBillingProduct>) : void
      {
         param1.sort(sortByTypeIndex);
      }
   }
}
