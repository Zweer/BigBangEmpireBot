package com.playata.framework.billing
{
   import com.playata.framework.core.enum.Enum;
   
   public class BillingProductType extends Enum
   {
      
      public static const PREMIUM_NORMAL:BillingProductType = new BillingProductType();
      
      public static const PREMIUM_SPECIAL:BillingProductType = new BillingProductType();
      
      public static const CONSUMABLE:BillingProductType = new BillingProductType();
      
      {
         initEnum(BillingProductType);
      }
      
      public function BillingProductType()
      {
         super();
      }
   }
}
