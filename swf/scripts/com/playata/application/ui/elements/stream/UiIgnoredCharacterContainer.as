package com.playata.application.ui.elements.stream
{
   import com.playata.application.data.character.Character;
   import com.playata.application.data.stream.IgnoreMessageCharacter;
   import com.playata.application.data.user.User;
   import com.playata.application.ui.ViewManager;
   import com.playata.application.ui.elements.generic.button.UiTextButton;
   import com.playata.application.ui.elements.generic.checkbox.UiCheckBox;
   import com.playata.framework.application.Environment;
   import com.playata.framework.application.request.ActionRequestResponse;
   import com.playata.framework.display.ui.controls.List;
   import com.playata.framework.input.InteractionEvent;
   import com.playata.framework.localization.LocText;
   import visuals.ui.elements.stream.SymbolIgnoredCharacterContainerGeneric;
   
   public class UiIgnoredCharacterContainer
   {
       
      
      private var _content:SymbolIgnoredCharacterContainerGeneric = null;
      
      private var _btnShow:UiTextButton = null;
      
      private var _btnUnignore:UiTextButton = null;
      
      private var _currentIgnoredCharacters:int = -1;
      
      private var _list:UiIgnoredCharacterList = null;
      
      private var _currentCharacter:IgnoreMessageCharacter = null;
      
      private var _ckbIgnoreGuildInvites:UiCheckBox = null;
      
      private var _ckbFriendMessagesOnly:UiCheckBox = null;
      
      public function UiIgnoredCharacterContainer(param1:SymbolIgnoredCharacterContainerGeneric)
      {
         super();
         _content = param1;
         _content.txtTitle.text = LocText.current.text("panel_streams/tab_ignored_character_tooltip");
         _content.txtNameCaption.text = LocText.current.text("dialog/mailbox_ignore/name_caption");
         _content.txtIgnoreDateCaption.text = LocText.current.text("dialog/mailbox_ignore/ignore_date_caption");
         _content.txtIgnoreGuildInvites.text = LocText.current.text("dialog/mailbox_ignore/ignore_guild_invites");
         _content.txtFriendMessagesOnly.text = LocText.current.text("dialog/mailbox_ignore/friend_messages_only");
         _btnShow = new UiTextButton(_content.btnShow,LocText.current.text("dialog/mailbox_ignore/button_show"),"",onClickShow);
         _btnUnignore = new UiTextButton(_content.btnUnignore,LocText.current.text("dialog/mailbox_ignore/button_unignore"),LocText.current.text("dialog/mailbox_ignore/button_unignore_tooltip"),onClickUnignore);
         _list = new UiIgnoredCharacterList(_content.list);
         _list.onListUpdated.add(onListUpdate);
         _list.onSelectionChanged.add(refreshButtons);
         _list.onLineDoubleClick.add(onLineDoubleClick);
         _ckbIgnoreGuildInvites = new UiCheckBox(_content.checkboxIgnoreGuildInvites,false,"",onIngoreGuildInvitesChanged,null,_content.txtIgnoreGuildInvites);
         _ckbFriendMessagesOnly = new UiCheckBox(_content.checkboxFriendMessagesOnly,false,"",onFriendMessagesOnlyChanged,null,_content.txtFriendMessagesOnly);
         _list.refreshList();
      }
      
      public function refreshLocalization() : void
      {
         _content.txtTitle.text = LocText.current.text("panel_streams/tab_ignored_character_tooltip");
         _content.txtNameCaption.text = LocText.current.text("dialog/mailbox_ignore/name_caption");
         _content.txtIgnoreDateCaption.text = LocText.current.text("dialog/mailbox_ignore/ignore_date_caption");
         _content.txtIgnoreGuildInvites.text = LocText.current.text("dialog/mailbox_ignore/ignore_guild_invites");
         _content.txtFriendMessagesOnly.text = LocText.current.text("dialog/mailbox_ignore/friend_messages_only");
         _btnShow.caption = LocText.current.text("dialog/mailbox_ignore/button_show");
         _btnUnignore.caption = LocText.current.text("dialog/mailbox_ignore/button_unignore");
         _btnUnignore.tooltip = LocText.current.text("dialog/mailbox_ignore/button_unignore_tooltip");
         _list.refreshLocalization();
      }
      
      public function dispose() : void
      {
         _btnShow.dispose();
         _btnShow = null;
         _btnUnignore.dispose();
         _btnUnignore = null;
         _list.dispose();
         _list = null;
         _ckbIgnoreGuildInvites.dispose();
         _ckbIgnoreGuildInvites = null;
         _ckbFriendMessagesOnly.dispose();
         _ckbFriendMessagesOnly = null;
      }
      
      public function get content() : SymbolIgnoredCharacterContainerGeneric
      {
         return _content;
      }
      
      public function init() : void
      {
         _ckbIgnoreGuildInvites.checked = User.current.ignoreGuildInvites;
         _ckbFriendMessagesOnly.checked = User.current.character.friendMessagesOnly;
      }
      
      public function reset() : void
      {
         _content.visible = false;
         _list.clear();
         _currentIgnoredCharacters = -1;
         _currentCharacter = null;
      }
      
      public function refresh() : void
      {
         if(!_content.visible)
         {
            return;
         }
         loadIgnoredCharacters();
      }
      
      public function loadIgnoredCharacters() : void
      {
         if(User.current.character.streams.ignoredCharacters.length == _currentIgnoredCharacters && _currentIgnoredCharacters >= 0)
         {
            return;
         }
         _currentIgnoredCharacters = User.current.character.streams.ignoredCharacters.length;
         Environment.application.sendActionRequest("getIgnoredMessageCharacters",{},handleRequests);
      }
      
      private function onIngoreGuildInvitesChanged(param1:Boolean) : void
      {
         User.current.ignoreGuildInvites = param1;
      }
      
      private function onFriendMessagesOnlyChanged(param1:Boolean) : void
      {
         Environment.application.sendActionRequest("setFriendMessagesOnly",{"friend_messages_only":param1},handleRequests);
      }
      
      private function onLineDoubleClick(param1:UiIgnoredCharacterLine) : void
      {
         if(!param1)
         {
            return;
         }
         onClickShow(null);
      }
      
      private function onClickShow(param1:InteractionEvent) : void
      {
         Environment.application.sendActionRequest("getCharacter",{"character_id":_list.selectedItemAsObject.id},handleRequests);
      }
      
      private function onClickUnignore(param1:InteractionEvent) : void
      {
         _btnShow.buttonEnabled = false;
         _btnUnignore.buttonEnabled = false;
         Environment.application.sendActionRequest("unignoreMessageCharacter",{"character_unignore_id":_list.selectedItemAsObject.id},handleRequests);
      }
      
      private function onListUpdate(param1:List) : void
      {
         refreshButtons(null);
      }
      
      private function refreshButtons(param1:UiIgnoredCharacterLine) : void
      {
         _btnShow.buttonEnabled = _list.selectedItem != null;
         _btnUnignore.buttonEnabled = _list.selectedItem != null;
      }
      
      private function handleRequests(param1:ActionRequestResponse) : void
      {
         var _loc2_:* = null;
         var _loc3_:* = param1.action;
         switch(_loc3_)
         {
            case "getIgnoredMessageCharacters":
               if(param1.error == "")
               {
                  Environment.application.updateData(param1.data);
                  _list.sync();
               }
               else
               {
                  Environment.reportError(param1.error,param1.request);
               }
               break;
            case "unignoreMessageCharacter":
               if(param1.error == "")
               {
                  Environment.application.updateData(param1.data);
                  _list.refreshList(false);
               }
               else if(param1.error != "errRemoveRecordInvalid")
               {
                  Environment.reportError(param1.error,param1.request);
               }
               break;
            case "getCharacter":
               if(param1.error == "")
               {
                  Environment.application.updateData(param1.data);
                  _loc2_ = Character.fromData(param1.data);
                  ViewManager.instance.showCharacter(_loc2_);
                  ViewManager.instance.baseUserPanel.streamsPanel.close();
               }
               else if(param1.error != "errGetCharacterInvalidCharacter")
               {
                  Environment.reportError(param1.error,param1.request);
               }
               break;
            case "setFriendMessagesOnly":
               if(param1.error == "")
               {
                  Environment.application.updateData(param1.data);
               }
               else
               {
                  Environment.reportError(param1.error,param1.request);
               }
               break;
            default:
               throw new Error("Unsupported request action \'" + param1.action + "\'!");
         }
      }
   }
}
