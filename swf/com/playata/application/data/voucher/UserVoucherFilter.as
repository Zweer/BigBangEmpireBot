package com.playata.application.data.voucher
{
   import com.playata.framework.core.TypedObject;
   
   public class UserVoucherFilter extends TypedObject
   {
       
      
      public function UserVoucherFilter(param1:Object)
      {
         super(param1);
      }
      
      public function get showEnergyVoucher() : Boolean
      {
         return getBoolean("sev");
      }
      
      public function get showBoosterVoucher() : Boolean
      {
         return getBoolean("sbv");
      }
   }
}
