package com.playata.application.ui.elements.stream
{
   import com.playata.application.data.voucher.UserVoucher;
   import com.playata.application.data.voucher.VoucherReward;
   import com.playata.application.ui.ViewManager;
   import com.playata.application.ui.elements.generic.button.UiTextButton;
   import com.playata.application.ui.elements.generic.dialog.UiInfoDialog;
   import com.playata.framework.application.Environment;
   import com.playata.framework.application.request.ActionRequestResponse;
   import com.playata.framework.display.ui.IListItem;
   import com.playata.framework.display.ui.controls.ListLine;
   import com.playata.framework.input.InteractionEvent;
   import com.playata.framework.localization.LocText;
   import visuals.ui.elements.stream.SymbolUserVoucherLineGeneric;
   
   public class UiUserVoucherLine extends ListLine
   {
       
      
      private var _rawContent:SymbolUserVoucherLineGeneric = null;
      
      private var _userVoucher:UserVoucher = null;
      
      private var _onRedeem:Function = null;
      
      private var _btnRedeem:UiTextButton = null;
      
      public function UiUserVoucherLine(param1:UserVoucher, param2:int, param3:SymbolUserVoucherLineGeneric = null)
      {
         _userVoucher = param1;
         if(!param3)
         {
            _rawContent = new SymbolUserVoucherLineGeneric();
         }
         else
         {
            _rawContent = param3;
         }
         super(_rawContent,param2);
         _btnRedeem = new UiTextButton(_rawContent.btnRedeem,LocText.current.text("dialog/redeem_voucher/button_redeem"),"",onClickRedeem);
      }
      
      public function refreshLocalization() : void
      {
         _btnRedeem.caption = LocText.current.text("dialog/redeem_voucher/button_redeem");
      }
      
      override public function dispose() : void
      {
         _btnRedeem.dispose();
         _btnRedeem = null;
         super.dispose();
      }
      
      public function get content() : SymbolUserVoucherLineGeneric
      {
         return _rawContent;
      }
      
      public function get onRedeem() : Function
      {
         return _onRedeem;
      }
      
      public function set onRedeem(param1:Function) : void
      {
         _onRedeem = param1;
      }
      
      private function onClickRedeem(param1:InteractionEvent) : void
      {
         _btnRedeem.buttonEnabled = false;
         Environment.application.sendActionRequest("redeemVoucher",{"code":_userVoucher.code},handleRequests);
      }
      
      public function get userVoucher() : UserVoucher
      {
         return _userVoucher;
      }
      
      override public function refresh(param1:IListItem, param2:int) : void
      {
         super.refresh(param1,param2);
         if(!param1)
         {
            return;
         }
         _userVoucher = param1 as UserVoucher;
         _rawContent.txtTitle.text = _userVoucher.title;
         _rawContent.txtInfo.text = _userVoucher.rewardString;
         if(_userVoucher.isExpired)
         {
            _rawContent.txtValidUntil.text = LocText.current.text("dialog/mail_read/voucher_expired");
         }
         else
         {
            _rawContent.txtValidUntil.text = LocText.current.text("panel_streams/user_vouchers/valid_until",_userVoucher.endDateTime);
         }
         _rawContent.icon.gotoAndStop(_userVoucher.rewardIconIndex);
         _rawContent.icon.visible = _userVoucher.rewardIconIndex > 0;
         _btnRedeem.buttonEnabled = true;
      }
      
      private function handleRequests(param1:ActionRequestResponse) : void
      {
         var _loc3_:* = null;
         var _loc4_:* = null;
         var _loc2_:* = null;
         var _loc5_:* = param1.action;
         if("redeemVoucher" !== _loc5_)
         {
            throw new Error("Unsupported request action \'" + param1.action + "\'!");
         }
         if(param1.error == "")
         {
            _loc3_ = new VoucherReward(param1.appResponse.voucher_rewards);
            _loc4_ = _loc3_.explanation;
            _loc2_ = LocText.current.text("dialog/redeem_voucher/success_text");
            if(_loc4_)
            {
               _loc2_ = _loc2_ + ("\n\n" + _loc4_);
            }
            Environment.panelManager.showDialog(new UiInfoDialog(LocText.current.text("dialog/redeem_voucher/success_title"),_loc2_,LocText.current.text("general/button_ok")));
            Environment.application.updateData(param1.data);
            ViewManager.instance.baseUserPanel.syncGame();
            _onRedeem(_userVoucher);
         }
         else if(param1.error == "errRedeemVoucherInvalidCode")
         {
            Environment.panelManager.showDialog(new UiInfoDialog(LocText.current.text("error/redeem_voucher/invalid_code_title"),LocText.current.text("error/redeem_voucher/invalid_code_text"),LocText.current.text("general/button_ok")));
         }
         else if(param1.error == "errInvalidateAlreadyRedeemed")
         {
            Environment.panelManager.showDialog(new UiInfoDialog(LocText.current.text("error/redeem_voucher/already_redeemed_title"),LocText.current.text("error/redeem_voucher/already_redeemed_text"),LocText.current.text("general/button_ok")));
            _onRedeem(_userVoucher);
         }
         else if(param1.error == "errRedeemInactiveCampaign")
         {
            Environment.panelManager.showDialog(new UiInfoDialog(LocText.current.text("error/redeem_voucher/inactive_campaign_title"),LocText.current.text("error/redeem_voucher/inactive_campaign_text"),LocText.current.text("general/button_ok")));
         }
         else if(param1.error == "errCheckCampaignRequirementsInvalidLevel")
         {
            Environment.panelManager.showDialog(new UiInfoDialog(LocText.current.text("error/redeem_voucher/invalid_level_title"),LocText.current.text("error/redeem_voucher/invalid_level_text"),LocText.current.text("general/button_ok")));
         }
         else if(param1.error == "errCheckCampaignRequirementsInvalidLocale")
         {
            Environment.panelManager.showDialog(new UiInfoDialog(LocText.current.text("error/redeem_voucher/invalid_locale_title"),LocText.current.text("error/redeem_voucher/invalid_locale_text"),LocText.current.text("general/button_ok")));
         }
         else if(param1.error == "errRedeemLimitReached")
         {
            Environment.panelManager.showDialog(new UiInfoDialog(LocText.current.text("error/redeem_voucher/limit_reached_title"),LocText.current.text("error/redeem_voucher/limit_reached_text"),LocText.current.text("general/button_ok")));
         }
         else if(param1.error == "errCheckVoucherRequirementsWrongUser")
         {
            Environment.panelManager.showDialog(new UiInfoDialog(LocText.current.text("error/redeem_user_voucher/invalid_user_title"),LocText.current.text("error/redeem_user_voucher/invalid_user_text"),LocText.current.text("general/button_ok")));
         }
         else if(param1.error == "errRedeemInactiveVoucher")
         {
            Environment.panelManager.showDialog(new UiInfoDialog(LocText.current.text("error/redeem_user_voucher/inactive_voucher_title"),LocText.current.text("error/redeem_user_voucher/inactive_voucher_text"),LocText.current.text("general/button_ok")));
         }
         else
         {
            Environment.reportError(param1.error,param1.request);
         }
      }
   }
}
