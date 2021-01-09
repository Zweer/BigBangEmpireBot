package com.playata.application.ui.dialogs
{
   import com.playata.application.data.guild.Guild;
   import com.playata.application.ui.elements.generic.button.UiButton;
   import com.playata.application.ui.elements.generic.button.UiTextButton;
   import com.playata.application.ui.elements.generic.dialog.UiDialog;
   import com.playata.application.ui.elements.generic.dialog.UiInfoDialog;
   import com.playata.application.ui.elements.generic.scrollbar.UiScrollBar;
   import com.playata.application.ui.elements.generic.textfield.UiTextTooltip;
   import com.playata.application.ui.elements.guild.UiGuildChatTab;
   import com.playata.framework.application.Environment;
   import com.playata.framework.application.request.ActionRequestResponse;
   import com.playata.framework.display.ui.controls.IScrollable;
   import com.playata.framework.display.ui.controls.ITextField;
   import com.playata.framework.display.ui.dialogs.Dialog;
   import com.playata.framework.input.InteractionEvent;
   import com.playata.framework.localization.LocText;
   import visuals.ui.dialogs.SymbolDialogGuildDescriptionNoteGeneric;
   
   public class DialogGuildOfficerNote extends UiDialog
   {
       
      
      private var _btnClose:UiButton = null;
      
      private var _btnSave:UiTextButton = null;
      
      private var _scrollBar:UiScrollBar = null;
      
      private var _tooltipGuildPage:UiTextTooltip = null;
      
      public function DialogGuildOfficerNote(param1:Guild)
      {
         var _loc2_:int = 0;
         var _loc3_:SymbolDialogGuildDescriptionNoteGeneric = new SymbolDialogGuildDescriptionNoteGeneric();
         super(_loc3_);
         _queued = false;
         _btnClose = new UiButton(_loc3_.btnClose,"",onClickClose);
         _btnSave = new UiTextButton(_loc3_.btnSave,LocText.current.text("dialog/guild_description/button_save"),"",onClickSave);
         _loc3_.txtText.text = "";
         _loc3_.inputText.text = "";
         var _loc5_:ITextField = _loc3_.inputText;
         var _loc4_:IScrollable = _loc3_.inputText;
         _loc3_.inputText.readOnly = false;
         _loc3_.txtDialogTitle.text = LocText.current.text("dialog/guild_officer_note/title");
         _loc5_.text = param1.officerNote;
         _btnSave.visible = true;
         _loc3_.txtGuildPageLink.visible = false;
         _loc3_.inputGuildPageLink.visible = false;
         _loc3_.backgroundGuildPage.visible = false;
         _loc3_.inputText.visible = _loc5_ == _loc3_.inputText;
         _loc3_.txtText.visible = _loc5_ == _loc3_.txtText;
         _scrollBar = new UiScrollBar(_loc3_.scrollKnob,_loc3_.scrollLine,_loc4_);
         _loc4_.verticalScrollBar = _scrollBar;
         _scrollBar.refresh();
         if(Environment.info.isNativeMobile)
         {
            _loc5_.width = _loc5_.width + 15;
         }
         _tabObjects.push(_loc5_);
         if(_loc3_.inputGuildPageLink.visible)
         {
            _tabObjects.push(_loc3_.inputGuildPageLink);
         }
         if(!Environment.info.isTouchScreen)
         {
            setFocus();
         }
         if(Environment.info.isNativeMobile)
         {
            _loc3_.inputText.readOnly = true;
            _btnSave.visible = true;
            _btnSave.caption = LocText.current.text("dialog/guild_description/button_edit");
            _loc3_.inputText.visible = false;
            _loc3_.txtText.visible = true;
            _loc2_ = 19000;
            if(_loc3_.inputText.text.length > _loc2_)
            {
               _loc3_.txtText.text = _loc3_.inputText.text.substr(0,_loc2_) + LocText.current.text("dialog/guild_note/to_long_for_mobile");
            }
            else
            {
               _loc3_.txtText.text = _loc3_.inputText.text;
            }
         }
      }
      
      override public function dispose() : void
      {
         _btnClose.dispose();
         _btnClose = null;
         _btnSave.dispose();
         _btnSave = null;
         _scrollBar.dispose();
         _scrollBar = null;
         if(_tooltipGuildPage)
         {
            _tooltipGuildPage.dispose();
            _tooltipGuildPage = null;
         }
         super.dispose();
      }
      
      private function onClickClose(param1:InteractionEvent) : void
      {
         close();
      }
      
      private function onClickSave(param1:InteractionEvent) : void
      {
         var _loc2_:SymbolDialogGuildDescriptionNoteGeneric = _vo as SymbolDialogGuildDescriptionNoteGeneric;
         if(_loc2_.inputText.readOnly)
         {
            _loc2_.inputText.readOnly = false;
            _btnSave.caption = LocText.current.text("dialog/guild_description/button_save");
            _loc2_.inputText.visible = true;
            _loc2_.txtText.visible = false;
            setFocus();
            return;
         }
         Environment.application.sendActionRequest("setGuildOfficerNote",{"officer_note":_loc2_.inputText.text},handleRequests);
      }
      
      private function setFocus() : void
      {
         var _loc1_:SymbolDialogGuildDescriptionNoteGeneric = _vo as SymbolDialogGuildDescriptionNoteGeneric;
         Dialog.focus = _loc1_.inputText;
      }
      
      private function handleRequests(param1:ActionRequestResponse) : void
      {
         var _loc2_:* = param1.action;
         if("setGuildOfficerNote" !== _loc2_)
         {
            throw new Error("Unsupported request action \'" + param1.action + "\'!");
         }
         if(param1.error == "")
         {
            Environment.application.updateData(param1.data);
            close();
            UiGuildChatTab.instance.refreshGuildLog();
         }
         else if(param1.error == "errSetOfficerNoteInvalidGuild")
         {
            Environment.panelManager.showDialog(new UiInfoDialog(LocText.current.text("dialog/guild_set_officer_note_invalid_guild/title"),LocText.current.text("dialog/guild_set_officer_note_invalid_guild/text"),LocText.current.text("general/button_ok")));
         }
         else if(param1.error == "errSetOfficerNoteNoPermission")
         {
            Environment.panelManager.showDialog(new UiInfoDialog(LocText.current.text("dialog/guild_set_officer_note_no_permission/title"),LocText.current.text("dialog/guild_set_officer_note_no_permission/text"),LocText.current.text("general/button_ok")));
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
