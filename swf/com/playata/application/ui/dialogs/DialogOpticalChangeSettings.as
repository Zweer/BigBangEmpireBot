package com.playata.application.ui.dialogs
{
   import com.playata.application.data.optical_changes.OpticalChanges;
   import com.playata.application.data.user.User;
   import com.playata.application.ui.elements.generic.button.UiButton;
   import com.playata.application.ui.elements.generic.button.UiTextButton;
   import com.playata.application.ui.elements.generic.checkbox.UiCheckBox;
   import com.playata.application.ui.elements.generic.dialog.UiDialog;
   import com.playata.framework.application.Environment;
   import com.playata.framework.application.request.ActionRequestResponse;
   import com.playata.framework.input.InteractionEvent;
   import com.playata.framework.localization.LocText;
   import visuals.ui.dialogs.SymbolDialogOpticalChangeSettingsGeneric;
   
   public class DialogOpticalChangeSettings extends UiDialog
   {
       
      
      private var _btnClose:UiButton = null;
      
      private var _btnSave:UiTextButton = null;
      
      private var _ckbQuests:UiCheckBox = null;
      
      private var _ckbDuel:UiCheckBox = null;
      
      private var _ckbBank:UiCheckBox = null;
      
      public function DialogOpticalChangeSettings()
      {
         var _loc1_:SymbolDialogOpticalChangeSettingsGeneric = new SymbolDialogOpticalChangeSettingsGeneric();
         super(_loc1_);
         _queued = false;
         _loc1_.txtDialogTitle.text = LocText.current.text("dialog/optical_change_settings/title");
         _loc1_.txtQuests.text = LocText.current.text("dialog/optical_change_settings/use_for_quests");
         _ckbQuests = new UiCheckBox(_loc1_.checkQuests,OpticalChanges.instance.useForQuest,LocText.current.text("dialog/optical_change_settings/use_for_quests_tooltip"),onSettingChanged,null,_loc1_.txtQuests);
         _loc1_.txtDuel.text = LocText.current.text("dialog/optical_change_settings/use_for_duel");
         _ckbDuel = new UiCheckBox(_loc1_.checkDuel,OpticalChanges.instance.useForDuel,LocText.current.text("dialog/optical_change_settings/use_for_duel_tooltip"),onSettingChanged,null,_loc1_.txtDuel);
         _loc1_.txtBank.text = LocText.current.text("dialog/optical_change_settings/move_items_to_bank");
         _ckbBank = new UiCheckBox(_loc1_.checkBank,User.current.getBooleanSettingValue("movie_optical_changes_to_bank"),LocText.current.text("dialog/optical_change_settings/move_items_to_bank_tooltip"),onSettingChanged,null,_loc1_.txtBank);
         _btnSave = new UiTextButton(_loc1_.btnSave,LocText.current.text("dialog/guild_battle_tactics/button_apply"),"",onClickSave);
         _btnSave.enabled = false;
         _btnClose = new UiButton(_loc1_.btnClose,"",onClickClose);
      }
      
      override public function dispose() : void
      {
         _btnClose.dispose();
         _btnClose = null;
         _btnSave.dispose();
         _btnSave = null;
         _ckbQuests.dispose();
         _ckbQuests = null;
         _ckbDuel.dispose();
         _ckbDuel = null;
         _ckbBank.dispose();
         _ckbBank = null;
         super.dispose();
      }
      
      private function onClickClose(param1:InteractionEvent) : void
      {
         close();
      }
      
      private function onClickSave(param1:InteractionEvent) : void
      {
         if(!_btnSave.enabled)
         {
            return;
         }
         if(_ckbQuests.checked != OpticalChanges.instance.useForQuest || _ckbDuel.checked != OpticalChanges.instance.useForDuel)
         {
            Environment.application.sendActionRequest("updateOpticalChangeSettings",{
               "useForQuest":_ckbQuests.checked,
               "useForDuel":_ckbDuel.checked
            },handleRequests);
         }
         if(_ckbBank.checked != User.current.getBooleanSettingValue("movie_optical_changes_to_bank"))
         {
            User.current.setSettingValue("movie_optical_changes_to_bank",_ckbBank.checked);
         }
         close();
      }
      
      private function onSettingChanged(param1:Boolean) : void
      {
         _btnSave.enabled = _ckbQuests.checked != OpticalChanges.instance.useForQuest || _ckbDuel.checked != OpticalChanges.instance.useForDuel || _ckbBank.checked != User.current.getBooleanSettingValue("movie_optical_changes_to_bank");
      }
      
      private function handleRequests(param1:ActionRequestResponse) : void
      {
         var _loc2_:* = param1.action;
         if("updateOpticalChangeSettings" !== _loc2_)
         {
            throw new Error("Unsupported request action \'" + param1.action + "\'!");
         }
         if(param1.error == "")
         {
            Environment.application.updateData(param1.data);
         }
         else
         {
            Environment.reportError(param1.error,param1.request);
         }
      }
      
      override public function onEscape() : void
      {
         close();
      }
   }
}
