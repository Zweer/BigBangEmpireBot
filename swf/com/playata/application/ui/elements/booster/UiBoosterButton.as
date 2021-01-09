package com.playata.application.ui.elements.booster
{
   import com.playata.application.data.GameUtil;
   import com.playata.application.data.character.Character;
   import com.playata.application.data.constants.CBooster;
   import com.playata.application.data.constants.CConstant;
   import com.playata.application.ui.elements.generic.UiInfoTooltipButton;
   import com.playata.application.ui.elements.generic.button.UiGameCurrencyButton;
   import com.playata.application.ui.elements.generic.button.UiPremiumButton;
   import com.playata.application.ui.elements.generic.textfield.UiTextTooltip;
   import com.playata.framework.core.util.TimeUtil;
   import com.playata.framework.input.InteractionEvent;
   import com.playata.framework.localization.LocText;
   import visuals.ui.elements.buttons.SymbolButtonBoosterPurchaseGeneric;
   
   public class UiBoosterButton
   {
       
      
      private var _content:SymbolButtonBoosterPurchaseGeneric = null;
      
      private var _boosterIcon:UiBoosterIcon = null;
      
      private var _btnBuyForGameCurrency:UiGameCurrencyButton = null;
      
      private var _btnBuyForPremiumCurrency:UiPremiumButton = null;
      
      private var _callback:Function = null;
      
      private var _tooltip:UiTextTooltip = null;
      
      private var _boosterId:String = null;
      
      public function UiBoosterButton(param1:SymbolButtonBoosterPurchaseGeneric, param2:String, param3:Character, param4:Function)
      {
         super();
         _content = param1;
         _boosterId = param2;
         _callback = param4;
         _btnBuyForGameCurrency = new UiGameCurrencyButton(param1.btnBuyForGameCurrency,GameUtil.boosterCost(param3.level,boosterAmount == 10),LocText.current.text("dialog/boosters/btn_buy"),"",onClickBuy);
         _btnBuyForPremiumCurrency = new UiPremiumButton(param1.btnBuyForPremiumCurrency,CConstant.booster_large_costs_premium_currency,"",LocText.current.text("dialog/boosters/btn_buy"),"","",onClickBuy);
         _btnBuyForPremiumCurrency.premium = true;
         _tooltip = new UiTextTooltip(_content.tooltipLayer,"");
         refresh(param3);
         UiInfoTooltipButton.assign(_content,_tooltip,-240,24);
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
      
      public function get boosterType() : int
      {
         return CBooster.fromId(_boosterId).type;
      }
      
      public function get boosterAmount() : int
      {
         return CBooster.fromId(_boosterId).amount;
      }
      
      public function refresh(param1:Character) : void
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
         _content.txtDuration.text = LocText.current.text("dialog/boosters/duration_format",TimeUtil.secondsToString(_loc2_));
         _content.boosterHighlightQuest.visible = false;
         _content.boosterHighlightStats.visible = false;
         _content.boosterHighlightWork.visible = false;
         var _loc8_:String = "";
         var _loc5_:int = 0;
         switch(int(_loc6_) - 1)
         {
            case 0:
               _content.boosterHighlightQuest.visible = param1.activeQuestBoosterId == boosterId;
               _content.txtEffectAmount.text = LocText.current.text("dialog/boosters/boost_quest_text",_loc4_);
               _content.checkmark.visible = param1.activeQuestBoosterAmount == _loc4_;
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
               _content.boosterHighlightStats.visible = param1.activeStatsBoosterId == boosterId;
               _content.txtEffectAmount.text = LocText.current.text("dialog/boosters/boost_stats_text",_loc4_);
               _content.checkmark.visible = param1.activeStatsBoosterAmount == _loc4_;
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
               _content.boosterHighlightWork.visible = param1.activeWorkBoosterId == boosterId;
               _content.txtEffectAmount.text = LocText.current.text("dialog/boosters/boost_work_text",_loc4_);
               _content.checkmark.visible = param1.activeWorkBoosterAmount == _loc4_;
               _loc8_ = UiBoosterIcon.getExpirationDateTime(param1.tsActiveWorkBoostExpires);
               _loc5_ = param1.tsActiveWorkBoostExpires - TimeUtil.now - 5;
               if(param1.activeWorkBoosterAmount == _loc4_)
               {
                  _tooltip.text = LocText.current.text("general/boost_work_new_active_tooltip",_loc4_,_loc8_);
                  break;
               }
               _tooltip.text = LocText.current.text("dialog/boosters/button_tooltip_work_new",_loc4_,TimeUtil.secondsToString(_loc2_));
               break;
         }
         _btnBuyForGameCurrency.buttonEnabled = true;
         if(_content.checkmark.visible && _loc5_ > _loc2_)
         {
            _btnBuyForGameCurrency.buttonEnabled = false;
            _btnBuyForPremiumCurrency.premiumCaption = LocText.current.text("dialog/boosters/btn_extend");
         }
         else if(_content.checkmark.visible && _loc5_ <= _loc2_)
         {
            _btnBuyForGameCurrency.caption = LocText.current.text("dialog/boosters/btn_extend");
            _btnBuyForPremiumCurrency.premiumCaption = LocText.current.text("dialog/boosters/btn_extend");
         }
         else
         {
            _btnBuyForGameCurrency.caption = LocText.current.text("dialog/boosters/btn_buy");
            _btnBuyForPremiumCurrency.premiumCaption = LocText.current.text("dialog/boosters/btn_buy");
         }
      }
   }
}
