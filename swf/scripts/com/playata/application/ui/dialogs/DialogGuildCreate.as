package com.playata.application.ui.dialogs
{
   import com.playata.application.data.constants.CConstant;
   import com.playata.application.data.user.User;
   import com.playata.application.ui.ViewManager;
   import com.playata.application.ui.elements.generic.button.UiButton;
   import com.playata.application.ui.elements.generic.button.UiGameCurrencyButton;
   import com.playata.application.ui.elements.generic.checkbox.UiCheckBox;
   import com.playata.application.ui.elements.generic.dialog.UiDialog;
   import com.playata.application.ui.elements.generic.dialog.UiInfoDialog;
   import com.playata.application.ui.elements.generic.textfield.UiTextTooltip;
   import com.playata.framework.application.Environment;
   import com.playata.framework.application.request.ActionRequestResponse;
   import com.playata.framework.core.util.StringUtil;
   import com.playata.framework.display.ui.controls.Button;
   import com.playata.framework.display.ui.dialogs.Dialog;
   import com.playata.framework.input.InteractionEvent;
   import com.playata.framework.localization.LocText;
   import visuals.ui.dialogs.SymbolDialogGuildCreateGeneric;
   
   public class DialogGuildCreate extends UiDialog
   {
       
      
      private var _btnClose:UiButton = null;
      
      private var _btnCreate:UiGameCurrencyButton = null;
      
      private var _checkAcceptMembers:UiCheckBox = null;
      
      private var _tooltipAcceptMembers:UiTextTooltip = null;
      
      public function DialogGuildCreate()
      {
         var _loc1_:SymbolDialogGuildCreateGeneric = new SymbolDialogGuildCreateGeneric();
         super(_loc1_);
         _queued = false;
         _loc1_.txtDialogTitle.text = LocText.current.text("dialog/create_guild/title");
         _loc1_.txtNameCaption.text = LocText.current.text("dialog/create_guild/name_caption");
         _loc1_.txtDescriptionCaption.text = LocText.current.text("dialog/create_guild/description_caption");
         _loc1_.txtAcceptMembers.text = LocText.current.text("dialog/create_guild/accept_members_caption");
         _loc1_.inputDescription.text = LocText.current.text("dialog/create_guild/description_init_text");
         _tooltipAcceptMembers = new UiTextTooltip(_loc1_.txtAcceptMembers,LocText.current.text("dialog/create_guild/accept_members"));
         _btnClose = new UiButton(_loc1_.btnClose,"",onClickClose);
         _btnCreate = new UiGameCurrencyButton(_loc1_.btnCreate,CConstant.guild_creation_cost_game_currency,LocText.current.text("dialog/create_guild/button_create"),"",onClickCreate);
         _checkAcceptMembers = new UiCheckBox(_loc1_.checkAcceptMembers,true,LocText.current.text("dialog/create_guild/accept_members"),null,null,_loc1_.txtAcceptMembers);
         _tabObjects.push(_loc1_.inputName);
         _tabObjects.push(_loc1_.inputDescription);
         _tabObjects.push(_checkAcceptMembers);
         setFocus();
      }
      
      override public function dispose() : void
      {
         _btnClose.dispose();
         _btnClose = null;
         _btnCreate.dispose();
         _btnCreate = null;
         _tooltipAcceptMembers.dispose();
         _tooltipAcceptMembers = null;
         super.dispose();
      }
      
      private function setFocus() : void
      {
         var _loc1_:SymbolDialogGuildCreateGeneric = _vo as SymbolDialogGuildCreateGeneric;
         if(StringUtil.isEmpty(_loc1_.inputName.text))
         {
            Dialog.focus = _loc1_.inputName;
         }
         else if(StringUtil.isEmpty(_loc1_.inputDescription.text))
         {
            Dialog.focus = _loc1_.inputDescription;
         }
      }
      
      private function onClickClose(param1:InteractionEvent) : void
      {
         close();
      }
      
      private function onClickCreate(param1:InteractionEvent) : void
      {
         var _loc2_:SymbolDialogGuildCreateGeneric = _vo as SymbolDialogGuildCreateGeneric;
         if(StringUtil.isEmpty(_loc2_.inputName.text))
         {
            Environment.panelManager.showDialog(new UiInfoDialog(LocText.current.text("general/info"),LocText.current.text("error/dialog/create_guild/empty_name"),LocText.current.text("general/button_ok"),setFocus));
         }
         else
         {
            Environment.application.sendActionRequest("createGuild",{
               "name":_loc2_.inputName.text,
               "description":_loc2_.inputDescription.text,
               "accept_members":_checkAcceptMembers.checked
            },handleRequests);
         }
      }
      
      private function openGuildEmblemDialog() : void
      {
         Environment.panelManager.showDialog(new DialogGuildEmblem(User.current.character.guild));
      }
      
      private function handleRequests(param1:ActionRequestResponse) : void
      {
         var _loc2_:* = param1.action;
         if("createGuild" !== _loc2_)
         {
            throw new Error("Unsupported request action \'" + param1.action + "\'!");
         }
         if(param1.error == "")
         {
            Environment.application.updateData(param1.data);
            close();
            Environment.panelManager.showDialog(new UiInfoDialog(LocText.current.text("dialog/create_guild_success/title"),LocText.current.text("dialog/create_guild_success/text",User.current.character.guild.name),LocText.current.text("general/button_ok"),openGuildEmblemDialog));
         }
         else if(param1.error == "errRemoveGameCurrencyNotEnough")
         {
            ViewManager.instance.showNotEnoughGameCurrencyDialog(_btnCreate.gameCurrencyAmount);
         }
         else if(param1.error == "errCreateProfanityName")
         {
            Environment.panelManager.showDialog(new UiInfoDialog(LocText.current.text("error/guild_name_profanity_title"),LocText.current.text("error/guild_name_profanity_text"),LocText.current.text("general/button_ok")));
         }
         else if(param1.error == "errCreateInvalidName")
         {
            Environment.panelManager.showDialog(new UiInfoDialog(LocText.current.text("error/guild_invalid_name_title"),LocText.current.text("error/guild_invalid_name_text",CConstant.guild_name_length_min,CConstant.guild_name_length_max),LocText.current.text("general/button_ok")));
         }
         else if(param1.error == "errCreateNameAlreadyExists")
         {
            Environment.panelManager.showDialog(new UiInfoDialog(LocText.current.text("error/guild_already_exists_title"),LocText.current.text("error/guild_already_exists_text"),LocText.current.text("general/button_ok")));
         }
         else
         {
            Environment.reportError(param1.error,param1.request);
         }
      }
      
      override public function get defaultButton() : Button
      {
         return _btnCreate;
      }
      
      override public function onEscape() : void
      {
         close();
      }
   }
}
