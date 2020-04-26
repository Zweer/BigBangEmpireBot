package com.playata.application.ui.elements.stream
{
   import com.playata.application.data.voucher.UserVoucher;
   import com.playata.application.ui.elements.generic.button.UiButton;
   import com.playata.application.ui.elements.generic.list.UiList;
   import com.playata.framework.localization.LocText;
   import visuals.ui.elements.stream.SymbolUserVoucherListGeneric;
   
   public class UiUserVoucherList extends UiList
   {
       
      
      private var _content:SymbolUserVoucherListGeneric = null;
      
      private var _onRedeem:Function = null;
      
      public function UiUserVoucherList(param1:SymbolUserVoucherListGeneric, param2:Function)
      {
         _content = param1;
         _onRedeem = param2;
         _content.txtNoUserVouchers.text = LocText.current.text("panel_streams/user_vouchers/no_user_vouchers");
         super(_content,UiUserVoucherLine,4,new UiButton(_content.btnUp,null,null),new UiButton(_content.btnDown,null,null),true,false,sortByEndTimestamp,"line");
      }
      
      public function refreshLocalization() : void
      {
         _content.txtNoUserVouchers.text = LocText.current.text("panel_streams/user_vouchers/no_user_vouchers");
         var _loc3_:int = 0;
         var _loc2_:* = _lines;
         for each(var _loc1_ in _lines)
         {
            _loc1_.refreshLocalization();
         }
      }
      
      public function update(param1:Vector.<UserVoucher>) : void
      {
         syncItemsFromVector(param1);
         var _loc4_:int = 0;
         var _loc3_:* = _lines;
         for each(var _loc2_ in _lines)
         {
            _loc2_.onRedeem = _onRedeem;
         }
      }
      
      private function sortByEndTimestamp(param1:UserVoucher, param2:UserVoucher) : int
      {
         if(param1.tsEnd < param2.tsEnd)
         {
            return -1;
         }
         if(param1.tsEnd > param2.tsEnd)
         {
            return 1;
         }
         return 0;
      }
   }
}
