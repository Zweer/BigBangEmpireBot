package com.playata.application.ui.elements.bonus
{
   import com.playata.application.data.bonus.DailyLoginBonusRewards;
   import com.playata.application.ui.elements.generic.textfield.UiTextTooltip;
   import com.playata.framework.localization.LocText;
   import visuals.ui.elements.bonus.SymbolDailyLoginBonusGeneric;
   
   public class UiDailyLoginBonus
   {
       
      
      private var _content:SymbolDailyLoginBonusGeneric = null;
      
      private var _tooltip:UiTextTooltip = null;
      
      public function UiDailyLoginBonus(param1:SymbolDailyLoginBonusGeneric, param2:int, param3:DailyLoginBonusRewards, param4:int)
      {
         super();
         _content = param1;
         var _loc7_:* = param2;
         if(param4 > 5)
         {
            _loc7_ = int(param4 - 2 + param2 - 1);
         }
         var _loc6_:* = _loc7_ > param4;
         _content.txtDay.autoFontSize = true;
         _content.txtDay.text = LocText.current.text("dialog/daily_login_bonus/day",_loc7_);
         _content.backgroundPending.visible = _loc6_;
         _content.backgroundRewarded.visible = !_loc6_;
         _content.checkmark.visible = !_loc6_;
         if(param3.hasBonusDay(_loc7_))
         {
            _content.iconCoinXp.visible = param3.getRewardType2(_loc7_) == 2 && param3.getRewardType1(_loc7_) == 1;
            _content.iconXpCoin.visible = param3.getRewardType1(_loc7_) == 2 && param3.getRewardType2(_loc7_) == 1;
            _content.iconCoinPremiumCurrency.visible = (param3.getRewardType1(_loc7_) == 3 || param3.getRewardType2(_loc7_) == 3) && (param3.getRewardType1(_loc7_) == 1 || param3.getRewardType2(_loc7_) == 1);
            _content.iconXpPremiumCurrency.visible = (param3.getRewardType1(_loc7_) == 3 || param3.getRewardType2(_loc7_) == 3) && (param3.getRewardType1(_loc7_) == 2 || param3.getRewardType2(_loc7_) == 2);
            _content.iconCoins.visible = !_content.iconCoinXp.visible && !_content.iconXpCoin.visible && !_content.iconCoinPremiumCurrency.visible && (param3.getRewardType1(_loc7_) == 1 || param3.getRewardType2(_loc7_) == 1);
            _content.iconPremiumCurrency.visible = !_content.iconCoinPremiumCurrency.visible && !_content.iconXpPremiumCurrency.visible && (param3.getRewardType1(_loc7_) == 3 || param3.getRewardType2(_loc7_) == 3);
            _content.iconXp.visible = !_content.iconCoinXp.visible && !_content.iconXpCoin.visible && !_content.iconXpPremiumCurrency.visible && (param3.getRewardType1(_loc7_) == 2 || param3.getRewardType2(_loc7_) == 2);
         }
         else
         {
            _content.iconCoinXp.visible = false;
            _content.iconXpCoin.visible = false;
            _content.iconCoinPremiumCurrency.visible = false;
            _content.iconXpPremiumCurrency.visible = false;
            _content.iconCoins.visible = false;
            _content.iconPremiumCurrency.visible = false;
            _content.iconXp.visible = false;
         }
         _content.iconGift.visible = param4 > 5 && _loc6_;
         var _loc5_:String = "";
         if(_loc7_ < param4)
         {
            _loc5_ = LocText.current.text("dialog/daily_login_bonus/tooltip_already_rewarded");
         }
         else if(_loc7_ == param4)
         {
            _loc5_ = LocText.current.text("dialog/daily_login_bonus/tooltip_todays_reward");
         }
         else if(param4 > 5)
         {
            _loc5_ = LocText.current.text("dialog/daily_login_bonus/tooltip_unknown_reward");
         }
         else if(!_content.iconCoins.visible && _content.iconXp.visible && !_content.iconPremiumCurrency.visible)
         {
            _loc5_ = LocText.current.text("dialog/daily_login_bonus/tooltip_xp_reward");
         }
         else if(_content.iconCoinXp.visible)
         {
            _loc5_ = LocText.current.text("dialog/daily_login_bonus/tooltip_xp_gamecurrency_reward");
         }
         else if(_content.iconXpCoin.visible)
         {
            _loc5_ = LocText.current.text("dialog/daily_login_bonus/tooltip_xp_gamecurrency_reward");
         }
         else if(!_content.iconCoins.visible && !_content.iconXp.visible && _content.iconPremiumCurrency.visible)
         {
            _loc5_ = LocText.current.text("dialog/daily_login_bonus/tooltip_premiumcurrency_reward");
         }
         _tooltip = new UiTextTooltip(_content.tooltipLayer,_loc5_);
      }
      
      public function dispose() : void
      {
         _tooltip.dispose();
         _tooltip = null;
      }
   }
}
