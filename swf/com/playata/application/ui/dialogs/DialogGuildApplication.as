package com.playata.application.ui.dialogs
{
   import com.playata.application.ui.elements.generic.button.UiButton;
   import com.playata.application.ui.elements.generic.button.UiTextButton;
   import com.playata.application.ui.elements.generic.dialog.UiDialog;
   import com.playata.application.ui.elements.generic.dialog.UiInfoDialog;
   import com.playata.application.ui.elements.generic.scrollbar.UiScrollBar;
   import com.playata.framework.application.Environment;
   import com.playata.framework.application.request.ActionRequestResponse;
   import com.playata.framework.core.util.StringUtil;
   import com.playata.framework.display.ui.dialogs.Dialog;
   import com.playata.framework.input.InteractionEvent;
   import com.playata.framework.localization.LocText;
   import visuals.ui.dialogs.SymbolDialogGuildApplicationGeneric;
   
   public class DialogGuildApplication extends UiDialog
   {
       
      
      private var _btnClose:UiButton = null;
      
      private var _btnSend:UiTextButton = null;
      
      private var _scrollBar:UiScrollBar = null;
      
      private var _guildId:int = 0;
      
      private var _guildName:String = null;
      
      public function DialogGuildApplication(param1:int, param2:String)
      {
         _guildId = param1;
         _guildName = param2;
         var _loc3_:SymbolDialogGuildApplicationGeneric = new SymbolDialogGuildApplicationGeneric();
         super(_loc3_);
         _queued = false;
         _loc3_.txtDialogTitle.text = LocText.current.text("screen/guild/guild_info/apply_mail_subject_text",_guildName);
         _loc3_.txtMessageCaption.text = LocText.current.text("dialog/mail_compose/message_caption");
         _loc3_.inputMessage.text = LocText.current.text("screen/guild/guild_info/apply_mail_body_text");
         _btnClose = new UiButton(_loc3_.btnClose,"",onClickClose);
         _btnSend = new UiTextButton(_loc3_.btnSend,LocText.current.text("dialog/mail_compose/button_send"),"",onClickSend);
         _tabObjects.push(_loc3_.inputMessage);
         _scrollBar = new UiScrollBar(_loc3_.scrollKnob,_loc3_.scrollLine,_loc3_.inputMessage);
         _loc3_.inputMessage.verticalScrollBar = _scrollBar;
         setFocus();
      }
      
      override public function dispose() : void
      {
         _btnClose.dispose();
         _btnClose = null;
         _btnSend.dispose();
         _btnSend = null;
         _scrollBar.dispose();
         _scrollBar = null;
         super.dispose();
      }
      
      private function setFocus() : void
      {
         var _loc1_:SymbolDialogGuildApplicationGeneric = _vo as SymbolDialogGuildApplicationGeneric;
         if(StringUtil.isEmpty(_loc1_.inputMessage.text))
         {
            Dialog.focus = _loc1_.inputMessage;
         }
      }
      
      private function onClickClose(param1:InteractionEvent) : void
      {
         close();
      }
      
      private function onClickSend(param1:InteractionEvent) : void
      {
         var _loc2_:SymbolDialogGuildApplicationGeneric = _vo as SymbolDialogGuildApplicationGeneric;
         if(StringUtil.isEmpty(_loc2_.inputMessage.text))
         {
            Environment.panelManager.showDialog(new UiInfoDialog(LocText.current.text("dialog/mail_compose/message_empty_title"),LocText.current.text("dialog/mail_compose/message_empty_text"),LocText.current.text("general/button_ok"),setFocus));
         }
         else
         {
            Environment.application.sendActionRequest("createGuildApplication",{
               "message":_loc2_.inputMessage.text,
               "guild_id":_guildId
            },handleRequests);
         }
      }
      
      private function handleRequests(param1:ActionRequestResponse) : void
      {
         var _loc2_:* = param1.action;
         if("createGuildApplication" !== _loc2_)
         {
            throw new Error("Unsupported request action \'" + param1.action + "\'!");
         }
         if(param1.error == "")
         {
            Environment.application.updateData(param1.data);
            close();
         }
         else if(param1.error == "errCreateGuildApplicationInvalidGuild")
         {
            Environment.panelManager.showDialog(new UiInfoDialog(LocText.current.text("dialog/mail_compose/invalid_guild_title"),LocText.current.text("dialog/mail_compose/invalid_guild_text"),LocText.current.text("general/button_ok")));
         }
         else if(param1.error == "errCreateGuildApplicationIgnoredByGuildLeader")
         {
            Environment.panelManager.showDialog(new UiInfoDialog(LocText.current.text("dialog/guild_application/ignored_by_guild_leader_title"),LocText.current.text("dialog/guild_application/ignored_by_guild_leader_text"),LocText.current.text("general/button_ok")));
         }
         else
         {
            Environment.reportError(param1.error,param1.request);
         }
      }
      
      override public function onEscape() : void
      {
         onClickClose(null);
      }
   }
}
