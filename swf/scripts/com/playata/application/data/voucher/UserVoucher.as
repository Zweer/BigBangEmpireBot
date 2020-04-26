package com.playata.application.data.voucher
{
   import com.playata.application.data.AppDateTime;
   import com.playata.application.data.dataobject.DOUserVoucher;
   import com.playata.framework.core.util.TimeUtil;
   import com.playata.framework.display.ui.IListItem;
   import com.playata.framework.localization.LocText;
   
   public class UserVoucher extends DOUserVoucher implements IListItem
   {
       
      
      private var _reward:VoucherReward = null;
      
      public function UserVoucher(param1:DOUserVoucher)
      {
         super(param1);
      }
      
      public function get rewardIconIndex() : int
      {
         if(this.reward.rewardCount == 1)
         {
            if(this.reward.hasReward("quest_energy"))
            {
               return 1;
            }
            if(this.reward.hasReward("quest_booster"))
            {
               return 2;
            }
            if(this.reward.hasReward("stats_booster"))
            {
               return 2;
            }
            if(this.reward.hasReward("work_booster"))
            {
               return 2;
            }
            if(this.reward.hasReward("sense_booster"))
            {
               return 3;
            }
            if(this.reward.hasReward("multitasking_booster"))
            {
               return 2;
            }
            if(this.reward.hasReward("premium_currency"))
            {
               return 4;
            }
            if(this.reward.hasReward("premium_currency_donatable"))
            {
               return 4;
            }
         }
         return 0;
      }
      
      public function get title() : String
      {
         var _loc1_:String = null;
         if(this.reward.rewardCount == 1)
         {
            if(this.reward.hasReward("quest_energy"))
            {
               _loc1_ = LocText.current.text("message/generic_user_voucher/subject_energy");
            }
            else if(this.reward.hasReward("quest_booster"))
            {
               _loc1_ = LocText.current.text("message/generic_user_voucher/subject_quest_booster");
            }
            else if(this.reward.hasReward("stats_booster"))
            {
               _loc1_ = LocText.current.text("message/generic_user_voucher/subject_stats_booster");
            }
            else if(this.reward.hasReward("work_booster"))
            {
               _loc1_ = LocText.current.text("message/generic_user_voucher/subject_work_booster");
            }
            else if(this.reward.hasReward("sense_booster"))
            {
               _loc1_ = LocText.current.text("message/generic_user_voucher/subject_sense_booster");
            }
            else if(this.reward.hasReward("multitasking_booster"))
            {
               _loc1_ = LocText.current.text("message/generic_user_voucher/subject_multitasking_booster");
            }
            else if(this.reward.hasReward("premium_currency"))
            {
               _loc1_ = LocText.current.text("message/generic_user_voucher/subject_premium_currency");
            }
            else if(this.reward.hasReward("premium_currency_donatable"))
            {
               _loc1_ = LocText.current.text("message/generic_user_voucher/subject_premium_currency_donatable");
            }
         }
         if(!_loc1_)
         {
            _loc1_ = LocText.current.text("message/generic_user_voucher/subject");
         }
         return _loc1_;
      }
      
      public function get rewardString() : String
      {
         var _loc1_:String = "";
         if(this.reward.hasReward("quest_energy"))
         {
            _loc1_ = _loc1_ + (LocText.current.text("dialog/redeem_voucher/explanation_line",LocText.current.text("message/generic_user_voucher/body_energy",this.reward.getRewardCount("quest_energy"))) + "\n");
         }
         if(this.reward.hasReward("quest_booster"))
         {
            _loc1_ = _loc1_ + (LocText.current.text("dialog/redeem_voucher/explanation_line",LocText.current.text("message/generic_user_voucher/body_quest_booster",this.reward.getBoosterType("quest_booster"),this.reward.getBoosterDuration("quest_booster"))) + "\n");
         }
         if(this.reward.hasReward("stats_booster"))
         {
            _loc1_ = _loc1_ + (LocText.current.text("dialog/redeem_voucher/explanation_line",LocText.current.text("message/generic_user_voucher/body_stat_booster",this.reward.getBoosterType("stats_booster"),this.reward.getBoosterDuration("stats_booster"))) + "\n");
         }
         if(this.reward.hasReward("work_booster"))
         {
            _loc1_ = _loc1_ + (LocText.current.text("dialog/redeem_voucher/explanation_line",LocText.current.text("message/generic_user_voucher/body_work_booster",this.reward.getBoosterType("work_booster"),this.reward.getBoosterDuration("work_booster"))) + "\n");
         }
         if(this.reward.hasReward("sense_booster"))
         {
            _loc1_ = _loc1_ + (LocText.current.text("dialog/redeem_voucher/explanation_line",LocText.current.text("message/generic_user_voucher/body_sense_booster",TimeUtil.secondsToString(this.reward.getBoosterDuration("sense_booster") * 3600))) + "\n");
         }
         if(this.reward.hasReward("multitasking_booster"))
         {
            _loc1_ = _loc1_ + (LocText.current.text("dialog/redeem_voucher/explanation_line",LocText.current.text("message/generic_user_voucher/body_multitasking_booster",TimeUtil.secondsToString(this.reward.getBoosterDuration("multitasking_booster") * 3600))) + "\n");
         }
         if(this.reward.hasReward("premium_currency"))
         {
            _loc1_ = _loc1_ + (LocText.current.text("dialog/redeem_voucher/explanation_line",LocText.current.text("message/generic_user_voucher/body_premium_currency",this.reward.getRewardCount("body_premium_currency"))) + "\n");
         }
         if(this.reward.hasReward("premium_currency_donatable"))
         {
            _loc1_ = _loc1_ + (LocText.current.text("dialog/redeem_voucher/explanation_line",LocText.current.text("message/generic_user_voucher/body_premium_currency_donatable",this.reward.getRewardCount("premium_currency_donatable"))) + "\n");
         }
         if(!_loc1_)
         {
            _loc1_ = LocText.current.text("message/generic_user_voucher/body_reward");
         }
         return _loc1_;
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
