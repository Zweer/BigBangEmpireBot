package com.playata.application.ui.dialogs
{
   import com.playata.application.data.GameUtil;
   import com.playata.application.data.bonus.DailyLoginBonusRewards;
   import com.playata.application.ui.elements.bonus.UiDailyLoginBonus;
   import com.playata.application.ui.elements.generic.button.UiTextButton;
   import com.playata.application.ui.elements.generic.dialog.UiDialog;
   import com.playata.framework.input.InteractionEvent;
   import com.playata.framework.localization.LocText;
   import visuals.ui.dialogs.SymbolDialogDailyLoginBonusGeneric;
   
   public class DialogDailyLoginBonus extends UiDialog
   {
       
      
      private var _btnOk:UiTextButton = null;
      
      private var _bonus1:UiDailyLoginBonus = null;
      
      private var _bonus2:UiDailyLoginBonus = null;
      
      private var _bonus3:UiDailyLoginBonus = null;
      
      private var _bonus4:UiDailyLoginBonus = null;
      
      private var _bonus5:UiDailyLoginBonus = null;
      
      public function DialogDailyLoginBonus(param1:DailyLoginBonusRewards, param2:int)
      {
         var _loc4_:SymbolDialogDailyLoginBonusGeneric = new SymbolDialogDailyLoginBonusGeneric();
         super(_loc4_);
         _queued = true;
         _loc4_.txtDialogTitle.text = LocText.current.text("dialog/daily_login_bonus/title");
         _loc4_.txtRewardCaption.text = LocText.current.text("dialog/daily_login_bonus/rewards_caption");
         _loc4_.txtInfo.text = LocText.current.text("dialog/daily_login_bonus/info");
         _bonus1 = new UiDailyLoginBonus(_loc4_.position1,1,param1,param2);
         _bonus2 = new UiDailyLoginBonus(_loc4_.position2,2,param1,param2);
         _bonus3 = new UiDailyLoginBonus(_loc4_.position3,3,param1,param2);
         _bonus4 = new UiDailyLoginBonus(_loc4_.position4,4,param1,param2);
         _bonus5 = new UiDailyLoginBonus(_loc4_.position5,5,param1,param2);
         _loc4_.iconCoins.visible = param1.getRewardType1(param2) == 1 || param1.getRewardType2(param2) == 1;
         _loc4_.iconPremiumCurrency.visible = param1.getRewardType1(param2) == 3 || param1.getRewardType2(param2) == 3;
         _loc4_.iconXp.visible = param1.getRewardType1(param2) == 2 || param1.getRewardType2(param2) == 2;
         _loc4_.txtCoins.visible = _loc4_.iconCoins.visible;
         _loc4_.txtPremiumCurrency.visible = _loc4_.iconPremiumCurrency.visible;
         _loc4_.txtXp.visible = _loc4_.iconXp.visible;
         if(param1.getRewardType1(param2) == 1)
         {
            _loc4_.txtCoins.text = GameUtil.getGameCurrencyString(param1.getRewardType1Amount(param2));
         }
         if(param1.getRewardType2(param2) == 1)
         {
            _loc4_.txtCoins.text = GameUtil.getGameCurrencyString(param1.getRewardType2Amount(param2));
         }
         if(param1.getRewardType1(param2) == 3)
         {
            _loc4_.txtPremiumCurrency.text = GameUtil.getPremiumCurrencyString(param1.getRewardType1Amount(param2));
         }
         if(param1.getRewardType2(param2) == 3)
         {
            _loc4_.txtPremiumCurrency.text = GameUtil.getPremiumCurrencyString(param1.getRewardType2Amount(param2));
         }
         if(param1.getRewardType1(param2) == 2)
         {
            _loc4_.txtXp.text = GameUtil.getXpString(param1.getRewardType1Amount(param2));
         }
         if(param1.getRewardType2(param2) == 2)
         {
            _loc4_.txtXp.text = GameUtil.getXpString(param1.getRewardType2Amount(param2));
         }
         if(!_loc4_.iconCoins.visible && !_loc4_.iconPremiumCurrency.visible && _loc4_.iconXp.visible)
         {
            _loc4_.iconXp.y = _loc4_.iconCoins.y;
            _loc4_.txtXp.y = _loc4_.txtCoins.y;
         }
         if(_loc4_.iconCoins.visible && _loc4_.iconPremiumCurrency.visible && !_loc4_.iconXp.visible)
         {
            _loc4_.iconCoins.y = _loc4_.iconXp.y;
            _loc4_.txtCoins.y = _loc4_.txtXp.y;
         }
         _btnOk = new UiTextButton(_loc4_.btnOk,LocText.current.text("general/button_ok"),"",onClickOk);
         var _loc3_:int = 0;
         if(_loc4_.txtCoins.visible)
         {
            _loc3_++;
         }
         if(_loc4_.txtPremiumCurrency.visible)
         {
            _loc3_++;
         }
         if(_loc4_.txtXp.visible)
         {
            _loc3_++;
         }
         if(_loc3_ == 1)
         {
            _btnOk.y = _btnOk.y - 35;
            _loc4_.dialogBackground.height = _loc4_.dialogBackground.height - 30;
         }
      }
      
      override public function dispose() : void
      {
         _btnOk.dispose();
         _btnOk = null;
         _bonus1.dispose();
         _bonus2.dispose();
         _bonus3.dispose();
         _bonus4.dispose();
         _bonus5.dispose();
         _bonus1 = null;
         _bonus2 = null;
         _bonus3 = null;
         _bonus4 = null;
         _bonus5 = null;
         super.dispose();
      }
      
      private function onClickOk(param1:InteractionEvent) : void
      {
         close();
      }
      
      override public function onEscape() : void
      {
         close();
      }
   }
}
