package com.playata.application.ui.dialogs
{
   import com.playata.application.data.voucher.VoucherReward;
   import com.playata.application.ui.elements.generic.dialog.UiInfoDialog;
   import com.playata.framework.core.TypedObject;
   import com.playata.framework.localization.LocText;
   
   public class DialogAutomaticUserVoucherRedeemed extends UiInfoDialog
   {
       
      
      public function DialogAutomaticUserVoucherRedeemed(param1:TypedObject)
      {
         var _loc3_:String = LocText.current.text("dialog/redeem_voucher/automatic_redeem_text",param1.length) + "\n\n";
         var _loc2_:TypedObject = mergeRewards(param1);
         var _loc4_:VoucherReward = new VoucherReward(_loc2_);
         var _loc5_:String = _loc4_.explanation;
         if(_loc5_)
         {
            _loc3_ = _loc3_ + _loc5_;
         }
         super(LocText.current.text("dialog/redeem_voucher/success_title"),_loc3_,LocText.current.text("general/button_ok"));
      }
      
      private function mergeRewards(param1:TypedObject) : TypedObject
      {
         var _loc4_:int = 0;
         var _loc5_:* = null;
         var _loc3_:TypedObject = new TypedObject();
         _loc4_ = 0;
         while(_loc4_ < param1.length)
         {
            _loc5_ = param1.getData(_loc4_.toString());
            var _loc9_:int = 0;
            var _loc8_:* = _loc5_;
            for(var _loc2_ in _loc5_)
            {
               if(_loc3_.hasData(_loc2_))
               {
                  if(_loc5_[_loc2_] is Number)
                  {
                     _loc3_.setInt(_loc2_,_loc3_.getInt(_loc2_) + _loc5_[_loc2_]);
                  }
                  else if(_loc5_[_loc2_]["duration"] !== null && _loc5_[_loc2_]["duration"] !== undefined)
                  {
                     var _loc6_:String = "duration";
                     var _loc7_:* = _loc3_.getData(_loc2_)[_loc6_] + _loc5_[_loc2_]["duration"];
                     _loc3_.getData(_loc2_)[_loc6_] = _loc7_;
                  }
               }
               else
               {
                  _loc3_.setData(_loc2_,_loc5_[_loc2_]);
               }
            }
            _loc4_++;
         }
         return _loc3_;
      }
   }
}
