package com.playata.application.data.dataobject
{
   import com.playata.framework.data.DataObject;
   
   public class DOPaymentPromotion extends DataObject
   {
       
      
      public function DOPaymentPromotion(param1:Object)
      {
         super(param1);
      }
      
      public function get isEligible() : Boolean
      {
         return getBoolean("is_eligible");
      }
      
      public function get premiumCurrency() : int
      {
         return getInt("premium_currency");
      }
   }
}
