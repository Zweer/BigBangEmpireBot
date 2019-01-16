package com.playata.application.ui.elements.booster
{
   import com.playata.application.data.GameUtil;
   import com.playata.application.data.character.Character;
   import com.playata.application.data.constants.CBooster;
   import com.playata.application.data.constants.CConstant;
   import com.playata.application.data.user.User;
   import com.playata.application.ui.elements.generic.UiInfoTooltipButton;
   import com.playata.application.ui.elements.generic.button.UiGameCurrencyButton;
   import com.playata.application.ui.elements.generic.button.UiPremiumButton;
   import com.playata.application.ui.elements.generic.textfield.UiTextTooltip;
   import com.playata.framework.core.util.TimeUtil;
   import com.playata.framework.input.InteractionEvent;
   import com.playata.framework.localization.LocText;
   import visuals.ui.elements.buttons.SymbolButtonBoosterExtendGeneric;
   
   public class UiBoosterExpiredButton
   {
       
      
      private var _content:SymbolButtonBoosterExtendGeneric = null;
      
      private var _boosterIcon:UiBoosterIcon = null;
      
      private var _btnBuyForGameCurrency:UiGameCurrencyButton = null;
      
      private var _btnBuyForPremiumCurrency:UiPremiumButton = null;
      
      private var _callback:Function = null;
      
      private var _tooltip:UiTextTooltip = null;
      
      private var _boosterId:String = null;
      
      public function UiBoosterExpiredButton(param1:SymbolButtonBoosterExtendGeneric, param2:String, param3:Character, param4:Function, param5:Boolean = true)
      {
         super();
         _content = param1;
         _boosterId = param2;
         _callback = param4;
         if(isQuestBooster)
         {
            param1.txtBoosterType.text = LocText.current.text("dialog/boosters/quest_boost");
         }
         else if(isStatBooster)
         {
            param1.txtBoosterType.text = LocText.current.text("dialog/boosters/stat_boost");
         }
         else if(isWorkBooster)
         {
            param1.txtBoosterType.text = LocText.current.text("dialog/boosters/work_boost");
         }
         else if(isSenseBooster)
         {
            param1.txtBoosterType.text = LocText.current.text("dialog/boosters/sense_booster_name");
            param1.txtBoosterType.x = param1.txtBoosterType.x - 80;
            param1.txtDuration.x = param1.txtDuration.x - 80;
         }
         else if(isMultitaskingBooster)
         {
            param1.txtBoosterType.text = LocText.current.text("dialog/boosters/multitasking_booster_name");
            param1.txtBoosterType.x = param1.txtBoosterType.x - 80;
            param1.txtDuration.x = param1.txtDuration.x - 80;
         }
         var _loc6_:String = !!param5?LocText.current.text("dialog/boosters/btn_extend"):LocText.current.text("dialog/boosters/btn_buy");
         if(isSenseBooster)
         {
            _btnBuyForGameCurrency = new UiGameCurrencyButton(param1.btnBuyForGameCurrency,0,_loc6_,"",onClickBuy);
            _btnBuyForPremiumCurrency = new UiPremiumButton(param1.btnBuyForPremiumCurrency,CConstant.booster_sense_costs_premium_currency_amount,"",_loc6_,"","",onClickBuy);
         }
         else if(isMultitaskingBooster)
         {
            _btnBuyForGameCurrency = new UiGameCurrencyButton(param1.btnBuyForGameCurrency,0,_loc6_,"",onClickBuy);
            _btnBuyForPremiumCurrency = new UiPremiumButton(param1.btnBuyForPremiumCurrency,CConstant.multitasking_rent_premium_amount,"",_loc6_,"","",onClickBuy);
         }
         else
         {
            _btnBuyForGameCurrency = new UiGameCurrencyButton(param1.btnBuyForGameCurrency,GameUtil.boosterCost(param3.level,boosterAmount == 10),_loc6_,"",onClickBuy);
            _btnBuyForPremiumCurrency = new UiPremiumButton(param1.btnBuyForPremiumCurrency,CConstant.booster_large_costs_premium_currency,"",_loc6_,"","",onClickBuy);
         }
         _btnBuyForPremiumCurrency.premium = true;
         _tooltip = new UiTextTooltip(_content.tooltipLayer,"");
         refresh(param3);
         UiInfoTooltipButton.assign(_content,_tooltip,60,15);
      }
      
      public function get isQuestBooster() : Boolean
      {
         return boosterId.indexOf("quest") >= 0;
      }
      
      public function get isStatBooster() : Boolean
      {
         return boosterId.indexOf("stat") >= 0;
      }
      
      public function get isWorkBooster() : Boolean
      {
         return boosterId.indexOf("work") >= 0;
      }
      
      public function get isSenseBooster() : Boolean
      {
         return boosterId == "booster_sense";
      }
      
      public function get isMultitaskingBooster() : Boolean
      {
         return boosterId == "booster_multitasking";
      }
      
      private function onClickBuy(param1:InteractionEvent) : void
      {
      }
      
      public function dispose() : void
      {
         _btnBuyForGameCurrency.dispose();
         _btnBuyForGameCurrency = null;
         _btnBuyForPremiumCurrency.dispose();
         _btnBuyForPremiumCurrency = null;
         _content = null;
      }
      
      public function get boosterId() : String
      {
         return _boosterId;
      }
      
      private function get boosterAmount() : int
      {
         return CBooster.fromId(_boosterId).amount;
      }
      
      public function get extended() : Boolean
      {
         return _content.checkmark.visible;
      }
      
      public function refresh(param1:Character) : void
      {
         if(isSenseBooster)
         {
            refreshSenseBooster(param1);
         }
         else if(isMultitaskingBooster)
         {
            refreshMultitaskingBooster(param1);
         }
         else
         {
            refreshClassicBooster(param1);
         }
      }
      
      private function refreshSenseBooster(param1:Character) : void
      {
         _btnBuyForGameCurrency.visible = false;
         _btnBuyForPremiumCurrency.visible = true;
         _content.booster.visible = false;
         _content.boosterSense.visible = true;
         _content.boosterMultitasking.visible = false;
         var _loc2_:int = CConstant.booster_sense_duration;
         _content.txtDuration.text = LocText.current.text("dialog/boosters/duration_format",GameUtil.getSenseBoosterDurationString());
         _content.backgroundQuest.visible = false;
         _content.backgroundStats.visible = false;
         _content.backgroundWork.visible = true;
         _content.txtEffectAmount.visible = false;
         _content.checkmark.visible = param1.tsActiveSenseBoostExpires > 0;
         var _loc3_:int = param1.tsActiveSenseBoostExpires - TimeUtil.now - 5;
         if(_content.checkmark.visible)
         {
            _tooltip.text = LocText.current.text("general/boost_sense_active_tooltip",_loc2_,_loc3_);
         }
         else
         {
            _tooltip.text = LocText.current.text("dialog/boosters/button_tooltip_sense",GameUtil.getSenseBoosterDurationString());
         }
         var _loc4_:* = !!_content.checkmark.visible?0.3:0.15;
         _content.backgroundWork.alpha = _loc4_;
         _loc4_ = _loc4_;
         _content.backgroundStats.alpha = _loc4_;
         _content.backgroundQuest.alpha = _loc4_;
         _btnBuyForGameCurrency.buttonEnabled = !_content.checkmark.visible;
         _btnBuyForPremiumCurrency.buttonEnabled = !_content.checkmark.visible;
      }
      
      private function refreshMultitaskingBooster(param1:Character) : void
      {
         var _loc5_:* = null;
         var _loc4_:int = 0;
         _btnBuyForGameCurrency.visible = false;
         _btnBuyForPremiumCurrency.visible = true;
         _content.booster.visible = false;
         _content.boosterSense.visible = false;
         _content.boosterMultitasking.visible = true;
         var _loc2_:int = CConstant.multitasking_rent_time_amount;
         var _loc3_:int = _loc2_ / 86400;
         _content.txtDuration.text = LocText.current.text("dialog/boosters/duration_format_day",_loc3_);
         _content.backgroundQuest.visible = false;
         _content.backgroundStats.visible = false;
         _content.backgroundWork.visible = true;
         _content.txtEffectAmount.visible = false;
         _content.checkmark.visible = param1.tsActiveMultitaskingBoostExpires > 0;
         if(_content.checkmark.visible)
         {
            _loc5_ = UiBoosterIcon.getExpirationDateTime(User.current.character.tsActiveMultitaskingBoostExpires);
            _loc4_ = User.current.character.tsActiveMultitaskingBoostExpires - TimeUtil.now - 5;
            _tooltip.text = LocText.current.text("general/boost_multitasking_active_tooltip",TimeUtil.secondsToString(_loc4_),_loc5_);
         }
         else
         {
            _tooltip.text = LocText.current.text("dialog/boosters/button_tooltip_multitasking",TimeUtil.secondsToString(_loc2_));
         }
         var _loc6_:* = !!_content.checkmark.visible?0.3:0.15;
         _content.backgroundWork.alpha = _loc6_;
         _loc6_ = _loc6_;
         _content.backgroundStats.alpha = _loc6_;
         _content.backgroundQuest.alpha = _loc6_;
         _btnBuyForGameCurrency.buttonEnabled = !_content.checkmark.visible;
         _btnBuyForPremiumCurrency.buttonEnabled = !_content.checkmark.visible;
      }
      
      private function refreshClassicBooster(param1:Character) : void
      {
         var _loc7_:CBooster = CBooster.fromId(_boosterId);
         var _loc4_:int = _loc7_.amount;
         var _loc2_:int = _loc7_.duration;
         var _loc3_:Boolean = _loc7_.premiumItem;
         var _loc6_:int = _loc7_.type;
         _btnBuyForGameCurrency.visible = !_loc3_;
         _btnBuyForPremiumCurrency.visible = _loc3_;
         _boosterIcon = new UiBoosterIcon(_content.booster,_loc6_);
         _boosterIcon.refresh(_boosterId,-1);
         _content.boosterSense.visible = false;
         _content.boosterMultitasking.visible = false;
         _content.txtDuration.text = LocText.current.text("dialog/boosters/duration_format",TimeUtil.secondsToString(_loc2_));
         var _loc8_:String = "";
         var _loc5_:int = 0;
         _content.backgroundQuest.visible = false;
         _content.backgroundStats.visible = false;
         _content.backgroundWork.visible = false;
         switch(int(_loc6_) - 1)
         {
            case 0:
               _content.txtBoosterType.text = LocText.current.text("dialog/boosters/quest_boost");
               _content.txtEffectAmount.text = LocText.current.text("dialog/boosters/boost_quest_text",_loc4_);
               _content.checkmark.visible = param1.activeQuestBoosterAmount == _loc4_;
               _content.backgroundQuest.visible = true;
               _loc8_ = UiBoosterIcon.getExpirationDateTime(param1.tsActiveQuestBoostExpires);
               _loc5_ = param1.tsActiveQuestBoostExpires - TimeUtil.now - 5;
               if(param1.activeQuestBoosterAmount == _loc4_)
               {
                  _tooltip.text = LocText.current.text("general/boost_quest_active_tooltip",_loc4_,_loc8_);
               }
               else
               {
                  _tooltip.text = LocText.current.text("dialog/boosters/button_tooltip_quest",_loc4_,TimeUtil.secondsToString(_loc2_));
               }
               break;
            case 1:
               _content.txtBoosterType.text = LocText.current.text("dialog/boosters/stat_boost");
               _content.txtEffectAmount.text = LocText.current.text("dialog/boosters/boost_stats_text",_loc4_);
               _content.checkmark.visible = param1.activeStatsBoosterAmount == _loc4_;
               _content.backgroundStats.visible = true;
               _loc8_ = UiBoosterIcon.getExpirationDateTime(param1.tsActiveStatsBoostExpires);
               _loc5_ = param1.tsActiveStatsBoostExpires - TimeUtil.now - 5;
               if(param1.activeStatsBoosterAmount == _loc4_)
               {
                  _tooltip.text = LocText.current.text("general/boost_stat_active_tooltip",_loc4_,_loc8_);
               }
               else
               {
                  _tooltip.text = LocText.current.text("dialog/boosters/button_tooltip_stats",_loc4_,TimeUtil.secondsToString(_loc2_));
               }
               break;
            case 2:
               _content.txtBoosterType.text = LocText.current.text("dialog/boosters/work_boost");
               _content.txtEffectAmount.text = LocText.current.text("dialog/boosters/boost_work_text",_loc4_);
               _content.checkmark.visible = param1.activeWorkBoosterAmount == _loc4_;
               _content.backgroundWork.visible = true;
               _loc8_ = UiBoosterIcon.getExpirationDateTime(param1.tsActiveWorkBoostExpires);
               _loc5_ = param1.tsActiveWorkBoostExpires - TimeUtil.now - 5;
               if(param1.activeWorkBoosterAmount == _loc4_)
               {
                  _tooltip.text = LocText.current.text("general/boost_work_active_tooltip",_loc4_,_loc8_);
                  break;
               }
               _tooltip.text = LocText.current.text("dialog/boosters/button_tooltip_work",_loc4_,TimeUtil.secondsToString(_loc2_));
               break;
         }
         var _loc9_:* = !!_content.checkmark.visible?0.3:0.15;
         _content.backgroundWork.alpha = _loc9_;
         _loc9_ = _loc9_;
         _content.backgroundStats.alpha = _loc9_;
         _content.backgroundQuest.alpha = _loc9_;
         _btnBuyForGameCurrency.buttonEnabled = !_content.checkmark.visible;
         _btnBuyForPremiumCurrency.buttonEnabled = !_content.checkmark.visible;
      }
   }
}
