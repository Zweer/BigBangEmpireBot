package com.playata.application.ui.dialogs
{
   import com.playata.application.data.voucher.VoucherReward;
   import com.playata.application.ui.ViewManager;
   import com.playata.application.ui.elements.generic.button.UiButton;
   import com.playata.application.ui.elements.generic.button.UiTextButton;
   import com.playata.application.ui.elements.generic.dialog.UiDialog;
   import com.playata.application.ui.elements.generic.dialog.UiInfoDialog;
   import com.playata.framework.application.Environment;
   import com.playata.framework.application.request.ActionRequestResponse;
   import com.playata.framework.core.util.StringUtil;
   import com.playata.framework.display.ui.controls.Button;
   import com.playata.framework.display.ui.dialogs.Dialog;
   import com.playata.framework.input.InteractionEvent;
   import com.playata.framework.localization.LocText;
   import com.playata.framework.network.request.RequestData;
   import visuals.ui.dialogs.SymbolDialogRedeemVoucherGeneric;
   
   public class DialogRedeemVoucher extends UiDialog
   {
       
      
      private var _btnClose:UiButton = null;
      
      private var _btnRedeem:UiTextButton = null;
      
      private var _voucherMessageId:int = 0;
      
      public function DialogRedeemVoucher(param1:String = null)
      {
         var _loc2_:SymbolDialogRedeemVoucherGeneric = new SymbolDialogRedeemVoucherGeneric();
         super(_loc2_);
         _queued = false;
         _loc2_.txtDialogTitle.text = LocText.current.text("dialog/redeem_voucher/title");
         _loc2_.txtInfo.text = LocText.current.text("dialog/redeem_voucher/info");
         _loc2_.txtVoucherCode.text = LocText.current.text("dialog/redeem_voucher/voucher_code_caption");
         _btnClose = new UiButton(_loc2_.btnClose,"",onClickClose);
         _btnRedeem = new UiTextButton(_loc2_.btnRedeem,LocText.current.text("dialog/redeem_voucher/button_redeem"),"",onClickRedeem);
         _tabObjects.push(_loc2_.inputCode);
         if(!param1)
         {
            setFocus();
         }
         else
         {
            setVoucherCode(param1);
         }
      }
      
      override public function dispose() : void
      {
         _btnClose.dispose();
         _btnClose = null;
         _btnRedeem.dispose();
         _btnRedeem = null;
         super.dispose();
      }
      
      private function onClickClose(param1:InteractionEvent) : void
      {
         close();
      }
      
      private function onClickRedeem(param1:InteractionEvent) : void
      {
         var _loc2_:* = null;
         var _loc3_:SymbolDialogRedeemVoucherGeneric = _vo as SymbolDialogRedeemVoucherGeneric;
         if(StringUtil.isEmpty(_loc3_.inputCode.text))
         {
            Environment.panelManager.showDialog(new UiInfoDialog(LocText.current.text("dialog/redeem_voucher/code_empty_title"),LocText.current.text("dialog/redeem_voucher/code_empty_text"),LocText.current.text("general/button_ok"),setFocus));
         }
         else
         {
            _loc2_ = new RequestData({"code":_loc3_.inputCode.text});
            if(_voucherMessageId > 0)
            {
               _loc2_.setInt("voucher_message_id",_voucherMessageId);
            }
            Environment.application.sendActionRequest("redeemVoucher",_loc2_,handleRequests);
         }
      }
      
      private function setFocus() : void
      {
         var _loc1_:SymbolDialogRedeemVoucherGeneric = _vo as SymbolDialogRedeemVoucherGeneric;
         if(StringUtil.isEmpty(_loc1_.inputCode.text))
         {
            Dialog.focus = _loc1_.inputCode;
         }
      }
      
      public function setVoucherCode(param1:String) : void
      {
         var _loc2_:SymbolDialogRedeemVoucherGeneric = _vo as SymbolDialogRedeemVoucherGeneric;
         if(StringUtil.isEmpty(_loc2_.inputCode.text))
         {
            _loc2_.inputCode.text = param1;
         }
      }
      
      public function setVoucherMessageId(param1:int) : void
      {
         _voucherMessageId = param1;
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
            Environment.application.updateData(param1.data);
            _loc3_ = new VoucherReward(param1.appResponse.voucher_rewards);
            _loc4_ = _loc3_.explanation;
            _loc2_ = LocText.current.text("dialog/redeem_voucher/success_text");
            if(_loc4_)
            {
               _loc2_ = _loc2_ + ("\n\n" + _loc4_);
            }
            Environment.panelManager.showDialog(new UiInfoDialog(LocText.current.text("dialog/redeem_voucher/success_title"),_loc2_,LocText.current.text("general/button_ok")));
            ViewManager.instance.baseUserPanel.syncGame();
            close();
         }
         else if(param1.error == "errRedeemVoucherInvalidCode")
         {
            Environment.panelManager.showDialog(new UiInfoDialog(LocText.current.text("error/redeem_voucher/invalid_code_title"),LocText.current.text("error/redeem_voucher/invalid_code_text"),LocText.current.text("general/button_ok")));
         }
         else if(param1.error == "errInvalidateAlreadyRedeemed")
         {
            Environment.panelManager.showDialog(new UiInfoDialog(LocText.current.text("error/redeem_voucher/already_redeemed_title"),LocText.current.text("error/redeem_voucher/already_redeemed_text"),LocText.current.text("general/button_ok")));
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
      
      override public function get defaultButton() : Button
      {
         return _btnRedeem;
      }
      
      override public function onEscape() : void
      {
         close();
      }
   }
}
