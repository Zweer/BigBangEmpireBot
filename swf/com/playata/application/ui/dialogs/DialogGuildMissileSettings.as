package com.playata.application.ui.dialogs
{
   import com.playata.application.data.guild.Guild;
   import com.playata.application.data.user.User;
   import com.playata.application.ui.elements.generic.button.UiButton;
   import com.playata.application.ui.elements.generic.checkbox.UiCheckBox;
   import com.playata.application.ui.elements.generic.dialog.UiDialog;
   import com.playata.framework.application.Environment;
   import com.playata.framework.application.request.ActionRequestResponse;
   import com.playata.framework.input.InteractionEvent;
   import com.playata.framework.localization.LocText;
   import visuals.ui.dialogs.SymbolDialogGuildMissileSettingsGeneric;
   
   public class DialogGuildMissileSettings extends UiDialog
   {
       
      
      private var _btnClose:UiButton = null;
      
      private var _ckbAttack:UiCheckBox = null;
      
      private var _ckbDefense:UiCheckBox = null;
      
      private var _oldUseGuildBattleAttackMissiles:Boolean = false;
      
      private var _oldUseGuildBattleDefenseMissiles:Boolean = false;
      
      public function DialogGuildMissileSettings()
      {
         var _loc3_:SymbolDialogGuildMissileSettingsGeneric = new SymbolDialogGuildMissileSettingsGeneric();
         super(_loc3_);
         _loc3_.txtDialogTitle.text = LocText.current.text("dialog/guild_missile_settings/title");
         _loc3_.txtInfo.text = LocText.current.text("dialog/guild_missile_settings/info");
         _loc3_.txtAttack.text = LocText.current.text("dialog/guild_missile_settings/option_attack");
         _loc3_.txtDefense.text = LocText.current.text("dialog/guild_missile_settings/option_defense");
         var _loc2_:String = "";
         if(User.current.character.guildRank == 3)
         {
            _loc2_ = LocText.current.text("dialog/guild_missile_settings/no_permission_tooltip");
         }
         var _loc1_:Guild = User.current.character.guild;
         _ckbAttack = new UiCheckBox(_loc3_.checkAttack,_loc1_.useMissilesAttack,_loc2_,null,null,_loc3_.txtAttack);
         _ckbDefense = new UiCheckBox(_loc3_.checkDefense,_loc1_.useMissilesDefense,_loc2_,null,null,_loc3_.txtDefense);
         _oldUseGuildBattleAttackMissiles = _loc1_.useMissilesAttack;
         _oldUseGuildBattleDefenseMissiles = _loc1_.useMissilesDefense;
         _ckbAttack.enabled = User.current.character.guildRank != 3;
         _ckbDefense.enabled = User.current.character.guildRank != 3;
         _btnClose = new UiButton(_loc3_.btnClose,"",onClickClose);
      }
      
      override public function dispose() : void
      {
         _btnClose.dispose();
         _btnClose = null;
         super.dispose();
      }
      
      override public function close(param1:Function = null) : void
      {
         if(_oldUseGuildBattleAttackMissiles != _ckbAttack.checked || _oldUseGuildBattleDefenseMissiles != _ckbDefense.checked)
         {
            Environment.application.sendActionRequest("setGuildMissileUsageSettings",{
               "attack":_ckbAttack.checked,
               "defense":_ckbDefense.checked
            },handleRequests);
         }
         else
         {
            super.close(param1);
         }
      }
      
      private function handleRequests(param1:ActionRequestResponse) : void
      {
         var _loc2_:* = param1.action;
         if("setGuildMissileUsageSettings" !== _loc2_)
         {
            throw new Error("Unsupported request action \'" + param1.action + "\'!");
         }
         if(param1.error == "")
         {
            Environment.application.updateData(param1.data);
            super.close(null);
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
