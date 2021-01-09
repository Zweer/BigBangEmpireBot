package com.playata.application.ui.elements.guild
{
   import com.greensock.easing.Elastic;
   import com.playata.application.data.constants.CConstant;
   import com.playata.application.data.user.User;
   import com.playata.application.ui.elements.generic.button.UiPremiumButton;
   import com.playata.framework.data.constants.Constants;
   import com.playata.framework.input.InteractionEvent;
   import com.playata.framework.localization.LocText;
   import visuals.ui.elements.guild.SymbolGuildBattleAutoJoinsPackageGeneric;
   
   public class UiGuildBattleAutoJoinPackage
   {
       
      
      private var _content:SymbolGuildBattleAutoJoinsPackageGeneric;
      
      private var _index:int;
      
      private var _onSelectedCallback:Function;
      
      private var _btnBuy:UiPremiumButton;
      
      public function UiGuildBattleAutoJoinPackage(param1:SymbolGuildBattleAutoJoinsPackageGeneric, param2:int, param3:Function)
      {
         var _loc6_:int = 0;
         var _loc5_:int = 0;
         var _loc9_:Number = NaN;
         var _loc7_:Number = NaN;
         super();
         _content = param1;
         _index = param2;
         _onSelectedCallback = param3;
         var _loc4_:int = Constants.current.getInt("guild_auto_joins_premium_currency_amount_package" + param2);
         var _loc8_:int = Constants.current.getInt("guild_auto_joins_amount_package" + param2);
         param1.txtAmountCaption.text = LocText.current.text("general/guild/auto_joins",_loc8_);
         _btnBuy = new UiPremiumButton(param1.btnBuy,_loc4_,"",LocText.current.text("dialog/guild_recharge_auto_joins/button_recharge"),"","",onClickBuy);
         _btnBuy.premium = true;
         if(User.current.character.guildRank == 3)
         {
            _btnBuy.buttonEnabled = false;
            _btnBuy.premiumTooltip = LocText.current.text("dialog/guild_recharge_auto_joins/recharge_button_no_permisison_tooltip");
         }
         param1.icon.gotoAndStop(param2);
         if(param2 == 1)
         {
            param1.discount.visible = false;
         }
         else
         {
            _loc6_ = CConstant.guild_auto_joins_premium_currency_amount_package1;
            _loc5_ = CConstant.guild_auto_joins_amount_package1;
            _loc9_ = _loc6_ / _loc5_ * _loc8_;
            _loc7_ = Math.round((1 - _loc4_ / _loc9_) * 20) * 5;
            param1.discount.txtDiscount.text = "-" + _loc7_ + "%";
            var _loc10_:int = 0;
            param1.discount.scaleY = _loc10_;
            param1.discount.scaleX = _loc10_;
            param1.discount.tweenTo(1,{
               "delay":0.8 + (param2 - 1) * 0.2,
               "scaleX":1,
               "scaleY":1,
               "ease":Elastic.easeOut
            });
         }
      }
      
      private function onClickBuy(param1:InteractionEvent) : void
      {
      }
      
      public function dispose() : void
      {
         _btnBuy.dispose();
         _btnBuy = null;
         _onSelectedCallback = null;
      }
   }
}
