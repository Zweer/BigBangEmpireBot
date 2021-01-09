package com.playata.application.ui.dialogs
{
   import com.playata.application.data.constants.CConstant;
   import com.playata.application.data.user.User;
   import com.playata.application.ui.elements.generic.button.UiButton;
   import com.playata.application.ui.elements.generic.button.UiTextButton;
   import com.playata.application.ui.elements.generic.checkbox.UiRadioButton;
   import com.playata.application.ui.elements.generic.dialog.UiDialog;
   import com.playata.application.ui.elements.generic.dialog.UiInfoDialog;
   import com.playata.framework.application.Environment;
   import com.playata.framework.application.request.ActionRequestResponse;
   import com.playata.framework.core.util.StringUtil;
   import com.playata.framework.display.ui.controls.TabGroup;
   import com.playata.framework.display.ui.dialogs.Dialog;
   import com.playata.framework.input.InteractionEvent;
   import com.playata.framework.localization.LocText;
   import visuals.ui.dialogs.SymbolDialogOptInMarketingGeneric;
   
   public class DialogOptInMarketing extends UiDialog
   {
       
      
      private var _btnClose:UiButton = null;
      
      private var _btnConfirm:UiTextButton = null;
      
      private var _selectionGroup:TabGroup = null;
      
      private var _rbtnYes:UiRadioButton = null;
      
      private var _rbtnNo:UiRadioButton = null;
      
      public function DialogOptInMarketing()
      {
         var _loc1_:SymbolDialogOptInMarketingGeneric = new SymbolDialogOptInMarketingGeneric();
         super(_loc1_);
         _queued = false;
         _loc1_.txtDialogTitle.text = LocText.current.text("dialog/opt_in_marketing/title");
         _loc1_.txtInfo.text = LocText.current.text("dialog/opt_in_marketing/info",CConstant.account_marketing_opt_in_premium_currency);
         _loc1_.txtYes.text = LocText.current.text("dialog/opt_in_marketing/yes_info");
         _loc1_.txtNo.text = LocText.current.text("dialog/opt_in_marketing/no_info");
         _loc1_.txtEmailCaption.text = LocText.current.text("dialog/opt_in_marketing/email_caption");
         _loc1_.txtInfo.autoFontSize = true;
         _loc1_.txtYes.autoFontSize = true;
         _loc1_.txtNo.autoFontSize = true;
         _selectionGroup = new TabGroup();
         _rbtnYes = new UiRadioButton(_loc1_.rbtnYes,_loc1_.txtYes);
         _rbtnNo = new UiRadioButton(_loc1_.rbtnNo,_loc1_.txtNo);
         _selectionGroup.addTab("yes",_rbtnYes);
         _selectionGroup.addTab("no",_rbtnNo);
         _selectionGroup.onTabSelected.add(onSelectionChanged);
         _loc1_.txtEmailCaption.visible = false;
         _loc1_.inputEmail.visible = false;
         _loc1_.backgroundInputEmail.visible = false;
         _btnClose = new UiButton(_loc1_.btnClose,"",onClickClose);
         _btnConfirm = new UiTextButton(_loc1_.btnConfirm,LocText.current.text("dialog/opt_in_marketing/button_confirm"),"",onClickConfirm);
         _btnConfirm.enabled = false;
      }
      
      override public function dispose() : void
      {
         _btnClose.dispose();
         _btnClose = null;
         _btnConfirm.dispose();
         _btnConfirm = null;
         _rbtnYes.dispose();
         _rbtnYes = null;
         _rbtnNo.dispose();
         _rbtnNo = null;
         super.dispose();
      }
      
      private function onSelectionChanged(param1:String) : void
      {
         var _loc2_:SymbolDialogOptInMarketingGeneric = _vo as SymbolDialogOptInMarketingGeneric;
         _loc2_.txtEmailCaption.visible = param1 == "yes";
         _loc2_.inputEmail.visible = _loc2_.txtEmailCaption.visible;
         _loc2_.backgroundInputEmail.visible = _loc2_.txtEmailCaption.visible;
         _btnConfirm.enabled = _selectionGroup.selectedTab != null;
      }
      
      private function onClickClose(param1:InteractionEvent) : void
      {
         close();
      }
      
      private function onClickConfirm(param1:InteractionEvent) : void
      {
         var _loc2_:SymbolDialogOptInMarketingGeneric = _vo as SymbolDialogOptInMarketingGeneric;
         if(_selectionGroup.selectedTab.id == "yes")
         {
            if(StringUtil.isEmpty(_loc2_.inputEmail.text))
            {
               Environment.panelManager.showDialog(new UiInfoDialog(LocText.current.text("dialog/opt_in_marketing/email_empty_title"),LocText.current.text("dialog/opt_in_marketing/email_empty_text"),LocText.current.text("general/button_ok"),setFocus));
            }
            else
            {
               Environment.application.sendActionRequest("optInUserMarketing",{"email":_loc2_.inputEmail.text},handleRequests);
            }
         }
         else
         {
            close();
         }
      }
      
      private function setFocus() : void
      {
         var _loc1_:SymbolDialogOptInMarketingGeneric = _vo as SymbolDialogOptInMarketingGeneric;
         if(StringUtil.isEmpty(_loc1_.inputEmail.text))
         {
            Dialog.focus = _loc1_.inputEmail;
         }
      }
      
      override public function onEscape() : void
      {
         close();
      }
      
      private function handleRequests(param1:ActionRequestResponse) : void
      {
         var _loc2_:* = param1.action;
         if("optInUserMarketing" !== _loc2_)
         {
            throw new Error("Unsupported request action \'" + param1.action + "\'!");
         }
         if(param1.error == "")
         {
            Environment.panelManager.showDialog(new UiInfoDialog(LocText.current.text("dialog/opt_in_marketing_success/title"),LocText.current.text("dialog/opt_in_marketing_success/text"),LocText.current.text("general/button_ok")));
            User.current.hasMarketingEmail = true;
            close();
         }
         else if(param1.error == "errSetMarketingEmailInvalidEmail")
         {
            Environment.panelManager.showDialog(new UiInfoDialog(LocText.current.text("error/opt_in_marketing/invalid_email_title"),LocText.current.text("error/opt_in_marketing/invalid_email_text"),LocText.current.text("general/button_ok")));
         }
         else
         {
            Environment.reportError(param1.error,param1.request);
         }
      }
   }
}
