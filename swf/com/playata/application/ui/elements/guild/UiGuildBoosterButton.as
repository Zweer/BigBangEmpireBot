package com.playata.application.ui.elements.guild
{
   import com.playata.application.data.constants.CGuildBooster;
   import com.playata.application.data.guild.Guild;
   import com.playata.application.data.user.User;
   import com.playata.application.ui.elements.generic.UiInfoTooltipButton;
   import com.playata.application.ui.elements.generic.button.UiGameCurrencyButton;
   import com.playata.application.ui.elements.generic.button.UiPremiumButton;
   import com.playata.application.ui.elements.generic.textfield.UiTextTooltip;
   import com.playata.framework.core.util.TimeUtil;
   import com.playata.framework.input.InteractionEvent;
   import com.playata.framework.localization.LocText;
   import visuals.ui.elements.buttons.SymbolButtonGuildBoosterPurchaseGeneric;
   
   public class UiGuildBoosterButton
   {
       
      
      private var _content:SymbolButtonGuildBoosterPurchaseGeneric = null;
      
      private var _boosterIcon:UiGuildBoosterIcon = null;
      
      private var _btnBuyForGameCurrency:UiGameCurrencyButton = null;
      
      private var _btnBuyForPremiumCurrency:UiPremiumButton = null;
      
      private var _callback:Function = null;
      
      private var _tooltip:UiTextTooltip = null;
      
      private var _boosterId:String = null;
      
      public function UiGuildBoosterButton(param1:SymbolButtonGuildBoosterPurchaseGeneric, param2:String, param3:Guild, param4:Function)
      {
         super();
         _content = param1;
         _boosterId = param2;
         _callback = param4;
         _btnBuyForGameCurrency = new UiGameCurrencyButton(param1.btnBuyForGameCurrency,param3.getGuildBoosterCostGameCurrency(),LocText.current.text("dialog/guild_boosters/btn_buy"),LocText.current.text("dialog/guild_boosters/variable_price"),onClickBuy);
         _btnBuyForPremiumCurrency = new UiPremiumButton(param1.btnBuyForPremiumCurrency,param3.getGuildBoosterCostPremiumCurrency(),"",LocText.current.text("dialog/guild_boosters/btn_buy"),"","",onClickBuy);
         _btnBuyForPremiumCurrency.premium = true;
         if(!param3.isOwnGuild || param3.getMemberById(User.current.character.id).guildRank == 3)
         {
            _btnBuyForGameCurrency.tooltip = LocText.current.text("dialog/guild_booster/no_permission_text");
            _btnBuyForPremiumCurrency.premiumTooltip = LocText.current.text("dialog/guild_booster/no_permission_text");
         }
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
         return CGuildBooster.fromId(_boosterId).type;
      }
      
      public function get boosterAmount() : int
      {
         return CGuildBooster.fromId(_boosterId).amount;
      }
      
      public function refresh(param1:Guild) : void
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
         _content.boosterHighlightQuest.visible = false;
         _content.boosterHighlightDuel.visible = false;
         var _loc9_:String = "";
         var _loc6_:int = 0;
         switch(int(_loc7_) - 1)
         {
            case 0:
               _content.boosterHighlightQuest.visible = param1.activeQuestBoosterId == boosterId;
               _content.txtEffectAmount.text = LocText.current.text("dialog/guild_boosters/boost_quest_text",_loc5_);
               _content.checkmark.visible = param1.activeQuestBoosterAmount == _loc5_;
               _loc9_ = UiGuildBoosterIcon.getExpirationDateTime(param1.tsActiveQuestBoostExpires);
               _loc6_ = param1.tsActiveQuestBoostExpires - TimeUtil.now - 5;
               if(param1.activeQuestBoosterAmount == _loc5_ && param1.isOwnGuild)
               {
                  _tooltip.text = LocText.current.text("general/guild_boost_quest_active_tooltip",_loc5_,_loc9_);
               }
               else
               {
                  _tooltip.text = LocText.current.text("dialog/guild_boosters/button_tooltip_quest",_loc5_,TimeUtil.secondsToString(_loc2_));
               }
               break;
            case 1:
               _content.boosterHighlightDuel.visible = param1.activeDuelBoosterId == boosterId;
               _content.txtEffectAmount.text = LocText.current.text("dialog/guild_boosters/boost_duel_text",_loc5_);
               _content.checkmark.visible = param1.activeDuelBoosterAmount == _loc5_;
               _loc9_ = UiGuildBoosterIcon.getExpirationDateTime(param1.tsActiveDuelBoostExpires);
               _loc6_ = param1.tsActiveDuelBoostExpires - TimeUtil.now - 5;
               if(param1.activeDuelBoosterAmount == _loc5_ && param1.isOwnGuild)
               {
                  _tooltip.text = LocText.current.text("general/guild_boost_duel_active_tooltip",_loc5_,_loc9_);
                  break;
               }
               _tooltip.text = LocText.current.text("dialog/guild_boosters/button_tooltip_duel",_loc5_,TimeUtil.secondsToString(_loc2_));
               break;
         }
         _btnBuyForGameCurrency.buttonEnabled = true;
         _btnBuyForPremiumCurrency.buttonEnabled = true;
         if(_content.checkmark.visible && _loc6_ > _loc2_)
         {
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
         if(!param1.isOwnGuild || param1.getMemberById(User.current.character.id).guildRank == 3)
         {
            _btnBuyForGameCurrency.buttonEnabled = false;
            _btnBuyForPremiumCurrency.buttonEnabled = false;
         }
      }
   }
}
