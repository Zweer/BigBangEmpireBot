package com.playata.application.ui.elements.guild
{
   import com.playata.application.data.constants.CGuildBooster;
   import com.playata.application.data.guild.Guild;
   import com.playata.application.ui.elements.booster.UiBoosterIcon;
   import com.playata.application.ui.elements.generic.UiInfoTooltipButton;
   import com.playata.application.ui.elements.generic.button.UiGameCurrencyButton;
   import com.playata.application.ui.elements.generic.button.UiPremiumButton;
   import com.playata.application.ui.elements.generic.textfield.UiTextTooltip;
   import com.playata.framework.core.util.TimeUtil;
   import com.playata.framework.input.InteractionEvent;
   import com.playata.framework.localization.LocText;
   import visuals.ui.elements.buttons.SymbolButtonGuildBoosterExtendGeneric;
   
   public class UiGuildBoosterExpiredButton
   {
       
      
      private var _content:SymbolButtonGuildBoosterExtendGeneric = null;
      
      private var _boosterIcon:UiGuildBoosterIcon = null;
      
      private var _btnBuyForGameCurrency:UiGameCurrencyButton = null;
      
      private var _btnBuyForPremiumCurrency:UiPremiumButton = null;
      
      private var _callback:Function = null;
      
      private var _tooltip:UiTextTooltip = null;
      
      private var _boosterId:String = null;
      
      private var _extended:Boolean = false;
      
      public function UiGuildBoosterExpiredButton(param1:SymbolButtonGuildBoosterExtendGeneric, param2:String, param3:Guild, param4:Function)
      {
         super();
         _content = param1;
         _boosterId = param2;
         _callback = param4;
         if(isQuestBooster)
         {
            param1.txtBoosterType.text = LocText.current.text("dialog/guild_boosters/quest_boost");
         }
         else if(isDuelBooster)
         {
            param1.txtBoosterType.text = LocText.current.text("dialog/guild_boosters/duel_boost");
         }
         param1.txtBoosterType.autoFontSize = true;
         _btnBuyForGameCurrency = new UiGameCurrencyButton(param1.btnBuyForGameCurrency,param3.getGuildBoosterCostGameCurrency(),LocText.current.text("dialog/guild_boosters/btn_buy"),LocText.current.text("dialog/guild_boosters/variable_price"),onClickBuy);
         _btnBuyForPremiumCurrency = new UiPremiumButton(param1.btnBuyForPremiumCurrency,param3.getGuildBoosterCostPremiumCurrency(),"",LocText.current.text("dialog/guild_boosters/btn_buy"),"","",onClickBuy);
         _btnBuyForPremiumCurrency.premium = true;
         _tooltip = new UiTextTooltip(_content.tooltipLayer,"");
         refresh(param3);
         _btnBuyForGameCurrency.x = _btnBuyForGameCurrency.x - 10;
         _btnBuyForPremiumCurrency.x = _btnBuyForPremiumCurrency.x - 10;
         UiInfoTooltipButton.assign(_content,_tooltip,60,15);
      }
      
      public function get isQuestBooster() : Boolean
      {
         return boosterId.indexOf("quest") >= 0;
      }
      
      public function get isDuelBooster() : Boolean
      {
         return boosterId.indexOf("duel") >= 0;
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
      
      public function get extended() : Boolean
      {
         return _extended;
      }
      
      public function refresh(param1:Guild) : void
      {
         refreshBooster(param1);
      }
      
      private function refreshBooster(param1:Guild) : void
      {
         var _loc8_:CGuildBooster = CGuildBooster.fromId(_boosterId);
         var _loc5_:int = _loc8_.amount;
         var _loc2_:int = _loc8_.duration;
         var _loc3_:Boolean = _loc8_.premiumItem;
         var _loc7_:int = _loc8_.type;
         var _loc4_:int = _loc2_ / 86400;
         _btnBuyForGameCurrency.visible = !_loc3_;
         _btnBuyForPremiumCurrency.visible = _loc3_;
         _boosterIcon = new UiGuildBoosterIcon(_content.booster,_loc7_);
         _boosterIcon.refresh(_boosterId,-1);
         _content.txtDuration.text = LocText.current.text("dialog/guild_boosters/duration_format_day",_loc4_);
         var _loc9_:String = "";
         var _loc6_:int = 0;
         _content.backgroundQuest.visible = false;
         _content.backgroundDuel.visible = false;
         switch(int(_loc7_) - 1)
         {
            case 0:
               _content.txtBoosterType.text = LocText.current.text("dialog/guild_boosters/quest_boost");
               _content.txtEffectAmount.text = LocText.current.text("dialog/guild_boosters/boost_quest_text",_loc5_);
               _content.checkmark.visible = param1.activeQuestBoosterAmount == _loc5_;
               _content.backgroundQuest.visible = true;
               _loc9_ = UiBoosterIcon.getExpirationDateTime(param1.tsActiveQuestBoostExpires);
               _loc6_ = param1.tsActiveQuestBoostExpires - TimeUtil.now - 5;
               if(param1.activeQuestBoosterAmount == _loc5_ && _loc6_ > 0)
               {
                  _tooltip.text = LocText.current.text("general/guild_boost_quest_active_tooltip",_loc5_,_loc9_);
               }
               else
               {
                  _tooltip.text = LocText.current.text("dialog/guild_boosters/button_tooltip_quest",_loc5_,TimeUtil.secondsToString(_loc2_));
               }
               break;
            case 1:
               _content.txtBoosterType.text = LocText.current.text("dialog/guild_boosters/duel_boost");
               _content.txtEffectAmount.text = LocText.current.text("dialog/guild_boosters/boost_duel_text",_loc5_);
               _content.checkmark.visible = param1.activeDuelBoosterAmount == _loc5_;
               _content.backgroundDuel.visible = true;
               _loc9_ = UiBoosterIcon.getExpirationDateTime(param1.tsActiveDuelBoostExpires);
               _loc6_ = param1.tsActiveDuelBoostExpires - TimeUtil.now - 5;
               if(param1.activeDuelBoosterAmount == _loc5_ && _loc6_ > 0)
               {
                  _tooltip.text = LocText.current.text("general/guild_boost_duel_active_tooltip",_loc5_,_loc9_);
                  break;
               }
               _tooltip.text = LocText.current.text("dialog/guild_boosters/button_tooltip_duel",_loc5_,TimeUtil.secondsToString(_loc2_));
               break;
         }
         var _loc10_:* = !!_content.checkmark.visible?0.3:0.15;
         _content.backgroundDuel.alpha = _loc10_;
         _content.backgroundQuest.alpha = _loc10_;
         _btnBuyForGameCurrency.buttonEnabled = true;
         _btnBuyForPremiumCurrency.buttonEnabled = true;
         _extended = false;
         if(_content.checkmark.visible && _loc6_ > _loc2_)
         {
            _extended = true;
            _btnBuyForGameCurrency.buttonEnabled = false;
            _btnBuyForPremiumCurrency.buttonEnabled = false;
         }
         else if(_content.checkmark.visible && _loc6_ <= _loc2_)
         {
            _btnBuyForGameCurrency.caption = LocText.current.text("dialog/guild_boosters/btn_extend");
            _btnBuyForPremiumCurrency.premiumCaption = LocText.current.text("dialog/guild_boosters/btn_extend");
         }
         else
         {
            _btnBuyForGameCurrency.caption = LocText.current.text("dialog/guild_boosters/btn_buy");
            _btnBuyForPremiumCurrency.premiumCaption = LocText.current.text("dialog/guild_boosters/btn_buy");
         }
      }
   }
}
