package com.playata.application.data.voucher
{
   import com.playata.application.data.AppDateTime;
   import com.playata.application.data.dataobject.DOUserVoucher;
   import com.playata.framework.core.util.TimeUtil;
   import com.playata.framework.display.ui.IListItem;
   
   public class UserVoucher extends DOUserVoucher implements IListItem
   {
       
      
      private var _reward:VoucherReward = null;
      
      public function UserVoucher(param1:DOUserVoucher)
      {
         super(param1);
      }
      
      public function get reward() : VoucherReward
      {
         if(_reward == null)
         {
            _reward = new VoucherReward(getTypedObjectFromJson("rewards"));
         }
         return _reward;
      }
      
      public function get isExpired() : Boolean
      {
         var _loc1_:int = tsEnd;
         return _loc1_ < TimeUtil.now;
      }
      
      public function get endDateTime() : String
      {
         return AppDateTime.getDateTimeString(TimeUtil.localDateTime,tsEnd);
      }
      
      public function get itemId() : String
      {
         return id.toString();
      }
   }
}
