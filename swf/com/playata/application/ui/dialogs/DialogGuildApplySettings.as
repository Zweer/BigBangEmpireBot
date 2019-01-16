package com.playata.application.ui.dialogs
{
   import com.playata.application.data.guild.Guild;
   import com.playata.application.data.user.User;
   import com.playata.application.ui.elements.generic.button.UiButton;
   import com.playata.application.ui.elements.generic.button.UiTextButton;
   import com.playata.application.ui.elements.generic.checkbox.UiCheckBox;
   import com.playata.application.ui.elements.generic.dialog.UiDialog;
   import com.playata.framework.application.Environment;
   import com.playata.framework.application.request.ActionRequestResponse;
   import com.playata.framework.core.util.StringUtil;
   import com.playata.framework.display.ui.controls.ITextInput;
   import com.playata.framework.input.InteractionEvent;
   import com.playata.framework.localization.LocText;
   import visuals.ui.dialogs.SymbolDialogGuildApplySettingsGeneric;
   
   public class DialogGuildApplySettings extends UiDialog
   {
       
      
      private var _btnClose:UiButton = null;
      
      private var _btnApply:UiTextButton = null;
      
      private var _ckbLevel:UiCheckBox = null;
      
      private var _ckbHonor:UiCheckBox = null;
      
      private var _ckbOpen:UiCheckBox = null;
      
      private var _ckbOpenMail:UiCheckBox = null;
      
      private var _oldMinApplyLevel:int = 0;
      
      private var _oldMinApplyHonor:int = 0;
      
      private var _oldIsOpen:Boolean = false;
      
      private var _oldIsOpenMail:Boolean = false;
      
      public function DialogGuildApplySettings()
      {
         var _loc3_:SymbolDialogGuildApplySettingsGeneric = new SymbolDialogGuildApplySettingsGeneric();
         super(_loc3_);
         _loc3_.txtDialogTitle.text = LocText.current.text("dialog/guild_apply_settings/title");
         _loc3_.txtLevel.text = LocText.current.text("dialog/guild_apply_settings/option_level");
         _loc3_.txtHonor.text = LocText.current.text("dialog/guild_apply_settings/option_honor");
         _loc3_.txtOpen.text = LocText.current.text("dialog/guild_apply_settings/option_open");
         _loc3_.txtOpenMail.text = LocText.current.text("dialog/guild_apply_settings/option_open_mail");
         _loc3_.txtOpen.autoFontSize = true;
         _loc3_.txtOpenMail.autoFontSize = true;
         var _loc2_:String = "";
         if(User.current.character.guildRank == 3)
         {
            _loc2_ = LocText.current.text("dialog/guild_apply_settings/no_permission_tooltip");
         }
         var _loc1_:Guild = User.current.character.guild;
         _ckbLevel = new UiCheckBox(_loc3_.checkLevel,_loc1_.hasMinApplyLevel,_loc2_,onChangeLevel,null,_loc3_.txtLevel);
         _ckbHonor = new UiCheckBox(_loc3_.checkHonor,_loc1_.hasMinApplyHonor,_loc2_,onChangeHonor,null,_loc3_.txtHonor);
         _ckbOpen = new UiCheckBox(_loc3_.checkOpen,_loc1_.applyOpen,_loc2_,onChangeOpen,null,_loc3_.txtOpen);
         _ckbOpenMail = new UiCheckBox(_loc3_.checkOpenMail,_loc1_.applyOpenMail,_loc2_,onChangeOpenMail,null,_loc3_.txtOpenMail);
         onChangeLevel(_loc1_.hasMinApplyLevel);
         onChangeHonor(_loc1_.hasMinApplyHonor);
         onChangeOpen(_loc1_.applyOpen);
         onChangeOpenMail(_loc1_.applyOpenMail);
         _oldMinApplyLevel = _loc1_.minApplyLevel;
         _oldMinApplyHonor = _loc1_.minApplyHonor;
         _oldIsOpen = _loc1_.applyOpen;
         _oldIsOpenMail = _loc1_.applyOpenMail;
         _ckbLevel.enabled = User.current.character.guildRank != 3;
         _ckbHonor.enabled = User.current.character.guildRank != 3;
         _ckbOpen.enabled = User.current.character.guildRank != 3;
         _ckbOpenMail.enabled = User.current.character.guildRank != 3 && _ckbOpen.checked;
         _loc3_.inputLevel.onChange.add(onInputChangedLevel);
         _loc3_.inputLevel.maxChars = 7;
         _loc3_.inputHonor.onChange.add(onInputChangedHonor);
         _loc3_.inputHonor.maxChars = 7;
         _btnClose = new UiButton(_loc3_.btnClose,"",onClickClose);
         _btnApply = new UiTextButton(_loc3_.btnApply,LocText.current.text("dialog/guild_apply_settings/button_apply"),"",onClickApply);
      }
      
      override public function dispose() : void
      {
         _btnClose.dispose();
         _btnClose = null;
         _ckbLevel.dispose();
         _ckbLevel = null;
         _ckbHonor.dispose();
         _ckbHonor = null;
         _ckbOpen.dispose();
         _ckbOpen = null;
         _ckbOpenMail.dispose();
         _ckbOpenMail = null;
         super.dispose();
      }
      
      private function onChangeOpen(param1:Boolean) : void
      {
         _ckbOpenMail.enabled = User.current.character.guildRank != 3 && _ckbOpen.checked;
         var _loc2_:SymbolDialogGuildApplySettingsGeneric = _vo as SymbolDialogGuildApplySettingsGeneric;
         if(param1)
         {
            _loc2_.txtOpenMail.alpha = 1;
         }
         else
         {
            _loc2_.txtOpenMail.alpha = 0.5;
         }
      }
      
      private function onChangeOpenMail(param1:Boolean) : void
      {
      }
      
      private function onChangeLevel(param1:Boolean) : void
      {
         var _loc2_:SymbolDialogGuildApplySettingsGeneric = _vo as SymbolDialogGuildApplySettingsGeneric;
         if(param1)
         {
            _loc2_.inputLevel.text = User.current.character.guild.minApplyLevel.toString();
            _loc2_.inputLevel.readOnly = false;
            _loc2_.inputLevel.alpha = 1;
         }
         else
         {
            _loc2_.inputLevel.text = "0";
            _loc2_.inputLevel.readOnly = true;
            _loc2_.inputLevel.alpha = 0.5;
         }
      }
      
      private function onChangeHonor(param1:Boolean) : void
      {
         var _loc2_:SymbolDialogGuildApplySettingsGeneric = _vo as SymbolDialogGuildApplySettingsGeneric;
         if(param1)
         {
            _loc2_.inputHonor.text = User.current.character.guild.minApplyHonor.toString();
            _loc2_.inputHonor.readOnly = false;
            _loc2_.inputHonor.alpha = 1;
         }
         else
         {
            _loc2_.inputHonor.text = "0";
            _loc2_.inputHonor.readOnly = true;
            _loc2_.inputHonor.alpha = 0.5;
         }
      }
      
      private function onInputChangedLevel(param1:ITextInput) : void
      {
         var _loc2_:SymbolDialogGuildApplySettingsGeneric = _vo as SymbolDialogGuildApplySettingsGeneric;
         if(isNaN(parseInt(_loc2_.inputLevel.text)))
         {
            _loc2_.inputLevel.text = "0";
         }
         else
         {
            _loc2_.inputLevel.text = Math.max(0,parseInt(_loc2_.inputLevel.text)).toString();
         }
      }
      
      private function onInputChangedHonor(param1:ITextInput) : void
      {
         var _loc2_:SymbolDialogGuildApplySettingsGeneric = _vo as SymbolDialogGuildApplySettingsGeneric;
         if(isNaN(parseInt(_loc2_.inputHonor.text)))
         {
            _loc2_.inputHonor.text = "0";
         }
         else
         {
            _loc2_.inputHonor.text = Math.max(0,parseInt(_loc2_.inputHonor.text)).toString();
         }
      }
      
      private function get minApplyLevel() : int
      {
         var _loc1_:SymbolDialogGuildApplySettingsGeneric = _vo as SymbolDialogGuildApplySettingsGeneric;
         if(StringUtil.isEmpty(_loc1_.inputLevel.text))
         {
            return 0;
         }
         var _loc2_:int = parseInt(_loc1_.inputLevel.text);
         if(isNaN(_loc2_) || _loc2_ < 0)
         {
            return 0;
         }
         return _loc2_;
      }
      
      private function get minApplyHonor() : int
      {
         var _loc1_:SymbolDialogGuildApplySettingsGeneric = _vo as SymbolDialogGuildApplySettingsGeneric;
         if(StringUtil.isEmpty(_loc1_.inputHonor.text))
         {
            return 0;
         }
         var _loc2_:int = parseInt(_loc1_.inputHonor.text);
         if(isNaN(_loc2_) || _loc2_ < 0)
         {
            return 0;
         }
         return _loc2_;
      }
      
      private function onClickApply(param1:InteractionEvent) : void
      {
         if(_oldMinApplyLevel != minApplyLevel || _oldMinApplyHonor != minApplyHonor || _oldIsOpen != _ckbOpen.checked || _oldIsOpenMail != _ckbOpenMail.checked)
         {
            Environment.application.sendActionRequest("setGuildApplySettings",{
               "level":minApplyLevel,
               "honor":minApplyHonor,
               "open":_ckbOpen.checked,
               "open_mail":_ckbOpenMail.checked
            },handleRequests);
         }
         else
         {
            close();
         }
      }
      
      private function handleRequests(param1:ActionRequestResponse) : void
      {
         var _loc2_:* = param1.action;
         if("setGuildApplySettings" !== _loc2_)
         {
            throw new Error("Unsupported request action \'" + param1.action + "\'!");
         }
         if(param1.error == "")
         {
            Environment.application.updateData(param1.data);
            close();
         }
         else
         {
            Environment.reportError(param1.error,param1.request);
         }
      }
      
      private function onClickClose(param1:InteractionEvent) : void
      {
         close();
      }
      
      override public function onEscape() : void
      {
         close();
      }
   }
}
