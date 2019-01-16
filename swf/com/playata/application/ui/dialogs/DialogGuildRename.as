package com.playata.application.ui.dialogs
{
   import com.playata.application.data.constants.CConstant;
   import com.playata.application.messaging.Message;
   import com.playata.application.messaging.MessageRouter;
   import com.playata.application.ui.ViewManager;
   import com.playata.application.ui.elements.generic.button.UiButton;
   import com.playata.application.ui.elements.generic.button.UiPremiumButton;
   import com.playata.application.ui.elements.generic.dialog.UiDialog;
   import com.playata.application.ui.elements.generic.dialog.UiInfoDialog;
   import com.playata.framework.application.Environment;
   import com.playata.framework.application.request.ActionRequestResponse;
   import com.playata.framework.core.Runtime;
   import com.playata.framework.core.util.StringUtil;
   import com.playata.framework.display.ui.controls.Button;
   import com.playata.framework.display.ui.dialogs.Dialog;
   import com.playata.framework.input.InteractionEvent;
   import com.playata.framework.localization.LocText;
   import visuals.ui.dialogs.SymbolDialogGuildRenameGeneric;
   
   public class DialogGuildRename extends UiDialog
   {
       
      
      private var _btnClose:UiButton = null;
      
      private var _btnRename:UiPremiumButton = null;
      
      public function DialogGuildRename()
      {
         var _loc2_:SymbolDialogGuildRenameGeneric = new SymbolDialogGuildRenameGeneric();
         super(_loc2_);
         _queued = false;
         _loc2_.txtDialogTitle.text = LocText.current.text("dialog/guild_rename/title");
         _loc2_.txtInfo.text = LocText.current.text("dialog/guild_rename/info_text");
         _loc2_.txtNameCaption.text = LocText.current.text("dialog/guild_rename/name_caption");
         _btnClose = new UiButton(_loc2_.btnClose,"",onClickClose);
         _btnRename = new UiPremiumButton(_loc2_.btnRename,CConstant.guild_rename_premium_currency_amount,"",LocText.current.text("dialog/guild_rename/button_rename"),"","",onClickRename);
         _btnRename.premium = true;
         var _loc1_:* = 7;
         _btnRename.realContent.caption.x = _btnRename.realContent.caption.x - _loc1_;
         _btnRename.realContent.iconPremiumCurrency.x = _btnRename.realContent.iconPremiumCurrency.x - _loc1_;
         _btnRename.realContent.cost.x = _btnRename.realContent.cost.x - _loc1_;
         _tabObjects.push(_loc2_.inputName);
         setFocus();
         MessageRouter.addListener("ViewMessage.notifyNeededGuildDonationMade",handleMessages);
      }
      
      override public function dispose() : void
      {
         MessageRouter.removeAllListeners(handleMessages);
         _btnClose.dispose();
         _btnClose = null;
         _btnRename.dispose();
         _btnRename = null;
         super.dispose();
      }
      
      private function setFocus() : void
      {
         var _loc1_:SymbolDialogGuildRenameGeneric = _vo as SymbolDialogGuildRenameGeneric;
         if(StringUtil.isEmpty(_loc1_.inputName.text))
         {
            Dialog.focus = _loc1_.inputName;
         }
      }
      
      private function onClickClose(param1:InteractionEvent) : void
      {
         close();
      }
      
      private function onClickRename(param1:InteractionEvent) : void
      {
         var _loc2_:SymbolDialogGuildRenameGeneric = _vo as SymbolDialogGuildRenameGeneric;
         if(StringUtil.isEmpty(_loc2_.inputName.text))
         {
            Environment.panelManager.showDialog(new UiInfoDialog(LocText.current.text("general/info"),LocText.current.text("error/dialog/guild_rename/empty_name"),LocText.current.text("general/button_ok"),setFocus));
         }
         else
         {
            renameGuild();
         }
      }
      
      private function renameGuild() : void
      {
         var _loc1_:SymbolDialogGuildRenameGeneric = _vo as SymbolDialogGuildRenameGeneric;
         Environment.application.sendActionRequest("renameGuild",{"name":_loc1_.inputName.text},handleRequests);
      }
      
      private function closeDialog() : void
      {
         close();
      }
      
      private function handleRequests(param1:ActionRequestResponse) : void
      {
         var _loc2_:* = null;
         var _loc3_:* = param1.action;
         if("renameGuild" !== _loc3_)
         {
            throw new Error("Unsupported request action \'" + param1.action + "\'!");
         }
         _btnRename.buttonEnabled = true;
         if(param1.error == "")
         {
            Environment.application.updateData(param1.data);
            close();
            _loc2_ = _vo as SymbolDialogGuildRenameGeneric;
            Environment.panelManager.showDialog(new UiInfoDialog(LocText.current.text("dialog/guild_rename/success_title"),LocText.current.text("dialog/guild_rename/success_text",_loc2_.inputName.text),LocText.current.text("general/button_ok")));
         }
         else if(param1.error == "errRenameGuildNoPermission")
         {
            Environment.panelManager.showDialog(new UiInfoDialog(LocText.current.text("dialog/guild_rename/no_permission_title"),LocText.current.text("dialog/guild_rename/no_permission_text"),LocText.current.text("general/button_ok")));
         }
         else if(param1.error == "errRemovePremiumCurrencyNotEnough")
         {
            ViewManager.instance.showGuildNotEnoughGameCurrencyPremiumCurrencyDialog(0,CConstant.guild_rename_premium_currency_amount,closeDialog);
         }
         else if(param1.error == "errRenameSameName")
         {
            Environment.panelManager.showDialog(new UiInfoDialog(LocText.current.text("dialog/guild_rename/same_name_title"),LocText.current.text("dialog/guild_rename/same_name_text"),LocText.current.text("general/button_ok")));
         }
         else if(param1.error == "errRenameInvalidName")
         {
            Environment.panelManager.showDialog(new UiInfoDialog(LocText.current.text("error/guild_invalid_name_title"),LocText.current.text("error/guild_invalid_name_text",CConstant.guild_name_length_min,CConstant.guild_name_length_max),LocText.current.text("general/button_ok")));
         }
         else if(param1.error == "errRenameNameAlreadyExists")
         {
            Environment.panelManager.showDialog(new UiInfoDialog(LocText.current.text("error/guild_already_exists_title"),LocText.current.text("error/guild_already_exists_text"),LocText.current.text("general/button_ok")));
         }
         else
         {
            Environment.reportError(param1.error,param1.request);
         }
      }
      
      private function handleMessages(param1:Message) : void
      {
         var _loc2_:* = param1.type;
         if("ViewMessage.notifyNeededGuildDonationMade" !== _loc2_)
         {
            throw new Error("Encountered unknown message type! type=" + param1.type);
         }
         _btnRename.buttonEnabled = false;
         Runtime.delayFunction(renameGuild,0.3);
      }
      
      override public function get defaultButton() : Button
      {
         return _btnRename;
      }
      
      override public function onEscape() : void
      {
         close();
      }
   }
}
