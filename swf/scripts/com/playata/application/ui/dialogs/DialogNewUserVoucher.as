package com.playata.application.ui.dialogs
{
   import com.playata.application.data.GameUtil;
   import com.playata.application.data.voucher.UserVoucher;
   import com.playata.application.data.voucher.VoucherReward;
   import com.playata.application.ui.ViewManager;
   import com.playata.application.ui.elements.generic.button.UiButton;
   import com.playata.application.ui.elements.generic.button.UiTextButton;
   import com.playata.application.ui.elements.generic.dialog.UiDialog;
   import com.playata.application.ui.elements.generic.dialog.UiInfoDialog;
   import com.playata.application.ui.elements.generic.textfield.UiTextTooltip;
   import com.playata.framework.application.Environment;
   import com.playata.framework.application.request.ActionRequestResponse;
   import com.playata.framework.input.InteractionEvent;
   import com.playata.framework.localization.LocText;
   import visuals.ui.dialogs.SymbolDialogNewUserVoucherGeneric;
   
   public class DialogNewUserVoucher extends UiDialog
   {
      
      private static var _isOpen:Boolean = false;
       
      
      private var _btnClose:UiButton = null;
      
      private var _btnRedeem:UiTextButton = null;
      
      private var _voucher:UserVoucher = null;
      
      private var _tooltipQuestEnergyIcon:UiTextTooltip;
      
      private var _tooltipRewardText:UiTextTooltip;
      
      public function DialogNewUserVoucher(param1:UserVoucher)
      {
         _voucher = param1;
         _isOpen = true;
         var _loc2_:SymbolDialogNewUserVoucherGeneric = new SymbolDialogNewUserVoucherGeneric();
         super(_loc2_,false);
         _loc2_.txtDialogTitle.text = LocText.current.text("dialog/new_user_voucher/title");
         _loc2_.txtInfo.text = LocText.current.text("dialog/new_user_voucher/info",_voucher.endDateTime);
         _loc2_.txtVoucherCode.text = _voucher.code;
         _loc2_.txtVoucherCode.selectable = true;
         _btnClose = new UiTextButton(_loc2_.btnClose,LocText.current.text("dialog/new_user_voucher/button_close"),"",onClickClose);
         _btnRedeem = new UiTextButton(_loc2_.btnRedeem,LocText.current.text("dialog/new_user_voucher/button_redeem"),"",onClickRedeem);
         _tooltipQuestEnergyIcon = new UiTextTooltip(_loc2_.iconQuestEnergy,LocText.current.text("dialog/new_user_voucher/quest_energy_tooltip"));
         _tooltipRewardText = new UiTextTooltip(_loc2_.txtReward,"");
         refreshReward(_voucher.reward);
      }
      
      public static function get isOpen() : Boolean
      {
         return _isOpen;
      }
      
      override public function dispose() : void
      {
         _btnClose.dispose();
         _btnClose = null;
         _btnRedeem.dispose();
         _btnRedeem = null;
         super.dispose();
      }
      
      private function refreshReward(param1:VoucherReward) : void
      {
         var _loc2_:SymbolDialogNewUserVoucherGeneric = _vo as SymbolDialogNewUserVoucherGeneric;
         _loc2_.iconQuestEnergy.visible = param1.questEnergy > 0;
         if(_loc2_.iconQuestEnergy.visible)
         {
            _loc2_.txtReward.text = GameUtil.getEnergyString(param1.questEnergy);
            _tooltipRewardText.text = LocText.current.text("dialog/new_user_voucher/quest_energy_tooltip");
         }
         else
         {
            _loc2_.txtReward.text = "";
            _tooltipRewardText.text = "";
         }
      }
      
      private function onClickClose(param1:InteractionEvent) : void
      {
         Environment.application.sendActionRequest("redeemUserVoucherLater",{"code":_voucher.code},handleRequests);
      }
      
      private function onClickRedeem(param1:InteractionEvent) : void
      {
         Environment.application.sendActionRequest("redeemVoucher",{"code":_voucher.code},handleRequests);
      }
      
      override public function close(param1:Function = null) : void
      {
         _isOpen = false;
         super.close(param1);
      }
      
      private function handleRequests(param1:ActionRequestResponse) : void
      {
         var _loc3_:* = null;
         var _loc4_:* = null;
         var _loc2_:* = null;
         var _loc5_:* = param1.action;
         switch(_loc5_)
         {
            case "redeemVoucher":
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
                  close();
               }
               else if(param1.error == "errRedeemVoucherInvalidCode")
               {
                  Environment.panelManager.showDialog(new UiInfoDialog(LocText.current.text("error/redeem_voucher/invalid_code_title"),LocText.current.text("error/redeem_voucher/invalid_code_text"),LocText.current.text("general/button_ok")));
                  close();
               }
               else if(param1.error == "errInvalidateAlreadyRedeemed")
               {
                  Environment.panelManager.showDialog(new UiInfoDialog(LocText.current.text("error/redeem_voucher/already_redeemed_title"),LocText.current.text("error/redeem_voucher/already_redeemed_text"),LocText.current.text("general/button_ok")));
                  close();
               }
               else if(param1.error == "errRedeemInactiveCampaign")
               {
                  Environment.panelManager.showDialog(new UiInfoDialog(LocText.current.text("error/redeem_voucher/inactive_campaign_title"),LocText.current.text("error/redeem_voucher/inactive_campaign_text"),LocText.current.text("general/button_ok")));
                  close();
               }
               else if(param1.error == "errCheckCampaignRequirementsInvalidLevel")
               {
                  Environment.panelManager.showDialog(new UiInfoDialog(LocText.current.text("error/redeem_voucher/invalid_level_title"),LocText.current.text("error/redeem_voucher/invalid_level_text"),LocText.current.text("general/button_ok")));
                  close();
               }
               else if(param1.error == "errCheckCampaignRequirementsInvalidLocale")
               {
                  Environment.panelManager.showDialog(new UiInfoDialog(LocText.current.text("error/redeem_voucher/invalid_locale_title"),LocText.current.text("error/redeem_voucher/invalid_locale_text"),LocText.current.text("general/button_ok")));
                  close();
               }
               else if(param1.error == "errRedeemLimitReached")
               {
                  Environment.panelManager.showDialog(new UiInfoDialog(LocText.current.text("error/redeem_voucher/limit_reached_title"),LocText.current.text("error/redeem_voucher/limit_reached_text"),LocText.current.text("general/button_ok")));
                  close();
               }
               else if(param1.error == "errCheckVoucherRequirementsWrongUser")
               {
                  Environment.panelManager.showDialog(new UiInfoDialog(LocText.current.text("error/redeem_user_voucher/invalid_user_title"),LocText.current.text("error/redeem_user_voucher/invalid_user_text"),LocText.current.text("general/button_ok")));
                  close();
               }
               else if(param1.error == "errRedeemInactiveVoucher")
               {
                  Environment.panelManager.showDialog(new UiInfoDialog(LocText.current.text("error/redeem_user_voucher/inactive_voucher_title"),LocText.current.text("error/redeem_user_voucher/inactive_voucher_text"),LocText.current.text("general/button_ok")));
                  close();
               }
               else
               {
                  Environment.reportError(param1.error,param1.request);
                  close();
               }
               break;
            case "redeemUserVoucherLater":
               if(param1.error == "")
               {
                  ViewManager.instance.baseUserPanel.syncGame();
                  Environment.application.updateData(param1.data);
                  close();
               }
               else if(param1.error == "errRedeemUserVoucherLaterInvalidCode")
               {
                  close();
               }
               else
               {
                  Environment.reportError(param1.error,param1.request);
                  close();
               }
               break;
            default:
               throw new Error("Unsupported request action \'" + param1.action + "\'!");
         }
      }
   }
}
