package com.playata.application.ui.dialogs
{
   import com.playata.application.data.guild.Guild;
   import com.playata.application.data.user.User;
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
   
   public class DialogGuildDescriptionNote extends UiDialog
   {
       
      
      private var _btnClose:UiButton = null;
      
      private var _btnSave:UiTextButton = null;
      
      private var _descriptionMode:Boolean = true;
      
      private var _scrollBar:UiScrollBar = null;
      
      private var _tooltipGuildPage:UiTextTooltip = null;
      
      public function DialogGuildDescriptionNote(param1:Guild, param2:Boolean)
      {
         var _loc4_:int = 0;
         _descriptionMode = param2;
         var _loc5_:SymbolDialogGuildDescriptionNoteGeneric = new SymbolDialogGuildDescriptionNoteGeneric();
         super(_loc5_);
         _queued = false;
         _btnClose = new UiButton(_loc5_.btnClose,"",onClickClose);
         _btnSave = new UiTextButton(_loc5_.btnSave,LocText.current.text("dialog/guild_description/button_save"),"",onClickSave);
         _loc5_.txtText.text = "";
         _loc5_.inputText.text = "";
         var _loc3_:Boolean = param1.isOwnGuild && User.current.character.guildRank != 3;
         var _loc7_:ITextField = _loc3_ || !Environment.info.isNativeMobile?_loc5_.inputText:_loc5_.txtText;
         var _loc6_:IScrollable = _loc3_ || !Environment.info.isNativeMobile?_loc5_.inputText:_loc5_.txtText;
         _loc5_.inputText.readOnly = !_loc3_;
         if(_descriptionMode)
         {
            _loc5_.txtDialogTitle.text = LocText.current.text("dialog/guild_description/title");
            _loc7_.text = param1.description;
            _loc5_.txtGuildPageLink.text = LocText.current.text("dialog/guild_description/link_caption");
            _tooltipGuildPage = new UiTextTooltip(_loc5_.inputGuildPageLink,LocText.current.text("dialog/guild_description/link_caption_tooltip"));
            _loc5_.inputGuildPageLink.text = param1.forumPage;
            _loc5_.dialogBackground.height = _loc5_.dialogBackground.height + 45;
            _btnSave.y = _btnSave.y + 45;
         }
         else
         {
            _loc5_.txtDialogTitle.text = LocText.current.text("dialog/guild_note/title");
            _loc7_.text = param1.note;
         }
         _btnSave.visible = _loc3_;
         _loc5_.txtGuildPageLink.visible = _loc3_ && _descriptionMode;
         _loc5_.inputGuildPageLink.visible = _loc3_ && _descriptionMode;
         _loc5_.backgroundGuildPage.visible = _loc3_ && _descriptionMode;
         _loc5_.inputText.visible = _loc7_ == _loc5_.inputText;
         _loc5_.txtText.visible = _loc7_ == _loc5_.txtText;
         _scrollBar = new UiScrollBar(_loc5_.scrollKnob,_loc5_.scrollLine,_loc6_);
         _loc6_.verticalScrollBar = _scrollBar;
         _scrollBar.refresh();
         if(_loc3_ && Environment.info.isNativeMobile)
         {
            _loc7_.width = _loc7_.width + 15;
         }
         if(_loc3_)
         {
            _tabObjects.push(_loc7_);
         }
         if(_loc5_.inputGuildPageLink.visible)
         {
            _tabObjects.push(_loc5_.inputGuildPageLink);
         }
         if(_loc3_ && !Environment.info.isTouchScreen)
         {
            setFocus();
         }
         if(_loc3_ && Environment.info.isNativeMobile)
         {
            _loc5_.inputText.readOnly = true;
            _btnSave.visible = true;
            _btnSave.caption = LocText.current.text("dialog/guild_description/button_edit");
            _loc5_.inputText.visible = false;
            _loc5_.txtText.visible = true;
            _loc4_ = 19000;
            if(_loc5_.inputText.text.length > _loc4_)
            {
               _loc5_.txtText.text = _loc5_.inputText.text.substr(0,_loc4_) + LocText.current.text("dialog/guild_note/to_long_for_mobile");
            }
            else
            {
               _loc5_.txtText.text = _loc5_.inputText.text;
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
         if(_descriptionMode)
         {
            Environment.application.sendActionRequest("setGuildDescription",{
               "description":_loc2_.inputText.text,
               "forum_page":_loc2_.inputGuildPageLink.text
            },handleRequests);
         }
         else
         {
            Environment.application.sendActionRequest("setGuildNote",{"note":_loc2_.inputText.text},handleRequests);
         }
      }
      
      private function setFocus() : void
      {
         var _loc1_:SymbolDialogGuildDescriptionNoteGeneric = _vo as SymbolDialogGuildDescriptionNoteGeneric;
         Dialog.focus = _loc1_.inputText;
      }
      
      private function handleRequests(param1:ActionRequestResponse) : void
      {
         var _loc2_:* = null;
         var _loc3_:* = param1.action;
         switch(_loc3_)
         {
            case "setGuildDescription":
            case "setGuildNote":
               if(param1.error == "")
               {
                  Environment.application.updateData(param1.data);
                  close();
                  UiGuildChatTab.instance.refreshGuildLog();
               }
               else if(param1.error == "errSetNoteInvalidGuild")
               {
                  Environment.panelManager.showDialog(new UiInfoDialog(LocText.current.text("dialog/guild_set_note_invalid_guild/title"),LocText.current.text("dialog/guild_set_note_invalid_guild/text"),LocText.current.text("general/button_ok")));
               }
               else if(param1.error == "errSetNoteNoPermission")
               {
                  Environment.panelManager.showDialog(new UiInfoDialog(LocText.current.text("dialog/guild_set_note_no_permission/title"),LocText.current.text("dialog/guild_set_note_no_permission/text"),LocText.current.text("general/button_ok")));
               }
               else if(param1.error == "errSetDescriptionInvalidGuild")
               {
                  Environment.panelManager.showDialog(new UiInfoDialog(LocText.current.text("dialog/guild_set_description_invalid_guild/title"),LocText.current.text("dialog/guild_set_description_invalid_guild/text"),LocText.current.text("general/button_ok")));
               }
               else if(param1.error == "errSetDescriptionNoPermission")
               {
                  Environment.panelManager.showDialog(new UiInfoDialog(LocText.current.text("dialog/guild_set_description_no_permission/title"),LocText.current.text("dialog/guild_set_description_no_permission/text"),LocText.current.text("general/button_ok")));
               }
               else if(param1.error == "errSetForumPageInvalidURL")
               {
                  _loc2_ = _vo as SymbolDialogGuildDescriptionNoteGeneric;
                  _loc2_.inputGuildPageLink.text = "";
                  Dialog.focus = _loc2_.inputGuildPageLink;
               }
               else
               {
                  Environment.reportError(param1.error,param1.request);
               }
               return;
            default:
               throw new Error("Unsupported request action \'" + param1.action + "\'!");
         }
      }
      
      override public function onEscape() : void
      {
         close();
      }
   }
}
