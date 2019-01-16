package com.playata.application.data.voucher
{
   import com.playata.framework.core.TypedObject;
   import com.playata.framework.core.util.ObjectUtil;
   import com.playata.framework.data.DataObject;
   import com.playata.framework.localization.LocText;
   
   public class VoucherReward extends DataObject
   {
       
      
      public function VoucherReward(param1:TypedObject)
      {
         super(param1);
      }
      
      public function get rewardCount() : int
      {
         return ObjectUtil.keyCount(rawData);
      }
      
      public function getRewardCount(param1:String) : int
      {
         if(!hasData(param1))
         {
            return 0;
         }
         return getInt(param1);
      }
      
      public function hasReward(param1:String) : Boolean
      {
         return hasData(param1);
      }
      
      public function get questEnergy() : int
      {
         if(!hasData("quest_energy"))
         {
            return 0;
         }
         return getInt("quest_energy");
      }
      
      private function get gameCurrency() : int
      {
         if(!hasData("game_currency"))
         {
            return 0;
         }
         return getInt("game_currency");
      }
      
      private function get premiumCurrency() : int
      {
         if(!hasData("premium_currency"))
         {
            return 0;
         }
         return getInt("premium_currency");
      }
      
      private function get premiumCurrencyDonatable() : int
      {
         if(!hasData("premium_currency_donatable"))
         {
            return 0;
         }
         return getInt("premium_currency_donatable");
      }
      
      private function get statPoints() : int
      {
         if(!hasData("stat_points"))
         {
            return 0;
         }
         return getInt("stat_points");
      }
      
      public function getBoosterType(param1:String) : int
      {
         if(!hasData(param1))
         {
            return 0;
         }
         return getTypedObject(param1).getInt("type");
      }
      
      public function getBoosterDuration(param1:String) : int
      {
         if(!hasData(param1))
         {
            return 0;
         }
         return getTypedObject(param1).getInt("duration");
      }
      
      public function get explanation() : String
      {
         var _loc1_:String = "";
         if(hasData("items"))
         {
            _loc1_ = _loc1_ + (LocText.current.text("dialog/redeem_voucher/explanation_line",LocText.current.text("dialog/redeem_voucher/reward_info_items")) + "\n");
         }
         if(hasData("game_currency"))
         {
            _loc1_ = _loc1_ + (LocText.current.text("dialog/redeem_voucher/explanation_line",LocText.current.text("dialog/redeem_voucher/reward_info_game_currency",gameCurrency)) + "\n");
         }
         if(hasData("premium_currency"))
         {
            _loc1_ = _loc1_ + (LocText.current.text("dialog/redeem_voucher/explanation_line",LocText.current.text("dialog/redeem_voucher/reward_info_premium_currency",premiumCurrency)) + "\n");
         }
         if(hasData("premium_currency_donatable"))
         {
            _loc1_ = _loc1_ + (LocText.current.text("dialog/redeem_voucher/explanation_line",LocText.current.text("dialog/redeem_voucher/reward_info_premium_currency_donatable",premiumCurrencyDonatable)) + "\n");
         }
         if(hasData("stat_points"))
         {
            _loc1_ = _loc1_ + (LocText.current.text("dialog/redeem_voucher/explanation_line",LocText.current.text("dialog/redeem_voucher/reward_info_stat_points",statPoints)) + "\n");
         }
         if(hasData("quest_energy"))
         {
            _loc1_ = _loc1_ + (LocText.current.text("dialog/redeem_voucher/explanation_line",LocText.current.text("dialog/redeem_voucher/reward_info_quest_energy",questEnergy)) + "\n");
         }
         if(hasData("quest_booster"))
         {
            _loc1_ = _loc1_ + (LocText.current.text("dialog/redeem_voucher/explanation_line",LocText.current.text("dialog/redeem_voucher/reward_info_quest_booster",getBoosterType("quest_booster"),getBoosterDuration("quest_booster"))) + "\n");
         }
         if(hasData("stats_booster"))
         {
            _loc1_ = _loc1_ + (LocText.current.text("dialog/redeem_voucher/explanation_line",LocText.current.text("dialog/redeem_voucher/reward_info_stats_booster",getBoosterType("stats_booster"),getBoosterDuration("stats_booster"))) + "\n");
         }
         if(hasData("work_booster"))
         {
            _loc1_ = _loc1_ + (LocText.current.text("dialog/redeem_voucher/explanation_line",LocText.current.text("dialog/redeem_voucher/reward_info_work_booster",getBoosterType("work_booster"),getBoosterDuration("work_booster"))) + "\n");
         }
         if(hasData("sense_booster"))
         {
            if(getBoosterDuration("sense_booster") % 24 == 0)
            {
               _loc1_ = _loc1_ + (LocText.current.text("dialog/redeem_voucher/explanation_line",LocText.current.text("dialog/redeem_voucher/reward_info_sense_booster_days",getBoosterDuration("sense_booster") / 24)) + "\n");
            }
            else
            {
               _loc1_ = _loc1_ + (LocText.current.text("dialog/redeem_voucher/explanation_line",LocText.current.text("dialog/redeem_voucher/reward_info_sense_booster",getBoosterDuration("sense_booster"))) + "\n");
            }
         }
         if(hasData("multitasking_booster"))
         {
            if(getBoosterDuration("multitasking_booster") % 24 == 0)
            {
               _loc1_ = _loc1_ + (LocText.current.text("dialog/redeem_voucher/explanation_line",LocText.current.text("dialog/redeem_voucher/reward_info_multitasking_booster_days",getBoosterDuration("multitasking_booster") / 24)) + "\n");
            }
            else
            {
               _loc1_ = _loc1_ + (LocText.current.text("dialog/redeem_voucher/explanation_line",LocText.current.text("dialog/redeem_voucher/reward_info_multitasking_booster",getBoosterDuration("multitasking_booster"))) + "\n");
            }
         }
         return _loc1_;
      }
   }
}
