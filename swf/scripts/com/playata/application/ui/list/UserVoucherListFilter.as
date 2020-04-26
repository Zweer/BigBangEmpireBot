package com.playata.application.ui.list
{
   import com.playata.application.data.voucher.UserVoucher;
   import com.playata.framework.display.ui.IListFilter;
   import com.playata.framework.display.ui.IListItem;
   
   public class UserVoucherListFilter implements IListFilter
   {
       
      
      public function UserVoucherListFilter()
      {
         super();
      }
      
      public function matches(param1:IListItem) : Boolean
      {
         var _loc2_:UserVoucher = param1 as UserVoucher;
         return !_loc2_.isExpired;
      }
   }
}
