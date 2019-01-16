package com.playata.application.ui.dialogs
{
   import com.playata.application.AppEnvironment;
   import com.playata.application.data.user.User;
   import com.playata.application.ui.ViewManager;
   import com.playata.application.ui.elements.generic.button.UiButton;
   import com.playata.application.ui.elements.generic.button.UiTextButton;
   import com.playata.application.ui.elements.generic.dialog.UiDialog;
   import com.playata.application.ui.elements.generic.dialog.UiInfoDialog;
   import com.playata.framework.application.Environment;
   import com.playata.framework.application.request.ActionRequestResponse;
   import com.playata.framework.core.Runtime;
   import com.playata.framework.display.ui.controls.Button;
   import com.playata.framework.input.InteractionEvent;
   import com.playata.framework.localization.LocText;
   import visuals.ui.base.SymbolUiDialogGuildJoinInfoGeneric;
   
   public class DialogGuildJoinInfo extends UiDialog
   {
       
      
      private var _btnJoin:UiTextButton = null;
      
      private var _btnClose:UiButton;
      
      private var _guildId:int = 0;
      
      private var _callback:Function = null;
      
      public function DialogGuildJoinInfo(param1:int, param2:String, param3:Function = null)
      {
         _guildId = param1;
         _callback = param3;
         var _loc4_:SymbolUiDialogGuildJoinInfoGeneric = new SymbolUiDialogGuildJoinInfoGeneric();
         super(_loc4_);
         _queued = false;
         _loc4_.txtTitle.text = LocText.current.text("dialog/join_guild/title");
         _loc4_.txtInfo.text = LocText.current.text("dialog/join_guild/info",param2);
         _btnClose = new UiButton(_loc4_.btnClose,"",onClickClose);
         _btnJoin = new UiTextButton(_loc4_.btnJoin,LocText.current.text("dialog/join_guild/button_join"),"",clickHandleJoin);
      }
      
      override public function dispose() : void
      {
         _btnClose.dispose();
         _btnClose = null;
         _btnJoin.dispose();
         _btnJoin = null;
         _callback = null;
         super.dispose();
      }
      
      private function onClickClose(param1:InteractionEvent) : void
      {
         close();
      }
      
      private function clickHandleJoin(param1:InteractionEvent) : void
      {
         Environment.application.sendActionRequest("joinGuild",{
            "guild_id":_guildId,
            "invitation":false
         },handleRequests);
      }
      
      private function showGuildJoinSuccess() : void
      {
         Environment.panelManager.showDialog(new UiInfoDialog(LocText.current.text("dialog/mail_compose/join_guild/success/title"),LocText.current.text("dialog/mail_compose/join_guild/success/text",User.current.character.guild.name),LocText.current.text("general/button_ok")));
      }
      
      private function handleRequests(param1:ActionRequestResponse) : void
      {
         var _loc2_:* = param1.action;
         if("joinGuild" !== _loc2_)
         {
            throw new Error("Unsupported request action \'" + param1.action + "\'!");
         }
         if(param1.error == "")
         {
            ViewManager.instance.showPanel("guild");
            Environment.application.updateData(param1.data);
            AppEnvironment.friendBar.updateSetting("force_sync_friendbar",true);
            AppEnvironment.friendBar.syncFriendBar();
            close();
            if(_callback != null)
            {
               Runtime.delayFunction(_callback,0.6);
            }
            Runtime.delayFunction(showGuildJoinSuccess,0.8);
         }
         else if(param1.error == "errJoinGuildAlreadyFull")
         {
            Environment.panelManager.showDialog(new UiInfoDialog(LocText.current.text("dialog/mail_compose/join_guild/already_full/title"),LocText.current.text("dialog/mail_compose/join_guild/already_full/text"),LocText.current.text("general/button_ok")));
         }
         else if(param1.error == "errJoinGuildDeleted")
         {
            Environment.panelManager.showDialog(new UiInfoDialog(LocText.current.text("dialog/mail_compose/join_guild/guild_deleted/title"),LocText.current.text("dialog/mail_compose/join_guild/guild_deleted/text"),LocText.current.text("general/button_ok")));
         }
         else if(param1.error == "errJoinGuildAlreadyInGuild")
         {
            Environment.panelManager.showDialog(new UiInfoDialog(LocText.current.text("dialog/mail_compose/join_guild/already_in_guild/title"),LocText.current.text("dialog/mail_compose/join_guild/already_in_guild/text"),LocText.current.text("general/button_ok")));
         }
         else if(param1.error == "errJoinGuildAlreadyMember")
         {
            Environment.panelManager.showDialog(new UiInfoDialog(LocText.current.text("dialog/mail_compose/join_guild/already_member/title"),LocText.current.text("dialog/mail_compose/join_guild/already_member/text"),LocText.current.text("general/button_ok")));
         }
         else if(param1.error == "errJoinGuildInvalidGuild")
         {
            Environment.panelManager.showDialog(new UiInfoDialog(LocText.current.text("dialog/mail_compose/join_guild/invalid_guild/title"),LocText.current.text("dialog/mail_compose/join_guild/invalid_guild/text"),LocText.current.text("general/button_ok")));
         }
         else if(param1.error == "errJoinGuildRequirementsNotMet")
         {
            Environment.panelManager.showDialog(new UiInfoDialog(LocText.current.text("dialog/mail_compose/join_guild/requirements_not_met/title"),LocText.current.text("dialog/mail_compose/join_guild/requirements_not_met/text"),LocText.current.text("general/button_ok")));
         }
         else if(param1.error == "errJoinGuildNotYetAllowed")
         {
            Environment.panelManager.showDialog(new UiInfoDialog(LocText.current.text("dialog/join_guild/join_guild_no_yet_allowed/title"),LocText.current.text("dialog/join_guild/join_guild_no_yet_allowed/text"),LocText.current.text("general/button_ok")));
         }
         else if(param1.error == "errJoinGuildNotOpen")
         {
            Environment.panelManager.showDialog(new UiInfoDialog(LocText.current.text("dialog/join_guild/guild_not_open/title"),LocText.current.text("dialog/join_guild/guild_not_open/text"),LocText.current.text("general/button_ok")));
         }
         else if(param1.error != "errJoinGuildLocked")
         {
            Environment.reportError(param1.error,param1.request);
         }
      }
      
      override public function get defaultButton() : Button
      {
         return _btnJoin;
      }
      
      override public function onEscape() : void
      {
         close();
      }
   }
}
