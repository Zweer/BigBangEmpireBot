package com.playata.application.ui.elements.booster
{
   import com.playata.application.data.GameUtil;
   import com.playata.application.data.constants.CConstant;
   import com.playata.application.data.user.User;
   import com.playata.application.ui.ViewManager;
   import com.playata.application.ui.elements.generic.UiInfoTooltipButton;
   import com.playata.application.ui.elements.generic.button.UiPremiumButton;
   import com.playata.application.ui.elements.generic.textfield.UiTextTooltip;
   import com.playata.framework.application.Environment;
   import com.playata.framework.application.request.ActionRequestResponse;
   import com.playata.framework.core.util.TimeUtil;
   import com.playata.framework.input.InteractionEvent;
   import com.playata.framework.localization.LocText;
   import visuals.ui.elements.booster.SymbolButtonHeroSenseBoosterGeneric;
   
   public class UiBoosterButtonSense
   {
       
      
      private var _content:SymbolButtonHeroSenseBoosterGeneric = null;
      
      private var _btnBuyForPremiumCurrency:UiPremiumButton = null;
      
      private var _tooltip:UiTextTooltip = null;
      
      public function UiBoosterButtonSense(param1:SymbolButtonHeroSenseBoosterGeneric)
      {
         super();
         _content = param1;
         _btnBuyForPremiumCurrency = new UiPremiumButton(_content.btnBuyForPremiumCurrency,CConstant.booster_sense_costs_premium_currency_amount,"",LocText.current.text("dialog/boosters/btn_buy"),"","",onClickBuy);
         _btnBuyForPremiumCurrency.premium = true;
         _content.txtName.text = LocText.current.text("dialog/boosters/sense_booster_name");
         _content.txtName.autoFontSize = true;
         _tooltip = new UiTextTooltip(_content.tooltipLayer,"",requestTooltip);
         _content.checkmark.bringToTop();
         refresh();
         UiInfoTooltipButton.assign(_content,_tooltip,5,12);
      }
      
      public static function getActiveTooltipText() : String
      {
         var _loc2_:String = "";
         var _loc1_:int = 0;
         _loc2_ = UiBoosterIcon.getExpirationDateTime(User.current.character.tsActiveSenseBoostExpires);
         _loc1_ = User.current.character.tsActiveSenseBoostExpires - TimeUtil.now - 5;
         return LocText.current.text("general/boost_sense_active_tooltip",TimeUtil.secondsToString(_loc1_),_loc2_);
      }
      
      public static function getInactiveTooltipText() : String
      {
         return LocText.current.text("dialog/boosters/button_tooltip_sense",GameUtil.getSenseBoosterDurationString());
      }
      
      public function dispose() : void
      {
         _btnBuyForPremiumCurrency.dispose();
         _btnBuyForPremiumCurrency = null;
         _tooltip.dispose();
         _tooltip = null;
         _content = null;
      }
      
      public function refresh() : void
      {
         if(!_btnBuyForPremiumCurrency)
         {
            return;
         }
         var _loc1_:int = CConstant.booster_sense_duration;
         _content.txtDuration.text = LocText.current.text("dialog/boosters/duration_format",GameUtil.getSenseBoosterDurationString());
         _content.checkmark.visible = User.current.character.senseBoosterActive;
         if(_content.checkmark.visible)
         {
            _btnBuyForPremiumCurrency.premiumCaption = LocText.current.text("dialog/boosters/btn_extend");
         }
         else
         {
            _btnBuyForPremiumCurrency.premiumCaption = LocText.current.text("dialog/boosters/btn_buy");
         }
      }
      
      private function requestTooltip() : String
      {
         if(_content.checkmark.visible)
         {
            return getActiveTooltipText();
         }
         return getInactiveTooltipText();
      }
      
      private function onClickBuy(param1:InteractionEvent) : void
      {
         Environment.application.sendActionRequest("buySenseBooster",{},handleRequests);
      }
      
      private function handleRequests(param1:ActionRequestResponse) : void
      {
         var _loc2_:* = param1.action;
         if("buySenseBooster" !== _loc2_)
         {
            throw new Error("Unsupported request action \'" + param1.action + "\'!");
         }
         if(param1.error == "")
         {
            Environment.application.updateData(param1.data);
            Environment.audio.playFX("booster_activate.mp3");
            refresh();
         }
         else
         {
            if(param1.error == "errRemovePremiumCurrencyNotEnough")
            {
               ViewManager.instance.showNotEnoughPremiumDialog(CConstant.booster_sense_costs_premium_currency_amount);
            }
            else
            {
               Environment.reportError(param1.error,param1.request);
            }
            ViewManager.instance.refresh();
         }
      }
   }
}
